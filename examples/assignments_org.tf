##################
# CIS Custom Benchmark
##################

module "org_mg_cis_custom_benchmark" {
  source           = "..//modules/set_assignment"
  initiative       = module.cis_custom_benchmark.initiative
  assignment_scope = data.azurerm_management_group.org.id
  assignment_parameters = {
    NetworkWatcherResourceGroupName                 = ""
    listOfApprovedVMExtensions                      = [""]
    listOfRegionsWhereNetworkWatcherShouldBeEnabled = ["uksouth", "ukwest"]
    workspaceRetentionDays                          = 456
    workspaceRetentionEffect                        = "AuditIfNotExists"
  }

  depends_on = [
    module.cis_custom_benchmark
  ]
}


##################
# General
##################

module "org_mg_whitelist_regions" {
  source            = "..//modules/def_assignment"
  definition        = module.whitelist_regions.definition
  assignment_scope  = data.azurerm_management_group.org.id
  assignment_effect = "Deny"
  assignment_parameters = {
    "listOfRegionsAllowed" = [
      "UK South",
      "UK West",
      "Global"
    ]
  }
}


##################
# Security Center
##################

module "org_mg_configure_asc_initiative" {
  source              = "..//modules/set_assignment"
  initiative          = module.configure_asc_initiative.initiative
  assignment_scope    = data.azurerm_management_group.org.id
  assignment_effect   = "DeployIfNotExists"
  skip_remediation    = var.skip_remediation
  role_definition_ids = module.configure_asc_initiative.role_definition_ids # using roles found in member_definitions
  assignment_parameters = {
    workspaceId           = local.dummy_resource_ids.azurerm_log_analytics_workspace
    eventHubDetails       = local.dummy_resource_ids.azurerm_eventhub_namespace_authorization_rule
    securityContactsEmail = "admin@cloud.com"
    securityContactsPhone = "44897654987"
  }
}


##################
# Storage
##################

module "org_mg_storage_enforce_https" {
  source            = "..//modules/def_assignment"
  definition        = module.storage_enforce_https.definition
  assignment_scope  = data.azurerm_management_group.org.id
  assignment_effect = "Deny"
}

module "org_mg_storage_enforce_minimum_tls1_2" {
  source            = "..//modules/def_assignment"
  definition        = module.storage_enforce_minimum_tls1_2.definition
  assignment_scope  = data.azurerm_management_group.org.id
  assignment_effect = "Deny"
}


##################
# Network
##################
module "org_mg_network_deny_nat_rules_firewall" {
  source            = "..//modules/def_assignment"
  definition        = module.deny_nat_rules_firewalls.definition
  assignment_scope  = data.azurerm_management_group.org.id
  assignment_effect = "Deny"
}


##################
# Monitoring
##################
module "org_mg_platform_diagnostics_initiative" {
  source            = "..//modules/set_assignment"
  initiative        = module.platform_diagnostics_initiative.initiative
  assignment_scope  = data.azurerm_management_group.org.id
  assignment_effect = "DeployIfNotExists"
  skip_remediation  = var.skip_remediation
  role_definition_ids = [
    data.azurerm_role_definition.contributor.id # using explicit roles and scopes
  ]
  role_assignment_scope = data.azurerm_management_group.team_a.id
  assignment_parameters = {
    workspaceId                 = local.dummy_resource_ids.azurerm_log_analytics_workspace
    storageAccountId            = local.dummy_resource_ids.azurerm_storage_account
    eventHubName                = local.dummy_resource_ids.azurerm_eventhub_namespace
    eventHubAuthorizationRuleId = local.dummy_resource_ids.azurerm_eventhub_namespace_authorization_rule
    metricsEnabled              = "True"
    logsEnabled                 = "True"
  }

  depends_on = [
    module.deploy_subscription_diagnostic_setting,
    module.deploy_resource_diagnostic_setting
  ]
}
