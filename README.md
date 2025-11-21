# STAT804 – Time Series Forecasting

**Course:** STAT804 – Stochastic Methods in Statistical Analysis (Enhanced)
**Author:** Yeongjin Yu  
**Date:** 2025  

This repository contains a time series analysis and forecasting project completed for STAT804.  
The data consist of monthly eSports membership counts from 2020–2024 (`hist.csv`).  
The project explores seasonal patterns, fits an ARIMA model, performs diagnostic checks, and produces 24-month forecasts using R.

---

## Objectives

- Explore seasonal and long-term patterns in the membership data  
- Examine autocorrelation behaviour using ACF and PACF plots  
- Fit the optimal ARIMA model using `auto.arima()`  
- Assess model adequacy using residual diagnostics  
- Forecast future membership values over a 24-month horizon  

---

## Files Included

- `stat804_timeseries.R` — Full R script for analysis  
- `hist.csv` — Provided monthly membership dataset  
- `forecast_output.csv` — 24-month ARIMA forecast results  
- `README.md` — This summary file  

---

## Methods & Tools

### **R Packages**
- `forecast`
- `ggplot2`
- `tseries`

### **Techniques Applied**
- Seasonal plots and subseries plots  
- ACF and PACF interpretation  
- ARIMA model selection using `auto.arima()`  
- Residual diagnostics (Ljung–Box, ACF of residuals)  
- Forecast visualisation and trend projection  

---

## Summary of Analysis

1. The data exhibit **clear seasonality** and an overall upward trend.  
2. The ACF shows strong seasonal dependence at lag 12.  
3. `auto.arima()` identified an appropriate differencing structure for the series.  
4. Residual diagnostics confirmed that the chosen ARIMA model produced **white-noise residuals**, indicating model adequacy.  
5. The final ARIMA model was used to generate a **24-month forecast**, with prediction intervals reflecting uncertainty.

---

## Running the Script

Run the following in R:

```r
source("stat804_timeseries.R")
```

The script will:

- Load the dataset  
- Produce all plots (seasonal, ACF/PACF, diagnostics, forecast)  
- Export the forecast results to `forecast_output.csv`
