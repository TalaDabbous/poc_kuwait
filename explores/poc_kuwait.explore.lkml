include: "/views/**/*.*"

explore: poc_kuwait {
  label: "PoC"
  view_label: "PoC"
  from: extended_cpi_data

  join: extended_monthly_cpi_data {
    relationship: many_to_many
    sql_on: ${poc_kuwait.date_month} = ${extended_monthly_cpi_data.date_month}
            ;;
  }

  join: extended_sub_major_groups {
    relationship: many_to_many
    sql_on: ${poc_kuwait.date_month} = ${extended_sub_major_groups.date_month} AND ${poc_kuwait.major_groups} = ${extended_sub_major_groups.major_groups}
      ;;
  }

}

explore: supply_report {
  label: "Supply Report"
  view_label: "Supply Report"
  from: extended_subsidized_products

  join: extended_users {
    relationship: many_to_one
    sql_on: ${supply_report.date_month} = ${extended_users.date_month}
      ;;
  }

  join: extended_cpi_data {
    relationship: many_to_many
    sql_on: ${extended_cpi_data.date_month} = ${supply_report.date_month}
      ;;
  }

  join: extended_kuwait_2024_births {
    relationship: many_to_one
    sql_on: ${extended_cpi_data.date_month} = ${extended_kuwait_2024_births.date_month}
      ;;
  }

}
