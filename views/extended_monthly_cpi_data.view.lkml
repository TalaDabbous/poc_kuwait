include: "/views/**/*.view.lkml"

view: extended_monthly_cpi_data {
  extends: [base_monthly_cpi_data]

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
    sql: CONCAT(${category}, ' - ', ${month_year}) ;;
  }

  measure: cpi_avg_w_parameter {
    type: average
    sql:
    CASE
      WHEN {% parameter category_m %} = 'All items' AND ${category} = 'all items' THEN ${cpi}
      WHEN {% parameter category_m %} = 'All items less food' AND ${category} = 'all items less food' THEN ${cpi}
      WHEN {% parameter category_m %} = 'All items less housing' AND ${category} = 'all items less housing' THEN ${cpi}
      WHEN {% parameter category_m %} = 'All items less food and housing' AND ${category} = 'all items less food and housing' THEN ${cpi}
      ELSE NULL
    END ;;
    value_format: "0.0"
    label: "مؤشر أسعار المستهلك"
  }

  measure: monthly_change_rate_prc_avg_w_parameter {
    type: average
    sql:
      CASE
        WHEN {% parameter category_m %} = 'All items' AND ${category} = 'all items' THEN ${monthly_change_rate_prc}
        WHEN {% parameter category_m %} = 'All items less food' AND ${category} = 'all items less food' THEN ${monthly_change_rate_prc}
        WHEN {% parameter category_m %} = 'All items less housing' AND ${category} = 'all items less housing' THEN ${monthly_change_rate_prc}
        WHEN {% parameter category_m %} = 'All items less food and housing' AND ${category} = 'all items less food and housing' THEN ${monthly_change_rate_prc}
        ELSE NULL
      END ;;
    value_format: "0.00\%"
    label: "نسبة التغيير الشهرية لمؤشر أسعار المستهلك"
  }

  measure: annual_change_rate_prc_avg_w_parameter{
    type: average
    sql:
      CASE
        WHEN {% parameter category_m %} = 'All items' AND ${category} = 'all items' THEN ${annual_change_rate_prc}
        WHEN {% parameter category_m %} = 'All items less food' AND ${category} = 'all items less food' THEN ${annual_change_rate_prc}
        WHEN {% parameter category_m %} = 'All items less housing' AND ${category} = 'all items less housing' THEN ${annual_change_rate_prc}
        WHEN {% parameter category_m %} = 'All items less food and housing' AND ${category} = 'all items less food and housing' THEN ${annual_change_rate_prc}
        ELSE NULL
      END ;;
    value_format: "0.00\%"
    label: "نسبة التغيير السنوية لمؤشر أسعار المستهلك"
  }

  parameter: category_m {
    type: string
    allowed_value: {
      label: "الرقم القياسي العام لأسعار المستهلك"
      value: "All items"
    }
    allowed_value: {
      label: "المجموع باستثناء الأغذية والمشروبات"
      value: "All items less food"
    }
    allowed_value: {
      label: "المجموع باستثناء خدمات السكن"
      value: "All items less housing"
    }
    allowed_value: {
      label: "المجموع باستثناء الأغذية والسكن"
      value: "All items less food and housing"
    }
  }
}
