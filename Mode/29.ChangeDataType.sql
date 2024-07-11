/* Convert the funding_total_usd and founded_at_clean columns in the tutorial.crunchbase_companies_clean_date table 
to strings (varchar format) using a different formatting function for each one.
*/ 


SELECT CAST(funding_total_usd AS varchar) AS funding_total_usd_string,
       founded_at_clean::varchar AS founded_at_string
  FROM tutorial.crunchbase_companies_clean_date