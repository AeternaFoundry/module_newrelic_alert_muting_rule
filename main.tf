resource "newrelic_alert_muting_rule" "alert_muting_rules" {
  for_each = var.alert_muting_rules

  enabled                            = each.value.enabled
  name                               = each.value.name
  account_id                         = each.value.account_id
  action_on_muting_rule_window_ended = each.value.action_on_muting_rule_window_ended
  description                        = each.value.description

  condition {
    dynamic "conditions" {
      for_each = each.value.condition.conditions
      content {
        attribute = conditions.value.attribute
        operator  = conditions.value.operator
        values    = conditions.value.values
      }
    }
    operator = each.value.condition.operator
  }

  dynamic "schedule" {
    for_each = each.value.schedule != null ? [each.value.schedule] : []
    content {
      end_repeat         = schedule.value.end_repeat
      end_time           = schedule.value.end_time
      repeat             = schedule.value.repeat
      repeat_count       = schedule.value.repeat_count
      start_time         = schedule.value.start_time
      time_zone          = schedule.value.time_zone
      weekly_repeat_days = schedule.value.weekly_repeat_days
    }
  }
}

