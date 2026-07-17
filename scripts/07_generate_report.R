library(rmarkdown)


#----------------------------------
# Generate HTML Report
#----------------------------------

if(!dir.exists("reports")){
  dir.create("reports")
}


render(
  input = "Daily_Report.Rmd",
  output_file = "Daily_Report.html",
  output_dir = "reports"
)


cat("\nReport generated successfully!\n")
