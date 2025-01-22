include: "/views/**/*.view.lkml"

view: base_cpi_data {
  sql_table_name: `sandbox_poc.cpi_data` ;;

  dimension: annual_change_rate_prc {
    type: number
    sql: ${TABLE}.annual_change_rate_prc ;;
    }
  dimension: cpi {
    type: number
    sql: ${TABLE}.cpi ;;
  }
  dimension: major_groups {
    type: string
    sql: ${TABLE}.major_groups ;;
  }
  dimension: major_groups_ar {
    type: string
    sql: ${TABLE}.major_groups_ar ;;
    label: "المجموعات الرئيسية"
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
  dimension: full_date {
    type: date
    sql: ${TABLE} ;;
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
