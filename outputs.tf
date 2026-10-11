output "alert_muting_rules_id" {
  description = "Map of id values across all alert_muting_rules, keyed the same as var.alert_muting_rules except keys with no id are omitted"
  value       = { for k, v in newrelic_alert_muting_rule.alert_muting_rules : k => v.id if v.id != null && length(v.id) > 0 }
}
output "alert_muting_rules_account_id" {
  description = "Map of account_id values across all alert_muting_rules, keyed the same as var.alert_muting_rules except keys with no account_id are omitted"
  value       = { for k, v in newrelic_alert_muting_rule.alert_muting_rules : k => v.account_id if v.account_id != null }
}
output "alert_muting_rules_action_on_muting_rule_window_ended" {
  description = "Map of action_on_muting_rule_window_ended values across all alert_muting_rules, keyed the same as var.alert_muting_rules except keys with no action_on_muting_rule_window_ended are omitted"
  value       = { for k, v in newrelic_alert_muting_rule.alert_muting_rules : k => v.action_on_muting_rule_window_ended if v.action_on_muting_rule_window_ended != null && length(v.action_on_muting_rule_window_ended) > 0 }
}
output "alert_muting_rules_condition" {
  description = "Map of condition values across all alert_muting_rules, keyed the same as var.alert_muting_rules except keys with no condition are omitted"
  value       = { for k, v in newrelic_alert_muting_rule.alert_muting_rules : k => one(v.condition) if v.condition != null && length(v.condition) > 0 }
}
output "alert_muting_rules_description" {
  description = "Map of description values across all alert_muting_rules, keyed the same as var.alert_muting_rules except keys with no description are omitted"
  value       = { for k, v in newrelic_alert_muting_rule.alert_muting_rules : k => v.description if v.description != null && length(v.description) > 0 }
}
output "alert_muting_rules_enabled" {
  description = "Map of enabled values across all alert_muting_rules, keyed the same as var.alert_muting_rules except keys with no enabled are omitted"
  value       = { for k, v in newrelic_alert_muting_rule.alert_muting_rules : k => v.enabled if v.enabled != null }
}
output "alert_muting_rules_name" {
  description = "Map of name values across all alert_muting_rules, keyed the same as var.alert_muting_rules except keys with no name are omitted"
  value       = { for k, v in newrelic_alert_muting_rule.alert_muting_rules : k => v.name if v.name != null && length(v.name) > 0 }
}
output "alert_muting_rules_schedule" {
  description = "Map of schedule values across all alert_muting_rules, keyed the same as var.alert_muting_rules except keys with no schedule are omitted"
  value       = { for k, v in newrelic_alert_muting_rule.alert_muting_rules : k => one(v.schedule) if v.schedule != null && length(v.schedule) > 0 }
}

