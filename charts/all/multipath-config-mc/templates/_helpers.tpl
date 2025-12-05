{{/*
Return the fully qualified name of the MachineConfig
*/}}
{{- define "multipath-config-mc.fullname" -}}
{{ .Values.namePrefix }}
{{- end -}}

