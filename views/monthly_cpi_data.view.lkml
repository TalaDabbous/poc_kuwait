view: monthly_cpi_data {
  sql_table_name: `the-line-crm-3-0.sandbox_poc.monthly_cpi_data ` ;;

  dimension: annual_change_rate_prc {
    type: number
    sql: ${TABLE}.annual_change_rate_prc ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: cpi {
    type: number
    sql: ${TABLE}.cpi ;;
  }
  dimension: full_date {
    type: date
    sql: ${TABLE} ;;
  }
  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }
  dimension: month_ar {
    type: string
    sql: ${TABLE}.month_ar ;;
  }
  dimension: month_year {
    type: string
    sql: ${TABLE}.month_year ;;
  }
  dimension: month_year_ar {
    type: string
    sql: ${TABLE}.month_year_ar ;;
    label: "شهر"
  }
  dimension: monthly_change_rate_prc {
    type: number
    sql: ${TABLE}.monthly_change_rate_prc ;;
  }
  dimension: previous_month_cpi {
    type: number
    sql: ${TABLE}.previous_month_cpi ;;
  }
  dimension: previous_year_cpi {
    type: number
    sql: ${TABLE}.previous_year_cpi ;;
  }
  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }
  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
  }
}
