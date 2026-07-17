#----------------------------------
# Export Dashboard Data
#----------------------------------

library(readr)


if(!dir.exists("dashboard_data")){
  dir.create("dashboard_data")
}


write_csv(
  production_kpis,
  "dashboard_data/production_dashboard.csv"
)


cat(
  "Dashboard data exported successfully!\n"
)
