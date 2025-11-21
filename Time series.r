##############################################################
# STAT804 – Report 2: Time Series Forecasting (hist.csv)
# Student: Yeongjin Yu
# Purpose: Analyse and forecast eSports membership data
##############################################################

# 1. Load libraries and data ---------------------------------
library(forecast)
library(ggplot2)
library(tseries)

# Apply a clean consistent theme to all ggplots
theme_set(theme_minimal(base_size = 14))

# Set working directory (← change this path to your folder)
#setwd("C:/Users/yourname/Downloads")

# Read the CSV file
hist <- read.csv("hist.csv")

# Check data structure
str(hist)
head(hist)

# 2. Create time-series object -------------------------------
# Assume monthly data for 5 years starting in Jan 2020
#hist.ts <- ts(hist[, 2], start = c(2020, 1), frequency = 12)
hist.ts <- ts(hist[, 1], start = c(2020, 1), frequency = 12)

# Plot the series
# autoplot(hist.ts) +
#   labs(title = "Monthly eSports Memberships (millions)",
#        x = "Year", y = "Subscribers (millions)")

autoplot(hist.ts) +
  labs(
    title = "Monthly eSports Memberships (2020–2024)",
    subtitle = "Data in millions of subscribers",
    x = "Year",
    y = "Subscribers (millions)"
  ) +
  theme_minimal(base_size = 14)

# 3. Explore basic patterns ----------------------------------
# Seasonal and subseries plots
# ggseasonplot(hist.ts)
# ggsubseriesplot(hist.ts)

ggseasonplot(hist.ts) +
  labs(
    title = "Seasonal Plot of eSports Memberships",
    subtitle = "Membership pattern by month and year",
    x = "Month",
    y = "Subscribers (millions)"
  ) +
  theme_minimal(base_size = 14)

ggsubseriesplot(hist.ts) +
  labs(
    title = "Subseries Plot of Monthly Memberships",
    subtitle = "Average membership level by month across years",
    x = "Month",
    y = "Subscribers (millions)"
  ) +
  theme_minimal(base_size = 14)

# Autocorrelation and partial autocorrelation
# acf(hist.ts)
# pacf(hist.ts)
acf(hist.ts, main = "Autocorrelation Function (ACF) of Membership Series")
pacf(hist.ts, main = "Partial Autocorrelation Function (PACF) of Membership Series")

# 4. Fit the best ARIMA model --------------------------------
fit <- auto.arima(hist.ts)
summary(fit)

# 5. Check residuals (diagnostics) ----------------------------
# checkresiduals(fit)

checkresiduals(fit) +
  labs(
    title = "Residual Diagnostics for ARIMA(0,1,0)",
    subtitle = "Residuals, ACF of residuals, and normality check"
  )

# Interpretation guideline:
# - Residual plot → no visible pattern
# - ACF → no significant spikes
# - Ljung–Box p-value > 0.05 → residuals are white noise

# 6. Forecast next 24 months ---------------------------------
fc <- forecast(fit, h = 24)

# Plot forecasts
autoplot(fc) +
  labs(title = "Forecasted eSports Memberships",
       x = "Year", y = "Subscribers (millions)")

# View forecast table
fc

# 7. Save results for report ---------------------------------
write.csv(fc, "forecast_output.csv")

##############################################################
# End of STAT804 Report 2 Script
##############################################################
