include: "/views/**/*.view.lkml"

view: extended_users {
  extends: [base_users]

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

  measure: supply_card_holders_sum {
    type: sum
    sql: ${supply_card_holders} ;;
    label: "عدد حاملي بطاقة التموين"
    value_format: "#,##0"
  }

  measure: supply_card_holders_avg {
    type: average
    sql: ${supply_card_holders} ;;
    label: "معدل ​​الشهري لعدد حاملي بطاقات التموين"
    value_format: "#,##0"
  }

  measure: beneficiaries_sum {
    type: sum
    sql: ${beneficiaries} ;;
    value_format: "#,##0"
    label: "المستفيدين"
  }

  measure: beneficiaries_avg {
    type: average
    sql: ${beneficiaries} ;;
    value_format: "#,##0"
    label: "معدل ​​الشهري لعدد المستفيدين "
    }
}
