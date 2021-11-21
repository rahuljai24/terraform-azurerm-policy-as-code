##################
# General
##################
module "customer_mg_whitelist_resources" {
  source                = "..//modules/def_assignment"
  definition            = module.whitelist_resources.definition
  assignment_scope      = data.azurerm_management_group.team_a.id
  assignment_effect     = "Audit"
  assignment_parameters = local.customer_mg_whitelist_resource_types # see below
}

##################
# Network
##################
module "customer_mg_deny_nic_public_ip" {
  source            = "..//modules/def_assignment"
  definition        = module.deny_nic_public_ip.definition
  assignment_scope  = data.azurerm_management_group.team_a.id
  assignment_effect = "Deny"
}

module "customer_mg_deny_nsg_outbound_allow_all" {
  source            = "..//modules/def_assignment"
  definition        = module.deny_nsg_outbound_allow_all.definition
  assignment_scope  = data.azurerm_management_group.team_a.id
  assignment_effect = "Deny"
}

##################
# Tags
##################
module "customer_mg_add_replace_resource_group_tag_key_modify" {
  source            = "..//modules/def_assignment"
  definition        = module.add_replace_resource_group_tag_key_modify.definition
  assignment_scope  = data.azurerm_management_group.team_a.id
  assignment_effect = "Modify"
  skip_remediation  = var.skip_remediation
}

module "customer_mg_inherit_resource_group_tags_modify" {
  source            = "..//modules/def_assignment"
  definition        = module.inherit_resource_group_tags_modify.definition
  assignment_scope  = data.azurerm_management_group.team_a.id
  assignment_effect = "Modify"
  skip_remediation  = var.skip_remediation
  assignment_parameters = {
    tagName = "environment"
  }
}

##################
# Resource Types to Whitelist
##################
locals {
  customer_mg_whitelist_resource_types = {
    listOfResourceTypesAllowed = [
      "Microsoft.AlertsManagement/actionRules",
      "Microsoft.AlertsManagement/alerts",
      "Microsoft.AlertsManagement/alertsList",
      "Microsoft.AlertsManagement/alertsMetaData",
      "Microsoft.AlertsManagement/alertsSummary",
      "Microsoft.AlertsManagement/alertsSummaryList",
      "Microsoft.AlertsManagement/operations",
      "Microsoft.AlertsManagement/smartDetectorAlertRules",
      "Microsoft.AlertsManagement/smartGroups",
      "Microsoft.Authorization/checkAccess",
      "Microsoft.Authorization/classicAdministrators",
      "Microsoft.Authorization/dataAliases",
      "Microsoft.Authorization/denyAssignments",
      "Microsoft.Authorization/elevateAccess",
      "Microsoft.Authorization/findOrphanRoleAssignments",
      "Microsoft.Authorization/locks",
      "Microsoft.Authorization/operations",
      "Microsoft.Authorization/permissions",
      "Microsoft.Authorization/policyAssignments",
      "Microsoft.Authorization/policyDefinitions",
      "Microsoft.Authorization/policySetDefinitions",
      "Microsoft.Authorization/providerOperations",
      "Microsoft.Authorization/roleAssignments",
      "Microsoft.Authorization/roleAssignmentsUsageMetrics",
      "Microsoft.Authorization/roleDefinitions",
      "Microsoft.Billing/billingAccounts",
      "Microsoft.Billing/billingAccounts/agreements",
      "Microsoft.Billing/billingAccounts/billingPermissions",
      "Microsoft.Billing/billingAccounts/billingProfiles",
      "Microsoft.Billing/billingAccounts/billingProfiles/availableBalance",
      "Microsoft.Billing/billingAccounts/billingProfiles/billingPermissions",
      "Microsoft.Billing/billingAccounts/billingProfiles/billingRoleAssignments",
      "Microsoft.Billing/billingAccounts/billingProfiles/billingRoleDefinitions",
      "Microsoft.Billing/billingAccounts/billingProfiles/billingSubscriptions",
      "Microsoft.Billing/billingAccounts/billingProfiles/createBillingRoleAssignment",
      "Microsoft.Billing/billingAccounts/billingProfiles/customers",
      "Microsoft.Billing/billingAccounts/billingProfiles/instructions",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoices",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoices/pricesheet",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/billingPermissions",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/billingRoleAssignments",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/billingRoleDefinitions",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/billingSubscriptions",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/createBillingRoleAssignment",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/initiateTransfer",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/products",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/products/transfer",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/products/updateAutoRenew",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/transactions",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/transfers",
      "Microsoft.Billing/billingAccounts/BillingProfiles/patchOperations",
      "Microsoft.Billing/billingAccounts/billingProfiles/paymentMethods",
      "Microsoft.Billing/billingAccounts/billingProfiles/policies",
      "Microsoft.Billing/billingAccounts/billingProfiles/pricesheet",
      "Microsoft.Billing/billingAccounts/billingProfiles/pricesheetDownloadOperations",
      "Microsoft.Billing/billingAccounts/billingProfiles/products",
      "Microsoft.Billing/billingAccounts/billingProfiles/transactions",
      "Microsoft.Billing/billingAccounts/billingRoleAssignments",
      "Microsoft.Billing/billingAccounts/billingRoleDefinitions",
      "Microsoft.Billing/billingAccounts/billingSubscriptions",
      "Microsoft.Billing/billingAccounts/billingSubscriptions/invoices",
      "Microsoft.Billing/billingAccounts/createBillingRoleAssignment",
      "Microsoft.Billing/billingAccounts/createInvoiceSectionOperations",
      "Microsoft.Billing/billingAccounts/customers",
      "Microsoft.Billing/billingAccounts/customers/billingPermissions",
      "Microsoft.Billing/billingAccounts/customers/billingSubscriptions",
      "Microsoft.Billing/billingAccounts/customers/initiateTransfer",
      "Microsoft.Billing/billingAccounts/customers/policies",
      "Microsoft.Billing/billingAccounts/customers/products",
      "Microsoft.Billing/billingAccounts/customers/transactions",
      "Microsoft.Billing/billingAccounts/customers/transfers",
      "Microsoft.Billing/billingAccounts/departments",
      "Microsoft.Billing/billingAccounts/enrollmentAccounts",
      "Microsoft.Billing/billingAccounts/invoices",
      "Microsoft.Billing/billingAccounts/invoiceSections",
      "Microsoft.Billing/billingAccounts/invoiceSections/billingSubscriptionMoveOperations",
      "Microsoft.Billing/billingAccounts/invoiceSections/billingSubscriptions",
      "Microsoft.Billing/billingAccounts/invoiceSections/billingSubscriptions/transfer",
      "Microsoft.Billing/billingAccounts/invoiceSections/elevate",
      "Microsoft.Billing/billingAccounts/invoiceSections/initiateTransfer",
      "Microsoft.Billing/billingAccounts/invoiceSections/patchOperations",
      "Microsoft.Billing/billingAccounts/invoiceSections/productMoveOperations",
      "Microsoft.Billing/billingAccounts/invoiceSections/products",
      "Microsoft.Billing/billingAccounts/invoiceSections/products/transfer",
      "Microsoft.Billing/billingAccounts/invoiceSections/products/updateAutoRenew",
      "Microsoft.Billing/billingAccounts/invoiceSections/productTransfersResults",
      "Microsoft.Billing/billingAccounts/invoiceSections/transactions",
      "Microsoft.Billing/billingAccounts/invoiceSections/transfers",
      "Microsoft.Billing/billingAccounts/lineOfCredit",
      "Microsoft.Billing/billingAccounts/listInvoiceSectionsWithCreateSubscriptionPermission",
      "Microsoft.Billing/billingAccounts/operationResults",
      "Microsoft.Billing/billingAccounts/patchOperations",
      "Microsoft.Billing/billingAccounts/paymentMethods",
      "Microsoft.Billing/billingAccounts/products",
      "Microsoft.Billing/billingAccounts/transactions",
      "Microsoft.Billing/billingPeriods",
      "Microsoft.Billing/billingPermissions",
      "Microsoft.Billing/billingProperty",
      "Microsoft.Billing/billingRoleAssignments",
      "Microsoft.Billing/billingRoleDefinitions",
      "Microsoft.Billing/createBillingRoleAssignment",
      "Microsoft.Billing/departments",
      "Microsoft.Billing/enrollmentAccounts",
      "Microsoft.Billing/invoices",
      "Microsoft.Billing/operationResults",
      "Microsoft.Billing/operations",
      "Microsoft.Billing/operationStatus",
      "Microsoft.Billing/transfers",
      "Microsoft.Billing/transfers/acceptTransfer",
      "Microsoft.Billing/transfers/declineTransfer",
      "Microsoft.Billing/transfers/operationStatus",
      "Microsoft.Billing/transfers/validateTransfer",
      "Microsoft.Billing/validateAddress",
      "Microsoft.Consumption/AggregatedCost",
      "Microsoft.Consumption/Balances",
      "Microsoft.Consumption/Budgets",
      "Microsoft.Consumption/Charges",
      "Microsoft.Consumption/CostTags",
      "Microsoft.Consumption/credits",
      "Microsoft.Consumption/events",
      "Microsoft.Consumption/Forecasts",
      "Microsoft.Consumption/lots",
      "Microsoft.Consumption/Marketplaces",
      "Microsoft.Consumption/OperationResults",
      "Microsoft.Consumption/Operations",
      "Microsoft.Consumption/OperationStatus",
      "Microsoft.Consumption/Pricesheets",
      "Microsoft.Consumption/products",
      "Microsoft.Consumption/ReservationDetails",
      "Microsoft.Consumption/ReservationRecommendations",
      "Microsoft.Consumption/ReservationSummaries",
      "Microsoft.Consumption/ReservationTransactions",
      "Microsoft.Consumption/Tags",
      "Microsoft.Consumption/tenants",
      "Microsoft.Consumption/Terms",
      "Microsoft.Consumption/UsageDetails",
      "Microsoft.CostManagement/Alerts",
      "Microsoft.CostManagement/BillingAccounts",
      "Microsoft.CostManagement/Budgets",
      "Microsoft.CostManagement/CloudConnectors",
      "Microsoft.CostManagement/Connectors",
      "Microsoft.CostManagement/Departments",
      "Microsoft.CostManagement/Dimensions",
      "Microsoft.CostManagement/EnrollmentAccounts",
      "Microsoft.CostManagement/Exports",
      "Microsoft.CostManagement/ExternalBillingAccounts",
      "Microsoft.CostManagement/ExternalBillingAccounts/Alerts",
      "Microsoft.CostManagement/ExternalBillingAccounts/Dimensions",
      "Microsoft.CostManagement/ExternalBillingAccounts/Forecast",
      "Microsoft.CostManagement/ExternalBillingAccounts/Query",
      "Microsoft.CostManagement/ExternalSubscriptions",
      "Microsoft.CostManagement/ExternalSubscriptions/Alerts",
      "Microsoft.CostManagement/ExternalSubscriptions/Dimensions",
      "Microsoft.CostManagement/ExternalSubscriptions/Forecast",
      "Microsoft.CostManagement/ExternalSubscriptions/Query",
      "Microsoft.CostManagement/Forecast",
      "Microsoft.CostManagement/operations",
      "Microsoft.CostManagement/Query",
      "Microsoft.CostManagement/register",
      "Microsoft.CostManagement/Reportconfigs",
      "Microsoft.CostManagement/Reports",
      "Microsoft.CostManagement/Settings",
      "Microsoft.CostManagement/showbackRules",
      "Microsoft.CostManagement/Views",
      "Microsoft.EventHub/availableClusterRegions",
      "Microsoft.EventHub/checkNameAvailability",
      "Microsoft.EventHub/checkNamespaceAvailability",
      "Microsoft.EventHub/clusters",
      "Microsoft.EventHub/locations",
      "Microsoft.EventHub/locations/deleteVirtualNetworkOrSubnets",
      "Microsoft.EventHub/namespaces",
      "Microsoft.EventHub/namespaces/authorizationrules",
      "Microsoft.EventHub/namespaces/disasterrecoveryconfigs",
      "Microsoft.EventHub/namespaces/disasterrecoveryconfigs/checkNameAvailability",
      "Microsoft.EventHub/namespaces/eventhubs",
      "Microsoft.EventHub/namespaces/eventhubs/authorizationrules",
      "Microsoft.EventHub/namespaces/eventhubs/consumergroups",
      "Microsoft.EventHub/namespaces/networkrulesets",
      "Microsoft.EventHub/operations",
      "Microsoft.EventHub/sku",
      "Microsoft.Features/featureProviders",
      "Microsoft.Features/features",
      "Microsoft.Features/operations",
      "Microsoft.Features/providers",
      "Microsoft.Features/subscriptionFeatureRegistrations",
      "microsoft.insights/actiongroups",
      "microsoft.insights/activityLogAlerts",
      "microsoft.insights/alertrules",
      "microsoft.insights/autoscalesettings",
      "microsoft.insights/baseline",
      "microsoft.insights/calculatebaseline",
      "microsoft.insights/components",
      "microsoft.insights/components/events",
      "microsoft.insights/components/linkedstorageaccounts",
      "microsoft.insights/components/metrics",
      "microsoft.insights/components/pricingPlans",
      "microsoft.insights/components/query",
      "microsoft.insights/diagnosticSettings",
      "microsoft.insights/diagnosticSettingsCategories",
      "microsoft.insights/eventCategories",
      "microsoft.insights/eventtypes",
      "microsoft.insights/extendedDiagnosticSettings",
      "microsoft.insights/listMigrationdate",
      "microsoft.insights/locations",
      "microsoft.insights/locations/operationResults",
      "microsoft.insights/logDefinitions",
      "microsoft.insights/logprofiles",
      "microsoft.insights/logs",
      "microsoft.insights/metricalerts",
      "microsoft.insights/metricbaselines",
      "microsoft.insights/metricbatch",
      "microsoft.insights/metricDefinitions",
      "microsoft.insights/metricNamespaces",
      "microsoft.insights/metrics",
      "microsoft.insights/migratealertrules",
      "microsoft.insights/migrateToNewPricingModel",
      "microsoft.insights/myWorkbooks",
      "microsoft.insights/operations",
      "microsoft.insights/privateLinkScopeOperationStatuses",
      "microsoft.insights/privateLinkScopes",
      "microsoft.insights/privateLinkScopes/privateEndpointConnectionProxies",
      "microsoft.insights/privateLinkScopes/privateEndpointConnections",
      "microsoft.insights/privateLinkScopes/scopedResources",
      "microsoft.insights/rollbackToLegacyPricingModel",
      "microsoft.insights/scheduledqueryrules",
      "microsoft.insights/topology",
      "microsoft.insights/transactions",
      "microsoft.insights/vmInsightsOnboardingStatuses",
      "microsoft.insights/webtests",
      "microsoft.insights/workbooks",
      "microsoft.insights/workbooktemplates",
      "Microsoft.KeyVault/checkNameAvailability",
      "Microsoft.KeyVault/deletedVaults",
      "Microsoft.KeyVault/locations",
      "Microsoft.KeyVault/locations/deletedVaults",
      "Microsoft.KeyVault/locations/deleteVirtualNetworkOrSubnets",
      "Microsoft.KeyVault/locations/operationResults",
      "Microsoft.KeyVault/operations",
      "Microsoft.KeyVault/vaults",
      "Microsoft.KeyVault/vaults/accessPolicies",
      "Microsoft.KeyVault/vaults/eventGridFilters",
      "microsoft.KeyVault/vaults/privateEndpointConnectionProxies",
      "microsoft.KeyVault/vaults/privateEndpointConnections",
      "Microsoft.KeyVault/vaults/secrets",
      "Microsoft.ManagedIdentity/Identities",
      "Microsoft.ManagedIdentity/operations",
      "Microsoft.ManagedIdentity/userAssignedIdentities",
      "Microsoft.Management/checkNameAvailability",
      "Microsoft.Management/getEntities",
      "Microsoft.Management/managementGroups",
      "Microsoft.Management/operationResults",
      "Microsoft.Management/operations",
      "Microsoft.Management/resources",
      "Microsoft.Management/startTenantBackfill",
      "Microsoft.Management/tenantBackfillStatus",
      "Microsoft.Network/applicationSecurityGroups",
      "Microsoft.Network/bgpServiceCommunities",
      "Microsoft.Network/connections",
      "Microsoft.Network/ddosCustomPolicies",
      "Microsoft.Network/ddosProtectionPlans",
      "Microsoft.Network/dnsOperationResults",
      "Microsoft.Network/dnsOperationStatuses",
      "Microsoft.Network/dnszones",
      "Microsoft.Network/dnszones/A",
      "Microsoft.Network/dnszones/AAAA",
      "Microsoft.Network/dnszones/all",
      "Microsoft.Network/dnszones/CAA",
      "Microsoft.Network/dnszones/CNAME",
      "Microsoft.Network/dnszones/MX",
      "Microsoft.Network/dnszones/NS",
      "Microsoft.Network/dnszones/PTR",
      "Microsoft.Network/dnszones/recordsets",
      "Microsoft.Network/dnszones/SOA",
      "Microsoft.Network/dnszones/SRV",
      "Microsoft.Network/dnszones/TXT",
      "Microsoft.Network/expressRouteCircuits",
      "Microsoft.Network/expressRouteGateways",
      "Microsoft.Network/expressRouteServiceProviders",
      "Microsoft.Network/getDnsResourceReference",
      "Microsoft.Network/locations",
      "Microsoft.Network/locations/autoApprovedPrivateLinkServices",
      "Microsoft.Network/locations/availableDelegations",
      "Microsoft.Network/locations/availablePrivateEndpointTypes",
      "Microsoft.Network/locations/availableServiceAliases",
      "Microsoft.Network/locations/bareMetalTenants",
      "Microsoft.Network/locations/batchNotifyPrivateEndpointsForResourceMove",
      "Microsoft.Network/locations/batchValidatePrivateEndpointsForResourceMove",
      "Microsoft.Network/locations/checkAcceleratedNetworkingSupport",
      "Microsoft.Network/locations/CheckDnsNameAvailability",
      "Microsoft.Network/locations/checkPrivateLinkServiceVisibility",
      "Microsoft.Network/locations/effectiveResourceOwnership",
      "Microsoft.Network/locations/nfvOperationResults",
      "Microsoft.Network/locations/nfvOperations",
      "Microsoft.Network/locations/operationResults",
      "Microsoft.Network/locations/operations",
      "Microsoft.Network/locations/serviceTags",
      "Microsoft.Network/locations/setResourceOwnership",
      "Microsoft.Network/locations/supportedVirtualMachineSizes",
      "Microsoft.Network/locations/usages",
      "Microsoft.Network/locations/validateResourceOwnership",
      "Microsoft.Network/locations/virtualNetworkAvailableEndpointServices",
      "Microsoft.Network/networkInterfaces",
      "Microsoft.Network/networkProfiles",
      "Microsoft.Network/networkSecurityGroups",
      "Microsoft.Network/networkSecurityGroups/securityRules",
      "Microsoft.Network/operations",
      "Microsoft.Network/privateDnsOperationResults",
      "Microsoft.Network/privateDnsOperationStatuses",
      "Microsoft.Network/privateDnsZones",
      "Microsoft.Network/privateDnsZones/A",
      "Microsoft.Network/privateDnsZones/AAAA",
      "Microsoft.Network/privateDnsZones/all",
      "Microsoft.Network/privateDnsZones/CNAME",
      "Microsoft.Network/privateDnsZones/MX",
      "Microsoft.Network/privateDnsZones/PTR",
      "Microsoft.Network/privateDnsZones/SOA",
      "Microsoft.Network/privateDnsZones/SRV",
      "Microsoft.Network/privateDnsZones/TXT",
      "Microsoft.Network/privateDnsZones/virtualNetworkLinks",
      "Microsoft.Network/privateDnsZonesInternal",
      "Microsoft.Network/privateEndpointRedirectMaps",
      "Microsoft.Network/privateEndpoints",
      "Microsoft.Network/routeFilters",
      "Microsoft.Network/routeTables",
      "Microsoft.Network/routeTables/routes",
      "Microsoft.Network/subnets",
      "Microsoft.Network/virtualNetworks",
      "Microsoft.Network/virtualNetworks/subnets",
      "Microsoft.Network/virtualNetworks/virtualNetworkPeerings",
      "Microsoft.Network/virtualRouters",
      "Microsoft.OperationalInsights/linkTargets",
      "Microsoft.OperationalInsights/locations",
      "Microsoft.OperationalInsights/locations/operationStatuses",
      "Microsoft.OperationalInsights/operations",
      "Microsoft.OperationalInsights/storageInsightConfigs",
      "Microsoft.OperationalInsights/workspaces",
      "Microsoft.OperationalInsights/workspaces/dataSources",
      "Microsoft.OperationalInsights/workspaces/linkedServices",
      "Microsoft.OperationalInsights/workspaces/query",
      "Microsoft.OperationalInsights/workspaces/scopedPrivateLinkProxies",
      "Microsoft.OperationsManagement/managementassociations",
      "Microsoft.OperationsManagement/managementconfigurations",
      "Microsoft.OperationsManagement/operations",
      "Microsoft.OperationsManagement/solutions",
      "Microsoft.OperationsManagement/views",
      "Microsoft.PolicyInsights/asyncOperationResults",
      "Microsoft.PolicyInsights/operations",
      "Microsoft.PolicyInsights/policyEvents",
      "Microsoft.PolicyInsights/policyMetadata",
      "Microsoft.PolicyInsights/policyStates",
      "Microsoft.PolicyInsights/policyTrackedResources",
      "Microsoft.PolicyInsights/remediations",
      "Microsoft.Portal/consoles",
      "Microsoft.Portal/dashboards",
      "Microsoft.Portal/locations",
      "Microsoft.Portal/locations/consoles",
      "Microsoft.Portal/locations/userSettings",
      "Microsoft.Portal/operations",
      "Microsoft.Portal/userSettings",
      "Microsoft.ResourceHealth/availabilityStatuses",
      "Microsoft.ResourceHealth/childAvailabilityStatuses",
      "Microsoft.ResourceHealth/childResources",
      "Microsoft.ResourceHealth/emergingissues",
      "Microsoft.ResourceHealth/events",
      "Microsoft.ResourceHealth/metadata",
      "Microsoft.ResourceHealth/notifications",
      "Microsoft.ResourceHealth/operations",
      "Microsoft.Resources/checkPolicyCompliance",
      "Microsoft.Resources/checkresourcename",
      "Microsoft.Resources/deployments",
      "Microsoft.Resources/deployments/operations",
      "Microsoft.Resources/deploymentScripts",
      "Microsoft.Resources/deploymentScripts/logs",
      "Microsoft.Resources/links",
      "Microsoft.Resources/locations",
      "Microsoft.Resources/locations/deploymentScriptOperationResults",
      "Microsoft.Resources/notifyResourceJobs",
      "Microsoft.Resources/operationresults",
      "Microsoft.Resources/operations",
      "Microsoft.Resources/providers",
      "Microsoft.Resources/resourceGroups",
      "Microsoft.Resources/resources",
      "Microsoft.Resources/subscriptions",
      "Microsoft.Resources/subscriptions/locations",
      "Microsoft.Resources/subscriptions/operationresults",
      "Microsoft.Resources/subscriptions/providers",
      "Microsoft.Resources/subscriptions/resourceGroups",
      "Microsoft.Resources/subscriptions/resourcegroups/resources",
      "Microsoft.Resources/subscriptions/resources",
      "Microsoft.Resources/subscriptions/tagnames",
      "Microsoft.Resources/subscriptions/tagNames/tagValues",
      "Microsoft.Resources/tags",
      "Microsoft.Resources/tenants",
      "Microsoft.Security/adaptiveNetworkHardenings",
      "Microsoft.Security/advancedThreatProtectionSettings",
      "Microsoft.Security/alerts",
      "Microsoft.Security/allowedConnections",
      "Microsoft.Security/applicationWhitelistings",
      "Microsoft.Security/assessmentMetadata",
      "Microsoft.Security/assessments",
      "Microsoft.Security/autoDismissAlertsRules",
      "Microsoft.Security/automations",
      "Microsoft.Security/AutoProvisioningSettings",
      "Microsoft.Security/complianceResults",
      "Microsoft.Security/Compliances",
      "Microsoft.Security/dataCollectionAgents",
      "Microsoft.Security/deviceSecurityGroups",
      "Microsoft.Security/discoveredSecuritySolutions",
      "Microsoft.Security/externalSecuritySolutions",
      "Microsoft.Security/InformationProtectionPolicies",
      "Microsoft.Security/iotSecuritySolutions",
      "Microsoft.Security/iotSecuritySolutions/analyticsModels",
      "Microsoft.Security/iotSecuritySolutions/analyticsModels/aggregatedAlerts",
      "Microsoft.Security/iotSecuritySolutions/analyticsModels/aggregatedRecommendations",
      "Microsoft.Security/jitNetworkAccessPolicies",
      "Microsoft.Security/locations",
      "Microsoft.Security/locations/alerts",
      "Microsoft.Security/locations/allowedConnections",
      "Microsoft.Security/locations/applicationWhitelistings",
      "Microsoft.Security/locations/discoveredSecuritySolutions",
      "Microsoft.Security/locations/externalSecuritySolutions",
      "Microsoft.Security/locations/jitNetworkAccessPolicies",
      "Microsoft.Security/locations/securitySolutions",
      "Microsoft.Security/locations/securitySolutionsReferenceData",
      "Microsoft.Security/locations/tasks",
      "Microsoft.Security/locations/topologies",
      "Microsoft.Security/operations",
      "Microsoft.Security/policies",
      "Microsoft.Security/pricings",
      "Microsoft.Security/regulatoryComplianceStandards",
      "Microsoft.Security/regulatoryComplianceStandards/regulatoryComplianceControls",
      "Microsoft.Security/regulatoryComplianceStandards/regulatoryComplianceControls/regulatoryComplianceAssessments",
      "Microsoft.Security/securityContacts",
      "Microsoft.Security/securitySolutions",
      "Microsoft.Security/securitySolutionsReferenceData",
      "Microsoft.Security/securityStatuses",
      "Microsoft.Security/securityStatusesSummaries",
      "Microsoft.Security/serverVulnerabilityAssessments",
      "Microsoft.Security/settings",
      "Microsoft.Security/subAssessments",
      "Microsoft.Security/tasks",
      "Microsoft.Security/topologies",
      "Microsoft.Security/workspaceSettings",
      "Microsoft.Storage/checkNameAvailability",
      "Microsoft.Storage/locations",
      "Microsoft.Storage/locations/asyncoperations",
      "Microsoft.Storage/locations/checkNameAvailability",
      "Microsoft.Storage/locations/deleteVirtualNetworkOrSubnets",
      "Microsoft.Storage/locations/usages",
      "Microsoft.Storage/operations",
      "Microsoft.Storage/storageAccounts",
      "Microsoft.Storage/storageAccounts/blobServices",
      "Microsoft.Storage/storageAccounts/blobServices/containers",
      "Microsoft.Storage/storageAccounts/listAccountSas",
      "Microsoft.Storage/storageAccounts/listServiceSas",
      "Microsoft.Storage/usages",
      "Microsoft.Storage/storageAccounts/privateEndpointConnections",
      "Microsoft.Storage/storageAccounts/privateEndpointConnectionProxies",
      "Microsoft.Storage/storageAccounts/services",
      "Microsoft.Storage/storageAccounts/services/metricDefinitions",
      "Microsoft.Storage/usages",
      "microsoft.support/checkNameAvailability",
      "microsoft.support/operationresults",
      "microsoft.support/operations",
      "microsoft.support/operationsstatus",
      "microsoft.support/services",
      "microsoft.support/services/problemclassifications",
      "microsoft.support/supporttickets",
      "Microsoft.Subscription/"
    ]
  }
}
