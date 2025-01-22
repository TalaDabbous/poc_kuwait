connection: "poc_kuwait"

# include all the views
include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

datagroup: poc_kuwait_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: poc_kuwait_default_datagroup

explore: cpi_data {}
