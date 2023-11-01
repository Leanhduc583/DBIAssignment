USE [master]
GO
/****** Object:  Database [DBI_ASSIGNMENT]    Script Date: 01-Nov-23 8:36:29 PM ******/
drop database if exists DBI_ASSIGNMENT
go
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
/****** Object:  Table [dbo].[Attendance]    Script Date: 01-Nov-23 8:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attendance]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Attendance](
	[AttID] [int] IDENTITY(1,1) NOT NULL,
	[AttReceiveDate] [date] NULL,
	[AttDay] [int] NOT NULL,
	[AttAbsent] [int] NOT NULL,
	[AttOvertime] [int] NOT NULL,
	[BonusBasic] [float] NOT NULL,
	[EmpID] [int] NOT NULL,
 CONSTRAINT [PK_Attendance_1] PRIMARY KEY CLUSTERED 
(
	[AttID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CarryOut]    Script Date: 01-Nov-23 8:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CarryOut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CarryOut](
	[CarryID] [int] IDENTITY(1,1) NOT NULL,
	[CityID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[ProStartDate] [date] NOT NULL,
	[ProEndDate] [date] NOT NULL,
 CONSTRAINT [PK_CarryOut] PRIMARY KEY CLUSTERED 
(
	[CarryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[City]    Script Date: 01-Nov-23 8:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[City]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Department]    Script Date: 01-Nov-23 8:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Department](
	[DeptID] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [nvarchar](50) NOT NULL,
	[DeptPhone] [varchar](20) NOT NULL,
	[ManagerID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Dependent]    Script Date: 01-Nov-23 8:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dependent]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Dependent](
	[DepID] [int] IDENTITY(1,1) NOT NULL,
	[DepName] [nvarchar](50) NULL,
	[DepGender] [char](1) NULL,
	[DepBirthDate] [date] NULL,
	[EmpID] [int] NULL,
 CONSTRAINT [PK_Dependent] PRIMARY KEY CLUSTERED 
(
	[DepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 01-Nov-23 8:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employees](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [nvarchar](50) NOT NULL,
	[EmpAddress] [nvarchar](50) NOT NULL,
	[EmpBirthDate] [date] NOT NULL,
	[Facility] [nvarchar](50) NOT NULL,
	[Major] [nvarchar](50) NOT NULL,
	[Rank] [nvarchar](50) NOT NULL,
	[EmpPhone] [char](10) NOT NULL,
	[EmpStartDate] [date] NOT NULL,
	[DeptID] [int] NOT NULL,
	[PositionID] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Insurance]    Script Date: 01-Nov-23 8:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Insurance]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Insurance](
	[InsID] [int] IDENTITY(1,1) NOT NULL,
	[InsAuthority] [nvarchar](50) NOT NULL,
	[InsStartDate] [date] NOT NULL,
	[InsClinic] [nvarchar](50) NOT NULL,
	[EmpID] [int] NOT NULL,
 CONSTRAINT [PK_Insurance] PRIMARY KEY CLUSTERED 
(
	[InsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Participate]    Script Date: 01-Nov-23 8:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Participate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Participate](
	[PartID] [int] IDENTITY(1,1) NOT NULL,
	[DeptID] [int] NULL,
	[ProjectID] [int] NOT NULL,
	[PartStartDate] [date] NOT NULL,
	[PartEndDate] [date] NOT NULL,
 CONSTRAINT [PK_Participate] PRIMARY KEY CLUSTERED 
(
	[PartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Position]    Script Date: 01-Nov-23 8:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Position]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Position](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [nvarchar](50) NOT NULL,
	[SalaryRate] [float] NOT NULL,
	[NumbAbsent] [int] NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Project]    Script Date: 01-Nov-23 8:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Project]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Project](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](50) NOT NULL,
	[Budget] [float] NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Salary]    Script Date: 01-Nov-23 8:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Salary]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Salary](
	[SalaryID] [int] IDENTITY(1,1) NOT NULL,
	[SalaryBasic] [float] NOT NULL,
	[PositionID] [int] NOT NULL,
	[AttID] [int] NOT NULL,
	[ProjectID] [int] NULL,
 CONSTRAINT [PK_Salary] PRIMARY KEY CLUSTERED 
(
	[SalaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Attendance] ON 
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (1, CAST(N'2020-02-16' AS Date), 27, 3, 9, 20, 24)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (2, CAST(N'2019-09-17' AS Date), 21, 7, 10, 20, 5)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (3, CAST(N'2020-11-15' AS Date), 17, 9, 6, 20, 4)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (4, CAST(N'2018-12-11' AS Date), 30, 2, 5, 20, 2)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (5, CAST(N'2016-10-21' AS Date), 16, 6, 1, 20, 16)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (6, CAST(N'2019-01-07' AS Date), 19, 2, 1, 20, 2)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (7, CAST(N'2019-07-10' AS Date), 27, 3, 7, 20, 18)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (8, CAST(N'2018-06-01' AS Date), 22, 10, 5, 20, 1)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (9, CAST(N'2019-11-05' AS Date), 18, 4, 5, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (10, CAST(N'2019-09-15' AS Date), 15, 4, 8, 20, 23)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (11, CAST(N'2018-05-20' AS Date), 27, 6, 3, 20, 23)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (12, CAST(N'2020-01-20' AS Date), 15, 9, 6, 20, 21)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (13, CAST(N'2016-12-29' AS Date), 15, 7, 4, 20, 8)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (14, CAST(N'2016-06-22' AS Date), 23, 1, 6, 20, 21)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (15, CAST(N'2018-08-15' AS Date), 21, 1, 8, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (16, CAST(N'2020-07-08' AS Date), 19, 10, 6, 20, 9)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (17, CAST(N'2016-03-22' AS Date), 26, 2, 6, 20, 3)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (18, CAST(N'2019-03-05' AS Date), 18, 9, 5, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (19, CAST(N'2019-10-21' AS Date), 26, 8, 8, 20, 17)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (20, CAST(N'2018-06-03' AS Date), 16, 5, 9, 20, 30)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (21, CAST(N'2018-01-29' AS Date), 16, 3, 4, 20, 5)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (22, CAST(N'2018-08-06' AS Date), 20, 6, 9, 20, 3)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (23, CAST(N'2018-03-12' AS Date), 20, 5, 7, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (24, CAST(N'2018-05-04' AS Date), 26, 1, 5, 20, 9)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (25, CAST(N'2017-11-23' AS Date), 29, 10, 1, 20, 17)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (26, CAST(N'2019-05-17' AS Date), 28, 5, 1, 20, 27)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (27, CAST(N'2017-12-26' AS Date), 25, 6, 4, 20, 29)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (28, CAST(N'2016-01-18' AS Date), 29, 6, 2, 20, 17)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (29, CAST(N'2019-01-22' AS Date), 16, 4, 7, 20, 2)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (30, CAST(N'2020-10-21' AS Date), 26, 5, 4, 20, 6)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (31, CAST(N'2018-09-20' AS Date), 29, 3, 7, 20, 11)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (32, CAST(N'2016-04-19' AS Date), 30, 3, 6, 20, 1)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (33, CAST(N'2018-07-04' AS Date), 16, 6, 10, 20, 23)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (34, CAST(N'2016-07-08' AS Date), 15, 1, 1, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (35, CAST(N'2016-07-09' AS Date), 20, 7, 1, 20, 19)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (36, CAST(N'2018-02-20' AS Date), 28, 9, 10, 20, 12)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (37, CAST(N'2019-09-18' AS Date), 25, 6, 4, 20, 9)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (38, CAST(N'2017-06-28' AS Date), 26, 5, 2, 20, 7)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (39, CAST(N'2016-04-05' AS Date), 25, 9, 1, 20, 28)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (40, CAST(N'2018-11-03' AS Date), 16, 7, 3, 20, 29)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (41, CAST(N'2017-11-04' AS Date), 15, 9, 6, 20, 27)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (42, CAST(N'2018-02-09' AS Date), 19, 6, 9, 20, 24)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (43, CAST(N'2019-02-26' AS Date), 19, 9, 5, 20, 20)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (44, CAST(N'2019-12-21' AS Date), 22, 7, 8, 20, 23)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (45, CAST(N'2019-06-06' AS Date), 30, 5, 1, 20, 18)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (46, CAST(N'2020-11-13' AS Date), 23, 5, 4, 20, 4)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (47, CAST(N'2016-06-14' AS Date), 15, 4, 7, 20, 28)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (48, CAST(N'2017-11-30' AS Date), 22, 6, 6, 20, 1)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (49, CAST(N'2019-03-17' AS Date), 20, 5, 6, 20, 13)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (50, CAST(N'2016-12-23' AS Date), 22, 7, 8, 20, 16)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (51, CAST(N'2018-04-05' AS Date), 25, 8, 9, 20, 26)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (52, CAST(N'2016-12-11' AS Date), 24, 1, 6, 20, 24)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (53, CAST(N'2016-01-31' AS Date), 16, 9, 6, 20, 8)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (54, CAST(N'2017-11-07' AS Date), 29, 1, 4, 20, 21)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (55, CAST(N'2017-03-20' AS Date), 24, 8, 10, 20, 11)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (56, CAST(N'2020-05-13' AS Date), 21, 8, 10, 20, 22)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (57, CAST(N'2017-07-23' AS Date), 16, 2, 4, 20, 5)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (58, CAST(N'2016-06-26' AS Date), 21, 8, 2, 20, 12)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (59, CAST(N'2019-05-07' AS Date), 16, 3, 4, 20, 3)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (60, CAST(N'2020-11-05' AS Date), 19, 2, 10, 20, 17)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (61, CAST(N'2020-01-02' AS Date), 25, 7, 7, 20, 8)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (62, CAST(N'2016-08-08' AS Date), 29, 8, 6, 20, 16)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (63, CAST(N'2019-12-18' AS Date), 20, 6, 8, 20, 22)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (64, CAST(N'2020-04-27' AS Date), 23, 9, 2, 20, 22)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (65, CAST(N'2019-08-29' AS Date), 16, 1, 1, 20, 6)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (66, CAST(N'2018-11-12' AS Date), 27, 3, 8, 20, 3)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (67, CAST(N'2020-11-09' AS Date), 29, 4, 7, 20, 11)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (68, CAST(N'2020-09-23' AS Date), 30, 7, 3, 20, 19)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (69, CAST(N'2019-05-22' AS Date), 17, 4, 6, 20, 5)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (70, CAST(N'2019-08-02' AS Date), 23, 2, 9, 20, 16)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (71, CAST(N'2016-02-24' AS Date), 24, 4, 2, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (72, CAST(N'2016-06-16' AS Date), 30, 7, 5, 20, 21)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (73, CAST(N'2020-05-28' AS Date), 23, 10, 5, 20, 19)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (74, CAST(N'2016-10-15' AS Date), 25, 1, 6, 20, 24)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (75, CAST(N'2020-10-20' AS Date), 15, 7, 3, 20, 5)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (76, CAST(N'2017-11-05' AS Date), 27, 7, 6, 20, 20)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (77, CAST(N'2018-12-25' AS Date), 16, 8, 5, 20, 24)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (78, CAST(N'2016-06-21' AS Date), 28, 9, 10, 20, 24)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (79, CAST(N'2017-09-30' AS Date), 27, 6, 5, 20, 20)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (80, CAST(N'2018-06-12' AS Date), 20, 6, 8, 20, 18)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (81, CAST(N'2020-05-27' AS Date), 27, 1, 5, 20, 11)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (82, CAST(N'2017-03-23' AS Date), 17, 1, 9, 20, 21)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (83, CAST(N'2019-06-22' AS Date), 24, 2, 7, 20, 2)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (84, CAST(N'2016-05-27' AS Date), 24, 8, 10, 20, 30)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (85, CAST(N'2017-07-10' AS Date), 15, 8, 5, 20, 17)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (86, CAST(N'2017-05-26' AS Date), 19, 3, 2, 20, 21)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (87, CAST(N'2019-08-03' AS Date), 29, 5, 10, 20, 3)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (88, CAST(N'2017-10-07' AS Date), 18, 5, 7, 20, 5)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (89, CAST(N'2018-03-08' AS Date), 22, 3, 1, 20, 4)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (90, CAST(N'2017-08-12' AS Date), 29, 10, 1, 20, 12)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (91, CAST(N'2019-05-15' AS Date), 27, 7, 7, 20, 29)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (92, CAST(N'2019-10-02' AS Date), 19, 8, 3, 20, 23)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (93, CAST(N'2017-02-26' AS Date), 25, 3, 8, 20, 27)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (94, CAST(N'2019-04-01' AS Date), 21, 8, 2, 20, 19)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (95, CAST(N'2018-04-06' AS Date), 22, 10, 6, 20, 30)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (96, CAST(N'2019-11-20' AS Date), 17, 2, 1, 20, 23)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (97, CAST(N'2020-12-27' AS Date), 29, 10, 1, 20, 5)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (98, CAST(N'2016-07-04' AS Date), 26, 10, 3, 20, 16)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (99, CAST(N'2020-10-18' AS Date), 21, 6, 7, 20, 11)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (100, CAST(N'2019-08-12' AS Date), 17, 3, 3, 20, 6)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (101, CAST(N'2020-02-03' AS Date), 25, 2, 7, 20, 8)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (102, CAST(N'2016-08-29' AS Date), 15, 8, 5, 20, 17)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (103, CAST(N'2019-06-18' AS Date), 20, 2, 1, 20, 8)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (104, CAST(N'2018-01-16' AS Date), 27, 3, 7, 20, 18)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (105, CAST(N'2020-07-19' AS Date), 29, 3, 6, 20, 16)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (106, CAST(N'2016-10-12' AS Date), 25, 1, 5, 20, 18)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (107, CAST(N'2016-09-10' AS Date), 16, 1, 1, 20, 15)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (108, CAST(N'2016-08-20' AS Date), 21, 8, 10, 20, 18)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (109, CAST(N'2017-02-19' AS Date), 28, 5, 1, 20, 17)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (110, CAST(N'2019-06-01' AS Date), 27, 2, 5, 20, 6)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (111, CAST(N'2018-07-11' AS Date), 20, 10, 6, 20, 13)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (112, CAST(N'2016-05-08' AS Date), 18, 4, 4, 20, 20)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (113, CAST(N'2020-07-07' AS Date), 25, 2, 8, 20, 8)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (114, CAST(N'2019-08-10' AS Date), 26, 7, 6, 20, 29)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (115, CAST(N'2017-08-07' AS Date), 23, 1, 6, 20, 21)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (116, CAST(N'2017-10-08' AS Date), 22, 7, 9, 20, 13)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (117, CAST(N'2019-08-26' AS Date), 19, 6, 10, 20, 17)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (118, CAST(N'2019-10-04' AS Date), 26, 9, 9, 20, 10)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (119, CAST(N'2019-08-25' AS Date), 22, 2, 8, 20, 16)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (120, CAST(N'2018-01-27' AS Date), 27, 9, 10, 20, 8)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (121, CAST(N'2016-02-08' AS Date), 29, 9, 8, 20, 9)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (122, CAST(N'2018-07-23' AS Date), 26, 10, 1, 20, 28)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (123, CAST(N'2019-08-11' AS Date), 23, 4, 3, 20, 3)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (124, CAST(N'2018-06-22' AS Date), 19, 4, 5, 20, 15)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (125, CAST(N'2019-05-06' AS Date), 27, 5, 3, 20, 23)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (126, CAST(N'2017-06-05' AS Date), 20, 7, 10, 20, 24)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (127, CAST(N'2018-07-12' AS Date), 19, 5, 7, 20, 29)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (128, CAST(N'2017-12-20' AS Date), 17, 3, 4, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (129, CAST(N'2017-10-31' AS Date), 18, 2, 1, 20, 7)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (130, CAST(N'2017-05-20' AS Date), 29, 6, 3, 20, 27)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (131, CAST(N'2016-05-15' AS Date), 29, 7, 5, 20, 23)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (132, CAST(N'2020-05-07' AS Date), 20, 8, 2, 20, 27)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (133, CAST(N'2018-08-07' AS Date), 21, 4, 4, 20, 27)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (134, CAST(N'2019-01-25' AS Date), 24, 4, 2, 20, 15)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (135, CAST(N'2019-11-30' AS Date), 26, 5, 2, 20, 23)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (136, CAST(N'2019-12-06' AS Date), 26, 4, 10, 20, 21)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (137, CAST(N'2020-07-25' AS Date), 28, 9, 9, 20, 3)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (138, CAST(N'2019-12-31' AS Date), 27, 9, 10, 20, 8)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (139, CAST(N'2016-01-26' AS Date), 26, 6, 4, 20, 20)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (140, CAST(N'2020-07-05' AS Date), 20, 7, 10, 20, 12)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (141, CAST(N'2017-02-11' AS Date), 18, 2, 1, 20, 26)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (142, CAST(N'2017-12-16' AS Date), 22, 8, 1, 20, 29)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (143, CAST(N'2017-02-08' AS Date), 20, 10, 6, 20, 20)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (144, CAST(N'2018-11-09' AS Date), 25, 2, 7, 20, 17)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (145, CAST(N'2016-09-30' AS Date), 23, 1, 5, 20, 8)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (146, CAST(N'2019-07-09' AS Date), 23, 4, 3, 20, 5)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (147, CAST(N'2017-07-17' AS Date), 24, 6, 5, 20, 17)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (148, CAST(N'2018-04-09' AS Date), 29, 6, 3, 20, 10)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (149, CAST(N'2017-09-02' AS Date), 29, 8, 7, 20, 11)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (150, CAST(N'2018-11-13' AS Date), 30, 4, 8, 20, 11)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (151, CAST(N'2017-06-22' AS Date), 28, 6, 2, 20, 8)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (152, CAST(N'2018-01-17' AS Date), 18, 2, 2, 20, 25)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (153, CAST(N'2017-03-01' AS Date), 18, 9, 5, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (154, CAST(N'2018-09-23' AS Date), 25, 7, 7, 20, 10)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (155, CAST(N'2020-05-29' AS Date), 19, 5, 6, 20, 15)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (156, CAST(N'2019-09-19' AS Date), 29, 3, 6, 20, 25)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (157, CAST(N'2016-08-13' AS Date), 23, 4, 3, 20, 3)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (158, CAST(N'2017-04-21' AS Date), 15, 9, 6, 20, 10)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (159, CAST(N'2020-06-03' AS Date), 15, 8, 5, 20, 19)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (160, CAST(N'2017-01-21' AS Date), 23, 6, 6, 20, 27)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (161, CAST(N'2018-06-19' AS Date), 21, 6, 8, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (162, CAST(N'2020-03-27' AS Date), 29, 9, 8, 20, 6)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (163, CAST(N'2016-03-20' AS Date), 18, 6, 10, 20, 27)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (164, CAST(N'2016-09-06' AS Date), 30, 9, 8, 20, 13)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (165, CAST(N'2020-11-29' AS Date), 29, 5, 10, 20, 5)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (166, CAST(N'2018-08-11' AS Date), 15, 2, 4, 20, 19)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (167, CAST(N'2019-10-17' AS Date), 28, 10, 1, 20, 10)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (168, CAST(N'2019-07-21' AS Date), 16, 9, 6, 20, 2)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (169, CAST(N'2018-12-22' AS Date), 15, 3, 5, 20, 17)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (170, CAST(N'2017-05-13' AS Date), 27, 7, 6, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (171, CAST(N'2016-07-15' AS Date), 25, 9, 10, 20, 30)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (172, CAST(N'2016-05-09' AS Date), 23, 8, 10, 20, 15)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (173, CAST(N'2017-02-17' AS Date), 15, 3, 6, 20, 1)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (174, CAST(N'2016-12-03' AS Date), 16, 5, 8, 20, 21)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (175, CAST(N'2019-08-20' AS Date), 23, 8, 9, 20, 16)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (176, CAST(N'2016-07-16' AS Date), 21, 1, 8, 20, 6)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (177, CAST(N'2017-12-21' AS Date), 20, 10, 5, 20, 16)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (178, CAST(N'2018-09-15' AS Date), 28, 3, 6, 20, 13)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (179, CAST(N'2018-12-16' AS Date), 26, 4, 10, 20, 1)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (180, CAST(N'2018-05-28' AS Date), 18, 2, 1, 20, 1)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (181, CAST(N'2019-02-13' AS Date), 27, 2, 5, 20, 9)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (182, CAST(N'2016-12-02' AS Date), 21, 10, 5, 20, 7)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (183, CAST(N'2019-03-23' AS Date), 19, 6, 8, 20, 5)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (184, CAST(N'2020-03-12' AS Date), 18, 8, 3, 20, 16)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (185, CAST(N'2019-12-08' AS Date), 15, 1, 2, 20, 18)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (186, CAST(N'2016-05-18' AS Date), 26, 6, 4, 20, 9)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (187, CAST(N'2019-06-16' AS Date), 16, 9, 7, 20, 27)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (188, CAST(N'2019-10-23' AS Date), 27, 7, 7, 20, 29)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (189, CAST(N'2016-08-27' AS Date), 19, 10, 6, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (190, CAST(N'2016-12-20' AS Date), 27, 2, 6, 20, 9)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (191, CAST(N'2018-05-29' AS Date), 18, 1, 8, 20, 19)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (192, CAST(N'2020-09-26' AS Date), 27, 1, 3, 20, 23)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (193, CAST(N'2018-06-30' AS Date), 26, 1, 5, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (194, CAST(N'2020-10-17' AS Date), 17, 10, 8, 20, 10)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (195, CAST(N'2018-11-19' AS Date), 30, 1, 3, 20, 4)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (196, CAST(N'2020-09-09' AS Date), 20, 4, 4, 20, 30)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (197, CAST(N'2019-09-21' AS Date), 18, 2, 1, 20, 26)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (198, CAST(N'2016-08-06' AS Date), 21, 2, 9, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (199, CAST(N'2017-06-21' AS Date), 27, 7, 7, 20, 22)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (200, CAST(N'2016-06-05' AS Date), 23, 9, 2, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (201, CAST(N'2019-11-06' AS Date), 26, 5, 2, 20, 25)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (202, CAST(N'2016-04-27' AS Date), 23, 8, 9, 20, 20)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (203, CAST(N'2019-12-16' AS Date), 28, 4, 9, 20, 22)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (204, CAST(N'2017-10-30' AS Date), 17, 2, 1, 20, 11)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (205, CAST(N'2020-10-07' AS Date), 19, 6, 8, 20, 22)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (206, CAST(N'2019-01-20' AS Date), 20, 8, 2, 20, 2)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (207, CAST(N'2018-04-25' AS Date), 17, 9, 6, 20, 4)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (208, CAST(N'2019-10-30' AS Date), 17, 5, 8, 20, 27)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (209, CAST(N'2016-06-27' AS Date), 16, 10, 9, 20, 28)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (210, CAST(N'2020-12-18' AS Date), 29, 4, 8, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (211, CAST(N'2020-08-14' AS Date), 23, 4, 1, 20, 15)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (212, CAST(N'2018-10-10' AS Date), 25, 2, 7, 20, 17)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (213, CAST(N'2019-03-08' AS Date), 20, 5, 6, 20, 20)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (214, CAST(N'2018-11-29' AS Date), 28, 7, 5, 20, 11)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (215, CAST(N'2019-08-19' AS Date), 27, 5, 2, 20, 21)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (216, CAST(N'2019-12-04' AS Date), 30, 7, 4, 20, 10)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (217, CAST(N'2020-08-27' AS Date), 25, 4, 1, 20, 25)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (218, CAST(N'2016-09-02' AS Date), 30, 9, 7, 20, 30)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (219, CAST(N'2020-03-09' AS Date), 30, 9, 7, 20, 25)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (220, CAST(N'2020-10-29' AS Date), 18, 10, 7, 20, 4)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (221, CAST(N'2020-03-03' AS Date), 29, 4, 7, 20, 20)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (222, CAST(N'2017-08-11' AS Date), 15, 3, 5, 20, 8)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (223, CAST(N'2018-03-06' AS Date), 27, 9, 10, 20, 2)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (224, CAST(N'2019-05-19' AS Date), 18, 1, 9, 20, 19)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (225, CAST(N'2020-06-23' AS Date), 23, 7, 8, 20, 28)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (226, CAST(N'2019-12-10' AS Date), 28, 8, 7, 20, 9)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (227, CAST(N'2018-11-14' AS Date), 27, 7, 5, 20, 6)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (228, CAST(N'2019-08-15' AS Date), 28, 4, 9, 20, 22)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (229, CAST(N'2019-03-14' AS Date), 17, 4, 6, 20, 24)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (230, CAST(N'2017-11-14' AS Date), 18, 4, 6, 20, 22)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (231, CAST(N'2017-01-18' AS Date), 17, 10, 7, 20, 19)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (232, CAST(N'2019-05-11' AS Date), 30, 9, 7, 20, 25)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (233, CAST(N'2019-01-10' AS Date), 16, 6, 10, 20, 25)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (234, CAST(N'2018-08-18' AS Date), 17, 6, 9, 20, 21)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (235, CAST(N'2019-08-17' AS Date), 23, 7, 9, 20, 11)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (236, CAST(N'2017-06-07' AS Date), 18, 5, 6, 20, 22)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (237, CAST(N'2016-10-05' AS Date), 23, 6, 6, 20, 21)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (238, CAST(N'2016-11-10' AS Date), 17, 4, 7, 20, 19)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (239, CAST(N'2017-08-23' AS Date), 29, 3, 6, 20, 30)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (240, CAST(N'2019-12-05' AS Date), 25, 3, 10, 20, 7)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (241, CAST(N'2017-04-09' AS Date), 23, 7, 8, 20, 25)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (242, CAST(N'2017-12-18' AS Date), 30, 5, 10, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (243, CAST(N'2019-08-07' AS Date), 26, 8, 8, 20, 8)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (244, CAST(N'2016-07-23' AS Date), 21, 7, 9, 20, 9)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (245, CAST(N'2017-10-21' AS Date), 19, 9, 6, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (246, CAST(N'2016-03-02' AS Date), 24, 9, 2, 20, 29)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (247, CAST(N'2016-04-16' AS Date), 21, 6, 8, 20, 13)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (248, CAST(N'2019-05-26' AS Date), 29, 5, 1, 20, 4)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (249, CAST(N'2020-04-23' AS Date), 20, 6, 7, 20, 6)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (250, CAST(N'2018-12-07' AS Date), 15, 5, 9, 20, 11)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (251, CAST(N'2016-01-30' AS Date), 25, 10, 4, 20, 15)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (252, CAST(N'2016-03-26' AS Date), 18, 4, 4, 20, 20)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (253, CAST(N'2019-11-25' AS Date), 22, 3, 2, 20, 24)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (254, CAST(N'2018-05-01' AS Date), 23, 8, 1, 20, 20)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (255, CAST(N'2020-05-25' AS Date), 25, 6, 5, 20, 3)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (256, CAST(N'2018-12-28' AS Date), 25, 2, 7, 20, 19)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (257, CAST(N'2020-07-31' AS Date), 26, 9, 10, 20, 10)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (258, CAST(N'2020-10-15' AS Date), 25, 4, 1, 20, 25)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (259, CAST(N'2020-07-03' AS Date), 24, 5, 4, 20, 3)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (260, CAST(N'2018-11-18' AS Date), 22, 8, 1, 20, 3)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (261, CAST(N'2019-01-27' AS Date), 24, 2, 7, 20, 1)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (262, CAST(N'2018-02-23' AS Date), 20, 6, 8, 20, 18)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (263, CAST(N'2018-10-27' AS Date), 30, 1, 2, 20, 5)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (264, CAST(N'2020-11-24' AS Date), 28, 6, 3, 20, 1)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (265, CAST(N'2017-01-04' AS Date), 26, 5, 1, 20, 28)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (266, CAST(N'2019-09-10' AS Date), 24, 5, 4, 20, 4)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (267, CAST(N'2016-01-15' AS Date), 23, 7, 7, 20, 26)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (268, CAST(N'2019-12-14' AS Date), 17, 10, 8, 20, 19)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (269, CAST(N'2019-08-06' AS Date), 19, 10, 7, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (270, CAST(N'2016-11-15' AS Date), 24, 1, 6, 20, 8)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (271, CAST(N'2019-03-30' AS Date), 22, 2, 9, 20, 6)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (272, CAST(N'2020-01-11' AS Date), 22, 10, 4, 20, 8)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (273, CAST(N'2018-12-05' AS Date), 15, 6, 2, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (274, CAST(N'2017-05-05' AS Date), 19, 6, 8, 20, 22)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (275, CAST(N'2020-02-02' AS Date), 26, 3, 9, 20, 2)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (276, CAST(N'2020-01-17' AS Date), 30, 9, 8, 20, 13)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (277, CAST(N'2017-11-20' AS Date), 20, 6, 8, 20, 9)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (278, CAST(N'2020-04-07' AS Date), 20, 3, 2, 20, 2)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (279, CAST(N'2016-10-10' AS Date), 30, 2, 3, 20, 17)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (280, CAST(N'2018-06-17' AS Date), 30, 8, 6, 20, 7)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (281, CAST(N'2017-09-29' AS Date), 21, 2, 10, 20, 3)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (282, CAST(N'2017-04-29' AS Date), 29, 2, 5, 20, 30)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (283, CAST(N'2016-11-14' AS Date), 22, 9, 2, 20, 4)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (284, CAST(N'2018-05-15' AS Date), 16, 10, 8, 20, 27)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (285, CAST(N'2016-11-22' AS Date), 23, 4, 3, 20, 5)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (286, CAST(N'2019-01-28' AS Date), 29, 7, 4, 20, 2)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (287, CAST(N'2019-01-08' AS Date), 23, 6, 6, 20, 27)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (288, CAST(N'2016-02-20' AS Date), 23, 8, 10, 20, 13)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (289, CAST(N'2020-09-25' AS Date), 23, 10, 5, 20, 19)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (290, CAST(N'2017-08-15' AS Date), 28, 6, 2, 20, 2)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (291, CAST(N'2018-06-23' AS Date), 22, 6, 7, 20, 30)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (292, CAST(N'2020-12-17' AS Date), 29, 3, 6, 20, 25)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (293, CAST(N'2019-01-01' AS Date), 23, 10, 3, 20, 5)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (294, CAST(N'2016-04-21' AS Date), 22, 5, 6, 20, 1)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (295, CAST(N'2016-09-27' AS Date), 16, 2, 3, 20, 18)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (296, CAST(N'2020-05-30' AS Date), 17, 1, 1, 20, 28)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (297, CAST(N'2016-05-01' AS Date), 30, 4, 8, 20, 11)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (298, CAST(N'2020-09-06' AS Date), 28, 2, 6, 20, 13)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (299, CAST(N'2020-08-12' AS Date), 25, 2, 8, 20, 19)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (300, CAST(N'2020-05-22' AS Date), 25, 5, 2, 20, 16)
GO
SET IDENTITY_INSERT [dbo].[Attendance] OFF
GO
SET IDENTITY_INSERT [dbo].[CarryOut] ON 
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (1, 3, 7, CAST(N'2016-10-08' AS Date), CAST(N'2021-04-05' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (2, 13, 10, CAST(N'2016-06-22' AS Date), CAST(N'2020-12-18' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (3, 26, 7, CAST(N'2017-11-20' AS Date), CAST(N'2022-05-18' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (4, 27, 4, CAST(N'2018-04-17' AS Date), CAST(N'2022-10-13' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (5, 11, 2, CAST(N'2018-08-24' AS Date), CAST(N'2023-02-19' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (6, 27, 4, CAST(N'2016-02-26' AS Date), CAST(N'2020-08-23' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (7, 16, 8, CAST(N'2016-03-07' AS Date), CAST(N'2020-09-02' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (8, 5, 5, CAST(N'2018-01-06' AS Date), CAST(N'2022-07-04' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (9, 1, 8, CAST(N'2016-02-07' AS Date), CAST(N'2020-08-04' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (10, 2, 2, CAST(N'2018-12-11' AS Date), CAST(N'2023-06-08' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (11, 2, 2, CAST(N'2018-09-28' AS Date), CAST(N'2023-03-26' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (12, 23, 5, CAST(N'2016-10-13' AS Date), CAST(N'2021-04-10' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (13, 21, 6, CAST(N'2017-12-07' AS Date), CAST(N'2022-06-04' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (14, 23, 5, CAST(N'2018-04-25' AS Date), CAST(N'2022-10-21' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (15, 1, 8, CAST(N'2018-07-24' AS Date), CAST(N'2023-01-19' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (16, 8, 3, CAST(N'2017-03-29' AS Date), CAST(N'2021-09-24' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (17, 25, 10, CAST(N'2017-09-17' AS Date), CAST(N'2022-03-15' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (18, 1, 8, CAST(N'2018-03-16' AS Date), CAST(N'2022-09-11' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (19, 10, 6, CAST(N'2017-06-08' AS Date), CAST(N'2021-12-04' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (20, 12, 1, CAST(N'2018-12-03' AS Date), CAST(N'2023-05-31' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (21, 13, 10, CAST(N'2016-10-28' AS Date), CAST(N'2021-04-25' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (22, 25, 10, CAST(N'2018-06-05' AS Date), CAST(N'2022-12-01' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (23, 1, 8, CAST(N'2017-09-05' AS Date), CAST(N'2022-03-03' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (24, 8, 3, CAST(N'2018-06-07' AS Date), CAST(N'2022-12-03' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (25, 10, 6, CAST(N'2017-01-20' AS Date), CAST(N'2021-07-18' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (26, 6, 4, CAST(N'2016-03-23' AS Date), CAST(N'2020-09-18' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (27, 7, 8, CAST(N'2018-09-27' AS Date), CAST(N'2023-03-25' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (28, 10, 6, CAST(N'2016-01-28' AS Date), CAST(N'2020-07-25' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (29, 27, 4, CAST(N'2016-08-26' AS Date), CAST(N'2021-02-21' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (30, 17, 3, CAST(N'2016-07-22' AS Date), CAST(N'2021-01-17' AS Date))
GO
SET IDENTITY_INSERT [dbo].[CarryOut] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (8, N'Anchorage')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (18, N'Aurora')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (17, N'Baton Rouge')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (29, N'Birmingham')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (30, N'Corpus Christi')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (20, N'Detroit')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (11, N'Fort Worth')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (24, N'Houston')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (2, N'Jacksonville')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (12, N'Las Vegas')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (28, N'Los Angeles')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (14, N'Lubbock')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (15, N'Memphis')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (5, N'Milwaukee')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (23, N'Montgomery')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (6, N'New Orleans')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (27, N'Newark')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (19, N'Oakland')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (21, N'Omaha')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (4, N'Philadelphia')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (10, N'Richmond')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (3, N'San Antonio')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (9, N'San Diego')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (26, N'San Jose')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (13, N'Seattle')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (25, N'Spokane')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (22, N'St. Paul')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (16, N'Stockton')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (7, N'Tulsa')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (1, N'Virginia Beach')
GO
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [DeptPhone], [ManagerID], [CityID]) VALUES (1, N'Accounting', N'5996530385', 28, 3)
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [DeptPhone], [ManagerID], [CityID]) VALUES (2, N'TechnicalSales', N'5731871168', 49, 13)
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [DeptPhone], [ManagerID], [CityID]) VALUES (3, N'AccessorySales', N'5793798139', 44, 26)
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [DeptPhone], [ManagerID], [CityID]) VALUES (4, N'BusinessSales', N'8211527011', 33, 27)
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [DeptPhone], [ManagerID], [CityID]) VALUES (5, N'Service', N'6897711618', 38, 11)
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [DeptPhone], [ManagerID], [CityID]) VALUES (6, N'Sales', N'9354565228', 44, 27)
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [DeptPhone], [ManagerID], [CityID]) VALUES (7, N'ConsumerSales', N'1157213943', 45, 16)
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [DeptPhone], [ManagerID], [CityID]) VALUES (8, N'InternationalSales', N'1996284520', 24, 5)
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [DeptPhone], [ManagerID], [CityID]) VALUES (9, N'NationalSales', N'7117659562', 49, 1)
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [DeptPhone], [ManagerID], [CityID]) VALUES (10, N'Prepaid Customer', N'4808610204', 62, 2)
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Dependent] ON 
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (1, N'Deborah Pope', N'F', CAST(N'1987-05-13' AS Date), 4)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (2, N'Thomas Branch', N'M', CAST(N'1993-08-24' AS Date), 4)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (3, N'Evan Clayton', N'M', CAST(N'1999-09-20' AS Date), 4)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (4, N'Myra Dominguez', N'M', CAST(N'1992-05-16' AS Date), 2)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (5, N'Christi Duncan', N'M', CAST(N'1998-07-16' AS Date), 2)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (6, N'Maggie Gordon', N'F', CAST(N'1995-08-29' AS Date), 14)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (7, N'Demond Mckinney', N'M', CAST(N'1992-11-06' AS Date), 14)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (8, N'Traci Combs', N'M', CAST(N'1998-07-19' AS Date), 14)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (9, N'Olga Sanchez', N'F', CAST(N'1986-06-24' AS Date), 26)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (10, N'Benny Gillespie', N'M', CAST(N'1997-07-21' AS Date), 29)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (11, N'Patrick Livingston', N'M', CAST(N'1987-05-29' AS Date), 29)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (12, N'Alfredo Collier', N'F', CAST(N'1994-11-08' AS Date), 18)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (13, N'Jonathon Hines', N'F', CAST(N'1992-11-30' AS Date), 24)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (14, N'Ruby Murray', N'M', CAST(N'2000-12-07' AS Date), 24)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (15, N'Brett Trevino', N'M', CAST(N'1987-09-02' AS Date), 24)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (16, N'Dan Shelton', N'M', CAST(N'2000-01-25' AS Date), 9)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (17, N'Kristie Kirby', N'M', CAST(N'1999-08-18' AS Date), 9)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (18, N'Brad Coleman', N'F', CAST(N'1990-12-18' AS Date), 9)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (19, N'Tamiko Richardson', N'F', CAST(N'1995-03-22' AS Date), 3)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (20, N'Penny Burgess', N'M', CAST(N'1992-06-24' AS Date), 3)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (21, N'Billy Franco', N'M', CAST(N'1992-04-02' AS Date), 3)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (22, N'Wesley Lyons', N'M', CAST(N'1992-09-24' AS Date), 6)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (23, N'Preston Cummings', N'F', CAST(N'1996-11-23' AS Date), 6)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (24, N'Patrick Conley', N'F', CAST(N'1985-01-09' AS Date), 6)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (25, N'Loretta Rivera', N'M', CAST(N'1991-10-22' AS Date), 25)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (26, N'Jennifer Forbes', N'M', CAST(N'1999-12-09' AS Date), 19)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (27, N'Grace Washington', N'M', CAST(N'1986-10-09' AS Date), 19)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (28, N'Nathan Meadows', N'F', CAST(N'1992-05-16' AS Date), 19)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (29, N'John Buchanan', N'M', CAST(N'1996-11-26' AS Date), 30)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (30, N'Ericka Sims', N'M', CAST(N'1989-01-01' AS Date), 8)
GO
SET IDENTITY_INSERT [dbo].[Dependent] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (1, N'Javier Ortiz', N'67 Clarendon Boulevard', CAST(N'1982-02-10' AS Date), N'RMIT University', N'Communication', N'Medium', N'0686144066', CAST(N'2000-03-07' AS Date), 6, 3)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (2, N'Joshua Copeland', N'168 Hague St.', CAST(N'1980-01-07' AS Date), N'PTIT University', N'Social Science', N'Poor', N'8993187728', CAST(N'1998-02-01' AS Date), 5, 5)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (3, N'Rickey Kent', N'89 Second Road', CAST(N'1992-12-26' AS Date), N'NEU University', N'Business', N'Poor', N'5275289799', CAST(N'2011-01-21' AS Date), 6, 5)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (4, N'Patrice Hodge', N'63 Oak Avenue', CAST(N'1980-07-01' AS Date), N'HUST University', N'Engineering', N'Medium', N'7567975908', CAST(N'1998-07-27' AS Date), 9, 7)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (5, N'Patricia Pugh', N'21 Rocky Fabien Drive', CAST(N'1983-03-08' AS Date), N'RMIT University', N'Business', N'Medium', N'0642036697', CAST(N'2001-04-02' AS Date), 4, 1)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (6, N'Angelo Benjamin', N'802 Clarendon Boulevard', CAST(N'1990-03-18' AS Date), N'NEU University', N'Communication', N'Excellent', N'7332359799', CAST(N'2008-04-12' AS Date), 9, 7)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (7, N'Harold Castillo', N'44 Hague Road', CAST(N'1985-09-16' AS Date), N'Oxford University', N'Communication', N'Medium', N'1604399873', CAST(N'2003-10-12' AS Date), 2, 6)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (8, N'Latisha Case', N'20 Green Nobel Freeway', CAST(N'1990-11-09' AS Date), N'ULIS University', N'Social Science', N'Excellent', N'8243459587', CAST(N'2008-12-04' AS Date), 8, 11)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (9, N'Adriana Velez', N'285 Old St.', CAST(N'1994-10-14' AS Date), N'Cambridge University', N'Business', N'Excellent', N'6418974677', CAST(N'2012-11-08' AS Date), 2, 9)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (10, N'Keith Whitney', N'334 Fabien Way', CAST(N'1987-04-29' AS Date), N'Harvard University', N'Business', N'Good', N'2972701433', CAST(N'2005-05-24' AS Date), 4, 8)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (11, N'Brendan Schultz', N'96 Hague Blvd.', CAST(N'1990-09-08' AS Date), N'PTIT University', N'Business', N'Poor', N'0067805260', CAST(N'2008-10-03' AS Date), 4, 8)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (12, N'Marvin Blake', N'976 Milton Freeway', CAST(N'1981-04-12' AS Date), N'Cambridge University', N'Social Science', N'Good', N'5661116307', CAST(N'1999-05-08' AS Date), 8, 2)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (13, N'Ashley Fox', N'168 White Fabien Blvd.', CAST(N'1988-06-11' AS Date), N'FPT University', N'Mathematics', N'Medium', N'7060888068', CAST(N'2006-07-07' AS Date), 10, 7)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (14, N'Ty Dennis', N'291 Nobel St.', CAST(N'1994-01-03' AS Date), N'PTIT University', N'Mathematics', N'Good', N'5416475963', CAST(N'2012-01-29' AS Date), 8, 2)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (15, N'Alberto Frey', N'60 North Green Oak Avenue', CAST(N'1997-10-27' AS Date), N'RMIT University', N'Computer Science', N'Excellent', N'1694109744', CAST(N'2015-11-22' AS Date), 2, 9)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (16, N'Calvin Barr', N'68 North Clarendon Boulevard', CAST(N'1988-07-26' AS Date), N'ULIS University', N'Social Science', N'Good', N'1306780367', CAST(N'2006-08-21' AS Date), 3, 10)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (17, N'Luz Blevins', N'967 East New Way', CAST(N'1986-11-16' AS Date), N'Harvard University', N'Communication', N'Medium', N'5226396114', CAST(N'2004-12-11' AS Date), 5, 6)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (18, N'Sonia Jefferson', N'58 New Drive', CAST(N'1984-10-14' AS Date), N'Cambridge University', N'Engineering', N'Excellent', N'6561731632', CAST(N'2002-11-09' AS Date), 2, 9)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (19, N'Lesley Black', N'237 Green Old Parkway', CAST(N'1986-10-25' AS Date), N'NEU University', N'Computer Science', N'Good', N'0848189355', CAST(N'2004-11-19' AS Date), 10, 3)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (20, N'Arlene Mata', N'95 Nobel Boulevard', CAST(N'1998-05-04' AS Date), N'NEU University', N'Mathematics', N'Excellent', N'3272339360', CAST(N'2016-05-29' AS Date), 7, 8)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (21, N'Jeff Munoz', N'232 North New Boulevard', CAST(N'1989-09-27' AS Date), N'RMIT University', N'Mathematics', N'Poor', N'0383066222', CAST(N'2007-10-23' AS Date), 5, 5)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (22, N'Ruby Potter', N'525 Green Hague Road', CAST(N'1993-06-14' AS Date), N'USTH University', N'Communication', N'Good', N'9564665038', CAST(N'2011-07-10' AS Date), 5, 6)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (23, N'Charity Hodge', N'65 Clarendon Blvd.', CAST(N'1995-04-15' AS Date), N'USTH University', N'Business', N'Good', N'8948468927', CAST(N'2013-05-10' AS Date), 2, 9)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (24, N'Margarita Holt', N'770 White Second Road', CAST(N'1993-11-25' AS Date), N'ULIS University', N'Engineering', N'Poor', N'5030724404', CAST(N'2011-12-21' AS Date), 3, 10)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (25, N'Chad Glover', N'20 Oak Road', CAST(N'1994-11-18' AS Date), N'Cambridge University', N'Language', N'Excellent', N'9912374990', CAST(N'2012-12-13' AS Date), 10, 3)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (26, N'Jake Nolan', N'724 First Parkway', CAST(N'1990-07-03' AS Date), N'HUST University', N'Mathematics', N'Good', N'2816338713', CAST(N'2008-07-28' AS Date), 9, 2)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (27, N'Jeffrey Obrien', N'24 East Green New Drive', CAST(N'1989-09-08' AS Date), N'NEU University', N'Communication', N'Excellent', N'3415838923', CAST(N'2007-10-04' AS Date), 2, 9)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (28, N'Forrest Bradley', N'333 Old Road', CAST(N'1997-11-05' AS Date), N'MIT University', N'Communication', N'Poor', N'5214793555', CAST(N'2015-12-01' AS Date), 10, 3)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (29, N'Tonia Lin', N'567 Nobel Road', CAST(N'1991-02-18' AS Date), N'Cambridge University', N'Business', N'Good', N'2624949234', CAST(N'2009-03-15' AS Date), 9, 7)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (30, N'Desiree Wu', N'708 Rocky Milton Blvd.', CAST(N'1997-10-29' AS Date), N'Oxford University', N'Engineering', N'Good', N'7210712074', CAST(N'2015-11-24' AS Date), 3, 10)
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Insurance] ON 
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (1, N'Alaska', CAST(N'2020-10-05' AS Date), N'Battersea', 24)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (2, N'Utah', CAST(N'2018-11-04' AS Date), N'Inverkeithing', 5)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (3, N'Arizona', CAST(N'2021-09-28' AS Date), N'Hove', 4)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (4, N'Florida', CAST(N'2019-11-22' AS Date), N'Magherafelt', 2)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (5, N'New Jersey', CAST(N'2018-03-10' AS Date), N'Keswick', 16)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (6, N'North Dakota', CAST(N'2020-09-03' AS Date), N'Haverfordwest', 2)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (7, N'Hawaii', CAST(N'2021-04-24' AS Date), N'Blandford Forum', 18)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (8, N'Iowa', CAST(N'2021-12-21' AS Date), N'Dulverton', 1)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (9, N'Hawaii', CAST(N'2019-09-14' AS Date), N'Irvine', 14)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (10, N'Illinois', CAST(N'2021-02-02' AS Date), N'Woodford Green', 23)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (11, N'Montana', CAST(N'2019-03-11' AS Date), N'Winchester', 23)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (12, N'West Virginia', CAST(N'2021-09-10' AS Date), N'Larkhall', 21)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (13, N'Alabama', CAST(N'2021-07-14' AS Date), N'Halesowen', 8)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (14, N'Michigan', CAST(N'2022-10-17' AS Date), N'Iver', 21)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (15, N'Kansas', CAST(N'2018-01-17' AS Date), N'Pinner', 14)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (16, N'Oklahoma', CAST(N'2019-09-06' AS Date), N'Weybridge', 9)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (17, N'Wisconsin', CAST(N'2019-12-12' AS Date), N'South Molton', 3)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (18, N'Vermont', CAST(N'2020-07-22' AS Date), N'Braunton', 14)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (19, N'Alaska', CAST(N'2018-04-05' AS Date), N'Beaworthy', 17)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (20, N'Ohio', CAST(N'2018-05-19' AS Date), N'Inverurie', 30)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (21, N'Kansas', CAST(N'2020-03-13' AS Date), N'Lockerbie', 5)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (22, N'Minnesota', CAST(N'2021-06-09' AS Date), N'Wantage', 3)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (23, N'Nebraska', CAST(N'2021-06-26' AS Date), N'Swanley', 14)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (24, N'Rhode Island', CAST(N'2018-07-25' AS Date), N'Inverkeithing', 9)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (25, N'West Virginia', CAST(N'2018-03-20' AS Date), N'Brighouse', 17)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (26, N'Vermont', CAST(N'2020-08-24' AS Date), N'Cairndow', 27)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (27, N'Georgia', CAST(N'2018-04-01' AS Date), N'Turriff', 29)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (28, N'Florida', CAST(N'2021-12-28' AS Date), N'Helston', 17)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (29, N'Utah', CAST(N'2018-10-05' AS Date), N'Highgate', 2)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (30, N'Alabama', CAST(N'2022-02-08' AS Date), N'Monmouth', 6)
GO
SET IDENTITY_INSERT [dbo].[Insurance] OFF
GO
SET IDENTITY_INSERT [dbo].[Participate] ON 
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (1, 5, 7, CAST(N'2016-02-11' AS Date), CAST(N'2020-08-08' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (2, 9, 10, CAST(N'2018-10-07' AS Date), CAST(N'2023-04-04' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (3, 9, 7, CAST(N'2016-08-19' AS Date), CAST(N'2021-02-14' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (4, 8, 4, CAST(N'2016-06-21' AS Date), CAST(N'2020-12-17' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (5, 4, 2, CAST(N'2018-06-07' AS Date), CAST(N'2022-12-03' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (6, 8, 4, CAST(N'2016-11-02' AS Date), CAST(N'2021-04-30' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (7, 8, 8, CAST(N'2018-10-05' AS Date), CAST(N'2023-04-02' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (8, 3, 5, CAST(N'2016-01-24' AS Date), CAST(N'2020-07-21' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (9, 2, 8, CAST(N'2016-06-13' AS Date), CAST(N'2020-12-09' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (10, 7, 2, CAST(N'2017-10-06' AS Date), CAST(N'2022-04-03' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (11, 5, 2, CAST(N'2017-02-27' AS Date), CAST(N'2021-08-25' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (12, 3, 5, CAST(N'2018-11-29' AS Date), CAST(N'2023-05-27' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (13, 9, 6, CAST(N'2017-01-12' AS Date), CAST(N'2021-07-10' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (14, 10, 5, CAST(N'2016-08-29' AS Date), CAST(N'2021-02-24' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (15, 3, 8, CAST(N'2017-06-10' AS Date), CAST(N'2021-12-06' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (16, 8, 3, CAST(N'2017-05-29' AS Date), CAST(N'2021-11-24' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (17, 2, 10, CAST(N'2016-10-08' AS Date), CAST(N'2021-04-05' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (18, 6, 8, CAST(N'2016-01-12' AS Date), CAST(N'2020-07-09' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (19, 7, 6, CAST(N'2018-05-25' AS Date), CAST(N'2022-11-20' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (20, 2, 1, CAST(N'2018-11-19' AS Date), CAST(N'2023-05-17' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (21, 6, 10, CAST(N'2017-11-23' AS Date), CAST(N'2022-05-21' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (22, 4, 10, CAST(N'2016-06-21' AS Date), CAST(N'2020-12-17' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (23, 6, 8, CAST(N'2018-10-12' AS Date), CAST(N'2023-04-09' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (24, 8, 3, CAST(N'2016-07-29' AS Date), CAST(N'2021-01-24' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (25, 4, 6, CAST(N'2017-06-30' AS Date), CAST(N'2021-12-26' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (26, 6, 4, CAST(N'2018-05-17' AS Date), CAST(N'2022-11-12' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (27, 8, 8, CAST(N'2016-12-04' AS Date), CAST(N'2021-06-01' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (28, 5, 6, CAST(N'2018-09-09' AS Date), CAST(N'2023-03-07' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (29, 6, 4, CAST(N'2016-10-23' AS Date), CAST(N'2021-04-20' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (30, 10, 3, CAST(N'2016-12-10' AS Date), CAST(N'2021-06-07' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Participate] OFF
GO
SET IDENTITY_INSERT [dbo].[Position] ON 
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (1, N'CEO', 4.3548741500614554, 1)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (2, N'Department head', 1.6263452477875842, 4)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (3, N'Executive assistant', 2.9293166389359704, 10)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (4, N'CDO', 4.5667408600294683, 8)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (5, N'Junior staffer', 5.7612935447885159, 2)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (6, N'Senior staffer', 2.942589261542349, 2)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (7, N'Department specialist', 2.9782497398453995, 8)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (8, N'CFO', 2.7092217713171718, 8)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (9, N'Team leader', 5.9853506218573784, 9)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (10, N'Board member', 6.7413897671463854, 2)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (11, N'COO', 1.4329656606693593, 8)
GO
SET IDENTITY_INSERT [dbo].[Position] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 
GO
INSERT [dbo].[Project] ([ProjectID], [ProjectName], [Budget]) VALUES (1, N'Corporate Sales', 448361.57074121828)
GO
INSERT [dbo].[Project] ([ProjectID], [ProjectName], [Budget]) VALUES (2, N'Corporate Marketing', 554640.88171470945)
GO
INSERT [dbo].[Project] ([ProjectID], [ProjectName], [Budget]) VALUES (3, N'Business Marketing', 48925.72263205691)
GO
INSERT [dbo].[Project] ([ProjectID], [ProjectName], [Budget]) VALUES (4, N'National Customer', 84344.374790948059)
GO
INSERT [dbo].[Project] ([ProjectID], [ProjectName], [Budget]) VALUES (5, N'International Marketing', 11566.488813407015)
GO
INSERT [dbo].[Project] ([ProjectID], [ProjectName], [Budget]) VALUES (6, N'National Marketing', 157378.12666100363)
GO
INSERT [dbo].[Project] ([ProjectID], [ProjectName], [Budget]) VALUES (7, N'Technical', 101738.78189257289)
GO
INSERT [dbo].[Project] ([ProjectID], [ProjectName], [Budget]) VALUES (8, N'Web', 969312.9910246064)
GO
INSERT [dbo].[Project] ([ProjectID], [ProjectName], [Budget]) VALUES (9, N'Consumer Customer', 404113.2282810813)
GO
INSERT [dbo].[Project] ([ProjectID], [ProjectName], [Budget]) VALUES (10, N'Technical Sales', 427109.29857432342)
GO
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
SET IDENTITY_INSERT [dbo].[Salary] ON 
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (1, 500, 3, 218, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (2, 500, 5, 246, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (3, 500, 5, 230, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (4, 500, 7, 166, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (5, 500, 1, 61, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (6, 500, 7, 167, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (7, 500, 6, 273, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (8, 500, 11, 131, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (9, 500, 9, 294, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (10, 500, 8, 81, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (11, 500, 8, 87, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (12, 500, 2, 140, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (13, 500, 7, 190, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (14, 500, 2, 139, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (15, 500, 9, 295, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (16, 500, 10, 9, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (17, 500, 6, 258, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (18, 500, 9, 299, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (19, 500, 3, 201, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (20, 500, 8, 93, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (21, 500, 5, 243, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (22, 500, 6, 253, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (23, 500, 9, 297, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (24, 500, 10, 11, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (25, 500, 3, 207, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (26, 500, 2, 154, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (27, 500, 9, 278, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (28, 500, 3, 202, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (29, 500, 7, 159, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (30, 500, 10, 24, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (31, 500, 1, 54, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (32, 500, 11, 130, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (33, 500, 8, 86, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (34, 500, 9, 293, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (35, 500, 3, 188, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (36, 500, 5, 226, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (37, 500, 10, 10, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (38, 500, 11, 111, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (39, 500, 8, 100, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (40, 500, 9, 284, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (41, 500, 2, 148, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (42, 500, 3, 212, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (43, 500, 4, 35, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (44, 500, 8, 78, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (45, 500, 6, 269, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (46, 500, 5, 235, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (47, 500, 8, 98, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (48, 500, 2, 133, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (49, 500, 4, 42, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (50, 500, 1, 64, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (51, 500, 11, 120, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (52, 500, 3, 213, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (53, 500, 7, 182, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (54, 500, 2, 144, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (55, 500, 1, 55, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (56, 500, 6, 262, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (57, 500, 6, 245, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (58, 500, 5, 217, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (59, 500, 6, 255, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (60, 500, 3, 197, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (61, 500, 7, 180, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (62, 500, 1, 62, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (63, 500, 6, 267, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (64, 500, 6, 266, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (65, 500, 10, 25, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (66, 500, 6, 248, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (67, 500, 4, 47, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (68, 500, 3, 186, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (69, 500, 6, 241, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (70, 500, 1, 63, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (71, 500, 9, 300, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (72, 500, 2, 137, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (73, 500, 3, 187, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (74, 500, 3, 209, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (75, 500, 5, 236, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (76, 500, 4, 28, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (77, 500, 5, 211, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (78, 500, 3, 206, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (79, 500, 4, 34, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (80, 500, 6, 271, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (81, 500, 1, 52, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (82, 500, 2, 134, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (83, 500, 2, 153, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (84, 500, 8, 92, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (85, 500, 3, 192, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (86, 500, 2, 128, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (87, 500, 6, 247, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (88, 500, 5, 237, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (89, 500, 5, 231, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (90, 500, 5, 222, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (91, 500, 9, 280, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (92, 500, 8, 80, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (93, 500, 2, 146, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (94, 500, 3, 184, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (95, 500, 8, 91, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (96, 500, 8, 76, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (97, 500, 6, 240, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (98, 500, 1, 59, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (99, 500, 1, 48, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (100, 500, 10, 17, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (101, 500, 7, 174, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (102, 500, 3, 196, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (103, 500, 7, 175, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (104, 500, 9, 277, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (105, 500, 1, 60, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (106, 500, 9, 279, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (107, 500, 10, 16, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (108, 500, 6, 265, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (109, 500, 3, 191, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (110, 500, 4, 23, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (111, 500, 4, 40, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (112, 500, 4, 30, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (113, 500, 7, 169, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (114, 500, 9, 286, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (115, 500, 2, 135, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (116, 500, 4, 41, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (117, 500, 3, 193, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (118, 500, 7, 158, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (119, 500, 1, 68, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (120, 500, 7, 171, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (121, 500, 10, 1, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (122, 500, 8, 104, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (123, 500, 6, 252, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (124, 500, 10, 18, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (125, 500, 8, 83, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (126, 500, 3, 204, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (127, 500, 9, 287, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (128, 500, 9, 296, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (129, 500, 11, 109, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (130, 500, 2, 145, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (131, 500, 8, 79, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (132, 500, 2, 141, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (133, 500, 2, 150, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (134, 500, 10, 14, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (135, 500, 8, 82, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (136, 500, 2, 136, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (137, 500, 6, 250, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (138, 500, 7, 172, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (139, 500, 4, 29, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (140, 500, 5, 219, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (141, 500, 11, 113, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (142, 500, 9, 276, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (143, 500, 4, 37, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (144, 500, 3, 200, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (145, 500, 7, 173, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (146, 500, 6, 242, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (147, 500, 3, 195, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (148, 500, 7, 157, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (149, 500, 4, 49, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (150, 500, 1, 51, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (151, 500, 7, 168, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (152, 500, 1, 72, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (153, 500, 9, 298, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (154, 500, 7, 156, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (155, 500, 10, 15, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (156, 500, 1, 75, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (157, 500, 6, 251, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (158, 500, 7, 160, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (159, 500, 3, 181, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (160, 500, 2, 132, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (161, 500, 9, 288, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (162, 500, 10, 20, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (163, 500, 2, 129, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (164, 500, 4, 44, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (165, 500, 5, 234, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (166, 500, 3, 179, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (167, 500, 7, 161, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (168, 500, 7, 149, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (169, 500, 3, 198, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (170, 500, 9, 292, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (171, 500, 8, 88, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (172, 500, 10, 13, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (173, 500, 2, 119, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (174, 500, 2, 123, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (175, 500, 1, 65, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (176, 500, 10, 19, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (177, 500, 1, 69, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (178, 500, 4, 43, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (179, 500, 11, 118, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (180, 500, 11, 121, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (181, 500, 10, 4, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (182, 500, 11, 108, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (183, 500, 5, 244, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (184, 500, 1, 58, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (185, 500, 9, 270, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (186, 500, 10, 6, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (187, 500, 2, 147, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (188, 500, 9, 283, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (189, 500, 9, 291, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (190, 500, 10, 3, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (191, 500, 3, 194, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (192, 500, 8, 89, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (193, 500, 9, 282, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (194, 500, 7, 165, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (195, 500, 5, 225, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (196, 500, 8, 97, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (197, 500, 11, 114, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (198, 500, 9, 285, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (199, 500, 6, 259, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (200, 500, 9, 281, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (201, 500, 1, 73, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (202, 500, 4, 38, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (203, 500, 6, 257, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (204, 500, 4, 53, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (205, 500, 6, 254, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (206, 500, 2, 151, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (207, 500, 5, 223, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (208, 500, 2, 127, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (209, 500, 8, 101, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (210, 500, 9, 290, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (211, 500, 10, 8, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (212, 500, 3, 203, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (213, 500, 4, 33, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (214, 500, 1, 57, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (215, 500, 2, 126, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (216, 500, 7, 164, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (217, 500, 1, 77, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (218, 500, 8, 95, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (219, 500, 1, 71, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (220, 500, 5, 227, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (221, 500, 4, 36, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (222, 500, 7, 178, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (223, 500, 7, 162, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (224, 500, 3, 199, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (225, 500, 8, 102, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (226, 500, 10, 5, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (227, 500, 4, 31, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (228, 500, 6, 260, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (229, 500, 3, 215, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (230, 500, 6, 261, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (231, 500, 3, 185, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (232, 500, 1, 84, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (233, 500, 1, 90, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (234, 500, 2, 124, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (235, 500, 1, 56, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (236, 500, 6, 256, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (237, 500, 2, 138, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (238, 500, 3, 189, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (239, 500, 8, 99, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (240, 500, 11, 107, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (241, 500, 1, 70, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (242, 500, 9, 289, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (243, 500, 7, 177, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (244, 500, 10, 2, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (245, 500, 9, 275, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (246, 500, 9, 268, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (247, 500, 4, 45, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (248, 500, 5, 221, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (249, 500, 4, 26, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (250, 500, 1, 66, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (251, 500, 10, 22, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (252, 500, 4, 39, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (253, 500, 5, 220, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (254, 500, 4, 32, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (255, 500, 6, 233, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (256, 500, 3, 183, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (257, 500, 7, 163, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (258, 500, 1, 96, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (259, 500, 6, 238, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (260, 500, 6, 239, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (261, 500, 11, 117, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (262, 500, 6, 263, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (263, 500, 5, 224, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (264, 500, 2, 122, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (265, 500, 8, 106, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (266, 500, 5, 216, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (267, 500, 11, 115, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (268, 500, 3, 176, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (269, 500, 9, 274, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (270, 500, 7, 152, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (271, 500, 10, 21, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (272, 500, 7, 170, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (273, 500, 9, 272, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (274, 500, 6, 229, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (275, 500, 2, 125, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (276, 500, 4, 46, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (277, 500, 10, 7, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (278, 500, 7, 142, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (279, 500, 3, 205, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (280, 500, 11, 103, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (281, 500, 6, 232, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (282, 500, 8, 94, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (283, 500, 5, 214, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (284, 500, 2, 112, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (285, 500, 6, 228, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (286, 500, 2, 116, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (287, 500, 2, 110, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (288, 500, 4, 50, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (289, 500, 7, 155, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (290, 500, 7, 143, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (291, 500, 8, 74, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (292, 500, 1, 67, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (293, 500, 5, 249, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (294, 500, 2, 105, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (295, 500, 9, 264, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (296, 500, 8, 27, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (297, 500, 1, 12, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (298, 500, 4, 85, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (299, 500, 3, 210, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (300, 500, 1, 208, NULL)
GO
SET IDENTITY_INSERT [dbo].[Salary] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__City__886159E5CDDC43C2]    Script Date: 01-Nov-23 8:36:29 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[City]') AND name = N'UQ__City__886159E5CDDC43C2')
ALTER TABLE [dbo].[City] ADD UNIQUE NONCLUSTERED 
(
	[CityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__5E508265E487A9BB]    Script Date: 01-Nov-23 8:36:29 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND name = N'UQ__Departme__5E508265E487A9BB')
ALTER TABLE [dbo].[Department] ADD UNIQUE NONCLUSTERED 
(
	[DeptName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__CC4794DF21BDDD23]    Script Date: 01-Nov-23 8:36:29 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND name = N'UQ__Departme__CC4794DF21BDDD23')
ALTER TABLE [dbo].[Department] ADD UNIQUE NONCLUSTERED 
(
	[DeptPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__CC4794DFDC42834E]    Script Date: 01-Nov-23 8:36:29 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND name = N'UQ__Departme__CC4794DFDC42834E')
ALTER TABLE [dbo].[Department] ADD UNIQUE NONCLUSTERED 
(
	[DeptPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__5E437C716C97F61C]    Script Date: 01-Nov-23 8:36:29 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND name = N'UQ__Employee__5E437C716C97F61C')
ALTER TABLE [dbo].[Employees] ADD UNIQUE NONCLUSTERED 
(
	[EmpPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__5E437C7197348DA9]    Script Date: 01-Nov-23 8:36:29 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND name = N'UQ__Employee__5E437C7197348DA9')
ALTER TABLE [dbo].[Employees] ADD UNIQUE NONCLUSTERED 
(
	[EmpPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__6C710DE15416E861]    Script Date: 01-Nov-23 8:36:29 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND name = N'UQ__Employee__6C710DE15416E861')
ALTER TABLE [dbo].[Employees] ADD UNIQUE NONCLUSTERED 
(
	[EmpName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Position__E46AEF42334ACCAE]    Script Date: 01-Nov-23 8:36:29 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Position]') AND name = N'UQ__Position__E46AEF42334ACCAE')
ALTER TABLE [dbo].[Position] ADD UNIQUE NONCLUSTERED 
(
	[PositionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Project__BCBE781CA4BA56E1]    Script Date: 01-Nov-23 8:36:29 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Project]') AND name = N'UQ__Project__BCBE781CA4BA56E1')
ALTER TABLE [dbo].[Project] ADD UNIQUE NONCLUSTERED 
(
	[ProjectName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Attendanc__Bonus__571DF1D5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Attendance] ADD  DEFAULT ('20') FOR [BonusBasic]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Employees__Rank__48CFD27E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Employees] ADD  DEFAULT ('Good') FOR [Rank]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Salary__SalaryBa__5812160E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Salary] ADD  DEFAULT ('500') FOR [SalaryBasic]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Employees] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employees] ([EmpID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Employees]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CarryOut_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[CarryOut]'))
ALTER TABLE [dbo].[CarryOut]  WITH CHECK ADD  CONSTRAINT [FK_CarryOut_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CarryOut_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[CarryOut]'))
ALTER TABLE [dbo].[CarryOut] CHECK CONSTRAINT [FK_CarryOut_City]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CarryOut_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[CarryOut]'))
ALTER TABLE [dbo].[CarryOut]  WITH CHECK ADD  CONSTRAINT [FK_CarryOut_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CarryOut_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[CarryOut]'))
ALTER TABLE [dbo].[CarryOut] CHECK CONSTRAINT [FK_CarryOut_Project]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Department_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Department]'))
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Department_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Department]'))
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_City]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Dependent_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dependent]'))
ALTER TABLE [dbo].[Dependent]  WITH CHECK ADD  CONSTRAINT [FK_Dependent_Employees] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employees] ([EmpID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Dependent_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dependent]'))
ALTER TABLE [dbo].[Dependent] CHECK CONSTRAINT [FK_Dependent_Employees]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Department] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Department] ([DeptID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Department]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Position]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Position] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([PositionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Position]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Position]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Insurance_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Insurance]'))
ALTER TABLE [dbo].[Insurance]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_Employees] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employees] ([EmpID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Insurance_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Insurance]'))
ALTER TABLE [dbo].[Insurance] CHECK CONSTRAINT [FK_Insurance_Employees]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Participate_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[Participate]'))
ALTER TABLE [dbo].[Participate]  WITH CHECK ADD  CONSTRAINT [FK_Participate_Department] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Department] ([DeptID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Participate_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[Participate]'))
ALTER TABLE [dbo].[Participate] CHECK CONSTRAINT [FK_Participate_Department]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Participate_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[Participate]'))
ALTER TABLE [dbo].[Participate]  WITH CHECK ADD  CONSTRAINT [FK_Participate_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Participate_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[Participate]'))
ALTER TABLE [dbo].[Participate] CHECK CONSTRAINT [FK_Participate_Project]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Salary_Attendance]') AND parent_object_id = OBJECT_ID(N'[dbo].[Salary]'))
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_Attendance] FOREIGN KEY([AttID])
REFERENCES [dbo].[Attendance] ([AttID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Salary_Attendance]') AND parent_object_id = OBJECT_ID(N'[dbo].[Salary]'))
ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_Attendance]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Salary_Position]') AND parent_object_id = OBJECT_ID(N'[dbo].[Salary]'))
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_Position] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([PositionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Salary_Position]') AND parent_object_id = OBJECT_ID(N'[dbo].[Salary]'))
ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_Position]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Salary_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[Salary]'))
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Salary_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[Salary]'))
ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_Project]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__Attendanc__AttAb__656C112C]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD CHECK  (([AttAbsent]>=(1) AND [AttAbsent]<=(10)))
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__Attendanc__AttDa__66603565]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD CHECK  (([AttDay]>=(15) AND [AttDay]<=(30)))
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__Attendanc__AttOv__6754599E]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD CHECK  (([AttOvertime]>=(1) AND [AttOvertime]<=(10)))
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__Dependent__DepGe__68487DD7]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dependent]'))
ALTER TABLE [dbo].[Dependent]  WITH CHECK ADD CHECK  (([DepGender]='M' OR [DepGender]='F'))
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__Employees__EmpBi__693CA210]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD CHECK  (((datepart(year,getdate())-datepart(year,[empbirthdate]))>=(18) AND (datepart(year,getdate())-datepart(year,[empbirthdate]))<=(65)))
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__Employees__Facil__6A30C649]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD CHECK  (([Facility] like '%University'))
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__Employees__Rank__47DBAE45]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD CHECK  (([Rank] like 'Excellent' OR [rank] like 'Good' OR [rank] like 'Medium' OR [rank] like 'Poor'))
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__Position__NumbAb__5070F446]') AND parent_object_id = OBJECT_ID(N'[dbo].[Position]'))
ALTER TABLE [dbo].[Position]  WITH CHECK ADD CHECK  (([NumbAbsent]>=(1) AND [NumbAbsent]<=(10)))
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__Position__Salary__6B24EA82]') AND parent_object_id = OBJECT_ID(N'[dbo].[Position]'))
ALTER TABLE [dbo].[Position]  WITH CHECK ADD CHECK  (([SalaryRate]>=(1) AND [SalaryRate]<=(8)))
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__Project__Budget__5441852A]') AND parent_object_id = OBJECT_ID(N'[dbo].[Project]'))
ALTER TABLE [dbo].[Project]  WITH CHECK ADD CHECK  (([budget]>=(10000) AND [budget]<=(1000000)))
GO
USE [master]
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET  READ_WRITE 
GO
