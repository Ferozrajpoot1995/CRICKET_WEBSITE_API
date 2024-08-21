USE [master]
GO
/****** Object:  Database [TayyabProject]    Script Date: 8/21/2024 6:12:59 PM ******/
CREATE DATABASE [TayyabProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TayyabProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TayyabProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TayyabProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TayyabProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TayyabProject] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TayyabProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TayyabProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TayyabProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TayyabProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TayyabProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TayyabProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [TayyabProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TayyabProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TayyabProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TayyabProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TayyabProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TayyabProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TayyabProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TayyabProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TayyabProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TayyabProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TayyabProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TayyabProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TayyabProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TayyabProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TayyabProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TayyabProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TayyabProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TayyabProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TayyabProject] SET  MULTI_USER 
GO
ALTER DATABASE [TayyabProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TayyabProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TayyabProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TayyabProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TayyabProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TayyabProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TayyabProject] SET QUERY_STORE = ON
GO
ALTER DATABASE [TayyabProject] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TayyabProject]
GO
/****** Object:  Table [dbo].[blog_posts]    Script Date: 8/21/2024 6:12:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog_posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[image_path] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 8/21/2024 6:12:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[MatchID] [int] NULL,
	[CommentText] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matches]    Script Date: 8/21/2024 6:12:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matches](
	[MatchID] [int] IDENTITY(1,1) NOT NULL,
	[HomeTeamID] [int] NULL,
	[AwayTeamID] [int] NULL,
	[MatchDate] [datetime] NOT NULL,
	[Venue] [nvarchar](100) NULL,
	[HomeTeamScore] [int] NULL,
	[AwayTeamScore] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 8/21/2024 6:12:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[PlayerID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerName] [nvarchar](100) NOT NULL,
	[TeamID] [int] NULL,
	[Position] [nvarchar](50) NULL,
	[JerseyNumber] [int] NULL,
	[Age] [int] NULL,
	[Nationality] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 8/21/2024 6:12:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[TeamID] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NULL,
	[CoachName] [nvarchar](100) NULL,
	[FoundedYear] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/21/2024 6:12:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[blog_posts] ON 
GO
INSERT [dbo].[blog_posts] ([id], [title], [description], [image_path], [created_at], [updated_at]) VALUES (1, N'Babar Azam bat price Shocking news', N'From making his debut in 2015 to winning the ICC Champions Trophy in 2017. And then becoming captain in 2019 to resigning as captain in 2023. The career of Babar Azam has everything. And there is no doubt that if not Babar started dominating cricket, this sport might be on death bed in Pakistan like other sports.
Considered as a big thing in world cricket will go down as one of the greats and that is for sure. In this post we won’t talk about his overall career, but only about his captaincy era from 2019 to 2023.

Starting days (2019–2020)
After the 2019 World Cup, when the news of a new captain was circulating, I was so happy because Babar was in the driving seat. And everyone knew that if they changed the captain, Babar would be the first choice because he was performing brilliantly at that time. Then they made him vice captain against SL in 2019, and not only me but everyone else could sense that he was so close to becoming captain. This joy was something else in those days because I never felt so happy about someone’s success as I felt about Babars.', N'./Images/babarazam.jpg', CAST(N'2024-08-13T00:21:00.000' AS DateTime), CAST(N'2024-08-14T00:21:00.000' AS DateTime))
GO
INSERT [dbo].[blog_posts] ([id], [title], [description], [image_path], [created_at], [updated_at]) VALUES (2, N'Virat Kohli Dismissal by leg spinners', N'Virat Kohli is an Indian cricketer and the current captain of the India national team12. He is a right-handed top-order batsman, who is regarded as one of the best contemporary batsmen in the world12. He also bowls occasionally as a right-arm medium pace bowler2. He plays for Royal Challengers Bangalore in the Indian Premier League (IPL), and has been the team''s captain since 20131. He is consistently rated as one of the top-ranked batsmen in the world, according to the ICC Player Rankings1.', N'./Images/Virat-Kohli.jpg', CAST(N'2024-08-06T15:02:00.000' AS DateTime), CAST(N'2024-08-06T15:02:00.000' AS DateTime))
GO
INSERT [dbo].[blog_posts] ([id], [title], [description], [image_path], [created_at], [updated_at]) VALUES (3, N'Anderson retirement from  cricket', N'After 188 Test matches, 704 wickets and 21 years, James Anderson’s England career is over. Those statistics alone make it incredible to think there was a point in the early days where he had doubts over whether he even had a future at international level.

Had it not been for the intervention of his family, who joined him at Lord''s for his emotional final Test as England stormed to an innings and 114 runs win over the West Indies inside three days, the seamer may have been lost to the team after missing the entire 2006 summer due to injury.', N'./Images/jpgnderson2.jpg', CAST(N'2024-08-06T15:08:00.000' AS DateTime), CAST(N'2024-08-06T15:08:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[blog_posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 
GO
INSERT [dbo].[Comments] ([CommentID], [UserID], [MatchID], [CommentText], [CreatedAt]) VALUES (1, 1, 1, N'Great match! Well played.', CAST(N'2024-06-01T00:21:41.110' AS DateTime))
GO
INSERT [dbo].[Comments] ([CommentID], [UserID], [MatchID], [CommentText], [CreatedAt]) VALUES (2, 2, 1, N'Exciting game till the last minute.', CAST(N'2024-06-01T00:21:41.110' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Matches] ON 
GO
INSERT [dbo].[Matches] ([MatchID], [HomeTeamID], [AwayTeamID], [MatchDate], [Venue], [HomeTeamScore], [AwayTeamScore], [CreatedAt], [UpdatedAt]) VALUES (1, 1, 2, CAST(N'2024-06-01T18:00:00.000' AS DateTime), N'Tiger Stadium', 2, 620, CAST(N'2024-06-01T00:21:41.107' AS DateTime), CAST(N'2024-06-01T00:21:41.107' AS DateTime))
GO
INSERT [dbo].[Matches] ([MatchID], [HomeTeamID], [AwayTeamID], [MatchDate], [Venue], [HomeTeamScore], [AwayTeamScore], [CreatedAt], [UpdatedAt]) VALUES (2, 1, 2, CAST(N'2024-08-17T23:36:00.000' AS DateTime), N'Islamabad', 230, 423, CAST(N'2024-08-01T20:33:41.317' AS DateTime), CAST(N'2024-08-01T20:33:41.317' AS DateTime))
GO
INSERT [dbo].[Matches] ([MatchID], [HomeTeamID], [AwayTeamID], [MatchDate], [Venue], [HomeTeamScore], [AwayTeamScore], [CreatedAt], [UpdatedAt]) VALUES (3, 1, 2, CAST(N'2024-08-28T20:48:00.000' AS DateTime), N'pindi', 1232, 12321, CAST(N'2024-08-01T20:48:44.943' AS DateTime), CAST(N'2024-08-01T20:48:44.943' AS DateTime))
GO
INSERT [dbo].[Matches] ([MatchID], [HomeTeamID], [AwayTeamID], [MatchDate], [Venue], [HomeTeamScore], [AwayTeamScore], [CreatedAt], [UpdatedAt]) VALUES (4, 1, 2, CAST(N'2024-08-17T20:49:00.000' AS DateTime), N'pindi', 454, 200, CAST(N'2024-08-01T20:49:44.700' AS DateTime), CAST(N'2024-08-01T20:49:44.700' AS DateTime))
GO
INSERT [dbo].[Matches] ([MatchID], [HomeTeamID], [AwayTeamID], [MatchDate], [Venue], [HomeTeamScore], [AwayTeamScore], [CreatedAt], [UpdatedAt]) VALUES (6, 4, 5, CAST(N'2024-08-20T14:21:00.000' AS DateTime), N'London', 250, 360, CAST(N'2024-08-10T14:21:59.073' AS DateTime), CAST(N'2024-08-10T14:21:59.073' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Matches] OFF
GO
SET IDENTITY_INSERT [dbo].[Players] ON 
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1007, N'Virat Kohli', 2, N'Batsman', 18, 35, N'Indian', CAST(N'2024-08-09T23:06:40.430' AS DateTime), CAST(N'2024-08-09T23:06:40.430' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1008, N'Rohit Sharma', 2, N'Batsman', 45, 37, N'Indian', CAST(N'2024-08-09T23:06:40.430' AS DateTime), CAST(N'2024-08-09T23:06:40.430' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1009, N'Jasprit Bumrah', 2, N'Bowler', 93, 30, N'Indian', CAST(N'2024-08-09T23:06:40.430' AS DateTime), CAST(N'2024-08-09T23:06:40.430' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1010, N'KL Rahul', 2, N'Batsman', 77, 31, N'Indian', CAST(N'2024-08-09T23:06:40.430' AS DateTime), CAST(N'2024-08-09T23:06:40.430' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1011, N'Rishabh Pant', 2, N'Wicketkeeper', 17, 26, N'Indian', CAST(N'2024-08-09T23:06:40.430' AS DateTime), CAST(N'2024-08-09T23:06:40.430' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1012, N'Hardik Pandya', 2, N'All-rounder', 33, 30, N'Indian', CAST(N'2024-08-09T23:06:40.430' AS DateTime), CAST(N'2024-08-09T23:06:40.430' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1013, N'Yuzvendra Chahal', 2, N'Bowler', 23, 33, N'Indian', CAST(N'2024-08-09T23:06:40.430' AS DateTime), CAST(N'2024-08-09T23:06:40.430' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1014, N'Bhuvneshwar Kumar', 2, N'Bowler', 15, 34, N'Indian', CAST(N'2024-08-09T23:06:40.430' AS DateTime), CAST(N'2024-08-09T23:06:40.430' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1015, N'Shubman Gill', 2, N'Batsman', 25, 24, N'Indian', CAST(N'2024-08-09T23:06:40.430' AS DateTime), CAST(N'2024-08-09T23:06:40.430' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1016, N'Suryakumar Yadav', 2, N'Batsman', 63, 33, N'Indian', CAST(N'2024-08-09T23:06:40.430' AS DateTime), CAST(N'2024-08-09T23:06:40.430' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1017, N'Axar Patel', 2, N'All-rounder', 8, 30, N'Indian', CAST(N'2024-08-09T23:06:40.430' AS DateTime), CAST(N'2024-08-09T23:06:40.430' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1018, N'Babar Azam', 1, N'Batsman', 56, 29, N'Pakistani', CAST(N'2024-08-09T23:07:15.630' AS DateTime), CAST(N'2024-08-09T23:07:15.630' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1019, N'Shaheen Afridi', 1, N'Bowler', 40, 24, N'Pakistani', CAST(N'2024-08-09T23:07:15.630' AS DateTime), CAST(N'2024-08-09T23:07:15.630' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1020, N'Fakhar Zaman', 1, N'Batsman', 16, 34, N'Pakistani', CAST(N'2024-08-09T23:07:15.630' AS DateTime), CAST(N'2024-08-09T23:07:15.630' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1021, N'Mohammad Rizwan', 1, N'Wicketkeeper', 17, 32, N'Pakistani', CAST(N'2024-08-09T23:07:15.630' AS DateTime), CAST(N'2024-08-09T23:07:15.630' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1022, N'Shadab Khan', 1, N'All-rounder', 6, 25, N'Pakistani', CAST(N'2024-08-09T23:07:15.630' AS DateTime), CAST(N'2024-08-09T23:07:15.630' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1023, N'Hasan Ali', 1, N'Bowler', 31, 30, N'Pakistani', CAST(N'2024-08-09T23:07:15.630' AS DateTime), CAST(N'2024-08-09T23:07:15.630' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1024, N'Haris Rauf', 1, N'Bowler', 52, 30, N'Pakistani', CAST(N'2024-08-09T23:07:15.630' AS DateTime), CAST(N'2024-08-09T23:07:15.630' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1025, N'Imam-ul-Haq', 1, N'Batsman', 8, 28, N'Pakistani', CAST(N'2024-08-09T23:07:15.630' AS DateTime), CAST(N'2024-08-09T23:07:15.630' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1026, N'Rauf Rauf', 1, N'Bowler', 85, 25, N'Pakistani', CAST(N'2024-08-09T23:07:15.630' AS DateTime), CAST(N'2024-08-09T23:07:15.630' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1027, N'Mohammad Nawaz', 1, N'All-rounder', 63, 29, N'Pakistani', CAST(N'2024-08-09T23:07:15.630' AS DateTime), CAST(N'2024-08-09T23:07:15.630' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1028, N'Junaid Khan', 1, N'Bowler', 90, 31, N'Pakistani', CAST(N'2024-08-09T23:07:15.630' AS DateTime), CAST(N'2024-08-09T23:07:15.630' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1029, N'Steve Smith', 4, N'Batsman', 49, 34, N'Australian', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1030, N'Pat Cummins', 4, N'Bowler', 30, 31, N'Australian', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1031, N'David Warner', 4, N'Batsman', 36, 37, N'Australian', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1032, N'Mitchell Starc', 4, N'Bowler', 56, 34, N'Australian', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1033, N'Josh Hazlewood', 4, N'Bowler', 48, 33, N'Australian', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1034, N'Glenn Maxwell', 4, N'All-Rounder', 23, 35, N'Australian', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1035, N'Marnus Labuschagne', 4, N'Batsman', 18, 29, N'Australian', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1036, N'Alex Carey', 4, N'Wicketkeeper', 7, 32, N'Australian', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1037, N'Usman Khawaja', 4, N'Batsman', 3, 37, N'Australian', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1038, N'Cameron Green', 4, N'All-Rounder', 66, 25, N'Australian', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1039, N'Travis Head', 4, N'Batsman', 9, 30, N'Australian', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1040, N'Ben Stokes', 5, N'All-Rounder', 55, 33, N'English', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1041, N'Joe Root', 5, N'Batsman', 66, 33, N'English', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1042, N'Stuart Broad', 5, N'Bowler', 8, 37, N'English', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1043, N'James Anderson', 5, N'Bowler', 9, 41, N'English', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1044, N'Jofra Archer', 5, N'Bowler', 20, 29, N'English', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1045, N'Jos Buttler', 5, N'Wicketkeeper', 63, 33, N'English', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1046, N'Sam Curran', 5, N'All-Rounder', 25, 26, N'English', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1047, N'Harry Brook', 5, N'Batsman', 7, 25, N'English', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1048, N'Ollie Pope', 5, N'Batsman', 9, 26, N'English', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1049, N'Dom Sibley', 5, N'Batsman', 14, 28, N'English', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Players] ([PlayerID], [PlayerName], [TeamID], [Position], [JerseyNumber], [Age], [Nationality], [CreatedAt], [UpdatedAt]) VALUES (1050, N'Chris Woakes', 5, N'All-Rounder', 19, 35, N'English', CAST(N'2024-01-10T09:00:00.000' AS DateTime), CAST(N'2024-08-01T12:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Players] OFF
GO
SET IDENTITY_INSERT [dbo].[Teams] ON 
GO
INSERT [dbo].[Teams] ([TeamID], [TeamName], [City], [CoachName], [FoundedYear], [CreatedAt], [UpdatedAt]) VALUES (1, N'Pakistan', N'New York', N'Mike Johnson', 1990, CAST(N'2024-06-01T00:21:41.107' AS DateTime), CAST(N'2024-06-01T00:21:41.107' AS DateTime))
GO
INSERT [dbo].[Teams] ([TeamID], [TeamName], [City], [CoachName], [FoundedYear], [CreatedAt], [UpdatedAt]) VALUES (2, N'India', N'Los Angeles', N'Sarah Connor', 1985, CAST(N'2024-06-01T00:21:41.107' AS DateTime), CAST(N'2024-06-01T00:21:41.107' AS DateTime))
GO
INSERT [dbo].[Teams] ([TeamID], [TeamName], [City], [CoachName], [FoundedYear], [CreatedAt], [UpdatedAt]) VALUES (4, N'Australia', N'Sydeny', N'Mathew Hyden', 1890, CAST(N'2024-08-10T14:20:20.997' AS DateTime), CAST(N'2024-08-10T14:20:20.997' AS DateTime))
GO
INSERT [dbo].[Teams] ([TeamID], [TeamName], [City], [CoachName], [FoundedYear], [CreatedAt], [UpdatedAt]) VALUES (5, N'England', N'London', N'Brandon Macullum', 1890, CAST(N'2024-08-10T14:20:47.423' AS DateTime), CAST(N'2024-08-10T14:20:47.423' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Teams] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Email], [FullName], [CreatedAt], [UpdatedAt]) VALUES (5, N'ferozrajpoot1995', N'Feroz0312@', N'ferozrajpoot1995@GMAIL.COM', N'feroz a raj', CAST(N'2024-07-06T01:55:22.433' AS DateTime), CAST(N'2024-07-06T01:55:22.433' AS DateTime))
GO
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Email], [FullName], [CreatedAt], [UpdatedAt]) VALUES (15, N'ferozrajpoot1996', N'123', N'ferozrajpoot96@gmail.com', N'feroz a raj', CAST(N'2024-07-08T20:58:02.593' AS DateTime), CAST(N'2024-07-08T20:58:02.593' AS DateTime))
GO
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Email], [FullName], [CreatedAt], [UpdatedAt]) VALUES (18, N'ferozrajpoot1999', N'', N'ferozrajpoot90@gmail.com', N'feroz a raj', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Email], [FullName], [CreatedAt], [UpdatedAt]) VALUES (23, N'Tayyab', N'Tayyab1234', N'tayyab1234@gmail.com', N'Tayyab', CAST(N'2024-08-10T14:36:28.207' AS DateTime), CAST(N'2024-08-10T14:36:28.207' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IDX_Matches_MatchDate]    Script Date: 8/21/2024 6:12:59 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Matches_MatchDate] ON [dbo].[Matches]
(
	[MatchDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Players_PlayerName]    Script Date: 8/21/2024 6:12:59 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Players_PlayerName] ON [dbo].[Players]
(
	[PlayerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Teams__4E21CAAC60890D8D]    Script Date: 8/21/2024 6:12:59 PM ******/
ALTER TABLE [dbo].[Teams] ADD UNIQUE NONCLUSTERED 
(
	[TeamName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Teams_TeamName]    Script Date: 8/21/2024 6:12:59 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Teams_TeamName] ON [dbo].[Teams]
(
	[TeamName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E46796AD66]    Script Date: 8/21/2024 6:12:59 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534A8ACAF82]    Script Date: 8/21/2024 6:12:59 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[blog_posts] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[blog_posts] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Matches] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Matches] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Players] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Players] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Teams] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Teams] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([MatchID])
REFERENCES [dbo].[Matches] ([MatchID])
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD FOREIGN KEY([AwayTeamID])
REFERENCES [dbo].[Teams] ([TeamID])
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD FOREIGN KEY([HomeTeamID])
REFERENCES [dbo].[Teams] ([TeamID])
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD FOREIGN KEY([TeamID])
REFERENCES [dbo].[Teams] ([TeamID])
GO
USE [master]
GO
ALTER DATABASE [TayyabProject] SET  READ_WRITE 
GO
