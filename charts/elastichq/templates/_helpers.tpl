{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "elastichq.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "elastichq.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "elastichq.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "elastichq.labels" -}}
app.kubernetes.io/name: {{ include "elastichq.name" . }}
helm.sh/chart: {{ include "elastichq.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "elastichq.matchLabels" -}}
app.kubernetes.io/name: {{ include "elastichq.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Return the proper image name
*/}}
{{- define "elastichq.image" -}}
{{- $registryName := .Values.image.registry -}}
{{- $repositoryName := .Values.image.repository -}}
{{- $tag := .Values.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}

{{- define "elastichq.portstr" -}}
{{- .Values.elasticsearch.port | toString -}}
{{- end -}}

{{/*
Return the ElasticSearch url
*/}}
{{- define "elastichq.url" -}}
{{- $host := .Values.elasticsearch.host -}}
{{- $port := include "elastichq.portstr" . -}}
{{- printf "http://%s:%s" $host $port -}}
{{- end -}}

{{- define "elastichq.secretName" -}}
{{- if .Values.ingress.secret -}}
{{- .Values.ingress.secret -}}
{{- else -}}
{{- printf "%s-tls" (include "elastichq.fullname" .) -}}
{{- end -}}
{{- end -}}

{{- define "elastichq.ingressName" -}}
{{- include "elastichq.fullname" . -}}
{{- end -}}
