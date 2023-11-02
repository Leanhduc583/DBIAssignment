use DBI_ASSIGNMENT

--1 Count total number of employees within a department
create procedure checkDepartmentCountEmployee
@ID int
as
select d.DeptName, count(e.EmpID) 'Number of employees'
from Department d
join Employees e on d.DeptID = e.DeptID
where d.DeptID = @ID
group by d.DeptName

exec checkDepartmentCountEmployee 4

--2 Check overall absenteeism of an employee
create procedure checkAbsentDay 
@empID int 
as
select e.EmpID, e.EmpName, sum(a.AttAbsent) TotalAbsentDay
from Employees e
join Attendance a on a.EmpID = e.EmpID
where e.EmpID = @empID
group by e.EmpID, e.EmpName

exec checkAbsentDay 14

--3 Check the dependents of an employee
create procedure checkDependent
@empID int
as
select d.*, e.EmpName
from Dependent d
join Employees e on e.EmpID = d.EmpID
where d.EmpID = @empID

exec checkDependent 17

--4 Check Department and City of a Project
create procedure checkProject
@ID int
as
select pj.ProjectName, d.DeptName, city.CityName
from Project pj
join Participate p on pj.ProjectID = p.ProjectID
join Department d on d.DeptID = p.DeptID
join city on city.CityID = d.CityID
where pj.ProjectID = @ID

exec checkProject 4

--5 Check number of employee participate in a project
create procedure checkProjectCountEmployee
@ID int
as
select pj.ProjectName, count(e.EmpName) 'Number of employees'
from Employees e
join Department d on d.DeptID = e.DeptID
join Participate p on p.DeptID = e.DeptID
join Project pj on pj.ProjectID = p.ProjectID
where pj.ProjectID = @ID
group by pj.ProjectName

exec checkProjectCountEmployee 5

--6 Show City Name, count of employees of citites that consists of employees who are over X years old
create procedure checkAgeOverCities
@age int
as
select c.CityName, COUNT(e.EmpID) 'Number of Employees'
from City c
join Department d on c.CityID = d.CityID
join Employees e on e.DeptID = d.DeptID
where year(getdate())-year(e.EmpBirthDate) > @age
group by c.CityName

exec checkAgeOverCities 30

--7 Change Salary Basic
create procedure changeBasicSalary
@salary int = 500
as
update Salary
set SalaryBasic = @salary


exec changeBasicSalary 1000

--8 Change Bonus Basic

create procedure changeBasicBonus
@bonus int = 20
as
update Attendance
set BonusBasic = @bonus

exec changeBasicBonus 50