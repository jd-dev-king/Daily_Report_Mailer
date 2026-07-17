library(tidyverse)
library(lubridate)

# Clean production data

production$Date <- ymd(production$Date)

# Remove duplicate records
production <- distinct(production)

# Remove missing values
production <- na.omit(production)

# Display cleaned data summary

cat("Production data cleaned successfully\n")
cat("Rows:", nrow(production), "\n")
cat("Columns:", ncol(production), "\n")

print(head(production))

