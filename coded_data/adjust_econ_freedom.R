# Load economic freedom data 
# will need library(readxl)

econ_freedom <- read_excel("~/Downloads/final_proj/raw_data/econ_freedom.xls")
econ_freedom <- as_tibble(econ_freedom)
colnames(econ_freedom)

# Rename columns in economic freedom data 

econ_freedom <- econ_freedom %>% 
  rename(
    countryID = `CountryID`, 
    country_name = `Country Name`,
    webname = WEBNAME, 
    region = Region, 
    world_rank = `World Rank`, 
    region_rank = `Region Rank`, 
    total_score = `2018 Score`, 
    property_rights = `Property Rights`, 
    judical_effectiveness = `Judical Effectiveness`, 
    govt_integrity = `Government Integrity`, 
    tax_burden = `Tax Burden`, 
    govt_spending = `Gov't Spending`, 
    fiscal_health = `Fiscal Health`, 
    bis_freedom = `Business Freedom`, 
    labor_freedom = `Labor Freedom`, 
    monetary_freedom = `Monetary Freedom`, 
    trade_freedom = `Trade Freedom`, 
    invest_freedom = `Investment Freedom`, 
    finance_freedom = `Financial Freedom`, 
    tariff_rate_perc = `Tariff Rate (%)`, 
    income_tax_rate_per = `Income Tax Rate (%)`, 
    corporate_tax_rate_per = `Corporate Tax Rate (%)`, 
    tax_burden_per_of_gdp = `Tax Burden % of GDP`, 
    govt_expenditure_per_of_gdp = `Gov't Expenditure % of GDP`, 
    country = Country, 
    pop_in_mil = `Population (Millions)`, 
    gdp_bill_ppp = `GDP (Billions, PPP)`, 
    gdp_growth_rate_perc = `GDP Growth Rate (%)`, 
    five_year_gdp_growth_rate_per = `5 Year GDP Growth Rate (%)`, 
    gdp_per_capita = `GDP per Capita (PPP)`, 
    unemployment_per = `Unemployment (%)`, 
    inflation_per = `Inflation (%)`, 
    fdi_inflow_mil = `FDI Inflow (Millions)`, 
    public_debt_per_of_gdp = `Public Debt (% of GDP)`
  )

colnames(econ_freedom)

# create second data set only with columns we care about 

small_econ <- data.frame("country_name" = econ_freedom$country_name,
                         "region" = econ_freedom$region,
                         "econ_freddom" = econ_freedom$total_score)
