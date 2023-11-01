USE [master]
GO
/****** Object:  Database [DBI_ASSIGNMENT]    Script Date: 01-Nov-23 7:44:13 AM ******/
CREATE DATABASE [DBI_ASSIGNMENT]
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBI_ASSIGNMENT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET  MULTI_USER 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBI_ASSIGNMENT]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 01-Nov-23 7:44:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[AttReceiveDate] [date] NOT NULL,
	[AttDayAttend] [int] NOT NULL,
	[AttAbsent] [int] NOT NULL,
	[AttOvertime] [int] NOT NULL,
	[EmpID] [int] NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarryOut]    Script Date: 01-Nov-23 7:44:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarryOut](
	[CityID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[ProStartDate] [date] NOT NULL,
	[ProEndDate] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 01-Nov-23 7:44:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 01-Nov-23 7:44:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DeptID] [int] NOT NULL,
	[DeptName] [nvarchar](50) NOT NULL,
	[DepPhone] [int] NOT NULL,
	[ManagerID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dependent]    Script Date: 01-Nov-23 7:44:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dependent](
	[DepName] [nvarchar](50) NULL,
	[DepGender] [char](1) NULL,
	[DepBirthDate] [date] NULL,
	[EmpID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 01-Nov-23 7:44:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmpID] [int] NOT NULL,
	[EmpName] [nvarchar](50) NOT NULL,
	[EmpAddress] [nvarchar](50) NOT NULL,
	[EmpBirthDate] [date] NOT NULL,
	[Facility] [nvarchar](50) NOT NULL,
	[Major] [nvarchar](50) NOT NULL,
	[Rank] [nvarchar](50) NOT NULL,
	[EmpPhone] [int] NOT NULL,
	[DeptID] [int] NOT NULL,
	[PositionID] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insurance]    Script Date: 01-Nov-23 7:44:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurance](
	[InsID] [int] NOT NULL,
	[InsAuthority] [nvarchar](50) NOT NULL,
	[InsStartDate] [date] NOT NULL,
	[InsClinic] [nvarchar](50) NOT NULL,
	[EmpID] [int] NOT NULL,
 CONSTRAINT [PK_Insurance] PRIMARY KEY CLUSTERED 
(
	[InsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participate]    Script Date: 01-Nov-23 7:44:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participate](
	[DeptID] [int] NULL,
	[ProjectID] [int] NOT NULL,
	[DepStartDate] [date] NOT NULL,
	[DepEndDate] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 01-Nov-23 7:44:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[PositionID] [int] NOT NULL,
	[PositionName] [nvarchar](50) NOT NULL,
	[SalaryRate] [float] NOT NULL,
	[NumbAbsent] [int] NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 01-Nov-23 7:44:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ProjectID] [int] NOT NULL,
	[ProjectName] [nvarchar](50) NOT NULL,
	[Budget] [float] NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salary]    Script Date: 01-Nov-23 7:44:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary](
	[SalaryBasic] [float] NOT NULL,
	[EmpID] [int] NOT NULL,
	[PositionID] [int] NOT NULL,
	[AttReceiveDate] [date] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Employees] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employees] ([EmpID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Employees]
GO
ALTER TABLE [dbo].[CarryOut]  WITH CHECK ADD  CONSTRAINT [FK_CarryOut_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[CarryOut] CHECK CONSTRAINT [FK_CarryOut_City]
GO
ALTER TABLE [dbo].[CarryOut]  WITH CHECK ADD  CONSTRAINT [FK_CarryOut_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
ALTER TABLE [dbo].[CarryOut] CHECK CONSTRAINT [FK_CarryOut_Project]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_City]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Employees] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Employees] ([EmpID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Employees]
GO
ALTER TABLE [dbo].[Dependent]  WITH CHECK ADD  CONSTRAINT [FK_Dependent_Employees] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employees] ([EmpID])
GO
ALTER TABLE [dbo].[Dependent] CHECK CONSTRAINT [FK_Dependent_Employees]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Department] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Department] ([DeptID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Department]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Position] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([PositionID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Position]
GO
ALTER TABLE [dbo].[Insurance]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_Employees] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employees] ([EmpID])
GO
ALTER TABLE [dbo].[Insurance] CHECK CONSTRAINT [FK_Insurance_Employees]
GO
ALTER TABLE [dbo].[Participate]  WITH CHECK ADD  CONSTRAINT [FK_Participate_Department] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Department] ([DeptID])
GO
ALTER TABLE [dbo].[Participate] CHECK CONSTRAINT [FK_Participate_Department]
GO
ALTER TABLE [dbo].[Participate]  WITH CHECK ADD  CONSTRAINT [FK_Participate_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
ALTER TABLE [dbo].[Participate] CHECK CONSTRAINT [FK_Participate_Project]
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_Attendance] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Attendance] ([EmpID])
GO
ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_Attendance]
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_Position] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([PositionID])
GO
ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_Position]
GO
USE [master]
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET  READ_WRITE 
GO
