# Summary

This deploys the "wlpxy" service in bip. This acts as a relay to the admin servers in VBMS Weblogic clusters.

The docker directory has the relevant Dockerfile(s) to build the two required images for this to work. They will need to be built and uploaded to Nexus **before** you try to deploy the helm chart or they will fail.



In order to generate these ip addresses automatically for the values.yaml file, you can create a script with this content and run from the tooling box
----------------------------------------------------------
function grabIt(){
  env=$1
  srv=$2
  title=$3

  if [ "${env}" == "NA" ]; then
    echo "  - name: ${title}"
    findVal=${srv}
  else
    echo "  - name: ${env}-${title}"
    findVal=${srv}.${env}
  fi

  if [ "$env" == "prod" ]; then
    findVal=${srv}.prd
  fi

 ip=$(ping -c 1 ${findVal} | grep PING | awk '{print $3}' | sed "s/(//g" | sed "s/)//g")
  echo "    ip: ${ip}"
  if [ ! -z "$4" ]; then
    echo "    port: $4"
  fi
}


function grabEnv(){
  env=$1
  grabIt $env vbmsa000 awards
  grabIt $env vbms000 core
  grabIt $env vbmsr000 rating
  grabIt $env haz000 haz 8001
  grabIt $env vbmsr000 res 9101
  if [ "$env" != "prod" ]; then
    grabIt $env microsvc001 spring 8100
  fi
  echo "  #"
}

echo "endpoints:"
grabEnv cola
grabEnv perf
grabEnv prdtst
grabEnv pre
grabEnv prod

grabIt "NA" oemdb001.prd oem 7802


echo
echo
echo "endpoints_https:"
grabIt prod microsvc001 spring 8100

----------------------------------------------------------