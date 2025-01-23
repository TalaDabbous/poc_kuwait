view: base_subsidized_products {
  sql_table_name: `the-line-crm-3-0.sandbox_poc.subsidized_products` ;;

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: category_ar {
    type: string
    sql: ${TABLE}.category_ar ;;
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
  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
  measure: count {
    type: count
  }
}
