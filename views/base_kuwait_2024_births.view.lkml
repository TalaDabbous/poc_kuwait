view: base_kuwait_2024_births {
  sql_table_name: `the-line-crm-3-0.sandbox_poc.kuwait_2024_births` ;;

  dimension: full_date {
    type: date
    sql: ${TABLE} ;;
  }
  dimension: kuwaiti {
    type: number
    sql: ${TABLE}.kuwaiti ;;
  }
  dimension: month_year_ar {
    type: string
    sql: ${TABLE}.month_year_ar ;;
    label: "شهر"
  }
  dimension: non_kuwaiti {
    type: number
    sql: ${TABLE}.non_kuwaiti ;;
  }
  measure: count {
    type: count
  }
}
