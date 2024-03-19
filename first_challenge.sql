--List of employees and their managers
select e.employeeId, e.firstName as Employee_FirstName, e.lastName as Employee_LastName,e.title, 
m.firstName as Manager_FirstName, m.lastName as Manager_LastName  
from employee e
JOIN employee m 
on e.managerId = m.employeeId

-- List of employees with zero sales
select employee.employeeId,employee.firstName, employee.lastName, 
employee.title, sales.salesAmount
from employee
left join sales
on employee.employeeId = sales.employeeId
where employee.title = 'Sales Person'
and sales.salesAmount is NULL

--List of all customers and their sales

select customer.customerId, customer.firstName, customer.lastName,
sales.salesId, sales.employeeId, sales.salesAmount, sales.soldDate
from customer
full outer join sales
on customer.customerId = sales.customerId
order by customer.firstName