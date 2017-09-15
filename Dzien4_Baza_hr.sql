#1. 
SELECT 
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name
FROM
    employees AS e
        LEFT JOIN 
    departments AS d ON e.department_id = d.department_id;
#2. 
SELECT 
    e.first_name,
    e.last_name,
    d.department_name,
    l.city,
    l.state_province
FROM
    employees AS e
        LEFT JOIN
    departments AS d ON e.department_id = d.department_id
       LEFT JOIN
    locations AS l ON d.location_id = l.location_id;
#4.
    
 SELECT 
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name
FROM
    employees AS e
        JOIN
    departments AS d ON e.department_id = d.department_id
WHERE
    e.department_id = 40
        OR e.department_id = 80; 
        
#5. 
SELECT 
    e.first_name,
    e.last_name,
    d.department_name,
    l.city,
    l.state_province
FROM
    employees AS e
        JOIN
    departments AS d ON e.department_id = d.department_id
        LEFT JOIN
    locations AS l ON d.location_id = l.location_id
WHERE
    e.first_name LIKE '%z%';
#6.     
SELECT 
    d.department_name, e.*
FROM
    employees AS e
        RIGHT JOIN
   departments AS d  ON d.department_id = e.department_id;
#7. 
SELECT e.first_name, e.last_name,e.salary FROM employees AS e  WHERE salary<(SELECT salary FROM employees WHERE employee_id=182 );
# Wersja z join:
SELECT 
    e.first_name, e.last_name, e.salary
FROM
    employees AS e
        JOIN
    employees AS ee ON e.salary < ee.salary
WHERE
    ee.employee_id = 182;
   
#8. 
SELECT 
    e.first_name AS 'Pracownik name',
    m.first_name AS 'Szef name'
FROM
    employees AS e
        LEFT JOIN
    employees m ON e.manager_id = m.employee_id;  

#13 USING ! // sam robi łączenia 
SELECT 
    j.job_title,
    d.department_name,
    e.first_name,
    e.last_name,
    jh.start_date
FROM
    job_history AS jh
        JOIN
    jobs AS j USING (job_id)
        JOIN
    departments AS d USING (department_id)
        JOIN
    employees AS e USING (employee_id)
WHERE
    jh.start_date >= '1993-01-01'
        AND jh.start_date <= '1997-08-31';
    
 # 14. 
 SELECT 
    c.country_name, l.city, d.department_name
FROM
    countries AS c
        JOIN
    locations AS l USING (country_id)
        JOIN
    departments AS d USING (location_id);
    
# 15
 SELECT d.department_name, m.first_name, m.last_name  FROM departments AS d JOIN employees m ON(d.manager_id=m.employee_id);

# 16.
 SELECT 
    country_name,
    city,
    COUNT(department_id) AS 'Ilość departamentów'
FROM
    countries
        JOIN
    locations USING (country_id)
        JOIN
    departments USING (location_id)
WHERE
    department_id IN (SELECT 
            department_id
        FROM
            employees
        GROUP BY department_id
        HAVING COUNT(department_id) >= 2)
GROUP BY country_name , city;

