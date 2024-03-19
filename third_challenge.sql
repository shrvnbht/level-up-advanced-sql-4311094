-- Total sales per year
with sales_yearly as (
select 
strftime ('%Y', soldDate) as Year_Sold, salesAmount
from sales
)
select Year_Sold,
format ('$%.2f', sum (salesAmount)) as Yearly_Sales
from sales_yearly
group by Year_Sold
order by Year_Sold

-- Sales per employee by month in 2021

select employee.firstName, employee.lastName,
sum ( case when strftime ('%m', sales.soldDate) = '01' then sales.salesAmount end) as Jan_Sales,
sum ( case when strftime ('%m', sales.soldDate) = '02' then sales.salesAmount end) as FEB_Sales,
sum ( case when strftime ('%m', sales.soldDate) = '03' then sales.salesAmount end) as Mar_Sales,
sum ( case when strftime ('%m', sales.soldDate) = '04' then sales.salesAmount end) as Apr_Sales,
sum ( case when strftime ('%m', sales.soldDate) = '05' then sales.salesAmount end) as May_Sales,
sum ( case when strftime ('%m', sales.soldDate) = '06' then sales.salesAmount end) as Jun_Sales,
sum ( case when strftime ('%m', sales.soldDate) = '07' then sales.salesAmount end) as Jul_Sales,
sum ( case when strftime ('%m', sales.soldDate) = '08' then sales.salesAmount end) as Aug_Sales,
sum ( case when strftime ('%m', sales.soldDate) = '09' then sales.salesAmount end) as Sep_Sales,
sum ( case when strftime ('%m', sales.soldDate) = '10' then sales.salesAmount end) as Oct_Sales,
sum ( case when strftime ('%m', sales.soldDate) = '11' then sales.salesAmount end) as Nov_Sales,
sum ( case when strftime ('%m', sales.soldDate) = '12' then sales.salesAmount end) as Dec_Sales
from sales
join employee
on sales.employeeId = employee.employeeId
WHERE sales.soldDate >= '2021-01-01' AND
sales.soldDate <= '2021-12-31'
group by employee.employeeId
order by employee.firstName, employee.lastName

-- Sale of cars that are electric

select sales.salesId, sales.salesAmount, inventory.colour, inventory.year
from sales
inner join inventory
on sales.inventoryId = inventory.inventoryId
where inventory.modelId in (
select modelId from model
where EngineType = 'Electric'
)



select sales.salesId, sales.salesAmount, inventory.inventoryId,
model.model, inventory.year, inventory.colour
from sales
inner join inventory on sales.inventoryId = inventory.inventoryId
inner join model on inventory.modelId = model.modelId
where model.EngineType = 'Electric'
