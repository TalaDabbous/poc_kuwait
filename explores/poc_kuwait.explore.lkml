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
