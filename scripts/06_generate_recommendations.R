#----------------------------------
# Automated Engineering Recommendations
#----------------------------------


recommendations <- c()


# Yield Recommendation

if(average_yield < 95){

  recommendations <- c(
    recommendations,
    "Investigate process variation impacting yield."
  )

} else {

  recommendations <- c(
    recommendations,
    "Yield performance is within target range."
  )

}



# Scrap Recommendation

if(average_scrap > 3){

  recommendations <- c(
    recommendations,
    "Review defect trends and perform root cause analysis on scrap drivers."
  )

} else {

  recommendations <- c(
    recommendations,
    "Scrap performance is acceptable."
  )

}



# Downtime Recommendation

if(average_downtime > 60){

  recommendations <- c(
    recommendations,
    paste(
      "Analyze recurring downtime causes. Primary issue:",
      top_downtime_issue
    )
  )

} else {

  recommendations <- c(
    recommendations,
    "Downtime is within expected operating limits."
  )

}



# OEE Recommendation

if(average_oee < 85){

  recommendations <- c(
    recommendations,
    "OEE improvement opportunity identified. Review Availability, Performance, and Quality losses."
  )

} else {

  recommendations <- c(
    recommendations,
    "OEE performance meets operational expectations."
  )

}



cat("\nEngineering Recommendations:\n")

for(rec in recommendations){

  cat("-", rec, "\n")

}
