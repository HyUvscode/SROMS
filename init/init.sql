USE [master]
GO
/****** Object:  Database [SROMS]    Script Date: 3/7/2024 5:43:09 PM ******/
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
/****** Object:  Table [dbo].[AdminProfile]    Script Date: 3/7/2024 5:43:09 PM ******/
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
/****** Object:  Table [dbo].[Club]    Script Date: 3/7/2024 5:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Club](
	[ClubID] [int] IDENTITY(1,1) NOT NULL,
	[Logo] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[ClubMember]    Script Date: 3/7/2024 5:43:09 PM ******/
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
	[Report] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 3/7/2024 5:43:09 PM ******/
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
	[Approve] [char](2) NULL,
	[CreateBy] [nvarchar](100) NULL,
	[EventCategoryID] [int] NULL,
	[AdminProfileID] [int] NULL,
	[ManagerProfileID] [int] NULL,
	[StudentProfileID] [int] NULL,
	[EndTime] [datetime] NULL,
	[PrizeStructureID] [int] NULL,
 CONSTRAINT [PK__Event__7944C8700E08091A] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventCategory]    Script Date: 3/7/2024 5:43:09 PM ******/
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
/****** Object:  Table [dbo].[ManagerProfile]    Script Date: 3/7/2024 5:43:09 PM ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 3/7/2024 5:43:09 PM ******/
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
/****** Object:  Table [dbo].[ParticipationEventDetail]    Script Date: 3/7/2024 5:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParticipationEventDetail](
	[EventID] [int] NULL,
	[StudentProfileID] [int] NULL,
	[RoleEvent] [nvarchar](100) NULL,
	[IsPresent] [bit] NULL,
	[Report] [nvarchar](100) NULL,
	[Result] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrizeStructure]    Script Date: 3/7/2024 5:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrizeStructure](
	[PrizeStructureID] [int] IDENTITY(1,1) NOT NULL,
	[First] [int] NULL,
	[Second] [int] NULL,
	[Third] [int] NULL,
	[Encouragement] [int] NULL,
 CONSTRAINT [PK_PrizeStructure] PRIMARY KEY CLUSTERED 
(
	[PrizeStructureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/7/2024 5:43:09 PM ******/
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
/****** Object:  Table [dbo].[Semester]    Script Date: 3/7/2024 5:43:09 PM ******/
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
/****** Object:  Table [dbo].[StudentProfile]    Script Date: 3/7/2024 5:43:09 PM ******/
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
/****** Object:  Table [dbo].[UserLogin]    Script Date: 3/7/2024 5:43:09 PM ******/
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
/****** Object:  Table [dbo].[UserProfile]    Script Date: 3/7/2024 5:43:09 PM ******/
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
/****** Object:  Table [dbo].[UserRole]    Script Date: 3/7/2024 5:43:09 PM ******/
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

INSERT [dbo].[AdminProfile] ([AdminProfileID], [StaffNumber], [AcademicLevel], [Degree], [Experience], [UserProfileID]) VALUES (1, N'CE171840', N'Docter', N'Ph.D', N'10 year', 1)
SET IDENTITY_INSERT [dbo].[AdminProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[Club] ON 

INSERT [dbo].[Club] ([ClubID], [Logo], [ClubName], [EstablishDate], [Description], [IsApprove], [IsActive], [ManagerProfileID]) VALUES (1, N'fcoder.png', N'F-Coder', CAST(N'2023-12-09' AS Date), N'Câu lạc bộ dành cho các sinh viên có đam mê về lập trình.Hãy tham gia để cùng nhau trao đổi học hỏi.', 1, 1, 2)
INSERT [dbo].[Club] ([ClubID], [Logo], [ClubName], [EstablishDate], [Description], [IsApprove], [IsActive], [ManagerProfileID]) VALUES (2, N'fec.png', N'F-Economic', CAST(N'2023-12-08' AS Date), N'Câu lạc bộ dành cho các sinh viên muốn tìm hiểu về kinh tế.Hãy tham gia để cùng nhau trao đổi học hỏi.', 1, 1, 2)
INSERT [dbo].[Club] ([ClubID], [Logo], [ClubName], [EstablishDate], [Description], [IsApprove], [IsActive], [ManagerProfileID]) VALUES (3, N'fvoice.png', N'F-Voice', CAST(N'2023-12-07' AS Date), N'Câu lạc bộ dành cho các sinh viên có đam mê về âm nhạc.Hãy tham gia để cùng nhau thỏa mãn niềm đam mê của mình.', 1, 1, 2)
INSERT [dbo].[Club] ([ClubID], [Logo], [ClubName], [EstablishDate], [Description], [IsApprove], [IsActive], [ManagerProfileID]) VALUES (4, N'ffashion.png', N'F-Fashion', CAST(N'2023-11-09' AS Date), N'Câu lạc bộ dành cho các sinh viên có đam mê về thời trang.Hãy tham gia để cùng nhau trao đổi học hỏi', 1, 1, 2)
INSERT [dbo].[Club] ([ClubID], [Logo], [ClubName], [EstablishDate], [Description], [IsApprove], [IsActive], [ManagerProfileID]) VALUES (5, N'fvolleyball.png', N'F-Volleyball', CAST(N'2023-08-02' AS Date), N'Câu lạc bộ dành cho các sinh viên có đam mê về bóng chuyền.Hãy tham gia để cùng nhau trao đổi học hỏi', 1, 1, 2)
INSERT [dbo].[Club] ([ClubID], [Logo], [ClubName], [EstablishDate], [Description], [IsApprove], [IsActive], [ManagerProfileID]) VALUES (6, N'fchess.png', N'F-Chess', CAST(N'2023-10-05' AS Date), N'Câu lạc bộ dành cho các sinh viên có đam mê về cờ vua, cờ tướng.Hãy tham gia để cùng nhau trao đổi học hỏi', 1, 1, 2)
INSERT [dbo].[Club] ([ClubID], [Logo], [ClubName], [EstablishDate], [Description], [IsApprove], [IsActive], [ManagerProfileID]) VALUES (7, N'ffootball.png', N'F-Football', CAST(N'2023-09-09' AS Date), N'Câu lạc bộ dành cho các sinh viên có đam mê về bóng đá.Hãy tham gia để cùng nhau tham gia thi đấu rèn luyện cùng nhau', 1, 1, 2)
INSERT [dbo].[Club] ([ClubID], [Logo], [ClubName], [EstablishDate], [Description], [IsApprove], [IsActive], [ManagerProfileID]) VALUES (8, N'fbadminton.png', N'F-Badminton', CAST(N'2023-09-17' AS Date), N'Câu lạc bộ dành cho các sinh viên có đam mê về cầu lông và tham gia môn thể thao ít va chạm.Hãy tham gia để cùng nhau trao đổi học hỏi chia sẽ những kĩ năng tâm lí thi đấu', 1, 1, 2)
INSERT [dbo].[Club] ([ClubID], [Logo], [ClubName], [EstablishDate], [Description], [IsApprove], [IsActive], [ManagerProfileID]) VALUES (9, N'fvovinam.png', N'F-Vovinam', CAST(N'2023-01-09' AS Date), N'Câu lạc bộ dành cho các sinh viên có đam mê về võ và rèn luyện sức khỏe.Hãy tham gia để cùng nhau trao đổi học hỏi rèn luyện sức khỏe', 1, 1, 2)
INSERT [dbo].[Club] ([ClubID], [Logo], [ClubName], [EstablishDate], [Description], [IsApprove], [IsActive], [ManagerProfileID]) VALUES (10, N'fkay.png', N'F-Kay', CAST(N'2023-04-05' AS Date), N'Câu lạc bộ dành cho các sinh viên có đam mê về côn nhị khúc.Hãy tham gia để cùng nhau trao đổi học hỏi', 1, 1, 2)
INSERT [dbo].[Club] ([ClubID], [Logo], [ClubName], [EstablishDate], [Description], [IsApprove], [IsActive], [ManagerProfileID]) VALUES (11, N'fwego.png', N'F-Wego', CAST(N'2023-02-08' AS Date), N'Câu lạc bộ dành cho các sinh viên muốn làm thiện nguyện.Hãy tham gia để cùng nhau gửi những món quà đến những người khó khăn', 1, 1, 2)
INSERT [dbo].[Club] ([ClubID], [Logo], [ClubName], [EstablishDate], [Description], [IsApprove], [IsActive], [ManagerProfileID]) VALUES (12, N'fbasketball.png', N'F-Basketball', CAST(N'2023-01-06' AS Date), N'Câu lạc bộ dành cho các sinh viên có đam mê về bóng rổ.Hãy tham gia để cùng nhau trao đổi học hỏi', 1, 1, 2)
INSERT [dbo].[Club] ([ClubID], [Logo], [ClubName], [EstablishDate], [Description], [IsApprove], [IsActive], [ManagerProfileID]) VALUES (13, N'ftc.png', N'F-TC', CAST(N'2023-11-01' AS Date), N'Câu lạc bộ dành cho các sinh viên có đam mê về nhạc cụ dân tộc.Hãy tham gia để cùng nhau trao đổi học hỏi', 1, 1, 2)
SET IDENTITY_INSERT [dbo].[Club] OFF
GO
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (1, 1, 9, N'Leader Club', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (1, 1, 10, N'Leader Club', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (2, 1, 9, N'Board Of Directing', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (2, 1, 10, N'Board Of Directing', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (3, 1, 9, N'Member', 10, N'Excellent')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (3, 1, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (4, 1, 9, N'Member', 5, N'Average')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (4, 1, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (5, 1, 9, N'Member', 7, N'Pretty good')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (5, 1, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (6, 2, 9, N'Leader Club', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (6, 2, 10, N'Board Of Directing', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (7, 2, 9, N'Board Of Directing', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (7, 2, 10, N'Leader Club', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (8, 2, 9, N'Member', 10, N'Excellent')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (8, 2, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (9, 2, 9, N'Member', 7, N'Pretty Good')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (9, 2, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (10, 2, 9, N'Member', 3, N'Bad')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (10, 3, 9, N'Leader Club', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (10, 3, 10, N'Leader Club', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (11, 3, 9, N'Board Of Directing', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (11, 3, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (12, 3, 9, N'Member', 10, N'Excellent')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (12, 3, 10, N'Board Of Directing', 10, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (13, 3, 9, N'Member', 6, N'Avarge')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (13, 3, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (14, 3, 10, N'Member', 5, N'Avarge')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (14, 3, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (15, 3, 9, N'Member', 8, N'Good')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (15, 3, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (16, 4, 9, N'Leader Club', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (16, 4, 10, N'Leader Club', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (17, 4, 9, N'Board Of Directing', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (17, 4, 10, N'Board Of Directing ', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (18, 4, 9, N'Member', 9, N'Excellent')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (18, 4, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (19, 4, 9, N'Member', 8, N'Good')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (19, 4, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (20, 4, 9, N'Member', 10, N'Excellent')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (20, 4, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (21, 5, 9, N'Leader Club', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (21, 5, 10, N'Leader Club', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (22, 5, 9, N'Board Of Directing', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (22, 5, 10, N'Board Of Directing', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (23, 5, 9, N'Member', 6, N'Avarge')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (23, 5, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (24, 5, 9, N'Member', 7, N'Pretty Good')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (24, 5, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (25, 5, 9, N'Member', 8, N'Good')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (25, 5, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (26, 6, 9, N'Leader Club', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (26, 6, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (27, 6, 9, N'Board Of Direting', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (27, 6, 10, N'Board Of Directing', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (28, 6, 9, N'Member', 10, N'Excellent')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (28, 6, 10, N'Leader Club', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (29, 6, 9, N'Member', 2, N'Bad')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (30, 6, 9, N'Member', 9, N'Excellent')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (30, 6, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (31, 7, 9, N'Leader Club', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (31, 7, 10, N'Leader Club', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (32, 7, 9, N'Board Of Directing', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (32, 7, 10, N'Board Of Directing', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (33, 7, 9, N'Member', 9, N'Excellent')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (33, 7, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (34, 7, 9, N'Member', 6, N'Avarge')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (34, 7, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (35, 7, 9, N'Member', 6, N'Avarge')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (35, 7, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (36, 8, 9, N'Leader Club', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (36, 8, 10, N'Leader Club', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (37, 8, 9, N'Board Of Directing', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (37, 8, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (38, 8, 9, N'Member', 10, N'Excellent')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (38, 8, 10, N'Board Of Directing', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (35, 8, 9, N'Member', 2, N'Bad')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (30, 8, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (39, 8, 9, N'Member', 6, N'Avarge')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (39, 8, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (40, 8, 9, N'Member', 8, N'Good')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (40, 8, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (41, 9, 9, N'Leader Club', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (41, 9, 10, N'Leader Club', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (42, 9, 9, N'Board Of Directing', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (42, 9, 10, N'Board Of Directing', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (43, 9, 9, N'Member', 7, N'Pretty Good')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (43, 9, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (44, 9, 9, N'Member', 8, N'Good')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (44, 9, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (45, 9, 9, N'Member', 9, N'Excellent')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (45, 9, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (46, 10, 9, N'Leader Club', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (46, 10, 10, N'Board Of Directing', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (47, 10, 9, N'Board Of Directing', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (47, 10, 10, N'Leader Club', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (48, 10, 9, N'Member', 8, N'Good')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (48, 10, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (49, 10, 9, N'Member', 6, N'Avarge')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (49, 10, 10, N'Member', NULL, N'')
GO
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (50, 10, 9, N'Member', 8, N'Good')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (50, 10, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (51, 11, 9, N'Leader Club', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (51, 11, 10, N'Leader Club', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (52, 11, 9, N'Board Of Directing', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (52, 11, 10, N'Board Of Directing', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (49, 11, 9, N'Member', 1, N'So Bad')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (50, 11, 9, N'Member', 9, N'Excellent')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (50, 11, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (53, 11, 9, N'Member', 7, N'Pretty Good')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (53, 11, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (54, 11, 9, N'Member', 8, N'Good')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (54, 11, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (55, 11, 9, N'Member', 8, N'Good')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (55, 11, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (56, 12, 9, N'Leader Club', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (56, 12, 10, N'Leader Club', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (57, 12, 9, N'Board Of Directing', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (57, 12, 10, N'Board Of Directing', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (58, 12, 9, N'Member', 10, N'Excellent')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (58, 12, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (59, 12, 9, N'Member', 10, N'Excellent')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (59, 12, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (60, 12, 9, N'Member', 9, N'Excellent')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (60, 12, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (61, 13, 9, N'Board Of Directing', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (61, 13, 10, N'Leader Club', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (62, 13, 9, N'Leader Club', 15, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (62, 13, 10, N'Board Of Directing', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (63, 13, 9, N'Member', 4, N'Bad')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (63, 13, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (64, 13, 9, N'Member', 10, N'Excellent')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (64, 13, 10, N'Member', NULL, N'')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (65, 13, 9, N'Member', 8, N'Good')
INSERT [dbo].[ClubMember] ([StudentProfileID], [ClubID], [SemesterID], [ClubRole], [ClubPoint], [Report]) VALUES (65, 13, 10, N'Member', NULL, N'')
GO
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([EventID], [EventName], [PreparationTime], [HoldTime], [Location], [Cost], [ExpectedNumber], [Organization], [Description], [Feedback], [Approve], [CreateBy], [EventCategoryID], [AdminProfileID], [ManagerProfileID], [StudentProfileID], [EndTime], [PrizeStructureID]) VALUES (1, N'𝗙𝗖𝗦 - 𝗙𝗣𝗧 𝗦𝗘𝗥𝗜𝗘𝗦 𝗖𝗛𝗔𝗠𝗣𝗜𝗢𝗡𝗦𝗛𝗜𝗣 𝟮𝟬𝟮𝟰 ', CAST(N'2024-01-01T07:00:00.000' AS DateTime), CAST(N'2024-03-01T07:30:00.000' AS DateTime), N'Can Tho Campus', 100000000, 200, N'Student Relation Office', N'Tưng bừng khí thế đầu năm, tiếp lửa tinh thần yêu thể thao đến cộng đồng nhà Cóc, Phòng Công tác Sinh viên chính thức phát động HỘI THAO CÁC CLB FCS mùa 2 –  𝐅𝐏𝐓 𝐂𝐇𝐀𝐌𝐏𝐈𝐎𝐍𝐒𝐇𝐈𝐏 𝐒𝐄𝐑𝐈𝐄𝐒 𝟐𝟎𝟐𝟒 Chắc hẳn các VĐV của chúng ta đã “sạc đầy pin” và lên tinh thần chiến đấu từ lâu đúng không nào???', N'', N'EC', N'Event Manager', 2, 1, 1, NULL, CAST(N'2024-03-28T18:00:00.000' AS DateTime), 1)
INSERT [dbo].[Event] ([EventID], [EventName], [PreparationTime], [HoldTime], [Location], [Cost], [ExpectedNumber], [Organization], [Description], [Feedback], [Approve], [CreateBy], [EventCategoryID], [AdminProfileID], [ManagerProfileID], [StudentProfileID], [EndTime], [PrizeStructureID]) VALUES (2, N'KỸ NĂNG QUAY DỰNG VIDEO BẰNG SMARTPHONE ', CAST(N'2024-01-15T09:00:00.000' AS DateTime), CAST(N'2024-02-09T15:00:00.000' AS DateTime), N'Can Tho Campus', 10000000, 100, N'Student Relation Office', N'Mời các Cóc cùng đến với buổi training kỹ năng quay dựng video bằng Smartphone với sự hướng dẫn của Mr. Phạm Minh Nhựt - Giảng viên Truyền thông Đa phương tiện, Đại học FPT Cần Thơ với rất nhiều kinh nghiệm thực tế và chuyên môn.', N'', N'EC', N'Event Manager', 1, 1, 1, NULL, CAST(N'2024-03-01T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Event] ([EventID], [EventName], [PreparationTime], [HoldTime], [Location], [Cost], [ExpectedNumber], [Organization], [Description], [Feedback], [Approve], [CreateBy], [EventCategoryID], [AdminProfileID], [ManagerProfileID], [StudentProfileID], [EndTime], [PrizeStructureID]) VALUES (3, N'Nhu cầu nguồn nhân lực ngành Công nghệ thông tin và Kinh tế tại thị trường Nhật Bản và Phần Lan', CAST(N'2024-01-01T13:30:00.000' AS DateTime), CAST(N'2024-01-07T14:30:00.000' AS DateTime), N'Can Tho Campus', 5000000, 100, N'Student Relation Office', N'Tìm hiểu thông tin nhu cầu nguồn nhân lực về CNTT và Kinh tế tại thị trường Phần Lan và Nhật Bản', N'', N'EC', N'Event Manager', 3, 1, 1, NULL, CAST(N'2024-01-07T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Event] ([EventID], [EventName], [PreparationTime], [HoldTime], [Location], [Cost], [ExpectedNumber], [Organization], [Description], [Feedback], [Approve], [CreateBy], [EventCategoryID], [AdminProfileID], [ManagerProfileID], [StudentProfileID], [EndTime], [PrizeStructureID]) VALUES (4, N'FBC-Tournament', CAST(N'2023-11-19T19:00:00.000' AS DateTime), CAST(N'2023-12-17T07:00:00.000' AS DateTime), N'Can Tho Campus', 5000000, 100, N'F-Badmintion Club', N'Chúng ta đã chờ đợi từ lâu và cuối cùng, giải nội bộ cầu lông của chúng ta đã được tổ chức! Hãy chuẩn bị tinh thần và sẵn sàng để tham gia vào một ngày đầy sự hứng khởi và cạnh tranh.', N'', N'AA', N'Leader Club', 2, 1, NULL, 36, CAST(N'2023-12-18T20:00:00.000' AS DateTime), 2)
INSERT [dbo].[Event] ([EventID], [EventName], [PreparationTime], [HoldTime], [Location], [Cost], [ExpectedNumber], [Organization], [Description], [Feedback], [Approve], [CreateBy], [EventCategoryID], [AdminProfileID], [ManagerProfileID], [StudentProfileID], [EndTime], [PrizeStructureID]) VALUES (5, N'DESIGN EVERYTHING ON CANVA', CAST(N'2024-02-10T14:30:00.000' AS DateTime), CAST(N'2024-03-29T08:00:00.000' AS DateTime), N'Can Tho Campus', 1000000000, 500, N'Student Relation Office', N'Biết tất tần tật các thủ thuật tìm kiếm kho nguyên liệu đồ sộ trên Canva để tự thiết kế banner, poster và slide thuyết trình chỉ sau 1 buổi học?', N'', N'EC', N'Event Manager', 1, 1, 1, NULL, CAST(N'2024-03-31T17:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Event] OFF
GO
SET IDENTITY_INSERT [dbo].[EventCategory] ON 

INSERT [dbo].[EventCategory] ([EventCategoryID], [EventCategoryName], [Point], [Description]) VALUES (1, N'Soft Skills', 5, N'Soft skills are not specific technical knowledge that people need to develop to be successful in work and daily life. These skills often involve working with others, communicating effectively, managing time, and adapting to a diverse work environment.Soft skills include many aspects such as communication skills, leadership, teamwork, conflict management, problem-solving, flexibility, teamwork ability, self-management and self-leadership, and appreciation—professional ethics and the ability to adapt to a changing work environment.')
INSERT [dbo].[EventCategory] ([EventCategoryID], [EventCategoryName], [Point], [Description]) VALUES (2, N'Compatition', 5, N'The competition is a great platform for people to showcase and develop their skills in various fields. From bodybuilding, speech, and dance to art, music, and sports, the competition allows contestants to showcase their talent and creativity in front of a crowd. More than just a platform to challenge yourself, the competition is also an opportunity to meet, connect, and learn from people with similar interests and visions. With its competitive atmosphere and support from the community, the competition is not only a unique experience but also an important step forward in self-development and achieving personal goals.')
INSERT [dbo].[EventCategory] ([EventCategoryID], [EventCategoryName], [Point], [Description]) VALUES (3, N'TalkShow', 3, N'Welcome to a lively and meaningful conversation where diverse opinions are expressed and emotional stories are shared. This program will lead you on a journey of discovery, where creative thinking and fresh perspectives are discovered. Join us to explore and experience the excitement of conversation through sharp statements and meaningful stories from our special guests. Be prepared to be fascinated and feel challenged in a space where imagination has no boundaries. Please be willing to join the conversation and leave your mark on our minds.')
SET IDENTITY_INSERT [dbo].[EventCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ManagerProfile] ON 

INSERT [dbo].[ManagerProfile] ([ManagerProfileID], [StaffNumber], [AcademicLevel], [Degree], [Experience], [UserProfileID]) VALUES (1, N'CE171592', N'Doctor', N'Ph.D', N'9 year', 2)
INSERT [dbo].[ManagerProfile] ([ManagerProfileID], [StaffNumber], [AcademicLevel], [Degree], [Experience], [UserProfileID]) VALUES (2, N'CE171778', N'Doctor', N'Ph.D', N'9 year', 3)
SET IDENTITY_INSERT [dbo].[ManagerProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsID], [Title], [Content], [CreateAt], [AdminProfileID]) VALUES (1, N'Cuộc thi Âm nhạc Sinh viên: Đăng ký Tham gia Ngay!', N'Để tạo ra một sân chơi thú vị và sôi động cho tất cả sinh viên yêu thích âm nhạc, Trung tâm Văn hóa Sinh viên tổ chức Cuộc thi Âm nhạc Sinh viên hàng năm! Đăng ký ngay hôm nay để có cơ hội thể hiện tài năng âm nhạc của bạn và giành được các giải thưởng hấp dẫn. Cuộc thi sẽ diễn ra vào ngày 20 tháng 4 tại Hội trường Trung tâm Văn hóa Sinh viên. Tham gia ngay và trải nghiệm không gian âm nhạc đầy sôi động!', CAST(N'2024-02-02' AS Date), 1)
INSERT [dbo].[News] ([NewsID], [Title], [Content], [CreateAt], [AdminProfileID]) VALUES (2, N'Chương trình Tình nguyện Mùa Xuân: Hành động vì Cộng đồng', N'Hãy cùng nhau tham gia vào Chương trình Tình nguyện Mùa Xuân để lan tỏa tinh thần xanh và tình nguyện trong cộng đồng! Trường Đại học chúng ta sẽ tổ chức một loạt các hoạt động như làm vệ sinh môi trường, trồng cây, và giúp đỡ cộng đồng người cao tuổi. Hãy đăng ký ngay để tham gia vào những hoạt động ý nghĩa này và góp phần xây dựng một cộng đồng văn minh, xanh sạch, đẹp mắt!', CAST(N'2024-03-03' AS Date), 1)
INSERT [dbo].[News] ([NewsID], [Title], [Content], [CreateAt], [AdminProfileID]) VALUES (3, N'Hội thảo Kỹ năng Giao tiếp: Bước Đi Tự tin Trong Sự Nghiệp', N'Bạn muốn nâng cao kỹ năng giao tiếp của mình để tự tin hơn trong công việc và cuộc sống hàng ngày? Tham gia ngay vào Hội thảo Kỹ năng Giao tiếp do Ban Tư vấn Sự nghiệp tổ chức! Chương trình sẽ cung cấp những kiến thức và kỹ năng cần thiết để bạn có thể giao tiếp hiệu quả, tự tin trước công chúng và xây dựng mối quan hệ thành công. Đừng bỏ lỡ cơ hội này để trở thành một người giao tiếp xuất sắc!', CAST(N'2024-04-04' AS Date), 1)
INSERT [dbo].[News] ([NewsID], [Title], [Content], [CreateAt], [AdminProfileID]) VALUES (4, N'Cuộc thi Triển lãm Nghệ thuật: Thể hiện Sự Sáng tạo của Bạn', N'Trường Đại học chúng ta sẽ tổ chức Cuộc thi Triển lãm Nghệ thuật, nơi bạn có cơ hội thể hiện sự sáng tạo và tài năng nghệ thuật của mình! Bằng cách sử dụng mọi loại hình nghệ thuật từ vẽ, điêu khắc đến nhiếp ảnh và âm nhạc, bạn có thể tham gia và chia sẻ tác phẩm của mình với cộng đồng sinh viên. Hãy đăng ký ngay và thể hiện sự sáng tạo của bạn!', CAST(N'2024-05-05' AS Date), 1)
INSERT [dbo].[News] ([NewsID], [Title], [Content], [CreateAt], [AdminProfileID]) VALUES (5, N'Hội thảo Phát triển Cá nhân: Định hình Tương lai của Bạn', N'Hãy tham gia vào Hội thảo Phát triển Cá nhân để hiểu rõ hơn về bản thân và định hình mục tiêu tương lai của bạn! Chương trình sẽ cung cấp các phương pháp và kỹ thuật để bạn phát triển bản thân, tạo ra kế hoạch và đạt được thành công trong sự nghiệp và cuộc sống. Hãy đăng ký ngay để bắt đầu hành trình phát triển cá nhân của bạn!', CAST(N'2024-06-06' AS Date), 1)
INSERT [dbo].[News] ([NewsID], [Title], [Content], [CreateAt], [AdminProfileID]) VALUES (6, N'Đăng ký Tham gia Câu lạc bộ Đọc sách: Khám phá Thế giới từ Trang sách', N'Câu lạc bộ Đọc sách đang tìm kiếm các thành viên mới đam mê đọc sách và muốn khám phá thế giới từ trang sách! Tham gia vào các buổi họp thú vị hàng tháng, thảo luận về các tác phẩm văn học đa dạng và chia sẻ cảm nhận của bạn. Đăng ký ngay để kết nối với cộng đồng đọc sách đầy sôi động!', CAST(N'2024-07-07' AS Date), 1)
INSERT [dbo].[News] ([NewsID], [Title], [Content], [CreateAt], [AdminProfileID]) VALUES (7, N'Hội thảo Sự Kiện Quản lý: Học hỏi từ Chuyên gia trong Lĩnh vực', N'Bạn đang quan tâm đến lĩnh vực quản lý và muốn học hỏi từ những người có kinh nghiệm? Tham gia ngay vào Hội thảo Sự Kiện Quản lý, nơi bạn sẽ được nghe các chuyên gia chia sẻ về chiến lược, kỹ năng quản lý và xu hướng mới nhất trong ngành. Đừng bỏ lỡ cơ hội này để tiếp cận kiến thức và kinh nghiệm từ các chuyên gia hàng đầu!', CAST(N'2024-08-08' AS Date), 1)
INSERT [dbo].[News] ([NewsID], [Title], [Content], [CreateAt], [AdminProfileID]) VALUES (8, N'Đăng ký Tham gia Clb Thể thao: Khám phá Sức mạnh và Sức khỏe của Bạn', N'Clb Thể thao đang mở cửa đón chào tất cả các sinh viên muốn khám phá sức mạnh và sức khỏe của bản thân! Tham gia vào các buổi tập luyện thể dục đa dạng từ yoga, bóng rổ đến bơi lội và cầu lông. Đăng ký ngay để có cơ hội gặp gỡ và kết nối với các đồng đội đam mê thể thao!', CAST(N'2024-09-09' AS Date), 1)
INSERT [dbo].[News] ([NewsID], [Title], [Content], [CreateAt], [AdminProfileID]) VALUES (9, N'Workshop Sáng tạo: Phát triển Ý tưởng và Dự án Của Sinh viên', N'Sinh viên có ý tưởng sáng tạo và muốn biến chúng thành hiện thực? Tham gia vào Workshop Sáng tạo để học cách phát triển ý tưởng và dự án của sinh viên từ các chuyên gia trong ngành. Chương trình sẽ cung cấp các công cụ và kỹ thuật để sinh viên có thể khởi đầu và phát triển ý tưởng của mình thành công. Hãy đăng ký ngay để bắt đầu hành trình sáng tạo của bạn!', CAST(N'2024-10-10' AS Date), 1)
INSERT [dbo].[News] ([NewsID], [Title], [Content], [CreateAt], [AdminProfileID]) VALUES (10, N'Cuộc thi Viết Văn: Khám phá Tài năng Sáng tác.', N'Bạn là một tác giả tiềm năng và muốn thể hiện tài năng sáng tác của mình? Tham gia ngay vào Cuộc thi Viết Văn để gửi tác phẩm của bạn và có cơ hội giành giải thưởng hấp dẫn. Cuộc thi mở cửa cho mọi thể loại văn học từ truyện ngắn, tiểu thuyết đến thơ ca và kịch bản. Đừng ngần ngại, hãy chia sẻ câu chuyện của bạn và tạo ra dấu ấn trong cộng đồng văn học!', CAST(N'2024-11-11' AS Date), 1)
SET IDENTITY_INSERT [dbo].[News] OFF
GO
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (1, 1, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (1, 2, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (1, 3, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (1, 4, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (1, 5, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (1, 6, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (1, 7, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (1, 8, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (1, 9, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (1, 10, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (2, 11, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (2, 12, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (2, 13, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (2, 14, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (2, 15, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (2, 16, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (2, 17, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (2, 18, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (2, 19, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (2, 20, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (3, 21, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (3, 22, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (3, 23, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (3, 24, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (3, 25, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (3, 26, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (3, 27, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (3, 28, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (3, 29, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (3, 30, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (4, 31, N'Member', 1, N'Good Skill', N'First')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (4, 32, N'Member', 1, N'Good', N'Second')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (4, 33, N'Member', 1, N'Good', N'Third')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (4, 34, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (4, 35, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (4, 36, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (4, 37, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (4, 38, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (4, 39, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (4, 40, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (5, 41, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (5, 42, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (5, 43, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (5, 44, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (5, 45, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (5, 46, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (5, 47, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (5, 48, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (5, 49, N'Member', 1, NULL, N'')
INSERT [dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result]) VALUES (5, 50, N'Member', 1, NULL, N'')
GO
SET IDENTITY_INSERT [dbo].[PrizeStructure] ON 

INSERT [dbo].[PrizeStructure] ([PrizeStructureID], [First], [Second], [Third], [Encouragement]) VALUES (1, 1, 1, 1, 1)
INSERT [dbo].[PrizeStructure] ([PrizeStructureID], [First], [Second], [Third], [Encouragement]) VALUES (2, 1, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[PrizeStructure] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Event Manager')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Club Manager')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (4, N'Student')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [SemesterCode], [Description]) VALUES (1, N'Spring 2021', N'SP21', N'')
INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [SemesterCode], [Description]) VALUES (2, N'Summer 2021', N'SU21', N'')
INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [SemesterCode], [Description]) VALUES (3, N'Fall 2021', N'FA21', N'')
INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [SemesterCode], [Description]) VALUES (4, N'Spring 2022', N'SP22', N'')
INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [SemesterCode], [Description]) VALUES (5, N'Summer 2022', N'SU22', N'')
INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [SemesterCode], [Description]) VALUES (6, N'Fall 2022', N'FA22', N'')
INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [SemesterCode], [Description]) VALUES (7, N'Spring 2023', N'SP23', N'')
INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [SemesterCode], [Description]) VALUES (8, N'Summer 2023', N'SU23', N'')
INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [SemesterCode], [Description]) VALUES (9, N'Fall 2023', N'FA23', N'')
INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [SemesterCode], [Description]) VALUES (10, N'Spring 2024', N'SP24', N'')
SET IDENTITY_INSERT [dbo].[Semester] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentProfile] ON 

INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (1, N'CE171903', N'NguyenNQCE171903', N'Software Engineering', N'Formal', 4)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (2, N'CE171860', N'NhuDTCE171860', N'Software Engineering', N'Formal', 5)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (3, N'CE1713456', N'KienTVCE1713456', N'Software Engineering', N'Formal', 6)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (4, N'CE1713457', N'AnNTCE1713457', N'Multimedia Management', N'Formal', 7)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (5, N'CE1713458', N'HuyNVCE1713458', N'Software Engineering', N'Formal', 8)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (6, N'CE1713459', N'PhuongLTCE1713459', N'Digital Marketing', N'Formal', 9)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (7, N'CE1713460', N'NamTVCE1713460', N'Multimedia Management', N'Formal', 10)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (8, N'CE1713461', N'HoaPTCE1713461', N'International Business', N'Formal', 11)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (9, N'CE1713462', N'DatNVCE1713462', N'Software Engineering', N'Formal', 12)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (10, N'CE1713463', N'LinhNTCE1713463', N'Software Engineering', N'Formal', 13)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (11, N'CE1713464', N'TuanLVCE1713464', N'Digital Marketing', N'Formal', 14)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (12, N'CE1713465', N'TrangPTCE1713465', N'Software Engineering', N'Formal', 15)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (13, N'CE1713466', N'LongTVCE1713466', N'Software Engineering', N'Formal', 16)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (14, N'CE1713467', N'NhungNTCE1713467', N'Software Engineering', N'Formal', 17)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (15, N'CE1713468', N'HieuLVCE1713468', N'Multimedia Management', N'Formal', 18)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (16, N'CE1713469', N'MaiNTCE1713469', N'Digital Marketing', N'Formal', 19)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (17, N'CE1713470', N'QuanTVCE1713470', N'Software Engineering', N'Formal', 20)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (18, N'CE1713471', N'LanPTCE1713471', N'Software Engineering', N'Formal', 21)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (19, N'CE1713472', N'MinhNVCE1713472', N'Multimedia Management', N'Formal', 22)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (20, N'CE1713473', N'AnhTTCE1713473', N'Software Engineering', N'Formal', 23)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (21, N'CE1713474', N'DucLVCE1713474', N'Digital Marketing', N'Formal', 24)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (22, N'CE1713475', N'TrinhNTCE1713475', N'International Business', N'Formal', 25)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (23, N'CE1713476', N'SonTVCE1713476', N'Software Engineering', N'Formal', 26)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (24, N'CE1713477', N'HuongNTCE1713477', N'Graphic Design', N'Formal', 27)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (25, N'CE1713478', N'DaiLVCE1713478', N'Digital Marketing', N'Formal', 28)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (26, N'CE1713479', N'TrucPTCE1713479', N'Software Engineering', N'Formal', 29)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (27, N'CE1713480', N'HoangNVCE1713480', N'Software Engineering', N'Formal', 30)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (28, N'CE1713481', N'ThaoTTCE1713481', N'International Business', N'Formal', 31)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (29, N'CE1713482', N'DungLVCE1713482', N'Software Engineering', N'Formal', 32)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (30, N'CE1713483', N'ThuyNTCE1713483', N'Digital Marketing', N'Formal', 33)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (31, N'CE1713484', N'HoaTTCE1713484', N'Software Engineering', N'Formal', 34)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (32, N'CE1713485', N'QuyenNTCE1713485', N'Software Engineering', N'Formal', 35)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (33, N'CE1713486', N'BinhLVCE1713486', N'International Business', N'Formal', 36)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (34, N'CE1713487', N'LoanTTCE1713487', N'Digital Marketing', N'Formal', 37)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (35, N'CE1713488', N'TungNVCE1713488', N'Software Engineering', N'Formal', 38)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (36, N'CE1713489', N'DiepLTCE1713489', N'Multimedia Management', N'Formal', 39)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (37, N'CE1713490', N'PhucTVCE1713490', N'International Business', N'Formal', 40)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (38, N'CE1713491', N'HongNTCE1713491', N'Digital Marketing', N'Formal', 41)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (39, N'CE1713492', N'TamTTCE1713492', N'Software Engineering', N'Formal', 42)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (40, N'CE1713493', N'HangNTCE1713493', N'Graphic Design', N'Formal', 43)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (41, N'CE1713494', N'HungLVCE1713494', N'Multimedia Management', N'Formal', 44)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (42, N'CE1713495', N'ThuTTCE1713495', N'Software Engineering', N'Formal', 45)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (43, N'CE1713496', N'TaiNVCE1713496', N'Digital Marketing', N'Formal', 46)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (44, N'CE1713497', N'GiangLVCE1713497', N'Software Engineering', N'Formal', 47)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (45, N'CE1713498', N'TienTVCE1713498', N'Software Engineering', N'Formal', 48)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (46, N'CE1713499', N'TramNTCE1713499', N'International Business', N'Formal', 49)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (47, N'CE1713500', N'DanhLVCE1713500', N'Digital Marketing', N'Formal', 50)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (48, N'CE1713501', N'LienTTCE1713501', N'Graphic Design', N'Formal', 51)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (49, N'CE1713502', N'KhoaNVCE1713502', N'Multimedia Management', N'Formal', 52)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (50, N'CE1713503', N'VyLTCE1713503', N'International Business', N'Formal', 53)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (51, N'CE1713504', N'TrongTVCE1713504', N'Digital Marketing', N'Formal', 54)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (52, N'CE1713505', N'HienNTCE1713505', N'Software Engineering', N'Formal', 55)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (53, N'CE1713506', N'BaoLVCE1713506', N'Multimedia Management', N'Formal', 56)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (54, N'CE1713507', N'PhuongTTCE1713507', N'Software Engineering', N'Formal', 57)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (55, N'CE1713508', N'VuNVCE1713508', N'International Business', N'Formal', 58)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (56, N'CE1713509', N'ThanhLVCE1713509', N'Digital Marketing', N'Formal', 59)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (57, N'CE1713510', N'TienTTCE1713510', N'Software Engineering', N'Formal', 60)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (58, N'CE1713511', N'NgocNTCE1713511', N'Software Engineering', N'Formal', 61)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (59, N'CE1713512', N'HoaTTCE1713512', N'International Business', N'Formal', 62)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (60, N'CE1713513', N'MinhNVCE1713513', N'Digital Marketing', N'Formal', 63)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (61, N'CE1713514', N'ThaoLTCE1713514', N'Software Engineering', N'Formal', 64)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (62, N'CE1713515', N'DucTVCE1713515', N'Software Engineering', N'Formal', 65)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (63, N'CE1713516', N'HienNTCE1713516', N'Multimedia Management', N'Formal', 66)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (64, N'CE1713517', N'AnhLVCE1713517', N'Digital Marketing', N'Formal', 67)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (65, N'CE1713518', N'TuanNVCE1713518', N'International Business', N'Formal', 68)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (66, N'CE1713519', N'ThiTTCE1713519', N'Software Engineering', N'Formal', 69)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (67, N'CE1713520', N'QuangNVCE1713520', N'Software Engineering', N'Formal', 70)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (68, N'CE1713521', N'HuongLTCE1713521', N'Multimedia Management', N'Formal', 71)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (69, N'CE1713522', N'HungTVCE1713522', N'Digital Marketing', N'Formal', 72)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (70, N'CE1713523', N'LinhNTCE1713523', N'International Business', N'Formal', 73)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (71, N'CE1713524', N'HoaLVCE1713524', N'Software Engineering', N'Formal', 74)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (72, N'CE1713525', N'ThaoTTCE1713525', N'Graphic Design', N'Formal', 75)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (73, N'CE1713526', N'HaiNVCE1713526', N'Digital Marketing', N'Formal', 76)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (74, N'CE1713527', N'MyLTCE1713527', N'International Business', N'Formal', 77)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (75, N'CE1713528', N'HieuTVCE1713528', N'Software Engineering', N'Formal', 78)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (76, N'CE1713529', N'ThuNTCE1713529', N'Multimedia Management', N'Formal', 79)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (77, N'CE1713530', N'HungLVCE1713530', N'Software Engineering', N'Formal', 80)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (78, N'CE1713531', N'LanTTCE1713531', N'Digital Marketing', N'Formal', 81)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (79, N'CE1713532', N'NamNVCE1713532', N'International Business', N'Formal', 82)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (80, N'CE1713533', N'MaiLTCE1713533', N'Software Engineering', N'Formal', 83)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (81, N'CE1713534', N'QuanTVCE1713534', N'Software Engineering', N'Formal', 84)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (82, N'CE1713535', N'LinhNTCE1713535', N'Digital Marketing', N'Formal', 85)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (83, N'CE1713536', N'HungLVCE1713536', N'International Business', N'Formal', 86)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (84, N'CE1713537', N'ThuTTCE1713537', N'Software Engineering', N'Formal', 87)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (85, N'CE1713538', N'KhoaNVCE1713538', N'Graphic Design', N'Formal', 88)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (86, N'CE1713539', N'HoaLTCE1713539', N'International Business', N'Formal', 89)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (87, N'CE1713540', N'LinhTTCE1713540', N'Digital Marketing', N'Formal', 90)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (88, N'CE1713541', N'DuyNVCE1713541', N'Software Engineering', N'Formal', 91)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (89, N'CE1713542', N'HieuLVCE1713542', N'Software Engineering', N'Formal', 92)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (90, N'CE1713543', N'AnhTTCE1713543', N'Digital Marketing', N'Formal', 93)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (91, N'CE1713544', N'TuanNVCE1713544', N'Software Engineering', N'Formal', 94)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (92, N'CE1713545', N'HoaLTCE1713545', N'Multimedia Management', N'Formal', 95)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (93, N'CE1713546', N'LinhTTCE1713546', N'Hotel Management', N'Formal', 96)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (94, N'CE1713547', N'DuyNVCE1713547', N'Graphic Design', N'Formal', 97)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (95, N'CE1713548', N'HieuLVCE1713548', N'Information Security', N'Formal', 98)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (96, N'CE1713549', N'AnhTTCE1713549', N'International Business', N'Formal', 99)
INSERT [dbo].[StudentProfile] ([StudentProfileID], [RollNumber], [MemberCode], [Major], [Mode], [UserProfileID]) VALUES (97, N'CE1713550', N'TuanNVCE1713550', N'Digital Marketing', N'Formal', 100)
SET IDENTITY_INSERT [dbo].[StudentProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[UserLogin] ON 

INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (1, N'TienBTCE171840@fpt.edu.vn', CAST(N'2021-09-02T01:01:01.000' AS DateTime), 1, 1)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (2, N'CuLQCE171592@fpt.edu.vn', CAST(N'2021-09-02T02:02:02.000' AS DateTime), 1, 2)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (3, N'HuyHKCE171778@fpt.edu.vn', CAST(N'2021-09-02T03:03:03.000' AS DateTime), 1, 3)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (4, N'NguyenNQCE171903@fpt.edu.vn', CAST(N'2021-09-02T04:04:04.000' AS DateTime), 1, 4)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (5, N'NhuDTCE171860@fpt.edu,vn', CAST(N'2021-09-02T05:05:05.000' AS DateTime), 1, 5)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (6, N'KienTVCE1713456@fpt.edu.vn', CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1, 6)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (7, N'AnNTCE1713457@fpt.edu.vn', CAST(N'2017-01-02T00:00:00.000' AS DateTime), 1, 7)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (8, N'HuyNVCE1713458@fpt.edu.vn', CAST(N'2017-01-03T00:00:00.000' AS DateTime), 1, 8)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (9, N'PhuongLTCE1713459@fpt.edu.vn', CAST(N'2017-01-04T00:00:00.000' AS DateTime), 1, 9)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (10, N'NamTVCE1713460@fpt.edu.vn', CAST(N'2017-01-05T00:00:00.000' AS DateTime), 1, 10)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (11, N'HoaPTCE1713461@fpt.edu.vn', CAST(N'2017-01-06T00:00:00.000' AS DateTime), 1, 11)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (12, N'DatNVCE1713462@fpt.edu.vn', CAST(N'2017-01-07T00:00:00.000' AS DateTime), 1, 12)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (13, N'LinhNTCE1713463@fpt.edu.vn', CAST(N'2017-01-08T00:00:00.000' AS DateTime), 1, 13)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (14, N'TuanLVCE1713464@fpt.edu.vn', CAST(N'2017-01-09T00:00:00.000' AS DateTime), 1, 14)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (15, N'TrangPTCE1713465@fpt.edu.vn', CAST(N'2017-01-10T00:00:00.000' AS DateTime), 1, 15)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (16, N'LongTVCE1713466@fpt.edu.vn', CAST(N'2017-01-11T00:00:00.000' AS DateTime), 1, 16)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (17, N'NhungNTCE1713467@fpt.edu.vn', CAST(N'2017-01-12T00:00:00.000' AS DateTime), 1, 17)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (18, N'HieuLVCE1713468@fpt.edu.vn', CAST(N'2017-01-13T00:00:00.000' AS DateTime), 1, 18)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (19, N'MaiNTCE1713469@fpt.edu.vn', CAST(N'2017-01-14T00:00:00.000' AS DateTime), 1, 19)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (20, N'QuanTVCE1713470@fpt.edu.vn', CAST(N'2017-01-15T00:00:00.000' AS DateTime), 1, 20)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (21, N'LanPTCE1713471@fpt.edu.vn', CAST(N'2017-01-16T00:00:00.000' AS DateTime), 1, 21)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (22, N'MinhNVCE1713472@fpt.edu.vn', CAST(N'2017-01-17T00:00:00.000' AS DateTime), 1, 22)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (23, N'AnhTTCE1713473@fpt.edu.vn', CAST(N'2017-01-18T00:00:00.000' AS DateTime), 1, 23)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (24, N'DucLVCE1713474@fpt.edu.vn', CAST(N'2017-01-19T00:00:00.000' AS DateTime), 1, 24)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (25, N'TrinhNTCE1713475@fpt.edu.vn', CAST(N'2017-01-20T00:00:00.000' AS DateTime), 1, 25)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (26, N'SonTVCE1713476@fpt.edu.vn', CAST(N'2017-01-21T00:00:00.000' AS DateTime), 1, 26)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (27, N'HuongNTCE1713477@fpt.edu.vn', CAST(N'2017-01-22T00:00:00.000' AS DateTime), 1, 27)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (28, N'DaiLVCE1713478@fpt.edu.vn', CAST(N'2017-01-23T00:00:00.000' AS DateTime), 1, 28)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (29, N'TrucPTCE1713479@fpt.edu.vn', CAST(N'2017-01-24T00:00:00.000' AS DateTime), 1, 29)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (30, N'HoangNVCE1713480@fpt.edu.vn', CAST(N'2017-01-25T00:00:00.000' AS DateTime), 1, 30)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (31, N'ThaoTTCE1713481@fpt.edu.vn', CAST(N'2017-01-26T00:00:00.000' AS DateTime), 1, 31)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (32, N'DungLVCE1713482@fpt.edu.vn', CAST(N'2017-01-27T00:00:00.000' AS DateTime), 1, 32)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (33, N'ThuyNTCE1713483@fpt.edu.vn', CAST(N'2017-01-28T00:00:00.000' AS DateTime), 1, 33)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (34, N'HoaTTCE1713484@fpt.edu.vn', CAST(N'2017-01-29T00:00:00.000' AS DateTime), 1, 34)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (35, N'QuyenNTCE1713485@fpt.edu.vn', CAST(N'2017-01-30T00:00:00.000' AS DateTime), 1, 35)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (36, N'BinhLVCE1713486@fpt.edu.vn', CAST(N'2017-01-31T00:00:00.000' AS DateTime), 1, 36)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (37, N'LoanTTCE1713487@fpt.edu.vn', CAST(N'2017-02-01T00:00:00.000' AS DateTime), 1, 37)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (38, N'TungNVCE1713488@fpt.edu.vn', CAST(N'2017-02-02T00:00:00.000' AS DateTime), 1, 38)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (39, N'DiepLTCE1713489@fpt.edu.vn', CAST(N'2017-02-03T00:00:00.000' AS DateTime), 1, 39)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (40, N'PhucTVCE1713490@fpt.edu.vn', CAST(N'2017-02-04T00:00:00.000' AS DateTime), 1, 40)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (41, N'HongNTCE1713491@fpt.edu.vn', CAST(N'2017-02-05T00:00:00.000' AS DateTime), 1, 41)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (42, N'TamTTCE1713492@fpt.edu.vn', CAST(N'2017-02-06T00:00:00.000' AS DateTime), 1, 42)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (43, N'HangNTCE1713493@fpt.edu.vn', CAST(N'2017-02-07T00:00:00.000' AS DateTime), 1, 43)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (44, N'HungLVCE1713494@fpt.edu.vn', CAST(N'2017-02-08T00:00:00.000' AS DateTime), 1, 44)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (45, N'ThuTTCE1713495@fpt.edu.vn', CAST(N'2017-02-09T00:00:00.000' AS DateTime), 1, 45)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (46, N'TaiNVCE1713496@fpt.edu.vn', CAST(N'2017-02-10T00:00:00.000' AS DateTime), 1, 46)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (47, N'GiangLVCE1713497@fpt.edu.vn', CAST(N'2017-02-11T00:00:00.000' AS DateTime), 1, 47)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (48, N'TienTVCE1713498@fpt.edu.vn', CAST(N'2017-02-12T00:00:00.000' AS DateTime), 1, 48)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (49, N'TramNTCE1713499@fpt.edu.vn', CAST(N'2017-02-13T00:00:00.000' AS DateTime), 1, 49)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (50, N'DanhLVCE1713500@fpt.edu.vn', CAST(N'2017-02-14T00:00:00.000' AS DateTime), 1, 50)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (51, N'LienTTCE1713501@fpt.edu.vn', CAST(N'2017-02-15T00:00:00.000' AS DateTime), 1, 51)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (52, N'KhoaNVCE1713502@fpt.edu.vn', CAST(N'2017-02-16T00:00:00.000' AS DateTime), 1, 52)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (53, N'VyLTCE1713503@fpt.edu.vn', CAST(N'2017-02-17T00:00:00.000' AS DateTime), 1, 53)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (54, N'TrongTVCE1713504@fpt.edu.vn', CAST(N'2017-02-18T00:00:00.000' AS DateTime), 1, 54)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (55, N'HienNTCE1713505@fpt.edu.vn', CAST(N'2017-02-19T00:00:00.000' AS DateTime), 1, 55)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (56, N'BaoLVCE1713506@fpt.edu.vn', CAST(N'2017-02-20T00:00:00.000' AS DateTime), 1, 56)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (57, N'PhuongTTCE1713507@fpt.edu.vn', CAST(N'2017-02-21T00:00:00.000' AS DateTime), 1, 57)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (58, N'VuNVCE1713508@fpt.edu.vn', CAST(N'2017-02-22T00:00:00.000' AS DateTime), 1, 58)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (59, N'ThanhLVCE1713509@fpt.edu.vn', CAST(N'2017-02-23T00:00:00.000' AS DateTime), 1, 59)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (60, N'TienTTCE1713510@fpt.edu.vn', CAST(N'2017-02-24T00:00:00.000' AS DateTime), 1, 60)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (61, N'NgocNTCE1713511@fpt.edu.vn', CAST(N'2017-02-25T00:00:00.000' AS DateTime), 1, 61)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (62, N'HoaTTCE1713512@fpt.edu.vn', CAST(N'2017-02-26T00:00:00.000' AS DateTime), 1, 62)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (63, N'MinhNVCE1713513@fpt.edu.vn', CAST(N'2017-02-27T00:00:00.000' AS DateTime), 1, 63)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (64, N'ThaoLTCE1713514@fpt.edu.vn', CAST(N'2017-02-28T00:00:00.000' AS DateTime), 1, 64)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (65, N'DucTVCE1713515@fpt.edu.vn', CAST(N'2017-03-01T00:00:00.000' AS DateTime), 1, 65)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (66, N'HienNTCE1713516@fpt.edu.vn', CAST(N'2017-03-02T00:00:00.000' AS DateTime), 1, 66)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (67, N'AnhLVCE1713517@fpt.edu.vn', CAST(N'2017-03-03T00:00:00.000' AS DateTime), 1, 67)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (68, N'TuanNVCE1713518@fpt.edu.vn', CAST(N'2017-03-04T00:00:00.000' AS DateTime), 1, 68)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (69, N'ThiTTCE1713519@fpt.edu.vn', CAST(N'2017-03-05T00:00:00.000' AS DateTime), 1, 69)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (70, N'QuangNVCE1713520@fpt.edu.vn', CAST(N'2017-03-06T00:00:00.000' AS DateTime), 1, 70)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (71, N'HuongLTCE1713521@fpt.edu.vn', CAST(N'2017-03-07T00:00:00.000' AS DateTime), 1, 71)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (72, N'HungTVCE1713522@fpt.edu.vn', CAST(N'2017-03-08T00:00:00.000' AS DateTime), 1, 72)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (73, N'LinhNTCE1713523@fpt.edu.vn', CAST(N'2017-03-09T00:00:00.000' AS DateTime), 1, 73)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (74, N'HoaLVCE1713524@fpt.edu.vn', CAST(N'2017-03-10T00:00:00.000' AS DateTime), 1, 74)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (75, N'ThaoTTCE1713525@fpt.edu.vn', CAST(N'2017-03-11T00:00:00.000' AS DateTime), 1, 75)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (76, N'HaiNVCE1713526@fpt.edu.vn', CAST(N'2017-03-12T00:00:00.000' AS DateTime), 1, 76)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (77, N'MyLTCE1713527@fpt.edu.vn', CAST(N'2017-03-13T00:00:00.000' AS DateTime), 1, 77)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (78, N'HieuTVCE1713528@fpt.edu.vn', CAST(N'2017-03-14T00:00:00.000' AS DateTime), 1, 78)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (79, N'ThuNTCE1713529@fpt.edu.vn', CAST(N'2017-03-15T00:00:00.000' AS DateTime), 1, 79)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (80, N'HungLVCE1713530@fpt.edu.vn', CAST(N'2017-03-16T00:00:00.000' AS DateTime), 1, 80)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (81, N'LanTTCE1713531@fpt.edu.vn', CAST(N'2017-03-17T00:00:00.000' AS DateTime), 1, 81)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (82, N'NamNVCE1713532@fpt.edu.vn', CAST(N'2017-03-18T00:00:00.000' AS DateTime), 1, 82)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (83, N'MaiLTCE1713533@fpt.edu.vn', CAST(N'2017-03-19T00:00:00.000' AS DateTime), 1, 83)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (84, N'QuanTVCE1713534@fpt.edu.vn', CAST(N'2017-03-20T00:00:00.000' AS DateTime), 1, 84)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (85, N'LinhNTCE1713535@fpt.edu.vn', CAST(N'2017-03-21T00:00:00.000' AS DateTime), 1, 85)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (86, N'HungLVCE1713536@fpt.edu.vn', CAST(N'2017-03-22T00:00:00.000' AS DateTime), 1, 86)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (87, N'ThuTTCE1713537@fpt.edu.vn', CAST(N'2017-03-23T00:00:00.000' AS DateTime), 1, 87)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (88, N'KhoaNVCE1713538@fpt.edu.vn', CAST(N'2017-03-24T00:00:00.000' AS DateTime), 1, 88)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (89, N'HoaLTCE1713539@fpt.edu.vn', CAST(N'2017-03-25T00:00:00.000' AS DateTime), 1, 89)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (90, N'LinhTTCE1713540@fpt.edu.vn', CAST(N'2017-03-26T00:00:00.000' AS DateTime), 1, 90)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (91, N'DuyNVCE1713541@fpt.edu.vn', CAST(N'2017-03-27T00:00:00.000' AS DateTime), 1, 91)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (92, N'HieuLVCE1713542@fpt.edu.vn', CAST(N'2017-03-28T00:00:00.000' AS DateTime), 1, 92)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (93, N'AnhTTCE1713543@fpt.edu.vn', CAST(N'2017-03-29T00:00:00.000' AS DateTime), 1, 93)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (94, N'TuanNVCE1713544@fpt.edu.vn', CAST(N'2017-03-30T00:00:00.000' AS DateTime), 1, 94)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (95, N'HoaLTCE1713545@fpt.edu.vn', CAST(N'2017-03-31T00:00:00.000' AS DateTime), 1, 95)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (96, N'LinhTTCE1713546@fpt.edu.vn', CAST(N'2017-04-01T00:00:00.000' AS DateTime), 1, 96)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (97, N'DuyNVCE1713547@fpt.edu.vn', CAST(N'2017-04-02T00:00:00.000' AS DateTime), 1, 97)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (98, N'HieuLVCE1713548@fpt.edu.vn', CAST(N'2017-04-03T00:00:00.000' AS DateTime), 1, 98)
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (99, N'AnhTTCE1713549@fpt.edu.vn', CAST(N'2017-04-04T00:00:00.000' AS DateTime), 1, 99)
GO
INSERT [dbo].[UserLogin] ([UserLoginID], [Username], [CreateAt], [IsActive], [UserProfileID]) VALUES (100, N'TuanNVCE1713550@fpt.edu.vn', CAST(N'2017-04-05T00:00:00.000' AS DateTime), 1, 100)
SET IDENTITY_INSERT [dbo].[UserLogin] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (1, N'Tien', N'Bach Trung', N'1.png', N'Male', CAST(N'2003-10-19' AS Date), N'Hau Giang', CAST(N'2021-09-02' AS Date), N'TienBTCE171840@fpt.edu.vn', N'0907577507')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (2, N'Cu', N'Le Quoc', N'2.png', N'Male', CAST(N'2003-02-27' AS Date), N'Can Tho', CAST(N'2021-09-02' AS Date), N'CuLQCE171592@fpt.edu.vn', N'0123235566')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (3, N'Huy', N'Hua Khanh', N'3.png', N'Male', CAST(N'2003-03-03' AS Date), N'Soc Trang', CAST(N'2021-09-02' AS Date), N'HuyHKCE171778@fpt.edu.vn', N'0234567893')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (4, N'Nguyen', N'Ngo Viet', N'4.png', N'Male', CAST(N'2003-04-04' AS Date), N'Ca Mau', CAST(N'2021-09-02' AS Date), N'NguyenNQ171903@fpt.edu.vn', N'0234567894')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (5, N'Nhu', N'Dang Tuyet', N'5.png', N'Female', CAST(N'2003-05-05' AS Date), N'Hau Giang', CAST(N'2021-09-02' AS Date), N'NhuDTCE171860@fpt.edu.vn', N'0234567895')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (6, N'Kien', N'Tran Van', N'6.png', N'Male', CAST(N'2003-09-12' AS Date), N'Hau Giang', CAST(N'2017-01-01' AS Date), N'KienTVCE1713456@fpt.edu.vn', N'0135792468')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (7, N'An', N'Nguyen Thi', N'7.png', N'Female', CAST(N'2002-12-25' AS Date), N'Ha Noi', CAST(N'2017-01-02' AS Date), N'AnNTCE1713457@fpt.edu.vn', N'0123456789')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (8, N'Huy', N'Nguyen Van', N'8.png', N'Male', CAST(N'2001-11-11' AS Date), N'Ho Chi Minh', CAST(N'2017-01-03' AS Date), N'HuyNVCE1713458@fpt.edu.vn', N'0987654321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (9, N'Phuong', N'Le Thi', N'9.png', N'Female', CAST(N'2004-03-15' AS Date), N'Da Nang', CAST(N'2017-01-04' AS Date), N'PhuongLTCE1713459@fpt.edu.vn', N'0112233445')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (10, N'Nam', N'Tran Van', N'10.png', N'Male', CAST(N'2003-07-20' AS Date), N'Quang Nam', CAST(N'2017-01-05' AS Date), N'NamTVCE1713460@fpt.edu.vn', N'0556677889')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (11, N'Hoa', N'Pham Thi', N'11.png', N'Female', CAST(N'2002-09-03' AS Date), N'Binh Duong', CAST(N'2017-01-06' AS Date), N'HoaPTCE1713461@fpt.edu.vn', N'0998877665')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (12, N'Dat', N'Nguyen Van', N'12.png', N'Male', CAST(N'2001-10-18' AS Date), N'Can Tho', CAST(N'2017-01-07' AS Date), N'DatNVCE1713462@fpt.edu.vn', N'0123456789')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (13, N'Linh', N'Nguyen Thi', N'13.png', N'Female', CAST(N'2004-02-14' AS Date), N'Bac Ninh', CAST(N'2017-01-08' AS Date), N'LinhNTCE1713463@fpt.edu.vn', N'0321456987')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (14, N'Tuan', N'Le Van', N'14.png', N'Male', CAST(N'2003-06-30' AS Date), N'Vinh Phuc', CAST(N'2017-01-09' AS Date), N'TuanLVCE1713464@fpt.edu.vn', N'0987123456')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (15, N'Trang', N'Pham Thi', N'15.png', N'Female', CAST(N'2002-08-12' AS Date), N'Phu Tho', CAST(N'2017-01-10' AS Date), N'TrangPTCE1713465@fpt.edu.vn', N'0123123123')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (16, N'Long', N'Tran Van', N'16.png', N'Male', CAST(N'2001-09-25' AS Date), N'Lam Dong', CAST(N'2017-01-11' AS Date), N'LongTVCE1713466@fpt.edu.vn', N'0456345278')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (17, N'Nhung', N'Nguyen Thi', N'17.png', N'Female', CAST(N'2004-01-09' AS Date), N'An Giang', CAST(N'2017-01-12' AS Date), N'NhungNTCE1713467@fpt.edu.vn', N'0965874123')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (18, N'Hieu', N'Le Van', N'18.png', N'Male', CAST(N'2003-05-05' AS Date), N'Bac Giang', CAST(N'2017-01-13' AS Date), N'HieuLVCE1713468@fpt.edu.vn', N'0965874123')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (19, N'Mai', N'Nguyen Thi', N'19.png', N'Female', CAST(N'2002-07-21' AS Date), N'Dong Thap', CAST(N'2017-01-14' AS Date), N'MaiNTCE1713469@fpt.edu.vn', N'0369852471')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (20, N'Quan', N'Tran Van', N'20.png', N'Male', CAST(N'2001-08-04' AS Date), N'Thai Nguyen', CAST(N'2017-01-15' AS Date), N'QuanTVCE1713470@fpt.edu.vn', N'0123654789')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (21, N'Lan', N'Pham Thi', N'21.png', N'Female', CAST(N'2004-04-28' AS Date), N'Quang Tri', CAST(N'2017-01-16' AS Date), N'LanPTCE1713471@fpt.edu.vn', N'0987456123')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (22, N'Minh', N'Nguyen Van', N'22.png', N'Male', CAST(N'2003-04-03' AS Date), N'Thua Thien Hue', CAST(N'2017-01-17' AS Date), N'MinhNVCE1713472@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (23, N'Anh', N'Tran Thi', N'23.png', N'Female', CAST(N'2002-06-17' AS Date), N'Khanh Hoa', CAST(N'2017-01-18' AS Date), N'AnhTTCE1713473@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (24, N'Duc', N'Le Van', N'24.png', N'Male', CAST(N'2001-07-30' AS Date), N'Quang Binh', CAST(N'2017-01-19' AS Date), N'DucLVCE1713474@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (25, N'Trinh', N'Nguyen Thi', N'25.png', N'Female', CAST(N'2004-05-25' AS Date), N'Dak Lak', CAST(N'2017-01-20' AS Date), N'TrinhNTCE1713475@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (26, N'Son', N'Tran Van', N'26.png', N'Male', CAST(N'2003-03-11' AS Date), N'Lao Cai', CAST(N'2017-01-21' AS Date), N'SonTVCE1713476@fpt.edu.vn', N'0123456987')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (27, N'Huong', N'Nguyen Thi', N'27.png', N'Female', CAST(N'2002-05-01' AS Date), N'Nam Dinh', CAST(N'2017-01-22' AS Date), N'HuongNTCE1713477@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (28, N'Dai', N'Le Van', N'28.png', N'Male', CAST(N'2001-06-14' AS Date), N'Thanh Hoa', CAST(N'2017-01-23' AS Date), N'DaiLVCE1713478@fpt.edu.vn', N'0123654879')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (29, N'Truc', N'Pham Thi', N'29.png', N'Female', CAST(N'2004-07-07' AS Date), N'Ninh Binh', CAST(N'2017-01-24' AS Date), N'TrucPTCE1713479@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (30, N'Hoang', N'Nguyen Van', N'30.png', N'Male', CAST(N'2003-02-22' AS Date), N'Ha Tinh', CAST(N'2017-01-25' AS Date), N'HoangNVCE1713480@fpt.edu.vn', N'0369852471')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (31, N'Thao', N'Tran Thi', N'31.png', N'Female', CAST(N'2002-04-06' AS Date), N'Lang Son', CAST(N'2017-01-26' AS Date), N'ThaoTTCE1713481@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (32, N'Dung', N'Le Van', N'32.png', N'Male', CAST(N'2001-05-19' AS Date), N'Bac Lieu', CAST(N'2017-01-27' AS Date), N'DungLVCE1713482@fpt.edu.vn', N'0123654879')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (33, N'Thuy', N'Nguyen Thi', N'33.png', N'Female', CAST(N'2004-08-13' AS Date), N'Tien Giang', CAST(N'2017-01-28' AS Date), N'ThuyNTCE1713483@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (34, N'Hoa', N'Tran Thi', N'34.png', N'Male', CAST(N'2003-01-27' AS Date), N'Ha Nam', CAST(N'2017-01-29' AS Date), N'HoaTTCE1713484@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (35, N'Quyen', N'Nguyen Thi', N'35.png', N'Female', CAST(N'2002-03-11' AS Date), N'Tra Vinh', CAST(N'2017-01-30' AS Date), N'QuyenNTCE1713485@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (36, N'Binh', N'Le Van', N'36.png', N'Male', CAST(N'2001-04-25' AS Date), N'Vinh Long', CAST(N'2017-01-31' AS Date), N'BinhLVCE1713486@fpt.edu.vn', N'0123654879')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (37, N'Loan', N'Tran Thi', N'37.png', N'Female', CAST(N'2004-06-18' AS Date), N'Ben Tre', CAST(N'2017-02-01' AS Date), N'LoanTTCE1713487@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (38, N'Tung', N'Nguyen Van', N'38.png', N'Male', CAST(N'2003-01-02' AS Date), N'Binh Phuoc', CAST(N'2017-02-02' AS Date), N'TungNVCE1713488@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (39, N'Diep', N'Le Thi', N'39.png', N'Female', CAST(N'2002-02-15' AS Date), N'Hai Duong', CAST(N'2017-02-03' AS Date), N'DiepLTCE1713489@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (40, N'Phuc', N'Tran Van', N'40.png', N'Male', CAST(N'2001-03-30' AS Date), N'Binh Dinh', CAST(N'2017-02-04' AS Date), N'PhucTVCE1713490@fpt.edu.vn', N'0123654879')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (41, N'Hong', N'Nguyen Thi', N'41.png', N'Female', CAST(N'2004-09-24' AS Date), N'Dong Nai', CAST(N'2017-02-05' AS Date), N'HongNTCE1713491@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (42, N'Tam', N'Tran Thi', N'42.png', N'Male', CAST(N'2003-01-08' AS Date), N'Soc Trang', CAST(N'2017-02-06' AS Date), N'TamTTCE1713492@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (43, N'Hang', N'Nguyen Thi', N'43.png', N'Female', CAST(N'2002-03-24' AS Date), N'Ca Mau', CAST(N'2017-02-07' AS Date), N'HangNTCE1713493@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (44, N'Hung', N'Le Van', N'44.png', N'Male', CAST(N'2001-05-07' AS Date), N'Tay Ninh', CAST(N'2017-02-08' AS Date), N'HungLVCE1713494@fpt.edu.vn', N'0123654879')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (45, N'Thu', N'Tran Thi', N'45.png', N'Female', CAST(N'2004-07-01' AS Date), N'Kon Tum', CAST(N'2017-02-09' AS Date), N'ThuTTCE1713495@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (46, N'Tai', N'Nguyen Van', N'46.png', N'Male', CAST(N'2003-02-16' AS Date), N'Lai Chau', CAST(N'2017-02-10' AS Date), N'TaiNVCE1713496@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (47, N'Giang', N'Le Van', N'47.png', N'Female', CAST(N'2002-04-01' AS Date), N'Phu Yen', CAST(N'2017-02-11' AS Date), N'GiangLVCE1713497@fpt.edu.vn', N'0123654879')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (48, N'Tien', N'Tran Van', N'48.png', N'Male', CAST(N'2001-06-15' AS Date), N'Yen Bai', CAST(N'2017-02-12' AS Date), N'TienTVCE1713498@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (49, N'Tram', N'Nguyen Thi', N'49.png', N'Female', CAST(N'2004-08-09' AS Date), N'Hoa Binh', CAST(N'2017-02-13' AS Date), N'TramNTCE1713499@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (50, N'Danh', N'Le Van', N'50.png', N'Male', CAST(N'2003-03-25' AS Date), N'Son La', CAST(N'2017-02-14' AS Date), N'DanhLVCE1713500@fpt.edu.vn', N'0123654879')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (51, N'Lien', N'Tran Thi', N'51.png', N'Female', CAST(N'2002-05-09' AS Date), N'Lang Son', CAST(N'2017-02-15' AS Date), N'LienTTCE1713501@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (52, N'Khoa', N'Nguyen Van', N'52.png', N'Male', CAST(N'2001-07-23' AS Date), N'Quang Ninh', CAST(N'2017-02-16' AS Date), N'KhoaNVCE1713502@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (53, N'Vy', N'Le Thi', N'53.png', N'Female', CAST(N'2004-09-17' AS Date), N'Gia Lai', CAST(N'2017-02-17' AS Date), N'VyLTCE1713503@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (54, N'Trong', N'Tran Van', N'54.png', N'Male', CAST(N'2003-01-01' AS Date), N'Bac Ninh', CAST(N'2017-02-18' AS Date), N'TrongTVCE1713504@fpt.edu.vn', N'0123654879')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (55, N'Hien', N'Nguyen Thi', N'55.png', N'Female', CAST(N'2002-02-14' AS Date), N'Dong Thap', CAST(N'2017-02-19' AS Date), N'HienNTCE1713505@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (56, N'Bao', N'Le Van', N'56.png', N'Male', CAST(N'2001-04-30' AS Date), N'Dien Bien', CAST(N'2017-02-20' AS Date), N'BaoLVCE1713506@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (57, N'Phuong', N'Tran Thi', N'57.png', N'Female', CAST(N'2004-06-24' AS Date), N'Dak Nong', CAST(N'2017-02-21' AS Date), N'PhuongTTCE1713507@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (58, N'Vu', N'Nguyen Van', N'58.png', N'Male', CAST(N'2003-02-08' AS Date), N'Binh Duong', CAST(N'2017-02-22' AS Date), N'VuNVCE1713508@fpt.edu.vn', N'0123654879')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (59, N'Thanh', N'Le Van', N'59.png', N'Female', CAST(N'2002-03-22' AS Date), N'Can Tho', CAST(N'2017-02-23' AS Date), N'ThanhLVCE1713509@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (60, N'Tien', N'Tran Thi', N'60.png', N'Male', CAST(N'2001-05-06' AS Date), N'Vinh Phuc', CAST(N'2017-02-24' AS Date), N'TienTTCE1713510@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (61, N'Ngoc', N'Nguyen Thi', N'61.png', N'Female', CAST(N'2004-07-30' AS Date), N'Phu Tho', CAST(N'2017-02-25' AS Date), N'NgocNTCE1713511@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (62, N'Hoa', N'Tran Thi', N'62.png', N'Male', CAST(N'2003-01-13' AS Date), N'Son La', CAST(N'2017-02-26' AS Date), N'HoaTTCE1713512@fpt.edu.vn', N'0123654879')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (63, N'Minh', N'Nguyen Van', N'63.png', N'Female', CAST(N'2002-02-26' AS Date), N'Lam Dong', CAST(N'2017-02-27' AS Date), N'MinhNVCE1713513@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (64, N'Thao', N'Le Thi', N'64.png', N'Male', CAST(N'2001-04-10' AS Date), N'An Giang', CAST(N'2017-02-28' AS Date), N'ThaoLTCE1713514@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (65, N'Duc', N'Tran Van', N'65.png', N'Female', CAST(N'2004-06-04' AS Date), N'Bac Lieu', CAST(N'2017-03-01' AS Date), N'DucTVCE1713515@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (66, N'Hien', N'Nguyen Thi', N'66.png', N'Male', CAST(N'2003-02-18' AS Date), N'Kien Giang', CAST(N'2017-03-02' AS Date), N'HienNTCE1713516@fpt.edu.vn', N'0123654879')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (67, N'Anh', N'Le Van', N'67.png', N'Female', CAST(N'2002-04-03' AS Date), N'Long An', CAST(N'2017-03-03' AS Date), N'AnhLVCE1713517@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (68, N'Tuan', N'Nguyen Van', N'68.png', N'Male', CAST(N'2001-05-17' AS Date), N'Ha Nam', CAST(N'2017-03-04' AS Date), N'TuanNVCE1713518@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (69, N'Thi', N'Tran Thi', N'69.png', N'Female', CAST(N'2004-07-11' AS Date), N'Lao Cai', CAST(N'2017-03-05' AS Date), N'ThiTTCE1713519@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (70, N'Quang', N'Nguyen Van', N'70.png', N'Male', CAST(N'2003-01-25' AS Date), N'Hung Yen', CAST(N'2017-03-06' AS Date), N'QuangNVCE1713520@fpt.edu.vn', N'0123654879')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (71, N'Huong', N'Le Thi', N'71.png', N'Female', CAST(N'2002-03-10' AS Date), N'Ninh Binh', CAST(N'2017-03-07' AS Date), N'HuongLTCE1713521@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (72, N'Hung', N'Tran Van', N'72.png', N'Male', CAST(N'2001-04-24' AS Date), N'Hai Phong', CAST(N'2017-03-08' AS Date), N'HungTVCE1713522@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (73, N'Linh', N'Nguyen Thi', N'73.png', N'Female', CAST(N'2004-06-18' AS Date), N'Thai Binh', CAST(N'2017-03-09' AS Date), N'LinhNTCE1713523@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (74, N'Hoa', N'Le Van', N'74.png', N'Male', CAST(N'2003-08-12' AS Date), N'Hai Duong', CAST(N'2017-03-10' AS Date), N'HoaLVCE1713524@fpt.edu.vn', N'0123654879')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (75, N'Thao', N'Tran Thi', N'75.png', N'Female', CAST(N'2002-09-26' AS Date), N'Bac Kan', CAST(N'2017-03-11' AS Date), N'ThaoTTCE1713525@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (76, N'Hai', N'Nguyen Van', N'76.png', N'Male', CAST(N'2001-11-10' AS Date), N'Lang Son', CAST(N'2017-03-12' AS Date), N'HaiNVCE1713526@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (77, N'My', N'Le Thi', N'77.png', N'Female', CAST(N'2004-01-04' AS Date), N'Cao Bang', CAST(N'2017-03-13' AS Date), N'MyLTCE1713527@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (78, N'Hieu', N'Tran Van', N'78.png', N'Male', CAST(N'2003-03-18' AS Date), N'Tuyen Quang', CAST(N'2017-03-14' AS Date), N'HieuTVCE1713528@fpt.edu.vn', N'0123654879')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (79, N'Thu', N'Nguyen Thi', N'79.png', N'Female', CAST(N'2002-05-02' AS Date), N'Quang Tri', CAST(N'2017-03-15' AS Date), N'ThuNTCE1713529@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (80, N'Hung', N'Le Van', N'80.png', N'Male', CAST(N'2001-06-16' AS Date), N'Quang Nam', CAST(N'2017-03-16' AS Date), N'HungLVCE1713530@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (81, N'Lan', N'Tran Thi', N'81.png', N'Female', CAST(N'2004-08-10' AS Date), N'Quang Ngai', CAST(N'2017-03-17' AS Date), N'LanTTCE1713531@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (82, N'Nam', N'Nguyen Van', N'82.png', N'Male', CAST(N'2003-12-27' AS Date), N'Quang Binh', CAST(N'2017-03-18' AS Date), N'NamNVCE1713532@fpt.edu.vn', N'0123654879')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (83, N'Mai', N'Le Thi', N'83.png', N'Female', CAST(N'2003-02-11' AS Date), N'Quang Tri', CAST(N'2017-03-19' AS Date), N'MaiLTCE1713533@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (84, N'Quan', N'Tran Van', N'84.png', N'Male', CAST(N'2002-03-27' AS Date), N'Quang Ngai', CAST(N'2017-03-20' AS Date), N'QuanTVCE1713534@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (85, N'Linh', N'Nguyen Thi', N'85.png', N'Female', CAST(N'2005-05-21' AS Date), N'Quang Nam', CAST(N'2017-03-21' AS Date), N'LinhNTCE1713535@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (86, N'Hung', N'Le Van', N'86.png', N'Male', CAST(N'2004-07-15' AS Date), N'Quang Binh', CAST(N'2017-03-22' AS Date), N'HungLVCE1713536@fpt.edu.vn', N'0123654879')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (87, N'Thu', N'Tran Thi', N'87.png', N'Female', CAST(N'2003-08-29' AS Date), N'Quang Tri', CAST(N'2017-03-23' AS Date), N'ThuTTCE1713537@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (88, N'Khoa', N'Nguyen Van', N'88.png', N'Male', CAST(N'2002-10-13' AS Date), N'Quang Ngai', CAST(N'2017-03-24' AS Date), N'KhoaNVCE1713538@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (89, N'Hoa', N'Le Thi', N'89.png', N'Female', CAST(N'2001-11-27' AS Date), N'Quang Nam', CAST(N'2017-03-25' AS Date), N'HoaLTCE1713539@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (90, N'Linh', N'Tran Thi', N'90.png', N'Male', CAST(N'2001-01-10' AS Date), N'Quang Tri', CAST(N'2017-03-26' AS Date), N'LinhTTCE1713540@fpt.edu.vn', N'0123654879')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (91, N'Duy', N'Nguyen Van', N'91.png', N'Female', CAST(N'2000-02-24' AS Date), N'Quang Ngai', CAST(N'2017-03-27' AS Date), N'DuyNVCE1713541@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (92, N'Hieu', N'Le Van', N'92.png', N'Male', CAST(N'1999-04-09' AS Date), N'Quang Binh', CAST(N'2017-03-28' AS Date), N'HieuLVCE1713542@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (93, N'Anh', N'Tran Thi', N'93.png', N'Female', CAST(N'1998-05-23' AS Date), N'Quang Tri', CAST(N'2017-03-29' AS Date), N'AnhTTCE1713543@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (94, N'Tuan', N'Nguyen Van', N'94.png', N'Male', CAST(N'1997-07-07' AS Date), N'Quang Nam', CAST(N'2017-03-30' AS Date), N'TuanNVCE1713544@fpt.edu.vn', N'0123654879')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (95, N'Hoa', N'Le Thi', N'95.png', N'Female', CAST(N'1996-08-21' AS Date), N'Quang Ngai', CAST(N'2017-03-31' AS Date), N'HoaLTCE1713545@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (96, N'Linh', N'Tran Thi', N'96.png', N'Male', CAST(N'1995-10-05' AS Date), N'Quang Binh', CAST(N'2017-04-01' AS Date), N'LinhTTCE1713546@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (97, N'Duy', N'Nguyen Van', N'97.png', N'Female', CAST(N'1994-11-19' AS Date), N'Quang Tri', CAST(N'2017-04-02' AS Date), N'DuyNVCE1713547@fpt.edu.vn', N'0147852369')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (98, N'Hieu', N'Le Van', N'98.png', N'Male', CAST(N'1993-01-02' AS Date), N'Quang Nam', CAST(N'2017-04-03' AS Date), N'HieuLVCE1713548@fpt.edu.vn', N'0987456321')
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (99, N'Anh', N'Tran Thi', N'99.png', N'Female', CAST(N'1992-02-16' AS Date), N'Quang Ngai', CAST(N'2017-04-04' AS Date), N'AnhTTCE1713549@fpt.edu.vn', N'0987456321')
GO
INSERT [dbo].[UserProfile] ([UserProfileID], [FirstName], [LastName], [Avatar], [Gender], [DateOfBirth], [Address], [EnrollmentDate], [Email], [Phone]) VALUES (100, N'Tuan', N'Nguyen Van', N'100.png', N'Male', CAST(N'1991-04-01' AS Date), N'Quang Binh', CAST(N'2017-04-05' AS Date), N'TuanNVCE1713550@fpt.edu.vn', N'0123654879')
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
GO
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (1, 1)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (2, 1)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (3, 1)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 1)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (1, 2)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (2, 2)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (3, 2)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 2)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (1, 3)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (2, 3)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (3, 3)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 3)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (1, 4)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (2, 4)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (3, 4)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 4)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (1, 5)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (2, 5)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (3, 5)
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
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 40)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 41)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 42)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 43)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 44)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 45)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 46)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 47)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 48)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 49)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 50)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 51)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 52)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 53)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 54)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 55)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 56)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 57)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 58)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 59)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 60)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 61)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 62)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 63)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 64)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 65)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 66)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 67)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 68)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 69)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 70)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 71)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 72)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 73)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 74)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 75)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 76)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 77)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 78)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 79)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 80)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 81)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 82)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 83)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 84)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 85)
GO
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 86)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 87)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 88)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 89)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 90)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 91)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 92)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 93)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 94)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 95)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 96)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 97)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 98)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 99)
INSERT [dbo].[UserRole] ([RoleID], [UserLoginID]) VALUES (4, 100)
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
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_PrizeStructure1] FOREIGN KEY([PrizeStructureID])
REFERENCES [dbo].[PrizeStructure] ([PrizeStructureID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_PrizeStructure1]
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
