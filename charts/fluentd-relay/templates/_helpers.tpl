{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "fluentd-relay.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "fluentd-relay.fullname" -}}
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
{{- define "fluentd-relay.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "fluentd-relay.labels" -}}
app.kubernetes.io/name: {{ include "fluentd-relay.name" . }}
helm.sh/chart: {{ include "fluentd-relay.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Labels to use on daemonset.spec.selector.matchLabels, statefulset.spec.selector.matchLabels and svc.spec.selector
*/}}
{{- define "fluentd-relay.matchLabels" -}}
app.kubernetes.io/name: {{ include "fluentd-relay.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Return the proper Fluentd image name
*/}}
{{- define "fluentd-relay.image" -}}
{{- $registryName := .Values.image.registry -}}
{{- $repositoryName := .Values.image.repository -}}
{{- $tag := .Values.image.tag | toString -}}
{{/*
Helm 2.11 supports the assignment of a value to a variable defined in a different scope,
but Helm 2.9 and 2.10 doesn't support it, so we need to implement this if-else logic.
Also, we can't use a single if because lazy evaluation is not an option
*/}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}

{{- define "fluentd-relay.ingressName" -}}
{{- if .Values.ingress.name -}}
{{- .Values.ingress.name -}}
{{- else -}}
{{- include "fluentd-relay.name" . -}}
{{- end -}}
{{- end -}}

{{- define "fluentd-relay.serviceName" -}}
{{- if .Values.service.name -}}
{{- .Values.service.name -}}
{{- else -}}
{{- include "fluentd-relay.name" . -}}
{{- end -}}
{{- end -}}

{{- define "fluentd-relay.servicePort" -}}
{{- .Values.service.port | default "1269" -}}
{{- end -}}
