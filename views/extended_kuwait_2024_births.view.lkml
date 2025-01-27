include: "/views/**/*.view.lkml"

view: extended_kuwait_2024_births {
  extends: [base_kuwait_2024_births]

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
    sql: ${date_month} ;;
  }

  measure: kuwaiti_births {
    type: sum
    sql: ${kuwaiti} ;;
    label: "عدد المواليد الكويتيين"
    value_format: "#,##0"
  }

  measure: non_kuwaiti_births {
    type: sum
    sql: ${non_kuwaiti} ;;
    label: "عدد المواليد غير الكويتيين"
    value_format: "#,##0"
  }
}
