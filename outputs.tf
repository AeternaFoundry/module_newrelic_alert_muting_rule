output "alert_muting_rules_id" {
  description = "Map of id values across all alert_muting_rules, keyed the same as var.alert_muting_rules"
  value       = { for k, v in newrelic_alert_muting_rule.alert_muting_rules : k => v.id }
}
output "alert_muting_rules_account_id" {
  description = "Map of account_id values across all alert_muting_rules, keyed the same as var.alert_muting_rules"
  value       = { for k, v in newrelic_alert_muting_rule.alert_muting_rules : k => v.account_id }
}
output "alert_muting_rules_action_on_muting_rule_window_ended" {
  description = "Map of action_on_muting_rule_window_ended values across all alert_muting_rules, keyed the same as var.alert_muting_rules"
  value       = { for k, v in newrelic_alert_muting_rule.alert_muting_rules : k => v.action_on_muting_rule_window_ended }
}
output "alert_muting_rules_condition" {
  description = "Map of condition values across all alert_muting_rules, keyed the same as var.alert_muting_rules"
  value       = { for k, v in newrelic_alert_muting_rule.alert_muting_rules : k => one(v.condition) }
}
output "alert_muting_rules_description" {
  description = "Map of description values across all alert_muting_rules, keyed the same as var.alert_muting_rules"
  value       = { for k, v in newrelic_alert_muting_rule.alert_muting_rules : k => v.description }
}
output "alert_muting_rules_enabled" {
  description = "Map of enabled values across all alert_muting_rules, keyed the same as var.alert_muting_rules"
  value       = { for k, v in newrelic_alert_muting_rule.alert_muting_rules : k => v.enabled }
}
output "alert_muting_rules_name" {
  description = "Map of name values across all alert_muting_rules, keyed the same as var.alert_muting_rules"
  value       = { for k, v in newrelic_alert_muting_rule.alert_muting_rules : k => v.name }
}
output "alert_muting_rules_schedule" {
  description = "Map of schedule values across all alert_muting_rules, keyed the same as var.alert_muting_rules"
  value       = { for k, v in newrelic_alert_muting_rule.alert_muting_rules : k => one(v.schedule) }
}

