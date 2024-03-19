-- Most model of cars sold by each salesperson

select employee.firstName, employee.lastName, model.model, sales.salesId,
count (model.model) as Models_Sold,
rank () over (PARTITION BY employee.employeeId order by count (model.model) desc) as Rank 
from sales
inner join employee on sales.employeeId = employee.employeeId
inner join inventory on inventory.inventoryId = sales.inventoryId
inner join model on model.modelId = inventory.modelId
group by employee.firstName, employee.lastName, model.model

-- Sales report showing sales per month and running total

select strftime ('%Y',soldDate) as sold_year , strftime ('%m',soldDate) as sold_month,
sum (salesAmount) as Total_Monthly_Sales,
sum (sum (salesAmount)) over (order by soldDate) as Annual_Total
from sales 
GROUP BY strftime ('%Y',soldDate), strftime ('%m',soldDate)
order by strftime ('%Y',soldDate), strftime ('%m',soldDate)


-- Number of cars sold in current and previous month

select strftime ('%Y', soldDate) as Year_Sold, strftime('%m', soldDate) as month_sold,
count (inventoryId) as current_month_sales,
lag ( count (inventoryId)) over (order by soldDate) as Previous_month_Sales
from sales
group by strftime ('%Y', soldDate), strftime('%m', soldDate)
order by strftime ('%Y', soldDate), strftime('%m', soldDate)


