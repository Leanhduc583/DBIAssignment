-- //Employee Trigger
-- An employee is only accepted to work if age is from 18 to 65(which is calculated by  = Year of EmpStartDate - Year of BirthDate).
create trigger TG_InsertEmployee_Age ON Employees
After insert
As
begin

	declare @count INT
	select  @count = count(*)
	from inserted i
	where (YEAR(i.EmpStartDate) - YEAR(i.EmpBirthDate)) <18  OR (YEAR(i.EmpStartDate) - YEAR(i.EmpBirthDate)) > 65

	if  (@count > 0)
	begin
		print 'Can not insert Employee too young or old'
		rollback tran
	end 
end
GO

--To become a Manager in a Department, the employee Rank must be “Excellent” 
create trigger TG_InsertEmployee_Rank ON Employees
After insert
As
begin

	declare @count varchar(20) = null
	select  @count = i.[Rank]
	from inserted i
	where i.PositionID = 3

	if  (@count not like 'Excellent')
	begin
		print 'The Manager must have Excellent-Rank'
		rollback tran
	end 
end
GO

-------------------------------------------------------------------------------
-- // Department
--The manager ID is equal the Employee ID whether the Employee has “Manager” Position
create trigger TG_DepartmentManager ON Department
After insert
As
begin
		declare @check varchar(50)
	select @check = p.PositionName  
	from Employees e
		inner join Position p ON p.PositionID = e.PositionID
	where e.EmpID = (select ManagerID
					from inserted)
	if  (@check not like 'Department head')
	begin
		print 'The manager ID is equal the Employee ID whether the Employee has “Manager” Position'
		rollback tran
	end 
end
GO

-------------------------------------------------------------------------------
-- // Insurance Trigger
--The Start date of the insurance must after the Employee BirthDate
create trigger TG_Insurance_Date ON Insurance
After insert
As
begin
		declare @count INT
	select  @count = count(*)
	from inserted i
		inner join Employees e ON i.EmpID = e.EmpID
	where (DATEDIFF(day,e.EmpBirthDate, i.InsStartDate) < 0) 

	if  (@count > 0)
	begin
		print 'The Start date of the insurance must after the Employee BirthDate'
		rollback tran
	end 
end
GO

-------------------------------------------------------------------------------
-- // Participate Trigger

-- Trigger: A Department participated in the Project, which must be carried out in the same Cities.
create trigger TG_InsertParticipate_SameCity ON Participate
After insert
As
begin

	declare @city1 int
	declare @dep int
	declare @pro int

	select @dep = i.DeptID, @pro  =i.ProjectID
		from inserted i
	

	select @city1 = CityID
		from Department
		where DeptID = @dep

	if  (@city1 not in (select c.CityID
						from Project p
							inner join CarryOut c ON p.ProjectID = c.ProjectID
						where p.ProjectID = @pro))
		begin
			print 'The Department can only join the Project within the same City'
			rollback tran
		end 
end
GO

-- PartStart can not earlier than ProStartDate as well as PartEnd is not later than ProEndDate---------------------------
create trigger TG_InsertParticipate_Date ON Participate
After insert
As
begin

	declare @partStart date, @partEnd date
	declare @proSta date, @proEnd date
	declare @pro int

	select @partStart = i.PartStartDate, @partEnd  =i.PartEndDate, @pro = i.ProjectID
		from inserted i

	select @proSta = Min(c.ProStartDate), @proEnd = MAX(c.ProEndDate)
	from Project p
	inner join CarryOut c ON p.ProjectID = c.ProjectID
	where p.ProjectID = @pro


	if  (datediff(day,@proSta, @partStart) < 0 or datediff(day,@proEnd, @partEnd) > 0)
	begin
		print 'PartStart can not earlier than ProStartDate as well as PartEnd is not later than ProEndDate'
		rollback tran
	end 
end
GO

-- ParticipateDays must be more than 2 months-----------------------------------------------------------------------
create trigger TG_ParticipateDay ON Participate
After insert
As
begin
	declare @count INT
	select  @count = datediff(MONTH,i.PartStartDate, i.PartEndDate)
	from inserted i

	if  (@count <2)
	begin
		print 'ParticipateDays must be more than 2 months'
		rollback tran
	end 
end
GO

-- CarrOutDays must be equal or larger than 3 months ---------------------------------------------------------
create trigger TG_CarryOutDay ON CarryOut
After insert
As
begin
	declare @count INT
	select  @count = datediff(MONTH,i.ProStartDate, i.ProEndDate)
	from inserted i

	if  (@count <3)
	begin
		print 'CarrOutDays must be equal or larger than 3 months'
		rollback tran
	end 
end
GO

--A Project is always participated by at least 1 Department, between Start and End Date (IF there no Department is valid => then Participation Insertion will share the the same Start and End Date as Project)

create trigger TG_Participate_Pro_same_Dep ON Participate
After insert
As
begin
	declare @partStart date, @partEnd date
	declare @proSta date, @proEnd date
	declare @pro int, @dep  int

	select @pro = i.ProjectID, @dep = i.DeptID
		from inserted i

	select @proSta = Min(c.ProStartDate), @proEnd = MAX(c.ProEndDate)
	from Project p
	inner join CarryOut c ON p.ProjectID = c.ProjectID
	where p.ProjectID = @pro

	select @partStart =MIN( p.PartStartDate), @partEnd = MAX(p.PartEndDate)
	from Participate p
	where p.ProjectID = @pro


	if  ((@proSta not like @partStart) or (@proEnd not like @partEnd))
	begin
		rollback tran
		print 'A Project is always participated by at least 1 Department, between Start and End Date'
		INSERT [dbo].[Participate] ([DeptID], [ProjectID], [PartStartDate], [PartEndDate]) 
		VALUES ( @dep, @pro, @proSta, @proEnd)
		
	end 
end
GO


