#----------------------------------
# Daily Report Mailer
# Main Controller
#----------------------------------


source("scripts/00_logger.R")


log_message(
  "Automation started"
)


tryCatch({


  source("scripts/01_load_data.R")

  log_message(
    "Data loaded successfully"
  )


  source("scripts/02_clean_data.R")

  log_message(
    "Data cleaning completed"
  )


  source("scripts/03_calculate_manufacturing_kpis.R")

  log_message(
    "KPI calculations completed"
  )

  source("scripts/04_create_manufacturing_charts.R")
    log_message("Manufacturing charts created successfully")

  source("scripts/05_export_dashboard_data.R")
    log_message("Data dashboard exported")

  source("scripts/06_generate_recommendations.R")
    log_message("Recommendations submitted successfully")

  source("scripts/07_generate_report.R")

  log_message(
    "Report generated successfully"
  )


  source("scripts/08_send_email.R")

  log_message(
    "Email sent successfully"
  )


  log_message(
    "Automation completed successfully"
  )


}, error = function(e){


  log_message(
    paste(
      "ERROR:",
      e$message
    )
  )


})
