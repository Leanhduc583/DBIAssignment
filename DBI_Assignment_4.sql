USE [master]
GO
/****** Object:  Database [DBI_ASSIGNMENT]    Script Date: 01-Nov-23 9:39:43 PM ******/
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
/****** Object:  Table [dbo].[Attendance]    Script Date: 01-Nov-23 9:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[CarryOut]    Script Date: 01-Nov-23 9:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[City]    Script Date: 01-Nov-23 9:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 01-Nov-23 9:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DeptID] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [nvarchar](50) NOT NULL,
	[DeptPhone] [char](10) NOT NULL,
	[ManagerID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dependent]    Script Date: 01-Nov-23 9:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 01-Nov-23 9:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[Insurance]    Script Date: 01-Nov-23 9:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[Participate]    Script Date: 01-Nov-23 9:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[Position]    Script Date: 01-Nov-23 9:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[Project]    Script Date: 01-Nov-23 9:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](50) NOT NULL,
	[Budget] [float] NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salary]    Script Date: 01-Nov-23 9:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET IDENTITY_INSERT [dbo].[Attendance] ON 
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (1, CAST(N'2018-01-01' AS Date), 27, 3, 9, 20, 5)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (2, CAST(N'2018-03-01' AS Date), 21, 7, 10, 20, 5)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (3, CAST(N'2018-02-01' AS Date), 17, 9, 6, 20, 5)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (4, CAST(N'2018-04-01' AS Date), 30, 2, 5, 20, 5)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (5, CAST(N'2018-03-01' AS Date), 16, 6, 1, 20, 10)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (6, CAST(N'2018-02-01' AS Date), 19, 2, 1, 20, 10)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (7, CAST(N'2018-01-01' AS Date), 27, 3, 7, 20, 10)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (8, CAST(N'2018-04-01' AS Date), 22, 10, 5, 20, 10)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (9, CAST(N'2018-01-01' AS Date), 18, 4, 5, 20, 8)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (10, CAST(N'2018-03-01' AS Date), 15, 4, 8, 20, 8)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (11, CAST(N'2018-02-01' AS Date), 27, 6, 3, 20, 8)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (12, CAST(N'2018-04-01' AS Date), 15, 9, 6, 20, 8)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (13, CAST(N'2018-02-01' AS Date), 15, 7, 4, 20, 7)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (14, CAST(N'2018-04-01' AS Date), 23, 1, 6, 20, 7)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (15, CAST(N'2018-01-01' AS Date), 21, 1, 8, 20, 7)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (16, CAST(N'2018-03-01' AS Date), 19, 10, 6, 20, 7)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (17, CAST(N'2018-02-01' AS Date), 26, 2, 6, 20, 13)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (18, CAST(N'2018-03-01' AS Date), 18, 9, 5, 20, 13)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (19, CAST(N'2018-04-01' AS Date), 26, 8, 8, 20, 13)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (20, CAST(N'2018-01-01' AS Date), 16, 5, 9, 20, 13)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (21, CAST(N'2018-04-01' AS Date), 16, 3, 4, 20, 2)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (22, CAST(N'2018-01-01' AS Date), 20, 6, 9, 20, 2)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (23, CAST(N'2018-03-01' AS Date), 20, 5, 7, 20, 2)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (24, CAST(N'2018-02-01' AS Date), 26, 1, 5, 20, 2)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (25, CAST(N'2018-02-01' AS Date), 29, 10, 1, 20, 1)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (26, CAST(N'2018-01-01' AS Date), 28, 5, 1, 20, 1)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (27, CAST(N'2018-04-01' AS Date), 25, 6, 4, 20, 1)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (28, CAST(N'2018-03-01' AS Date), 29, 6, 2, 20, 1)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (29, CAST(N'2018-04-01' AS Date), 16, 4, 7, 20, 9)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (30, CAST(N'2018-02-01' AS Date), 26, 5, 4, 20, 9)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (31, CAST(N'2018-03-01' AS Date), 29, 3, 7, 20, 9)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (32, CAST(N'2018-01-01' AS Date), 30, 3, 6, 20, 9)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (33, CAST(N'2018-03-01' AS Date), 16, 6, 10, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (34, CAST(N'2018-01-01' AS Date), 15, 1, 1, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (35, CAST(N'2018-04-01' AS Date), 20, 7, 1, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (36, CAST(N'2018-02-01' AS Date), 28, 9, 10, 20, 14)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (37, CAST(N'2018-04-01' AS Date), 25, 6, 4, 20, 11)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (38, CAST(N'2018-01-01' AS Date), 26, 5, 2, 20, 11)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (39, CAST(N'2018-03-01' AS Date), 25, 9, 1, 20, 11)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (40, CAST(N'2018-02-01' AS Date), 16, 7, 3, 20, 11)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (41, CAST(N'2018-02-01' AS Date), 15, 9, 6, 20, 3)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (42, CAST(N'2018-04-01' AS Date), 19, 6, 9, 20, 3)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (43, CAST(N'2018-03-01' AS Date), 19, 9, 5, 20, 3)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (44, CAST(N'2018-01-01' AS Date), 22, 7, 8, 20, 3)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (45, CAST(N'2018-02-01' AS Date), 30, 5, 1, 20, 15)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (46, CAST(N'2018-03-01' AS Date), 23, 5, 4, 20, 15)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (47, CAST(N'2018-04-01' AS Date), 15, 4, 7, 20, 15)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (48, CAST(N'2018-01-01' AS Date), 22, 6, 6, 20, 15)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (49, CAST(N'2018-01-01' AS Date), 20, 5, 6, 20, 17)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (50, CAST(N'2018-02-01' AS Date), 22, 7, 8, 20, 17)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (51, CAST(N'2018-03-01' AS Date), 25, 8, 9, 20, 17)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (52, CAST(N'2018-04-01' AS Date), 24, 1, 6, 20, 17)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (53, CAST(N'2018-02-01' AS Date), 16, 9, 6, 20, 12)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (54, CAST(N'2018-03-01' AS Date), 29, 1, 4, 20, 12)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (55, CAST(N'2018-04-01' AS Date), 24, 8, 10, 20, 12)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (56, CAST(N'2018-01-01' AS Date), 21, 8, 10, 20, 12)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (57, CAST(N'2018-04-01' AS Date), 16, 2, 4, 20, 6)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (58, CAST(N'2018-01-01' AS Date), 21, 8, 2, 20, 6)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (59, CAST(N'2018-02-01' AS Date), 16, 3, 4, 20, 6)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (60, CAST(N'2018-03-01' AS Date), 19, 2, 10, 20, 6)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (61, CAST(N'2018-04-01' AS Date), 25, 7, 7, 20, 19)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (62, CAST(N'2018-03-01' AS Date), 29, 8, 6, 20, 19)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (63, CAST(N'2018-02-01' AS Date), 20, 6, 8, 20, 19)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (64, CAST(N'2018-01-01' AS Date), 23, 9, 2, 20, 19)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (65, CAST(N'2018-01-01' AS Date), 16, 1, 1, 20, 18)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (66, CAST(N'2018-02-01' AS Date), 27, 3, 8, 20, 18)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (67, CAST(N'2018-03-01' AS Date), 29, 4, 7, 20, 18)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (68, CAST(N'2018-04-01' AS Date), 30, 7, 3, 20, 18)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (69, CAST(N'2018-04-01' AS Date), 17, 4, 6, 20, 4)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (70, CAST(N'2018-03-01' AS Date), 23, 2, 9, 20, 4)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (71, CAST(N'2018-02-01' AS Date), 24, 4, 2, 20, 4)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (72, CAST(N'2018-01-01' AS Date), 30, 7, 5, 20, 4)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (73, CAST(N'2018-01-01' AS Date), 23, 10, 5, 20, 20)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (74, CAST(N'2018-02-01' AS Date), 25, 1, 6, 20, 20)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (75, CAST(N'2018-03-01' AS Date), 15, 7, 3, 20, 20)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (76, CAST(N'2018-04-01' AS Date), 27, 7, 6, 20, 20)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (77, CAST(N'2018-02-01' AS Date), 16, 8, 5, 20, 16)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (78, CAST(N'2018-04-01' AS Date), 28, 9, 10, 20, 16)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (79, CAST(N'2018-03-01' AS Date), 27, 6, 5, 20, 16)
GO
INSERT [dbo].[Attendance] ([AttID], [AttReceiveDate], [AttDay], [AttAbsent], [AttOvertime], [BonusBasic], [EmpID]) VALUES (80, CAST(N'2018-01-01' AS Date), 20, 6, 8, 20, 16)
GO
SET IDENTITY_INSERT [dbo].[Attendance] OFF
GO
SET IDENTITY_INSERT [dbo].[CarryOut] ON 
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (1, 3, 7, CAST(N'2016-10-08' AS Date), CAST(N'2021-04-05' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (2, 13, 10, CAST(N'2016-06-22' AS Date), CAST(N'2020-12-18' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (3, 9, 7, CAST(N'2017-11-20' AS Date), CAST(N'2022-05-18' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (4, 6, 4, CAST(N'2018-04-17' AS Date), CAST(N'2022-10-13' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (5, 20, 2, CAST(N'2018-08-24' AS Date), CAST(N'2023-02-19' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (6, 23, 4, CAST(N'2016-02-26' AS Date), CAST(N'2020-08-23' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (7, 16, 8, CAST(N'2016-03-07' AS Date), CAST(N'2020-09-02' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (8, 14, 5, CAST(N'2018-01-06' AS Date), CAST(N'2022-07-04' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (9, 1, 8, CAST(N'2016-02-07' AS Date), CAST(N'2020-08-04' AS Date))
GO
INSERT [dbo].[CarryOut] ([CarryID], [CityID], [ProjectID], [ProStartDate], [ProEndDate]) VALUES (10, 11, 2, CAST(N'2018-12-11' AS Date), CAST(N'2023-06-08' AS Date))
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
INSERT [dbo].[Department] ([DeptID], [DeptName], [DeptPhone], [ManagerID], [CityID]) VALUES (1, N'Accounting', N'5996530385', 12, 3)
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [DeptPhone], [ManagerID], [CityID]) VALUES (2, N'TechnicalSales', N'5731871168', 14, 13)
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [DeptPhone], [ManagerID], [CityID]) VALUES (3, N'AccessorySales', N'5793798139', 10, 26)
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [DeptPhone], [ManagerID], [CityID]) VALUES (4, N'BusinessSales', N'8211527011', 18, 27)
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [DeptPhone], [ManagerID], [CityID]) VALUES (5, N'Service', N'6897711618', 11, 11)
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
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (4, N'Myra Dominguez', N'M', CAST(N'1992-05-16' AS Date), 4)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (5, N'Christi Duncan', N'M', CAST(N'1998-07-16' AS Date), 10)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (6, N'Maggie Gordon', N'F', CAST(N'1995-08-29' AS Date), 10)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (7, N'Demond Mckinney', N'M', CAST(N'1992-11-06' AS Date), 10)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (8, N'Traci Combs', N'M', CAST(N'1998-07-19' AS Date), 14)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (9, N'Olga Sanchez', N'F', CAST(N'1986-06-24' AS Date), 14)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (10, N'Benny Gillespie', N'M', CAST(N'1997-07-21' AS Date), 14)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (11, N'Patrick Livingston', N'M', CAST(N'1987-05-29' AS Date), 14)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (12, N'Alfredo Collier', N'F', CAST(N'1994-11-08' AS Date), 14)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (13, N'Jonathon Hines', N'F', CAST(N'1992-11-30' AS Date), 7)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (14, N'Ruby Murray', N'M', CAST(N'2000-12-07' AS Date), 7)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (15, N'Brett Trevino', N'M', CAST(N'1987-09-02' AS Date), 18)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (16, N'Dan Shelton', N'M', CAST(N'2000-01-25' AS Date), 18)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (17, N'Kristie Kirby', N'M', CAST(N'1999-08-18' AS Date), 18)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (18, N'Brad Coleman', N'F', CAST(N'1990-12-18' AS Date), 18)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (19, N'Tamiko Richardson', N'F', CAST(N'1995-03-22' AS Date), 3)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (20, N'Penny Burgess', N'M', CAST(N'1992-06-24' AS Date), 17)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (21, N'Billy Franco', N'M', CAST(N'1992-04-02' AS Date), 17)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (22, N'Wesley Lyons', N'M', CAST(N'1992-09-24' AS Date), 17)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (23, N'Preston Cummings', N'F', CAST(N'1996-11-23' AS Date), 17)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (24, N'Patrick Conley', N'F', CAST(N'1985-01-09' AS Date), 9)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (25, N'Loretta Rivera', N'M', CAST(N'1991-10-22' AS Date), 9)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (26, N'Jennifer Forbes', N'M', CAST(N'1999-12-09' AS Date), 9)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (27, N'Grace Washington', N'M', CAST(N'1986-10-09' AS Date), 9)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (28, N'Nathan Meadows', N'F', CAST(N'1992-05-16' AS Date), 9)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (29, N'John Buchanan', N'M', CAST(N'1996-11-26' AS Date), 5)
GO
INSERT [dbo].[Dependent] ([DepID], [DepName], [DepGender], [DepBirthDate], [EmpID]) VALUES (30, N'Ericka Sims', N'M', CAST(N'1989-01-01' AS Date), 5)
GO
SET IDENTITY_INSERT [dbo].[Dependent] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (1, N'Javier Ortiz', N'67 Clarendon Boulevard', CAST(N'1982-02-10' AS Date), N'RMIT University', N'Communication', N'Medium', N'0686144066', CAST(N'2000-03-07' AS Date), 5, 3)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (2, N'Joshua Copeland', N'168 Hague St.', CAST(N'1980-01-07' AS Date), N'PTIT University', N'Social Science', N'Poor', N'8993187728', CAST(N'1998-02-01' AS Date), 4, 5)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (3, N'Rickey Kent', N'89 Second Road', CAST(N'1992-12-26' AS Date), N'NEU University', N'Business', N'Poor', N'5275289799', CAST(N'2011-01-21' AS Date), 5, 5)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (4, N'Patrice Hodge', N'63 Oak Avenue', CAST(N'1980-07-01' AS Date), N'HUST University', N'Engineering', N'Medium', N'7567975908', CAST(N'1998-07-27' AS Date), 1, 6)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (5, N'Patricia Pugh', N'21 Rocky Fabien Drive', CAST(N'1983-03-08' AS Date), N'RMIT University', N'Business', N'Medium', N'0642036697', CAST(N'2001-04-02' AS Date), 3, 1)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (6, N'Angelo Benjamin', N'802 Clarendon Boulevard', CAST(N'1990-03-18' AS Date), N'NEU University', N'Communication', N'Excellent', N'7332359799', CAST(N'2008-04-12' AS Date), 1, 7)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (7, N'Harold Castillo', N'44 Hague Road', CAST(N'1985-09-16' AS Date), N'Oxford University', N'Communication', N'Medium', N'1604399873', CAST(N'2003-10-12' AS Date), 4, 6)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (8, N'Latisha Case', N'20 Green Nobel Freeway', CAST(N'1990-11-09' AS Date), N'ULIS University', N'Social Science', N'Excellent', N'8243459587', CAST(N'2008-12-04' AS Date), 1, 11)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (9, N'Adriana Velez', N'285 Old St.', CAST(N'1994-10-14' AS Date), N'Cambridge University', N'Business', N'Excellent', N'6418974677', CAST(N'2012-11-08' AS Date), 4, 9)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (10, N'Keith Whitney', N'334 Fabien Way', CAST(N'1987-04-29' AS Date), N'Harvard University', N'Business', N'Good', N'2972701433', CAST(N'2005-05-24' AS Date), 3, 2)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (11, N'Brendan Schultz', N'96 Hague Blvd.', CAST(N'1990-09-08' AS Date), N'PTIT University', N'Business', N'Poor', N'0067805260', CAST(N'2008-10-03' AS Date), 5, 2)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (12, N'Marvin Blake', N'976 Milton Freeway', CAST(N'1981-04-12' AS Date), N'Cambridge University', N'Social Science', N'Good', N'5661116307', CAST(N'1999-05-08' AS Date), 1, 2)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (13, N'Ashley Fox', N'168 White Fabien Blvd.', CAST(N'1988-06-11' AS Date), N'FPT University', N'Mathematics', N'Medium', N'7060888068', CAST(N'2006-07-07' AS Date), 5, 7)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (14, N'Ty Dennis', N'291 Nobel St.', CAST(N'1994-01-03' AS Date), N'PTIT University', N'Mathematics', N'Good', N'5416475963', CAST(N'2012-01-29' AS Date), 2, 2)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (15, N'Alberto Frey', N'60 North Green Oak Avenue', CAST(N'1997-10-27' AS Date), N'RMIT University', N'Computer Science', N'Excellent', N'1694109744', CAST(N'2015-11-22' AS Date), 4, 9)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (16, N'Calvin Barr', N'68 North Clarendon Boulevard', CAST(N'1988-07-26' AS Date), N'ULIS University', N'Social Science', N'Good', N'1306780367', CAST(N'2006-08-21' AS Date), 2, 10)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (17, N'Luz Blevins', N'967 East New Way', CAST(N'1986-11-16' AS Date), N'Harvard University', N'Communication', N'Medium', N'5226396114', CAST(N'2004-12-11' AS Date), 4, 6)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (18, N'Sonia Jefferson', N'58 New Drive', CAST(N'1984-10-14' AS Date), N'Cambridge University', N'Engineering', N'Excellent', N'6561731632', CAST(N'2002-11-09' AS Date), 4, 2)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (19, N'Lesley Black', N'237 Green Old Parkway', CAST(N'1986-10-25' AS Date), N'NEU University', N'Computer Science', N'Good', N'0848189355', CAST(N'2004-11-19' AS Date), 5, 3)
GO
INSERT [dbo].[Employees] ([EmpID], [EmpName], [EmpAddress], [EmpBirthDate], [Facility], [Major], [Rank], [EmpPhone], [EmpStartDate], [DeptID], [PositionID]) VALUES (20, N'Arlene Mata', N'95 Nobel Boulevard', CAST(N'1998-05-04' AS Date), N'NEU University', N'Mathematics', N'Excellent', N'3272339360', CAST(N'2016-05-29' AS Date), 3, 8)
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Insurance] ON 
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (1, N'Alaska', CAST(N'2020-10-05' AS Date), N'Battersea', 12)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (2, N'Utah', CAST(N'2018-11-04' AS Date), N'Inverkeithing', 5)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (3, N'Arizona', CAST(N'2021-09-28' AS Date), N'Hove', 4)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (4, N'Florida', CAST(N'2019-11-22' AS Date), N'Magherafelt', 8)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (5, N'New Jersey', CAST(N'2018-03-10' AS Date), N'Keswick', 13)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (6, N'North Dakota', CAST(N'2020-09-03' AS Date), N'Haverfordwest', 8)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (7, N'Hawaii', CAST(N'2021-04-24' AS Date), N'Blandford Forum', 18)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (8, N'Iowa', CAST(N'2021-12-21' AS Date), N'Dulverton', 1)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (9, N'Hawaii', CAST(N'2019-09-14' AS Date), N'Irvine', 14)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (10, N'Illinois', CAST(N'2021-02-02' AS Date), N'Woodford Green', 11)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (11, N'Montana', CAST(N'2019-03-11' AS Date), N'Winchester', 11)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (12, N'West Virginia', CAST(N'2021-09-10' AS Date), N'Larkhall', 2)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (13, N'Alabama', CAST(N'2021-07-14' AS Date), N'Halesowen', 19)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (14, N'Michigan', CAST(N'2022-10-17' AS Date), N'Iver', 2)
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
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (20, N'Ohio', CAST(N'2018-05-19' AS Date), N'Inverurie', 16)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (21, N'Kansas', CAST(N'2020-03-13' AS Date), N'Lockerbie', 5)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (22, N'Minnesota', CAST(N'2021-06-09' AS Date), N'Wantage', 5)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (23, N'Nebraska', CAST(N'2021-06-26' AS Date), N'Swanley', 14)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (24, N'Rhode Island', CAST(N'2018-07-25' AS Date), N'Inverkeithing', 9)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (25, N'West Virginia', CAST(N'2018-03-20' AS Date), N'Brighouse', 17)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (26, N'Vermont', CAST(N'2020-08-24' AS Date), N'Cairndow', 10)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (27, N'Georgia', CAST(N'2018-04-01' AS Date), N'Turriff', 18)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (28, N'Florida', CAST(N'2021-12-28' AS Date), N'Helston', 17)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (29, N'Utah', CAST(N'2018-10-05' AS Date), N'Highgate', 10)
GO
INSERT [dbo].[Insurance] ([InsID], [InsAuthority], [InsStartDate], [InsClinic], [EmpID]) VALUES (30, N'Alabama', CAST(N'2022-02-08' AS Date), N'Monmouth', 15)
GO
SET IDENTITY_INSERT [dbo].[Insurance] OFF
GO
SET IDENTITY_INSERT [dbo].[Participate] ON 
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (1, 4, 7, CAST(N'2016-02-11' AS Date), CAST(N'2020-08-08' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (2, 1, 10, CAST(N'2018-10-07' AS Date), CAST(N'2023-04-04' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (3, 1, 7, CAST(N'2016-08-19' AS Date), CAST(N'2021-02-14' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (4, 1, 4, CAST(N'2016-06-21' AS Date), CAST(N'2020-12-17' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (5, 3, 2, CAST(N'2018-06-07' AS Date), CAST(N'2022-12-03' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (6, 1, 4, CAST(N'2016-11-02' AS Date), CAST(N'2021-04-30' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (7, 1, 8, CAST(N'2018-10-05' AS Date), CAST(N'2023-04-02' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (8, 2, 5, CAST(N'2016-01-24' AS Date), CAST(N'2020-07-21' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (9, 4, 8, CAST(N'2016-06-13' AS Date), CAST(N'2020-12-09' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (10, 3, 2, CAST(N'2017-10-06' AS Date), CAST(N'2022-04-03' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (11, 4, 2, CAST(N'2017-02-27' AS Date), CAST(N'2021-08-25' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (12, 2, 5, CAST(N'2018-11-29' AS Date), CAST(N'2023-05-27' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (13, 1, 6, CAST(N'2017-01-12' AS Date), CAST(N'2021-07-10' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (14, 5, 5, CAST(N'2016-08-29' AS Date), CAST(N'2021-02-24' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (15, 2, 8, CAST(N'2017-06-10' AS Date), CAST(N'2021-12-06' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (16, 1, 3, CAST(N'2017-05-29' AS Date), CAST(N'2021-11-24' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (17, 4, 10, CAST(N'2016-10-08' AS Date), CAST(N'2021-04-05' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (18, 5, 8, CAST(N'2016-01-12' AS Date), CAST(N'2020-07-09' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (19, 3, 6, CAST(N'2018-05-25' AS Date), CAST(N'2022-11-20' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (20, 4, 1, CAST(N'2018-11-19' AS Date), CAST(N'2023-05-17' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (21, 5, 10, CAST(N'2017-11-23' AS Date), CAST(N'2022-05-21' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (22, 3, 10, CAST(N'2016-06-21' AS Date), CAST(N'2020-12-17' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (23, 5, 8, CAST(N'2018-10-12' AS Date), CAST(N'2023-04-09' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (24, 1, 3, CAST(N'2016-07-29' AS Date), CAST(N'2021-01-24' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (25, 3, 6, CAST(N'2017-06-30' AS Date), CAST(N'2021-12-26' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (26, 5, 4, CAST(N'2018-05-17' AS Date), CAST(N'2022-11-12' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (27, 1, 8, CAST(N'2016-12-04' AS Date), CAST(N'2021-06-01' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (28, 4, 6, CAST(N'2018-09-09' AS Date), CAST(N'2023-03-07' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (29, 5, 4, CAST(N'2016-10-23' AS Date), CAST(N'2021-04-20' AS Date))
GO
INSERT [dbo].[Participate] ([PartID], [DeptID], [ProjectID], [PartStartDate], [PartEndDate]) VALUES (30, 5, 3, CAST(N'2016-12-10' AS Date), CAST(N'2021-06-07' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Participate] OFF
GO
SET IDENTITY_INSERT [dbo].[Position] ON 
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (1, N'CEO', 8, 10)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (2, N'Manager', 2.5, 4)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (3, N'Executive assistant', 2.9, 5)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (4, N'CDO', 6.5, 8)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (5, N'Junior staffer', 1.1, 2)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (6, N'Senior staffer', 1.5, 3)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (7, N'Department specialist', 2.1, 4)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (8, N'CFO', 6, 8)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (9, N'Team leader', 1.9, 3)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (10, N'Board member', 3.5, 6)
GO
INSERT [dbo].[Position] ([PositionID], [PositionName], [SalaryRate], [NumbAbsent]) VALUES (11, N'COO', 7.5, 8)
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
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (1, 500, 3, 59, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (2, 500, 5, 66, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (3, 500, 5, 61, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (4, 500, 7, 43, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (5, 500, 1, 16, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (6, 500, 7, 44, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (7, 500, 6, 74, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (8, 500, 11, 34, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (9, 500, 9, 79, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (10, 500, 8, 21, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (11, 500, 8, 23, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (12, 500, 2, 37, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (13, 500, 7, 51, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (14, 500, 2, 36, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (15, 500, 9, 78, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (16, 500, 10, 2, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (17, 500, 6, 69, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (18, 500, 9, 80, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (19, 500, 3, 52, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (20, 500, 8, 24, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (21, 500, 5, 64, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (22, 500, 6, 67, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (23, 500, 9, 77, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (24, 500, 10, 3, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (25, 500, 3, 53, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (26, 500, 2, 38, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (27, 500, 9, 72, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (28, 500, 3, 49, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (29, 500, 7, 39, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (30, 500, 10, 7, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (31, 500, 1, 13, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (32, 500, 11, 31, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (33, 500, 8, 20, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (34, 500, 9, 76, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (35, 500, 3, 47, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (36, 500, 5, 57, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (37, 500, 10, 4, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (38, 500, 11, 27, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (39, 500, 8, 25, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (40, 500, 9, 73, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (41, 500, 2, 35, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (42, 500, 3, 54, 5)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (43, 500, 4, 9, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (44, 500, 8, 18, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (45, 500, 6, 68, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (46, 500, 5, 58, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (47, 500, 8, 22, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (48, 500, 2, 32, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (49, 500, 4, 10, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (50, 500, 1, 14, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (51, 500, 11, 30, 7)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (52, 500, 3, 55, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (53, 500, 7, 46, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (54, 500, 2, 40, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (55, 500, 1, 12, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (56, 500, 6, 65, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (57, 500, 6, 62, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (58, 500, 5, 50, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (59, 500, 6, 63, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (60, 500, 3, 45, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (61, 500, 7, 41, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (62, 500, 1, 11, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (63, 500, 6, 71, 6)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (64, 500, 6, 70, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (65, 500, 10, 5, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (66, 500, 6, 56, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (67, 500, 4, 8, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (68, 500, 3, 33, 9)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (69, 500, 6, 48, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (70, 500, 1, 15, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (71, 500, 9, 75, 3)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (72, 500, 2, 26, 10)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (73, 500, 3, 29, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (74, 500, 3, 42, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (75, 500, 5, 28, 8)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (76, 500, 4, 1, 1)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (77, 500, 5, 19, 2)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (78, 500, 3, 60, 4)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (79, 500, 4, 6, NULL)
GO
INSERT [dbo].[Salary] ([SalaryID], [SalaryBasic], [PositionID], [AttID], [ProjectID]) VALUES (80, 500, 6, 17, NULL)
GO
SET IDENTITY_INSERT [dbo].[Salary] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__City__886159E5C551C03A]    Script Date: 01-Nov-23 9:39:44 PM ******/
ALTER TABLE [dbo].[City] ADD UNIQUE NONCLUSTERED 
(
	[CityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__5E50826554D4FE78]    Script Date: 01-Nov-23 9:39:44 PM ******/
ALTER TABLE [dbo].[Department] ADD UNIQUE NONCLUSTERED 
(
	[DeptName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__CC4794DFD9E1F8F4]    Script Date: 01-Nov-23 9:39:44 PM ******/
ALTER TABLE [dbo].[Department] ADD UNIQUE NONCLUSTERED 
(
	[DeptPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__CC4794DFDE2E35FE]    Script Date: 01-Nov-23 9:39:44 PM ******/
ALTER TABLE [dbo].[Department] ADD UNIQUE NONCLUSTERED 
(
	[DeptPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__5E437C71D13FF949]    Script Date: 01-Nov-23 9:39:44 PM ******/
ALTER TABLE [dbo].[Employees] ADD UNIQUE NONCLUSTERED 
(
	[EmpPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__5E437C71DBAC0105]    Script Date: 01-Nov-23 9:39:44 PM ******/
ALTER TABLE [dbo].[Employees] ADD UNIQUE NONCLUSTERED 
(
	[EmpPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__6C710DE1AB51CA38]    Script Date: 01-Nov-23 9:39:44 PM ******/
ALTER TABLE [dbo].[Employees] ADD UNIQUE NONCLUSTERED 
(
	[EmpName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Position__E46AEF427087974C]    Script Date: 01-Nov-23 9:39:44 PM ******/
ALTER TABLE [dbo].[Position] ADD UNIQUE NONCLUSTERED 
(
	[PositionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Project__BCBE781CCC8BBCAC]    Script Date: 01-Nov-23 9:39:44 PM ******/
ALTER TABLE [dbo].[Project] ADD UNIQUE NONCLUSTERED 
(
	[ProjectName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attendance] ADD  DEFAULT ('20') FOR [BonusBasic]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT ('Good') FOR [Rank]
GO
ALTER TABLE [dbo].[Salary] ADD  DEFAULT ('500') FOR [SalaryBasic]
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
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_Attendance] FOREIGN KEY([AttID])
REFERENCES [dbo].[Attendance] ([AttID])
GO
ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_Attendance]
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_Position] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([PositionID])
GO
ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_Position]
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_Project]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD CHECK  (([AttAbsent]>=(1) AND [AttAbsent]<=(10)))
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD CHECK  (([AttDay]>=(15) AND [AttDay]<=(30)))
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD CHECK  (([AttOvertime]>=(1) AND [AttOvertime]<=(10)))
GO
ALTER TABLE [dbo].[Dependent]  WITH CHECK ADD CHECK  (([DepGender]='M' OR [DepGender]='F'))
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD CHECK  (((datepart(year,getdate())-datepart(year,[empbirthdate]))>=(18) AND (datepart(year,getdate())-datepart(year,[empbirthdate]))<=(65)))
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD CHECK  (([Facility] like '%University'))
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD CHECK  (([Rank] like 'Excellent' OR [rank] like 'Good' OR [rank] like 'Medium' OR [rank] like 'Poor'))
GO
ALTER TABLE [dbo].[Position]  WITH CHECK ADD CHECK  (([NumbAbsent]>=(1) AND [NumbAbsent]<=(10)))
GO
ALTER TABLE [dbo].[Position]  WITH CHECK ADD CHECK  (([SalaryRate]>=(1) AND [SalaryRate]<=(8)))
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD CHECK  (([budget]>=(10000) AND [budget]<=(1000000)))
GO
USE [master]
GO
ALTER DATABASE [DBI_ASSIGNMENT] SET  READ_WRITE 
GO
