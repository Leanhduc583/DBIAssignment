-- 1, Calculate Employee Attendance bonus
create function Calculate_Employee_AttBonus (@date date = '2018-01-01', @EmpId int = 5)
returns float
as
begin 
	declare @Attbonus float
	declare @numbAbs int, @abs int, @day int, @overtime int, @basic float
	
	select @numbAbs = p.NumbAbsent
	from Employees e
		join Position p ON e.PositionID = p.PositionID
	where e.EmpID = @EmpId

	select @abs = a.AttAbsent - @numbAbs ,@day = a.AttDay, @overtime = a.AttOvertime, @basic = a.BonusBasic
	from Attendance a
	where a.EmpID = @EmpId and a.AttReceiveDate = @date

	if(@abs < 0)
		SET @Attbonus = (@day + @overtime*0.3) *@basic 
	else
		SET @Attbonus = (@day - @abs+ @overtime*0.3) *@basic

	return @Attbonus
end
GO

-- 2, Display the each Department's paricipation days per Project

create function TblParticipateDays__Project_each_IDDepartment (@ID int = -1)
returns @TblParticipateDay_Project table ( DeptID int,ProjectID int, ParticipateDays int)
as
begin
	if(@ID < 0)
		begin
		insert into @TblParticipateDay_Project
			select  p.DeptID, p.ProjectID, SUM(DATEDIFF(day,p.PartStartDate, p.PartEndDate)) ParticipateDays
			from Participate p
			group by p.DeptID, p.ProjectID
		end
	else
		begin
		insert into @TblParticipateDay_Project
			select  p.DeptID, p.ProjectID, SUM(DATEDIFF(day,p.PartStartDate, p.PartEndDate)) ParticipateDay
			from Participate p
			where p.DeptID = @ID
			group by p.DeptID, p.ProjectID
		end
		return
end
GO

-- 3, Display each Project is paricipatied by Department and its participated days
create function TblParticipateDays__Department_each_IDProject (@ID int = -1)
returns @TblParticipateDay_Project table ( ProjectID int, DeptID int, ParticipateDays int)
as
begin
	if(@ID < 0)
		begin
		insert into @TblParticipateDay_Project
			select p.ProjectID, p.DeptID,  SUM(DATEDIFF(day,p.PartStartDate, p.PartEndDate)) ParticipateDays
			from Participate p
			group by p.DeptID, p.ProjectID
		end
	else
		begin
		insert into @TblParticipateDay_Project
			select  p.ProjectID, p.DeptID,  SUM(DATEDIFF(day,p.PartStartDate, p.PartEndDate)) ParticipateDay
			from Participate p
			where p.ProjectID = @ID
			group by p.DeptID, p.ProjectID
		end
		return
end
GO

--
-- 3, Display Total participate days of all Department
create function Total_ParticipateDays__AllDepartment_in_IDProject (@ID int = 1)
returns int
as
begin
	declare @total int
	select @total = SUM(ParticipateDays)
	from TblParticipateDays__Department_each_IDProject(@ID)
	return @total
end
GO

--  4, Display the each Project's number of days, carried out in each city
create function TblCarryOutDays_City_each_Project (@ID int = -1)
returns @TblCarryOutDays_Project table (ProjectID int, CityID int, ParticipateDays int)
as
begin
	if(@ID < 0)
		begin
		insert into @TblCarryOutDays_Project
			select c.ProjectID, c.CityID, SUM(DATEDIFF(day,c.ProStartDate, c.ProEndDate)) CarryOutDays
			from CarryOut c
			group by c.ProjectID, c.CityID
		end
	else
		begin
			insert into @TblCarryOutDays_Project
			select c.ProjectID, c.CityID, SUM(DATEDIFF(day,c.ProStartDate, c.ProEndDate)) ParticipateDay
			from CarryOut c
			where c.ProjectID = @ID
			group by c.ProjectID, c.CityID
			
		end
		return
end
GO

-- 5, Calculate Employee Project bonus
create function Calculate_Employee_ProjBonus (@date date, @EmpId int)
returns float
as
begin 
	declare @Probonus float
	declare @Partx int, @partAll int
	declare @pro int

	select @pro = DeptID
	from Employees
	where EmpID = @EmpId

	select @Probonus = SUM((t.ParticipateDays/dbo.Total_ParticipateDays__AllDepartment_in_IDProject(t.ProjectID))*p.Budget)
	from TblParticipateDays__Project_each_IDDepartment(@pro) t
		join Project p ON p.ProjectID = t.ProjectID
		inner join CarryOut c on c.ProjectID = p.ProjectID
	where MONTH(c.ProEndDate) = MONTH (@date) and YEAR(c.ProEndDate) = YEAR (@date)

	return isnull(@Probonus, 0)
end
GO

-- 6, Total Employee's Salary each month
create function Calculate_Employee_Salary (@date date = '2018-01-01', @EmpId int = 5)
returns float
as
begin 
	declare @Salary float
	select @Salary = (s.SalaryBasic*p.SalaryRate)  + dbo.Calculate_Employee_AttBonus(@date, @EmpId) + isnull(dbo.Calculate_Employee_ProjBonus(@date, @EmpId),0)
	from Employees e
		join Attendance a ON e.EmpID = a.EmpID
		join Salary s oN s.AttID = a.AttID
		join Position p ON p.PositionID = e.EmpID
	where e.EmpID = @EmpId AND MONTH(a.AttReceiveDate) = MONTH (@date) and YEAR(a.AttReceiveDate) = YEAR (@date)
	return @Salary
end
GO
-------------------------------------------------------------------------

--select *
--from TblParticipateDays__Project_each_IDDepartment(1)
--GO
--select *
--from TblParticipateDays__Department_each_IDProject(1)
--GO

--print dbo.Calculate_Employee_ProjBonus('2022-04-01', 5)
--print dbo.Calculate_Employee_AttBonus('2018-01-01', 5)
--print dbo.Calculate_Employee_Salary('2018-01-01', 5)

