################################################################################
# Calico
################################################################################

module "calico" {
  source  = "aws-ia/eks-blueprints-addon/aws"
  version = "1.1.1"

  create = var.enable_calico

  # Disable helm release
  create_release = var.create_kubernetes_resources
      
  # https://github.com/kubernetes-sigs/metrics-server/blob/master/charts/metrics-server/Chart.yaml
  name             = try(var.calico.name, "calico")
  description      = try(var.calico.description, "A Helm chart to install the Calico CNI")
  namespace        = try(var.calico.namespace, "tigera-operator")
  create_namespace = try(var.calico.create_namespace, true)
  chart            = try(var.calico.chart, "tigera-operator")
  chart_version    = try(var.calico.chart_version, "v3.24.3")
  repository       = try(var.calico.repository, "https://docs.projectcalico.org/charts")
  values           = try(var.calico.values, ["  installation:\n    kubernetesProvider: \"EKS\"\n"])
  
  timeout                    = try(var.calico.timeout, null)
  repository_key_file        = try(var.calico.repository_key_file, null)
  repository_cert_file       = try(var.calico.repository_cert_file, null)
  repository_ca_file         = try(var.calico.repository_ca_file, null)
  repository_username        = try(var.calico.repository_username, null)
  repository_password        = try(var.calico.repository_password, null)
  devel                      = try(var.calico.devel, null)
  verify                     = try(var.calico.verify, null)
  keyring                    = try(var.calico.keyring, null)
  disable_webhooks           = try(var.calico.disable_webhooks, null)
  reuse_values               = try(var.calico.reuse_values, null)
  reset_values               = try(var.calico.reset_values, null)
  force_update               = try(var.calico.force_update, null)
  recreate_pods              = try(var.calico.recreate_pods, null)
  cleanup_on_fail            = try(var.calico.cleanup_on_fail, null)
  max_history                = try(var.calico.max_history, null)
  atomic                     = try(var.calico.atomic, null)
  skip_crds                  = try(var.calico.skip_crds, null)
  render_subchart_notes      = try(var.calico.render_subchart_notes, null)
  disable_openapi_validation = try(var.calico.disable_openapi_validation, null)
  wait                       = try(var.calico.wait, false)
  wait_for_jobs              = try(var.calico.wait_for_jobs, null)
  dependency_update          = try(var.calico.dependency_update, null)
  replace                    = try(var.calico.replace, null)
  lint                       = try(var.calico.lint, null)

  postrender    = try(var.calico.postrender, [])
  set           = try(var.calico.set, [])
  set_sensitive = try(var.calico.set_sensitive, [])

  tags = var.tags
}
