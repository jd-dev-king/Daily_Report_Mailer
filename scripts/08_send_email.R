library(blastula)


#----------------------------------
# Create Email
#----------------------------------

email <- compose_email(

  body = "

  # Daily Business Report

  The automated daily report has been generated.

  Please see the attached HTML report.

  "

)


#----------------------------------
# Add Report Attachment
#----------------------------------

email <- email %>%
  add_attachment(
    file = "reports/Daily_Report.html"
  )


#----------------------------------
# Send Email
#----------------------------------

smtp_send(

  email,

  to = "jdlupton1@gmail.com",

  from = "jdlupton1@gmail.com",

  subject = "Daily Automated Report",

  credentials = creds_file("gmail_credentials")

)


cat("\nEmail sent successfully!\n")
