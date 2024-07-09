/*
Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

Note:

The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.
*/

SELECT comp.company_code, 
              founder,
              COUNT(DISTINCT lm.lead_manager_code),
              COUNT(DISTINCT sm.senior_manager_code),
              COUNT(DISTINCT mng.manager_code),
              COUNT(DISTINCT emp.employee_code)
FROM Company comp
LEFT JOIN Lead_Manager lm ON lm.company_code = comp.company_code
LEFT JOIN Senior_Manager sm ON sm.lead_manager_code = lm.lead_manager_code
LEFT JOIN Manager mng ON mng.senior_manager_code = sm.senior_manager_code
LEFT JOIN Employee emp ON emp.manager_code = mng.manager_code 
GROUP BY comp.company_code, founder
ORDER BY company_code asc
