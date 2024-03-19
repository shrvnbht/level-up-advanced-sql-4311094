-- Cars sold per employee

SELECT employee.employeeId,employee.firstName, employee.lastName, 
count(*) as Total_Car_Sales
from sales
join employee
on sales.employeeId = employee.employeeId
group by employee.employeeId, employee.firstName, employee.lastName
order by Total_Car_Sales DESC

-- Least and Most Expensive car sold by each employee

select employee.employeeId, employee.firstName, employee.lastName, 
min (s.salesAmount) as Least_Expensive_Car_Sold,
max (s.salesAmount)as Most_Expensive_Car_Sold 
from sales s
join employee
on s.employeeId = employee.employeeId
where s.soldDate >= '2023-01-01' and s.soldDate <= '2023-12-31'
group by employee.employeeId, employee.firstName, employee.lastName


-- List of Employees making more than 5 sales this year (2023)

SELECT employee.employeeId,employee.firstName, employee.lastName, 
count (*) as Current_Total_Sales,
min (sales.salesAmount) as Least_Expensive_Car_Sold,
max (sales.salesAmount)as Most_Expensive_Car_Sold
from sales
join employee
on sales.employeeId = employee.employeeId
where sales.soldDate >= '2023-01-01' and sales.soldDate <= '2023-12-31'
group by employee.employeeId, employee.firstName, employee.lastName
HAVING Current_Total_Sales >= 5
order by Current_Total_Sales DESC