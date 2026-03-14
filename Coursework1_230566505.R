# MTH6139 Time Series Coursework
# Scratch file to test ideas before putting them in RMarkdown

# Load libraries
library(prophet)
library(zoo)

# Load CO2 dataset
data(co2)

# Convert to dataframe for Prophet
time_vector <- time(co2)
date_vector <- as.Date(as.yearmon(time_vector))

co2_dataframe <- data.frame(
  ds = date_vector,
  y = as.numeric(co2)
)

# View first rows
head(co2_dataframe)

# Fit Prophet model
prophet_model <- prophet(co2_dataframe)

# Create future dates (forecast 24 months)
future_dates <- make_future_dataframe(prophet_model, periods = 24, freq = "month")

# Predict
forecast_results <- predict(prophet_model, future_dates)

# Plot forecast
plot(prophet_model, forecast_results)