{{/* vim: set filetype=mustache: */}}

{{/* Expand the name of the chart.  */}}
{{- define "wlpxy.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
  Create a default fully qualified app name.
  We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
  If release name contains chart name it will be used as a full name.
*/}}
{{- define "wlpxy.fullname" -}}
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

{{/* Create chart name and version as used by the chart label.  */}}
{{- define "wlpxy.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Common labels */}}
{{- define "wlpxy.labels" -}}
app.kubernetes.io/name: {{ include "wlpxy.name" . }}
helm.sh/chart: {{ include "wlpxy.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- end -}}

{{/* Image + Tag */}}
{{- define "wlpxy.imageandtag" -}}
{{ .image }}:{{ .tag -}}
{{- end -}}

{{/* Name of haproxy items */}}
{{- define "wlpxy.haproxy.name" -}}
{{ include "wlpxy.name" . }}-haproxy
{{- end -}}

{{/* Name of nginx items */}}
{{- define "wlpxy.nginx.name" -}}
{{ include "wlpxy.name" . }}-nginx
{{- end -}}

{{- define "wlpxy.nginx.files" -}}
{{ include "wlpxy.nginx.name" . }}-files
{{- end -}}
