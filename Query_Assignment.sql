use DBI_ASSIGNMENT
select * from Employees
where rank like 'Excellent'
order by Facility

select * from Department

select * from Dependent
where Year(DepBirthDate) > 1990
order by DepBirthDate,EmpID

select * from Insurance
Where InsClinic = 'Winchester'
order by InsStartDate

select * from Participate
where PartEndDate between '2020-07-01' and '2020-09-30'
order by DeptID, PartStartDate

select * from city

select * from CarryOut
where year(ProStartDate) =2016
order by ProjectID

select * from Project
where ProjectName like '%Marketing'
order by budget

select * from position
where SalaryRate > 3
order by SalaryRate

select * from Attendance
where month(AttReceiveDate) = 2
order by AttReceiveDate,EmpID

select * from Salary
where ProjectID = 9 
order by AttID