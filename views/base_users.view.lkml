view: base_users {
  sql_table_name: `the-line-crm-3-0.sandbox_poc.users` ;;

  dimension: beneficiaries {
    type: number
    sql: ${TABLE}.beneficiaries ;;
  }
  dimension: full_date {
    type: date
    sql: ${TABLE}.full_date ;;
  }
  dimension: month_year_ar {
    type: string
    sql: ${TABLE}.month_year_ar ;;
    label: "شهر"
  }
  dimension: supply_card_holders {
    type: number
    sql: ${TABLE}.supply_card_holders ;;
  }
  measure: count {
    type: count
  }
}
