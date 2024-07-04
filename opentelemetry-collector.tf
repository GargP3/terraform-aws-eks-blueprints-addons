################################################################################
# Opentelemtry Collector
################################################################################

module "opentelemetry-collector" {
  source  = "aws-ia/eks-blueprints-addon/aws"
  version = "1.1.1"

  create = var.enable_opentelemetry-collector

  # Disable helm release
  create_release = var.create_kubernetes_resources
      
  # https://github.com/kubernetes-sigs/metrics-server/blob/master/charts/metrics-server/Chart.yaml
  name             = try(var.opentelemetry-collector.name, "opentelemetry-collector")
  description      = try(var.opentelemetry-collector.description, "A Helm chart to install the Calico CNI")
  namespace        = try(var.opentelemetry-collector.namespace, "tigera-operator")
  create_namespace = try(var.opentelemetry-collector.create_namespace, true)
  chart            = try(var.opentelemetry-collector.chart, "tigera-operator")
  chart_version    = try(var.opentelemetry-collector.chart_version, "v3.24.3")
  repository       = try(var.opentelemetry-collector.repository, "https://docs.projectopentelemetry-collector.org/charts")
  values           = try(var.opentelemetry-collector.values, ["  installation:\n    kubernetesProvider: \"EKS\"\n"])
  
  timeout                    = try(var.opentelemetry-collector.timeout, null)
  repository_key_file        = try(var.opentelemetry-collector.repository_key_file, null)
  repository_cert_file       = try(var.opentelemetry-collector.repository_cert_file, null)
  repository_ca_file         = try(var.opentelemetry-collector.repository_ca_file, null)
  repository_username        = try(var.opentelemetry-collector.repository_username, null)
  repository_password        = try(var.opentelemetry-collector.repository_password, null)
  devel                      = try(var.opentelemetry-collector.devel, null)
  verify                     = try(var.opentelemetry-collector.verify, null)
  keyring                    = try(var.opentelemetry-collector.keyring, null)
  disable_webhooks           = try(var.opentelemetry-collector.disable_webhooks, null)
  reuse_values               = try(var.opentelemetry-collector.reuse_values, null)
  reset_values               = try(var.opentelemetry-collector.reset_values, null)
  force_update               = try(var.opentelemetry-collector.force_update, null)
  recreate_pods              = try(var.opentelemetry-collector.recreate_pods, null)
  cleanup_on_fail            = try(var.opentelemetry-collector.cleanup_on_fail, null)
  max_history                = try(var.opentelemetry-collector.max_history, null)
  atomic                     = try(var.opentelemetry-collector.atomic, null)
  skip_crds                  = try(var.opentelemetry-collector.skip_crds, null)
  render_subchart_notes      = try(var.opentelemetry-collector.render_subchart_notes, null)
  disable_openapi_validation = try(var.opentelemetry-collector.disable_openapi_validation, null)
  wait                       = try(var.opentelemetry-collector.wait, false)
  wait_for_jobs              = try(var.opentelemetry-collector.wait_for_jobs, null)
  dependency_update          = try(var.opentelemetry-collector.dependency_update, null)
  replace                    = try(var.opentelemetry-collector.replace, null)
  lint                       = try(var.opentelemetry-collector.lint, null)

  postrender    = try(var.opentelemetry-collector.postrender, [])
  set           = try(var.opentelemetry-collector.set, [])
  set_sensitive = try(var.opentelemetry-collector.set_sensitive, [])

  tags = var.tags
}
