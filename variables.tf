variable "alert_muting_rules" {
  description = <<EOT
Map of alert_muting_rules, attributes below
Required:
    - enabled
    - name
    - condition (block):
        - conditions (required, block):
            - attribute (required)
            - operator (required)
            - values (required)
        - operator (required)
Optional:
    - account_id
    - action_on_muting_rule_window_ended
    - description
    - schedule (block):
        - end_repeat (optional)
        - end_time (optional)
        - repeat (optional)
        - repeat_count (optional)
        - start_time (optional)
        - time_zone (required)
        - weekly_repeat_days (optional)
EOT

  type = map(object({
    enabled                            = bool
    name                               = string
    account_id                         = optional(number)
    action_on_muting_rule_window_ended = optional(string)
    description                        = optional(string)
    condition = object({
      conditions = list(object({
        attribute = string
        operator  = string
        values    = list(string)
      }))
      operator = string
    })
    schedule = optional(object({
      end_repeat         = optional(string)
      end_time           = optional(string)
      repeat             = optional(string)
      repeat_count       = optional(number)
      start_time         = optional(string)
      time_zone          = string
      weekly_repeat_days = optional(set(string))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.alert_muting_rules : (
        length(v.condition.conditions) >= 1
      )
    ])
    error_message = "Each conditions list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.alert_muting_rules : (
        alltrue([for item in v.condition.conditions : (contains([for v in ["ANY", "CONTAINS", "ENDS_WITH", "EQUALS", "IN", "IS_BLANK", "IS_NOT_BLANK", "NOT_CONTAINS", "NOT_ENDS_WITH", "NOT_EQUALS", "NOT_IN", "NOT_STARTS_WITH", "STARTS_WITH"] : lower(v)], lower(item.operator)))])
      )
    ])
    error_message = "must be one of: \"ANY\", \"CONTAINS\", \"ENDS_WITH\", \"EQUALS\", \"IN\", \"IS_BLANK\", \"IS_NOT_BLANK\", \"NOT_CONTAINS\", \"NOT_ENDS_WITH\", \"NOT_EQUALS\", \"NOT_IN\", \"NOT_STARTS_WITH\", \"STARTS_WITH\""
  }
  validation {
    condition = alltrue([
      for k, v in var.alert_muting_rules : (
        contains([for v in ["AND", "OR"] : lower(v)], lower(v.condition.operator))
      )
    ])
    error_message = "must be one of: \"AND\", \"OR\""
  }
  validation {
    condition = alltrue([
      for k, v in var.alert_muting_rules : (
        v.schedule == null || (v.schedule.repeat == null || (contains(["DAILY", "WEEKLY", "MONTHLY"], v.schedule.repeat)))
      )
    ])
    error_message = "must be one of: \"DAILY\", \"WEEKLY\", \"MONTHLY\""
  }
  validation {
    condition = alltrue([
      for k, v in var.alert_muting_rules : (
        v.schedule == null || (v.schedule.repeat_count == null || (v.schedule.repeat_count >= 1))
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.alert_muting_rules : (
        v.schedule == null || (v.schedule.weekly_repeat_days == null || (alltrue([for x in v.schedule.weekly_repeat_days : contains(["MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY", "SUNDAY"], x)])))
      )
    ])
    error_message = "must be one of: \"MONDAY\", \"TUESDAY\", \"WEDNESDAY\", \"THURSDAY\", \"FRIDAY\", \"SATURDAY\", \"SUNDAY\""
  }
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

