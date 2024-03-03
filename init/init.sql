USE [master]
GO
/****** Object:  Database [SROMS]    Script Date: 3/3/2024 7:34:15 PM ******/
CREATE DATABASE [SROMS]
 CONTAINMENT = NONE
GO
ALTER DATABASE [SROMS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SROMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SROMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SROMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SROMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SROMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SROMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [SROMS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SROMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SROMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SROMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SROMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SROMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SROMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SROMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SROMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SROMS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SROMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SROMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SROMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SROMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SROMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SROMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SROMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SROMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SROMS] SET  MULTI_USER 
GO
ALTER DATABASE [SROMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SROMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SROMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SROMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SROMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SROMS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SROMS] SET QUERY_STORE = ON
GO
ALTER DATABASE [SROMS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SROMS]
GO
/****** Object:  Table [dbo].[AdminProfile]    Script Date: 3/3/2024 7:34:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminProfile](
	[AdminProfileID] [int] IDENTITY(1,1) NOT NULL,
	[StaffNumber] [nvarchar](10) NULL,
	[AcademicLevel] [nvarchar](50) NULL,
	[Degree] [nvarchar](50) NULL,
	[Experience] [nvarchar](200) NULL,
	[UserProfileID] [int] NULL,
 CONSTRAINT [PK__AdminPro__22ABFD60F431F9A7] PRIMARY KEY CLUSTERED 
(
	[AdminProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Club]    Script Date: 3/3/2024 7:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Club](
	[ClubID] [int] IDENTITY(1,1) NOT NULL,
	[ClubName] [nvarchar](200) NULL,
	[EstablishDate] [date] NULL,
	[Description] [nvarchar](1000) NULL,
	[IsApprove] [bit] NULL,
	[IsActive] [bit] NULL,
	[ManagerProfileID] [int] NULL,
 CONSTRAINT [PK__Club__D35058C74FB5639D] PRIMARY KEY CLUSTERED 
(
	[ClubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClubMember]    Script Date: 3/3/2024 7:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClubMember](
	[StudentProfileID] [int] NULL,
	[ClubID] [int] NULL,
	[SemesterID] [int] NULL,
	[ClubRole] [nvarchar](100) NULL,
	[ClubPoint] [int] NULL,
	[Report] [nvarchar](200) NULL,
	[Status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 3/3/2024 7:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[EventName] [nvarchar](200) NULL,
	[PreparationTime] [datetime] NULL,
	[HoldTime] [datetime] NULL,
	[Location] [nvarchar](500) NULL,
	[Cost] [int] NULL,
	[ExpectedNumber] [int] NULL,
	[Organization] [nvarchar](100) NULL,
	[Description] [nvarchar](1000) NULL,
	[Feedback] [nvarchar](200) NULL,
	[IsApprove] [bit] NULL,
	[CreateBy] [nvarchar](100) NULL,
	[EventCategoryID] [int] NULL,
	[AdminProfileID] [int] NULL,
	[ManagerProfileID] [int] NULL,
	[StudentProfileID] [int] NULL,
 CONSTRAINT [PK__Event__7944C8700E08091A] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventCategory]    Script Date: 3/3/2024 7:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventCategory](
	[EventCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[EventCategoryName] [nvarchar](200) NULL,
	[Point] [int] NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK__EventCat__7174DE9E3E02024C] PRIMARY KEY CLUSTERED 
(
	[EventCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManagerProfile]    Script Date: 3/3/2024 7:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagerProfile](
	[ManagerProfileID] [int] IDENTITY(1,1) NOT NULL,
	[StaffNumber] [nvarchar](10) NULL,
	[AcademicLevel] [nvarchar](50) NULL,
	[Degree] [nvarchar](50) NULL,
	[Experience] [nvarchar](200) NULL,
	[UserProfileID] [int] NULL,
 CONSTRAINT [PK__ManagerP__693DF054061E1E6B] PRIMARY KEY CLUSTERED 
(
	[ManagerProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 3/3/2024 7:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Content] [nvarchar](2000) NULL,
	[CreateAt] [date] NULL,
	[AdminProfileID] [int] NULL,
 CONSTRAINT [PK__News__954EBDD369926F22] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParticipationEventDetail]    Script Date: 3/3/2024 7:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParticipationEventDetail](
	[EventID] [int] NULL,
	[StudentProfileID] [int] NULL,
	[RoleEvent] [nvarchar](100) NULL,
	[IsPresent] [bit] NULL,
	[Report] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/3/2024 7:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](200) NULL,
 CONSTRAINT [PK__Role__8AFACE3A6E4E410E] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 3/3/2024 7:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[SemesterID] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [nvarchar](200) NULL,
	[SemesterCode] [nvarchar](50) NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK__Semester__043301BD59CE121F] PRIMARY KEY CLUSTERED 
(
	[SemesterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentProfile]    Script Date: 3/3/2024 7:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentProfile](
	[StudentProfileID] [int] IDENTITY(1,1) NOT NULL,
	[RollNumber] [nvarchar](10) NULL,
	[MemberCode] [nvarchar](20) NULL,
	[Major] [nvarchar](50) NULL,
	[Mode] [nvarchar](30) NULL,
	[UserProfileID] [int] NULL,
 CONSTRAINT [PK__StudentP__222BD0D0E3EACC38] PRIMARY KEY CLUSTERED 
(
	[StudentProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 3/3/2024 7:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[UserLoginID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](200) NULL,
	[CreateAt] [datetime] NULL,
	[IsActive] [bit] NULL,
	[UserProfileID] [int] NULL,
 CONSTRAINT [PK__UserLogi__107D56AC1EA3764E] PRIMARY KEY CLUSTERED 
(
	[UserLoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 3/3/2024 7:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserProfileID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Gender] [nvarchar](10) NULL,
	[DateOfBirth] [date] NULL,
	[Address] [nvarchar](500) NULL,
	[EnrollmentDate] [date] NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [char](10) NULL,
 CONSTRAINT [PK__UserProf__9E267F42D8856726] PRIMARY KEY CLUSTERED 
(
	[UserProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 3/3/2024 7:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[RoleID] [int] NULL,
	[UserLoginID] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdminProfile] ON 

INSERT [dbo].[AdminProfile] ([AdminProfileID], [StaffNumber], [AcademicLevel], [Degree], [Experience], [UserProfileID]) VALUES (1, N's12345', N'12/12', N'Master', N'7year', 1)
SET IDENTITY_INSERT [dbo].[AdminProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[Club] ON 

INSERT [dbo].[Club] ([ClubID], [ClubName], [EstablishDate], [Description], [IsApprove], [IsActive], [ManagerProfileID]) VALUES (2, N'BadmintonClub', CAST(N'2022-05-05' AS Date), N'vfejfwbjbnkjf', 1, 1, 2)
INSERT [dbo].[Club] ([ClubID], [ClubName], [EstablishDate], [Description], [IsApprove], [IsActive], [ManagerProfileID]) VALUES (3, N'FChess', CAST(N'2022-06-04' AS Date), N'ewfweffwrgr', 1, 1, 2)
INSERT [dbo].[Club] ([ClubID], [ClubName], [EstablishDate], [Description], [IsApprove], [IsActive], [ManagerProfileID]) VALUES (4, N'FVC', CAST(N'2022-07-04' AS Date), N'dfdfs', 1, 1, 2)
INSERT [dbo].[Club] ([ClubID], [ClubName], [EstablishDate], [Description], [IsApprove], [IsActive], [ManagerProfileID]) VALUES (5, N'FActive', CAST(N'2022-01-04' AS Date), N'dfdfs', 1, 1, 2)
INSERT [dbo].[Club] ([ClubID], [ClubName], [EstablishDate], [Description], [IsApprove], [IsActive], [ManagerProfileID]) VALUES (6, N'FFashion', CAST(N'2022-02-09' AS Date), N'dfdfs', 1, 1, 2)
SET IDENTITY_INSERT [dbo].[Club] OFF
GO
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (1, 2, 1, N'Leader Club', 10, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (2, 2, 1, N'Board Of Directing', 10, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (3, 2, 1, N'Board Of Directing', 10, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (4, 2, 1, N'Member', 10, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (5, 2, 1, N'Member', 10, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (6, 2, 1, N'Member', 10, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (7, 3, 1, N'Leader Club', 15, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (8, 3, 1, N'Board Of Directing', 15, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (9, 3, 1, N'Board Of Directing', 15, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (10, 3, 1, N'Member', 15, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (11, 3, 1, N'Member', 15, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (12, 3, 1, N'Member', 15, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (13, 4, 2, N'Leader Club', 20, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (14, 4, 2, N'Board Of Directing', 20, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (15, 4, 2, N'Board Of Directing', 20, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (16, 4, 2, N'Member', 20, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (17, 4, 2, N'Member', 20, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (18, 4, 2, N'Member', 20, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (19, 5, 2, N'Leader Club', 15, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (20, 5, 2, N'Board Of Directing', 15, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (21, 5, 2, N'Board Of Directing', 15, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (22, 5, 2, N'Member', 15, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (23, 5, 2, N'Member', 15, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (24, 5, 2, N'Member', 15, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (25, 6, 3, N'Leader Club', 10, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (26, 6, 3, N'Board Of Direcing', 10, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (27, 6, 3, N'Board Of Direting', 10, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (28, 6, 3, N'Member', 10, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (29, 6, 3, N'Member', 10, N'Qualified', 1)
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report], [Status]) VALUES (30, 6, 3, N'Member', 10, N'Qualified', 1)
GO
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([EventID], [EventName], [PreparationTime], [HoldTime], [Location], [Cost], [ExpectedNumber], [Organization], [Description], [Feedback], [IsApprove], [CreateBy], [EventCategoryID], [AdminProfileID], [ManagerProfileID], [StudentProfileID]) VALUES (2, N'FPT champion seri', CAST(N'2024-02-02T00:00:00.000' AS DateTime), CAST(N'2024-03-10T00:00:00.000' AS DateTime), N'Can Tho Campus', 50000000, 200, N'SRO', N'cfvgbhnjmkcfvgbh', N'tegfsdfeds', 1, N'Event Manager', 1, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Event] OFF
GO
SET IDENTITY_INSERT [dbo].[EventCategory] ON 

INSERT [dbo].[EventCategory] ([EventCategoryID], [EventCategoryName], [Point], [Description]) VALUES (1, N'Talkshow', 15, N'ewwfwerfwewrgrg')
INSERT [dbo].[EventCategory] ([EventCategoryID], [EventCategoryName], [Point], [Description]) VALUES (2, N'Sport', 10, N'ewwfwerfwewrfggree')
INSERT [dbo].[EventCategory] ([EventCategoryID], [EventCategoryName], [Point], [Description]) VALUES (3, N'Miss', 20, N'ewwfwerfwewbfhsbf')
SET IDENTITY_INSERT [dbo].[EventCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ManagerProfile] ON 

INSERT [dbo].[ManagerProfile] ([ManagerProfileID], [StaffNumber], [AcademicLevel], [Degree], [Experience], [UserProfileID]) VALUES (1, N'a12345', N'12/12', N'Master', N'5year', 2)
INSERT [dbo].[ManagerProfile] ([ManagerProfileID], [StaffNumber], [AcademicLevel], [Degree], [Experience], [UserProfileID]) VALUES (2, N'b12345', N'12/12', N'Master', N'6year', 3)
SET IDENTITY_INSERT [dbo].[ManagerProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsID], [Title], [Content], [CreateAt], [AdminProfileID]) VALUES (1, N'Tuition payment deadline', N'dxcfvbhnjmkdcfvgbhnj', CAST(N'2023-03-09' AS Date), 1)
INSERT [dbo].[News] ([NewsID], [Title], [Content], [CreateAt], [AdminProfileID]) VALUES (2, N'fghbnjemrnfefeu', N'dxcfvbhnjmkdcfvgbhnj', CAST(N'2023-04-10' AS Date), 1)
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Event Manager')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Club Manager')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (4, N'Student')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (5, N'fewfeww')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [SemesterCode], [Description]) VALUES (1, N'Fall 2024', N'FA24', N'defefrvfvfv')
INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [SemesterCode], [Description]) VALUES (2, N'Spring 2024', N'SP24', N'brbhfbhfb')
INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [SemesterCode], [Description]) VALUES (3, N'Summer 2024', N'SU24', N'dtttttefrvfvfv')
SET IDENTITY_INSERT [dbo].[Semester] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentProfile] ON 

INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (1, N'CE171903', N'NguyenNQCE171903', N'SoftwareEngineering', N'Formal', 4)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (2, N'CE171860', N'NhuDTCE171860', N'SoftwareEngineering', N'Formal', 5)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (3, N'CE171111', N'AnhNVCE171111', N'SoftwareEngineering', N'Formal', 6)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (4, N'CE171112', N'BangNVCE171112', N'SoftwareEngineering', N'Formal', 7)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (5, N'CE171113', N'CanhNVCE171113', N'SoftwareEngineering', N'Formal', 8)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (6, N'CE171114', N'DuongNVCE171114', N'SoftwareEngineering', N'Formal', 9)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (7, N'CE171115', N'GiangNTCE171115', N'SoftwareEngineering', N'Formal', 10)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (8, N'CE171116', N'HuongNTCE171116', N'SoftwareEngineering', N'Formal', 11)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (9, N'CE171117', N'HoaNTCE171117', N'SoftwareEngineering', N'Formal', 12)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (10, N'CE171118', N'ThanhNVCE171118', N'SoftwareEngineering', N'Formal', 13)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (11, N'CE171119', N'TrangLTCE171119', N'SoftwareEngineering', N'Formal', 42)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (12, N'CE171120', N'HoangVMCE171120', N'SoftwareEngineering', N'Formal', 43)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (13, N'CE171121', N'ThuyPTCE171121', N'SoftwareEngineering', N'Formal', 44)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (14, N'CE171122', N'HungNVCE171122', N'SoftwareEngineering', N'Formal', 45)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (15, N'CE171123', N'MaiTTCE171123', N'SoftwareEngineering', N'Formal', 46)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (16, N'CE171124', N'QuanLVCE171124', N'SoftwareEngineering', N'Formal', 47)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (17, N'CE171125', N'HangHTCE171125', N'SoftwareEngineering', N'Formal', 48)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (18, N'CE171126', N'BinhDVCE171126', N'SoftwareEngineering', N'Formal', 49)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (19, N'CE171127', N'LinhVTCE171127', N'SoftwareEngineering', N'Formal', 50)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (20, N'CE171128', N'NamNVCE171128', N'SoftwareEngineering', N'Formal', 51)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (21, N'CE171129', N'ThuTTCE171129', N'SoftwareEngineering', N'Formal', 52)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (22, N'CE171130', N'TuanPVCE171130', N'SoftwareEngineering', N'Formal', 53)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (23, N'CE171131', N'HoaNTCE171131', N'SoftwareEngineering', N'Formal', 54)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (24, N'CE171132', N'DucLVCE171132', N'SoftwareEngineering', N'Formal', 55)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (25, N'CE171133', N'TrangNTCE171133', N'SoftwareEngineering', N'Formal', 56)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (26, N'CE171134', N'ThangTVCE171134', N'SoftwareEngineering', N'Formal', 57)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (27, N'CE171135', N'NhuHTCE171135', N'SoftwareEngineering', N'Formal', 58)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (28, N'CE171136', N'QuocNVCE171136', N'SoftwareEngineering', N'Formal', 59)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (29, N'CE171137', N'ThaoLTCE171137', N'SoftwareEngineering', N'Formal', 60)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (30, N'CE171138', N'HoaiNVCE171138', N'SoftwareEngineering', N'Formal', 61)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (31, N'CE171139', N'TramPTCE171139', N'SoftwareEngineering', N'Formal', 62)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (32, N'CE171140', N'HaiVVCE171140', N'SoftwareEngineering', N'Formal', 63)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (33, N'CE171141', N'ThuyNTCE171141', N'SoftwareEngineering', N'Formal', 64)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (34, N'CE171142', N'CuongLVCE171142', N'SoftwareEngineering', N'Formal', 65)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (35, N'CE171143', N'HuongTTCE171143', N'SoftwareEngineering', N'Formal', 66)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (36, N'CE171144', N'TienHVCE171144', N'SoftwareEngineering', N'Formal', 67)
SET IDENTITY_INSERT [dbo].[StudentProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[UserLogin] ON 

INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (1, N'TienBTCE171840@fpt.edu.vn', CAST(N'2021-09-02T01:01:01.000' AS DateTime), 0, 1)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (2, N'CuLQCE171592@fpt.edu.vn', CAST(N'2021-09-02T02:02:02.000' AS DateTime), 1, 2)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (3, N'HuyHKCE171778@fpt.edu.vn', CAST(N'2021-09-02T03:03:03.000' AS DateTime), 0, 3)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (4, N'NguyenNQCE71903@fpt.edu.vn', CAST(N'2021-09-02T04:04:04.000' AS DateTime), 1, 4)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (5, N'NhuDTCE171860@fpt.edu,vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 0, 5)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (6, N'AnhNVCE171111@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 6)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (7, N'BangNVCE171112@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 7)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (8, N'CanhNVCE171113@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 8)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (9, N'DuongNVCE171114@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 9)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (10, N'GiangNTCE171115@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 10)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (11, N'HuongNTCE171116@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 11)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (12, N'HoaNTCE171117@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 12)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (13, N'ThanhNVCE171118@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 13)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (14, N'TrangLTCE171119@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 42)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (15, N'HoangVMCE171120@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 43)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (16, N'ThuyPTCE171121@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 44)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (17, N'HungNVCE171122@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 45)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (18, N'MaiTTCE171123@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 46)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (19, N'QuanLVCE171124@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 47)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (20, N'HangHTCE171125@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 48)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (21, N'BinhDVCE171126@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 49)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (22, N'LinhVTCE171127@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 50)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (23, N'NamNVCE171128@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 51)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (24, N'ThuTTCE171129@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 52)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (25, N'TuanPVCE171130@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 53)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (26, N'HoaNTCE171131@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 54)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (27, N'DucLVCE171132@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 55)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (28, N'TrangNTCE171133@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 56)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (29, N'ThangTVCE171134@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 57)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (30, N'NhuHTCE171135@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 58)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (31, N'QuocNVCE171136@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 59)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (32, N'ThaoLTCE171137@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 60)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (33, N'HoaiNVCE171138@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 61)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (34, N'TramPTCE171139@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 62)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (35, N'HaiVVCE171140@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 63)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (36, N'ThuyNTCE171141@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 64)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (37, N'CuongLVCE171142@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 65)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (38, N'HuongTTCE171143@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 66)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (39, N'TienHVCE171144@fpt.edu.vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 67)
SET IDENTITY_INSERT [dbo].[UserLogin] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (1, N'Tien', N'Bach Trung', N'1.png', N'Male', CAST(N'2003-10-19' AS Date), N'Hau Giang', CAST(N'2021-09-02' AS Date), N'TienBTCE171840@fpt.edu.vn', N'0907577507')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (2, N'Cu', N'Le Quoc', N'2.png', N'Male', CAST(N'2003-02-27' AS Date), N'Can Tho', CAST(N'2021-09-02' AS Date), N'CuLQCE171592@fpt.edu.vn', N'0123235566')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (3, N'Huy', N'Hua Khanh', N'3.png', N'Male', CAST(N'2003-03-03' AS Date), N'Soc Trang', CAST(N'2021-09-02' AS Date), N'HuyHKCE172345@fpt.edu.vn', N'0234567893')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (4, N'Nguyen', N'Ngo Viet', N'4.png', N'Male', CAST(N'2003-04-04' AS Date), N'Ca Mau', CAST(N'2021-09-02' AS Date), N'NguyenNQ173456@fpt.edu.vn', N'0234567894')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (5, N'Nhu', N'Dang Tuyet', N'4.png', N'Female', CAST(N'2003-05-05' AS Date), N'Hau Giang', CAST(N'2021-09-02' AS Date), N'NhuDTCE174567@fpt.edu.vn', N'0234567895')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (6, N'Anh', N'Nguyen Van', N'6.png', N'Male', CAST(N'2003-06-06' AS Date), N'Tien Giang', CAST(N'2021-09-02' AS Date), N'AnhNVCE123456@fpt.edu.vn', N'0987654321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (7, N'Bang', N'Nguyen Van', N'7.png', N'Male', CAST(N'2003-07-07' AS Date), N'Ben Tre', CAST(N'2021-09-02' AS Date), N'BangNVCE123457@fpt.edu.vn', N'0987654322')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (8, N'Canh', N'Nguyen Van', N'8.png', N'Male', CAST(N'2003-08-08' AS Date), N'Dong Thap', CAST(N'2021-09-02' AS Date), N'CanhNVCE123458@fpt.edu.vn', N'0987654323')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (9, N'Duong', N'Nguyen Van', N'9.png', N'Male', CAST(N'2003-09-09' AS Date), N'Vinh Long', CAST(N'2021-09-02' AS Date), N'DuongNVCE123459@fpt.edu.vn', N'0987654324')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (10, N'Giang', N'Nguyen Thi', N'10.png', N'Femail', CAST(N'2003-11-11' AS Date), N'Bac Lieu', CAST(N'2021-09-02' AS Date), N'GiangNTCE123410@fpt.edu.vn', N'0987654325')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (11, N'Huong', N'Nguyen Thi', N'11.png', N'Female', CAST(N'2003-12-12' AS Date), N'Hau Giang', CAST(N'2021-09-02' AS Date), N'HuongNTCE123411@fpt.edu.vn', N'0987654326')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (12, N'Hoa', N'Nguyen Thi', N'12.png', N'Female', CAST(N'2003-12-01' AS Date), N'Kien Giang', CAST(N'2021-09-02' AS Date), N'HoaNTCE123412@fpt.edu.vn', N'0987654327')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (13, N'Thanh', N'Nguyen Van', N'13.png', N'Male', CAST(N'2003-12-02' AS Date), N'Soc Trang', CAST(N'2021-09-02' AS Date), N'ThanhNVCE123457@fpt.edu.vn', N'0987654322')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (42, N'Trang', N'Le Thi', N'7.png', N'Female', CAST(N'2002-03-15' AS Date), N'Ha Noi', CAST(N'2021-10-05' AS Date), N'TrangLTCE123456@fpt.edu.vn', N'0123456789')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (43, N'Hoang', N'Vu Minh', N'8.png', N'Male', CAST(N'2004-07-20' AS Date), N'Da Nang', CAST(N'2021-11-15' AS Date), N'HoangVMCE123456@fpt.edu.vn', N'0987654321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (44, N'Thuy', N'Pham Thi', N'9.png', N'Female', CAST(N'2003-12-25' AS Date), N'Ho Chi Minh', CAST(N'2021-12-20' AS Date), N'ThuyPTCE123456@fpt.edu.vn', N'0123456789')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (45, N'Hung', N'Nguyen Van', N'10.png', N'Male', CAST(N'2002-08-10' AS Date), N'Hai Phong', CAST(N'2022-01-03' AS Date), N'HungNVCE123456@fpt.edu.vn', N'0987654321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (46, N'Mai', N'Tran Thi', N'11.png', N'Female', CAST(N'2003-05-30' AS Date), N'Bac Ninh', CAST(N'2022-02-14' AS Date), N'MaiTTCE123456@fpt.edu.vn', N'0123456789')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (47, N'Quan', N'Ly Van', N'12.png', N'Male', CAST(N'2004-09-05' AS Date), N'Quang Ninh', CAST(N'2022-03-19' AS Date), N'QuanLVCE123456@fpt.edu.vn', N'0987654321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (48, N'Hang', N'Hoang Thi', N'13.png', N'Female', CAST(N'2002-10-17' AS Date), N'Thanh Hoa', CAST(N'2022-04-25' AS Date), N'HangHTCE123456@fpt.edu.vn', N'0123456789')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (49, N'Binh', N'Dang Van', N'14.png', N'Male', CAST(N'2003-11-22' AS Date), N'Nghe An', CAST(N'2022-05-30' AS Date), N'BinhDVCE123456@fpt.edu.vn', N'0987654321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (50, N'Linh', N'Vo Thi', N'15.png', N'Female', CAST(N'2004-04-12' AS Date), N'Binh Duong', CAST(N'2022-06-07' AS Date), N'LinhVTCE123456@fpt.edu.vn', N'0123456789')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (51, N'Nam', N'Nguyen Van', N'16.png', N'Male', CAST(N'2002-01-28' AS Date), N'Dong Nai', CAST(N'2022-07-10' AS Date), N'NamNVCE123456@fpt.edu.vn', N'0987654321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (52, N'Thu', N'Tran Thi', N'17.png', N'Female', CAST(N'2003-07-07' AS Date), N'Can Tho', CAST(N'2022-08-15' AS Date), N'ThuTTCE123456@fpt.edu.vn', N'0123456789')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (53, N'Tuan', N'Pham Van', N'18.png', N'Male', CAST(N'2004-02-09' AS Date), N'An Giang', CAST(N'2022-09-20' AS Date), N'TuanPVCE123456@fpt.edu.vn', N'0987654321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (54, N'Hoa', N'Nguyen Thi', N'19.png', N'Female', CAST(N'2002-09-18' AS Date), N'Kien Giang', CAST(N'2022-10-25' AS Date), N'HoaNTCE123456@fpt.edu.vn', N'0123456789')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (55, N'Duc', N'Le Van', N'20.png', N'Male', CAST(N'2003-04-05' AS Date), N'Long An', CAST(N'2022-11-30' AS Date), N'DucLVCE123456@fpt.edu.vn', N'0987654321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (56, N'Trang', N'Nguyen Thi', N'21.png', N'Female', CAST(N'2004-08-23' AS Date), N'Ha Tinh', CAST(N'2022-12-05' AS Date), N'TrangNTCE123456@fpt.edu.vn', N'0123456789')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (57, N'Thang', N'Tran Van', N'22.png', N'Male', CAST(N'2002-12-11' AS Date), N'Vinh Phuc', CAST(N'2023-01-10' AS Date), N'ThangTVCE123456@fpt.edu.vn', N'0987654321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (58, N'Nhu', N'Hoang Thi', N'23.png', N'Female', CAST(N'2003-06-03' AS Date), N'Binh Phuoc', CAST(N'2023-02-15' AS Date), N'NhuHTCE123456@fpt.edu.vn', N'0123456789')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (59, N'Quoc', N'Nguyen Van', N'24.png', N'Male', CAST(N'2004-01-19' AS Date), N'Phu Tho', CAST(N'2023-03-20' AS Date), N'QuocNVCE123456@fpt.edu.vn', N'0987654321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (60, N'Thao', N'Le Thi', N'25.png', N'Female', CAST(N'2002-07-27' AS Date), N'Hau Giang', CAST(N'2023-04-25' AS Date), N'ThaoLTCE123456@fpt.edu.vn', N'0123456789')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (61, N'Hoai', N'Nguyen Van', N'26.png', N'Male', CAST(N'2003-02-14' AS Date), N'Binh Dinh', CAST(N'2023-05-30' AS Date), N'HoaiNVCE123456@fpt.edu.vn', N'0987654321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (62, N'Tram', N'Pham Thi', N'27.png', N'Female', CAST(N'2004-05-08' AS Date), N'Soc Trang', CAST(N'2023-06-07' AS Date), N'TramPTCE123456@fpt.edu.vn', N'0123456789')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (63, N'Hai', N'Vo Van', N'28.png', N'Male', CAST(N'2002-11-25' AS Date), N'Ba Ria - Vung Tau', CAST(N'2023-07-10' AS Date), N'HaiVVCE123456@fpt.edu.vn', N'0987654321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (64, N'Thuy', N'Nguyen Thi', N'29.png', N'Female', CAST(N'2003-03-10' AS Date), N'Bac Lieu', CAST(N'2023-08-15' AS Date), N'ThuyNTCE123456@fpt.edu.vn', N'0123456789')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (65, N'Cuong', N'Le Van', N'30.png', N'Male', CAST(N'2004-10-02' AS Date), N'Ca Mau', CAST(N'2023-09-20' AS Date), N'CuongLVCE123456@fpt.edu.vn', N'0987654321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (66, N'Huong', N'Tran Thi', N'31.png', N'Female', CAST(N'2002-04-28' AS Date), N'Dak Lak', CAST(N'2023-10-25' AS Date), N'HuongTTCE123456@fpt.edu.vn', N'0123456789')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (67, N'Tien', N'Hoang Van', N'32.png', N'Male', CAST(N'2003-09-15' AS Date), N'Dak Nong', CAST(N'2023-11-30' AS Date), N'TienHVCE123456@fpt.edu.vn', N'0987654321')
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
GO
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (1, 1)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (2, 2)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (3, 3)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 4)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 5)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 6)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 7)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 8)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 9)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 10)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 11)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 12)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 13)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 14)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 15)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 16)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 17)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 18)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 19)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 20)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 21)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 22)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 23)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 24)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 25)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 26)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 27)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 28)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 29)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 30)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 31)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 32)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 33)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 34)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 35)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 36)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 37)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 38)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 39)
GO
ALTER TABLE [dbo].[AdminProfile]  WITH CHECK ADD  CONSTRAINT [FK__AdminProf__UserP__4D94879B] FOREIGN KEY([UserProfileID])
REFERENCES [dbo].[UserProfile] ([UserProfileID])
GO
ALTER TABLE [dbo].[AdminProfile] CHECK CONSTRAINT [FK__AdminProf__UserP__4D94879B]
GO
ALTER TABLE [dbo].[Club]  WITH CHECK ADD  CONSTRAINT [FK__Club__ManagerPro__4E88ABD4] FOREIGN KEY([ManagerProfileID])
REFERENCES [dbo].[ManagerProfile] ([ManagerProfileID])
GO
ALTER TABLE [dbo].[Club] CHECK CONSTRAINT [FK__Club__ManagerPro__4E88ABD4]
GO
ALTER TABLE [dbo].[ClubMember]  WITH CHECK ADD  CONSTRAINT [FK__ClubMembe__ClubI__4F7CD00D] FOREIGN KEY([ClubID])
REFERENCES [dbo].[Club] ([ClubID])
GO
ALTER TABLE [dbo].[ClubMember] CHECK CONSTRAINT [FK__ClubMembe__ClubI__4F7CD00D]
GO
ALTER TABLE [dbo].[ClubMember]  WITH CHECK ADD  CONSTRAINT [FK__ClubMembe__Semes__5070F446] FOREIGN KEY([SemesterID])
REFERENCES [dbo].[Semester] ([SemesterID])
GO
ALTER TABLE [dbo].[ClubMember] CHECK CONSTRAINT [FK__ClubMembe__Semes__5070F446]
GO
ALTER TABLE [dbo].[ClubMember]  WITH CHECK ADD  CONSTRAINT [FK__ClubMembe__Stude__5165187F] FOREIGN KEY([StudentProfileID])
REFERENCES [dbo].[StudentProfile] ([StudentProfileID])
GO
ALTER TABLE [dbo].[ClubMember] CHECK CONSTRAINT [FK__ClubMembe__Stude__5165187F]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK__Event__AdminProf__52593CB8] FOREIGN KEY([AdminProfileID])
REFERENCES [dbo].[AdminProfile] ([AdminProfileID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK__Event__AdminProf__52593CB8]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK__Event__EventCate__534D60F1] FOREIGN KEY([EventCategoryID])
REFERENCES [dbo].[EventCategory] ([EventCategoryID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK__Event__EventCate__534D60F1]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK__Event__ManagerPr__5441852A] FOREIGN KEY([ManagerProfileID])
REFERENCES [dbo].[ManagerProfile] ([ManagerProfileID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK__Event__ManagerPr__5441852A]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK__Event__StudentPr__5535A963] FOREIGN KEY([StudentProfileID])
REFERENCES [dbo].[StudentProfile] ([StudentProfileID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK__Event__StudentPr__5535A963]
GO
ALTER TABLE [dbo].[ManagerProfile]  WITH CHECK ADD  CONSTRAINT [FK__ManagerPr__UserP__5629CD9C] FOREIGN KEY([UserProfileID])
REFERENCES [dbo].[UserProfile] ([UserProfileID])
GO
ALTER TABLE [dbo].[ManagerProfile] CHECK CONSTRAINT [FK__ManagerPr__UserP__5629CD9C]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK__News__AdminProfi__571DF1D5] FOREIGN KEY([AdminProfileID])
REFERENCES [dbo].[AdminProfile] ([AdminProfileID])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK__News__AdminProfi__571DF1D5]
GO
ALTER TABLE [dbo].[ParticipationEventDetail]  WITH CHECK ADD  CONSTRAINT [FK__Participa__Event__5812160E] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[ParticipationEventDetail] CHECK CONSTRAINT [FK__Participa__Event__5812160E]
GO
ALTER TABLE [dbo].[ParticipationEventDetail]  WITH CHECK ADD  CONSTRAINT [FK__Participa__Stude__59063A47] FOREIGN KEY([StudentProfileID])
REFERENCES [dbo].[StudentProfile] ([StudentProfileID])
GO
ALTER TABLE [dbo].[ParticipationEventDetail] CHECK CONSTRAINT [FK__Participa__Stude__59063A47]
GO
ALTER TABLE [dbo].[StudentProfile]  WITH CHECK ADD  CONSTRAINT [FK__StudentPr__UserP__59FA5E80] FOREIGN KEY([UserProfileID])
REFERENCES [dbo].[UserProfile] ([UserProfileID])
GO
ALTER TABLE [dbo].[StudentProfile] CHECK CONSTRAINT [FK__StudentPr__UserP__59FA5E80]
GO
ALTER TABLE [dbo].[UserLogin]  WITH CHECK ADD  CONSTRAINT [FK__UserLogin__UserP__5BE2A6F2] FOREIGN KEY([UserProfileID])
REFERENCES [dbo].[UserProfile] ([UserProfileID])
GO
ALTER TABLE [dbo].[UserLogin] CHECK CONSTRAINT [FK__UserLogin__UserP__5BE2A6F2]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK__UserRole__RoleID__5CD6CB2B] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK__UserRole__RoleID__5CD6CB2B]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK__UserRole__UserLo__5DCAEF64] FOREIGN KEY([UserLoginID])
REFERENCES [dbo].[UserLogin] ([UserLoginID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK__UserRole__UserLo__5DCAEF64]
GO
USE [master]
GO
ALTER DATABASE [SROMS] SET  READ_WRITE 
GO
