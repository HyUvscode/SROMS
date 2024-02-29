USE [master]
GO
/****** Object:  Database [SROMS]    Script Date: 2/28/2024 9:36:21 AM ******/
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
/****** Object:  Table [dbo].[AdminProfile]    Script Date: 2/28/2024 9:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminProfile](
	[AdminProfileID] [int] NOT NULL,
	[StaffNumber] [nvarchar](10) NULL,
	[AcademicLevel] [nvarchar](50) NULL,
	[Degree] [nvarchar](50) NULL,
	[Experience] [nvarchar](200) NULL,
	[UserProfileID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Club]    Script Date: 2/28/2024 9:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Club](
	[ClubID] [int] NOT NULL,
	[ClubName] [nvarchar](200) NULL,
	[EstablishDate] [date] NULL,
	[Description] [nvarchar](1000) NULL,
	[IsApprove] [bit] NULL,
	[IsActive] [bit] NULL,
	[ManagerProfileID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClubMember]    Script Date: 2/28/2024 9:36:22 AM ******/
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
/****** Object:  Table [dbo].[Event]    Script Date: 2/28/2024 9:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventID] [int] NOT NULL,
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
PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventCategory]    Script Date: 2/28/2024 9:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventCategory](
	[EventCategoryID] [int] NOT NULL,
	[EventCategoryName] [nvarchar](200) NULL,
	[Point] [int] NULL,
	[Description] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[EventCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManagerProfile]    Script Date: 2/28/2024 9:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagerProfile](
	[ManagerProfileID] [int] NOT NULL,
	[StaffNumber] [nvarchar](10) NULL,
	[AcademicLevel] [nvarchar](50) NULL,
	[Degree] [nvarchar](50) NULL,
	[Experience] [nvarchar](200) NULL,
	[UserProfileID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ManagerProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 2/28/2024 9:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Content] [nvarchar](2000) NULL,
	[CreateAt] [date] NULL,
	[AdminProfileID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParticipationEventDetail]    Script Date: 2/28/2024 9:36:22 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 2/28/2024 9:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 2/28/2024 9:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[SemesterID] [int] NOT NULL,
	[SemesterName] [nvarchar](200) NULL,
	[SemesterCode] [nvarchar](50) NULL,
	[Point] [int] NULL,
	[Description] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[SemesterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentProfile]    Script Date: 2/28/2024 9:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentProfile](
	[StudentProfileID] [int] NOT NULL,
	[RollNumber] [nvarchar](10) NULL,
	[MemberCode] [nvarchar](20) NULL,
	[Major] [nvarchar](50) NULL,
	[Mode] [nvarchar](30) NULL,
	[UserProfileID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 2/28/2024 9:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[UserLoginID] [int] NOT NULL,
	[Username] [nvarchar](200) NULL,
	[CreateAt] [datetime] NULL,
	[IsActive] [bit] NULL,
	[RoleID] [int] NULL,
	[UserProfileID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserLoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 2/28/2024 9:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserProfileID] [int] NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Gender] [nvarchar](10) NULL,
	[DateOfBirth] [date] NULL,
	[Address] [nvarchar](500) NULL,
	[EnrollmentDate] [date] NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2/28/2024 9:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[RoleID] [int] NULL,
	[UserLoginID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdminProfile]  WITH CHECK ADD FOREIGN KEY([UserProfileID])
REFERENCES [dbo].[UserProfile] ([UserProfileID])
GO
ALTER TABLE [dbo].[Club]  WITH CHECK ADD FOREIGN KEY([ManagerProfileID])
REFERENCES [dbo].[ManagerProfile] ([ManagerProfileID])
GO
ALTER TABLE [dbo].[ClubMember]  WITH CHECK ADD FOREIGN KEY([ClubID])
REFERENCES [dbo].[Club] ([ClubID])
GO
ALTER TABLE [dbo].[ClubMember]  WITH CHECK ADD FOREIGN KEY([SemesterID])
REFERENCES [dbo].[Semester] ([SemesterID])
GO
ALTER TABLE [dbo].[ClubMember]  WITH CHECK ADD FOREIGN KEY([StudentProfileID])
REFERENCES [dbo].[StudentProfile] ([StudentProfileID])
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD FOREIGN KEY([AdminProfileID])
REFERENCES [dbo].[AdminProfile] ([AdminProfileID])
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD FOREIGN KEY([EventCategoryID])
REFERENCES [dbo].[EventCategory] ([EventCategoryID])
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD FOREIGN KEY([ManagerProfileID])
REFERENCES [dbo].[ManagerProfile] ([ManagerProfileID])
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD FOREIGN KEY([StudentProfileID])
REFERENCES [dbo].[StudentProfile] ([StudentProfileID])
GO
ALTER TABLE [dbo].[ManagerProfile]  WITH CHECK ADD FOREIGN KEY([UserProfileID])
REFERENCES [dbo].[UserProfile] ([UserProfileID])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([AdminProfileID])
REFERENCES [dbo].[AdminProfile] ([AdminProfileID])
GO
ALTER TABLE [dbo].[ParticipationEventDetail]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[ParticipationEventDetail]  WITH CHECK ADD FOREIGN KEY([StudentProfileID])
REFERENCES [dbo].[StudentProfile] ([StudentProfileID])
GO
ALTER TABLE [dbo].[StudentProfile]  WITH CHECK ADD FOREIGN KEY([UserProfileID])
REFERENCES [dbo].[UserProfile] ([UserProfileID])
GO
ALTER TABLE [dbo].[UserLogin]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserLogin]  WITH CHECK ADD FOREIGN KEY([UserProfileID])
REFERENCES [dbo].[UserProfile] ([UserProfileID])
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD FOREIGN KEY([UserLoginID])
REFERENCES [dbo].[UserLogin] ([UserLoginID])
GO
USE [master]
GO
ALTER DATABASE [SROMS] SET  READ_WRITE 
GO
