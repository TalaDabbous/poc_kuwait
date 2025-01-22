view: base_sub_major_groups {
  sql_table_name: `the-line-crm-3-0.sandbox_poc.sub_cpi_data` ;;

  dimension: major_groups {
    type: string
    sql: ${TABLE}.major_groups ;;
  }
  dimension: major_groups_ar {
    type: string
    sql: ${TABLE}.major_groups_ar ;;
  }
  dimension: sub_major_groups {
    type: string
    sql: ${TABLE}.sub_major_groups ;;
  }
  dimension: sub_major_groups_ar {
    type: string
    sql: ${TABLE}.sub_major_groups_ar ;;
    label: "المنتجات"
  }
  dimension: sub_cpi {
    type: number
    sql: ${TABLE}.sub_cpi ;;
  }
  dimension: full_date {
    type: date
    sql: ${TABLE} ;;
  }
  measure: count {
    type: count
  }
}
