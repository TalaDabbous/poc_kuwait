include: "/views/**/*.view.lkml"

view: extended_cpi_data {
  extends: [base_cpi_data]

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
    sql: CONCAT(${major_groups}, ' - ', ${month_year}) ;;
  }

  measure: cpi_avg {
    type: average
    sql: ${cpi};;
    value_format: "0.0"
  }

  measure: cpi_avg_w_parameter {
    type: average
    sql:
    CASE
      WHEN {% parameter category %} = 'All items' AND ${all_items} = 1 THEN ${cpi}
      WHEN {% parameter category %} = 'All items less food' AND ${all_items_less_food} = 1 THEN ${cpi}
      WHEN {% parameter category %} = 'All items less housing' AND ${all_items_less_housing} = 1 THEN ${cpi}
      WHEN {% parameter category %} = 'All items less food and housing' AND ${all_items_less_food_housing} = 1 THEN ${cpi}
      ELSE NULL
    END ;;
    value_format: "0.0"
    label: "مؤشر أسعار المستهلك"
    drill_fields: [major_groups_ar, extended_sub_major_groups.sub_major_groups_ar, extended_sub_major_groups.sub_cpi_avg]
  }

  measure: cpi_avg_w_parameter_without_drill {
    type: average
    sql:
    CASE
      WHEN {% parameter category %} = 'All items' AND ${all_items} = 1 THEN ${cpi}
      WHEN {% parameter category %} = 'All items less food' AND ${all_items_less_food} = 1 THEN ${cpi}
      WHEN {% parameter category %} = 'All items less housing' AND ${all_items_less_housing} = 1 THEN ${cpi}
      WHEN {% parameter category %} = 'All items less food and housing' AND ${all_items_less_food_housing} = 1 THEN ${cpi}
      ELSE NULL
    END ;;
    value_format: "0.0"
    label: "مؤشر أسعار المستهلك"
  }

  measure: previous_year_cpi_avg {
    type: average
    sql: ${previous_year_cpi} ;;
    value_format: "0.0"
  }

  measure: previous_month_cpi_avg {
    type: average
    sql: ${previous_month_cpi} ;;
    value_format: "0.0"
  }

  measure: monthly_change_rate_prc_avg {
    type: average
    sql: ${monthly_change_rate_prc} ;;
    value_format: "0.0"
  }

  measure: monthly_change_rate_prc_avg_w_parameter {
    type: average
    sql:
      CASE
        WHEN {% parameter category %} = 'All items' AND ${all_items} = 1 THEN ${monthly_change_rate_prc}
        WHEN {% parameter category %} = 'All items less food' AND ${all_items_less_food} = 1 THEN ${monthly_change_rate_prc}
        WHEN {% parameter category %} = 'All items less housing' AND ${all_items_less_housing} = 1 THEN ${monthly_change_rate_prc}
        WHEN {% parameter category %} = 'All items less food and housing' AND ${all_items_less_food_housing} = 1 THEN ${monthly_change_rate_prc}
        ELSE NULL
      END ;;
    value_format: "0.00\%"
    label: "نسبة التغيير الشهرية لمؤشر أسعار المستهلك"
  }


  measure: monthly_change_rate_prc_avg_w_parameter_html {
    type: number
    sql:
    ${cpi_avg_w_parameter} ;;
      html:
          {% if monthly_change_rate_prc_avg_w_parameter._value >=0  %}
          <p style="color: green; font-size:100%">+{{monthly_change_rate_prc_avg_w_parameter._rendered_value }}</p>
          {% else %}
          <p style="color: red; font-size:100%">{{monthly_change_rate_prc_avg_w_parameter._rendered_value }}</p>
          {% endif %} ;;

      }

  measure: annual_change_rate_prc_avg {
    type: average
    sql: ${annual_change_rate_prc} ;;
    value_format: "0.00\%"
  }

  measure: annual_change_rate_prc_avg_w_parameter{
    type: average
    sql:
      CASE
        WHEN {% parameter category %} = 'All items' AND ${all_items} = 1 THEN ${annual_change_rate_prc}
        WHEN {% parameter category %} = 'All items less food' AND ${all_items_less_food} = 1 THEN ${annual_change_rate_prc}
        WHEN {% parameter category %} = 'All items less housing' AND ${all_items_less_housing} = 1 THEN ${annual_change_rate_prc}
        WHEN {% parameter category %} = 'All items less food and housing' AND ${all_items_less_food_housing} = 1 THEN ${annual_change_rate_prc}
        ELSE NULL
      END ;;
    value_format: "0.00\%"
    label: "نسبة التغيير السنوية لمؤشر أسعار المستهلك"
  }

  # Items flagging and Parameter

  dimension: all_items {
    type: number
    sql: 1 ;;
  }

  dimension: all_items_less_food {
    type: number
    sql: CASE WHEN ${major_groups} = 'Food & Beverages' THEN 0 ELSE 1 END ;;
  }

  dimension: all_items_less_housing {
    type: number
    sql: CASE WHEN ${major_groups} = 'Housing Services' THEN 0 ELSE 1 END ;;
  }

  dimension: all_items_less_food_housing {
    type: number
    sql: CASE WHEN (${major_groups} = 'Housing Services' OR ${major_groups} = 'Food & Beverages') THEN 0 ELSE 1 END ;;
  }

  parameter: category {
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
