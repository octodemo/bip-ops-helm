FROM nginx:1.19.6-alpine
LABEL maintainer 'Zan Loy'

# Port for custom nginx site
EXPOSE 1280

# Copy in static web files.
COPY files/http/ /srv/http/

# Copy in nginx config.
COPY files/wlpxy.vbms.vba.va.gov.conf /etc/nginx/conf.d/
