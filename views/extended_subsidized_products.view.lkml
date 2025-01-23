include: "/views/**/*.view.lkml"

view: extended_subsidized_products {
  extends: [base_subsidized_products]

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.full_date ;;
  }

  dimension: pk {
    primary_key: yes
    sql: CONCAT(${category}, ' - ', ${date_month}) ;;
  }

  measure: value_sum {
    type: sum
    sql: ${value} ;;
    value_format: "#,##0"
    label: "(KWD) التمويل"
  }
}
