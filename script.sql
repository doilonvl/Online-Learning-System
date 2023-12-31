USE [master]
GO
/****** Object:  Database [SWP391_Project]    Script Date: 26/07/2023 09:12:42 ******/
CREATE DATABASE [SWP391_Project]
GO
USE [SWP391_Project]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 26/07/2023 09:12:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[blog_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nchar](255) NULL,
	[author] [int] NULL,
	[image] [nvarchar](max) NULL,
	[brief_infor] [nvarchar](500) NULL,
	[createDate] [date] NULL,
	[blog_content] [nvarchar](500) NULL,
	[cate_id] [int] NULL,
	[status] [bit] NULL,
	[thumbnail] [nvarchar](100) NULL,
	[flag] [nvarchar](100) NULL,
	[dateModified] [date] NULL,
	[numberOfAccess] [int] NULL,
 CONSTRAINT [PK__Blog__2975AA28D2EE56E2] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoryBlog]    Script Date: 26/07/2023 09:12:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoryBlog](
	[categoryBlog_id] [int] IDENTITY(1,1) NOT NULL,
	[categoryBlog_name] [nchar](150) NULL,
 CONSTRAINT [PK__category__4FDD92CAA9D4C000] PRIMARY KEY CLUSTERED 
(
	[categoryBlog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryCourse]    Script Date: 26/07/2023 09:12:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryCourse](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 26/07/2023 09:12:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](150) NULL,
	[title] [nchar](150) NULL,
	[original_price] [money] NULL,
	[sale_price] [money] NULL,
	[brief_infor] [nchar](150) NULL,
	[cate_id] [int] NULL,
	[sale_id] [int] NULL,
	[image] [nvarchar](max) NULL,
	[course_date] [date] NULL,
	[user_id] [int] NULL,
	[lessons] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK__Course__8F1EF7AEE4EB3AAE] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lesson]    Script Date: 26/07/2023 09:12:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lesson](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subject_id] [int] NOT NULL,
	[topic_id] [int] NOT NULL,
	[name] [varchar](20) NOT NULL,
	[type_id] [int] NOT NULL,
	[order] [int] NULL,
	[video_link] [nvarchar](550) NULL,
	[html_content] [ntext] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_LESSON] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lesson_topic]    Script Date: 26/07/2023 09:12:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lesson_topic](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_LESSON_TOPIC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lesson_type]    Script Date: 26/07/2023 09:12:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lesson_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_LESSON_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[price_package]    Script Date: 26/07/2023 09:12:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[price_package](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[duration] [int] NOT NULL,
	[price] [money] NOT NULL,
	[sale] [decimal](18, 0) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_PRICE_PACKAGE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registration]    Script Date: 26/07/2023 09:12:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registration](
	[registration_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[price_package_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[created] [datetime] NOT NULL,
	[regis_status] [nvarchar](50) NULL,
 CONSTRAINT [PK_REGISTRATION] PRIMARY KEY CLUSTERED 
(
	[registration_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 26/07/2023 09:12:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](10) NOT NULL,
 CONSTRAINT [PK_ROLE] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 26/07/2023 09:12:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting](
	[setting_id] [int] IDENTITY(1,1) NOT NULL,
	[setting_name] [nvarchar](50) NULL,
	[type] [int] NULL,
	[value] [nvarchar](50) NULL,
	[order] [int] NULL,
	[status] [bit] NULL,
	[description] [nvarchar](150) NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[setting_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[slider]    Script Date: 26/07/2023 09:12:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[slider](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[image] [varchar](255) NOT NULL,
	[backlink] [varchar](255) NOT NULL,
	[status] [bit] NOT NULL,
	[created] [datetime] NOT NULL,
	[modified] [datetime] NULL,
 CONSTRAINT [PK_SLIDER] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 26/07/2023 09:12:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[address] [nvarchar](150) NULL,
	[phone_number] [nvarchar](150) NULL,
	[verification_code] [nvarchar](150) NULL,
	[is_verified] [bit] NULL,
	[status] [bit] NULL,
	[role_id] [int] NULL,
	[image] [nvarchar](250) NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([blog_id], [title], [author], [image], [brief_infor], [createDate], [blog_content], [cate_id], [status], [thumbnail], [flag], [dateModified], [numberOfAccess]) VALUES (1, N'Ạbkjdsa                                                                                                                                                                                                                                                        ', 1, N'image/courses_1.jpg', N'Trong suốt khóa học, học viên sẽ được  vvdsfvsdfsdhướng dẫn về cách xác định mục tiêu, lập kế hoạch và quản lý                                                                                                                                                                                                                                                                                                                                                                                                      ', CAST(N'2023-05-28' AS Date), N'Trong suốt khóa học, học viên sẽ được fdsfdsfdsfdshướng dẫn về cách xác định mục tiêu, lập kế hoạch và quản lý  trongggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg                                                                                                                                                                                                                                          ', 3, 0, N'image/courses_1.jpg', N'OFF', CAST(N'2023-06-27' AS Date), NULL)
INSERT [dbo].[Blog] ([blog_id], [title], [author], [image], [brief_infor], [createDate], [blog_content], [cate_id], [status], [thumbnail], [flag], [dateModified], [numberOfAccess]) VALUES (2, N'         abcde                                                                                                                                                                                                                                                 ', 2, N'image/course_1.jpg', N'Trong suốt khóa học, học viên sẽ được dsadsahướng dẫn về cách xác định mục tiêu, lập kế hoạch và quản lý                                                                                                                                                                                                                                                                                                                                                                                                            ', CAST(N'2020-06-06' AS Date), N'Trong suốt khóa học, học viên sẽ được dsadsahướng dẫn về cách xác định mục tiêu, lập kế hoạch và quản lý  trongggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg                                                                                                                                                                                                                                                ', 1, 1, N'image/course_1.jpg', N'ON', CAST(N'2023-07-13' AS Date), 47)
INSERT [dbo].[Blog] ([blog_id], [title], [author], [image], [brief_infor], [createDate], [blog_content], [cate_id], [status], [thumbnail], [flag], [dateModified], [numberOfAccess]) VALUES (3, N'Title3                                                                                                                                                                                                                                                         ', 3, N'image/courses_3.jpg', N'Trong suốt khóa học, học viên sẽ được hướng dẫn về cách xác định mục tiêu, lập kế hoạch và quản lý                                                                                                                                                                                                                                                                                                                                                                                                                  ', CAST(N'2022-09-30' AS Date), N'Trong suốt khóa học, học viên sẽ được hướng dẫn về cách xác định mục tiêu, lập kế hoạch và quản lý  trongggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg                                                                                                                                                                                                                                                      ', 3, 1, NULL, NULL, NULL, 1)
INSERT [dbo].[Blog] ([blog_id], [title], [author], [image], [brief_infor], [createDate], [blog_content], [cate_id], [status], [thumbnail], [flag], [dateModified], [numberOfAccess]) VALUES (4, N'Title4                                                                                                                                                                                                                                                         ', 4, N'image/courses_4.jpg', N'Trong suốt khóa học, học viên sẽ được hướng dẫn về cách xác định mục tiêu, lập kế hoạch và quản lý                                                                                                                                                                                                                                                                                                                                                                                                                  ', CAST(N'2021-01-20' AS Date), N'Trong suốt khóa học, học viên sẽ được hướng dẫn về cách xác định mục tiêu, lập kế hoạch và quản lý  trongggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg                                                                                                                                                                                                                                                      ', 1, 1, NULL, NULL, NULL, 1)
INSERT [dbo].[Blog] ([blog_id], [title], [author], [image], [brief_infor], [createDate], [blog_content], [cate_id], [status], [thumbnail], [flag], [dateModified], [numberOfAccess]) VALUES (5, N'Title5                                                                                                                                                                                                                                                         ', 5, N'image/courses_5.jpg', N'Trong suốt khóa học, học viên sẽ được hướng dẫn về cách xác định mục tiêu, lập kế hoạch và quản lý                                                                                                                                                                                                                                                                                                                                                                                                                  ', CAST(N'2022-06-22' AS Date), N'Trong suốt khóa học, học viên sẽ được hướng dẫn về cách xác định mục tiêu, lập kế hoạch và quản lý  trongggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg                                                                                                                                                                                                                                                      ', 2, 1, NULL, NULL, NULL, 1)
INSERT [dbo].[Blog] ([blog_id], [title], [author], [image], [brief_infor], [createDate], [blog_content], [cate_id], [status], [thumbnail], [flag], [dateModified], [numberOfAccess]) VALUES (6, N'Title6                                                                                                                                                                                                                                                         ', 3, N'image/courses_6.jpg', N'Trong suốt khóa học, học viên sẽ được hướng dẫn về cách xác định mục tiêu, lập kế hoạch và quản lý                                                                                                                                                                                                                                                                                                                                                                                                                  ', CAST(N'2023-04-23' AS Date), N'Trong suốt khóa học, học viên sẽ được hướng dẫn về cách xác định mục tiêu, lập kế hoạch và quản lý  trongggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg                                                                                                                                                                                                                                                      ', 3, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Blog] ([blog_id], [title], [author], [image], [brief_infor], [createDate], [blog_content], [cate_id], [status], [thumbnail], [flag], [dateModified], [numberOfAccess]) VALUES (7, N'Title7                                                                                                                                                                                                                                                         ', 2, N'image/courses_7.jpg', N'Trong suốt khóa học, học viên sẽ được hướng dẫn về cách xác định mục tiêu, lập kế hoạch và quản lý                                                                                                                                                                                                                                                                                                                                                                                                                  ', CAST(N'2022-06-22' AS Date), N'Trong suốt khóa học, học viên sẽ được hướng dẫn về cách xác định mục tiêu, lập kế hoạch và quản lý  trongggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg                                                                                                                                                                                                                                                      ', 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Blog] ([blog_id], [title], [author], [image], [brief_infor], [createDate], [blog_content], [cate_id], [status], [thumbnail], [flag], [dateModified], [numberOfAccess]) VALUES (8, N'Title8                                                                                                                                                                                                                                                         ', 1, N'image/courses_8.jpg', N'Trong suốt khóa học, học viên sẽ được hướng dẫn về cách xác định mục tiêu, lập kế hoạch và quản lý                                                                                                                                                                                                                                                                                                                                                                                                                  ', CAST(N'2023-05-01' AS Date), N'Trong suốt khóa học, học viên sẽ được hướng dẫn về cách xác định mục tiêu, lập kế hoạch và quản lý  trongggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg                                                                                                                                                                                                                                                      ', 1, 1, NULL, NULL, NULL, 3)
INSERT [dbo].[Blog] ([blog_id], [title], [author], [image], [brief_infor], [createDate], [blog_content], [cate_id], [status], [thumbnail], [flag], [dateModified], [numberOfAccess]) VALUES (9, N'Blog nam                                                                                                                                                                                                                                                       ', 1, N'image/courses_8.jpg', N'Blog nam', CAST(N'2023-05-01' AS Date), N'sadfsd', 1, 1, NULL, NULL, NULL, 1)
INSERT [dbo].[Blog] ([blog_id], [title], [author], [image], [brief_infor], [createDate], [blog_content], [cate_id], [status], [thumbnail], [flag], [dateModified], [numberOfAccess]) VALUES (10, N'Blog nam2                                                                                                                                                                                                                                                      ', 2, N'image/courses_8.jpg', N'ưaesdfcsadc', CAST(N'2023-05-01' AS Date), N'sadfsd', 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Blog] ([blog_id], [title], [author], [image], [brief_infor], [createDate], [blog_content], [cate_id], [status], [thumbnail], [flag], [dateModified], [numberOfAccess]) VALUES (11, N'Blog nam2                                                                                                                                                                                                                                                      ', 1, N'image/courses_8.jpg', N'ưaesdfcsadc', CAST(N'2021-01-20' AS Date), N'cczxcc', 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Blog] ([blog_id], [title], [author], [image], [brief_infor], [createDate], [blog_content], [cate_id], [status], [thumbnail], [flag], [dateModified], [numberOfAccess]) VALUES (12, N'Heloo                                                                                                                                                                                                                                                          ', 2, N'image/courses_5.jpg', N'Trong suốt khóa học, học viên sẽ được hướng dẫn về cách xác định mục tiêu, lập kế hoạch và quản lý                                                                                                                                                                                                                                                                                                                                                                                                                  ', CAST(N'2021-01-20' AS Date), N'Trong suốt khóa học, học viên sẽ được hướng dẫn về cách xác định mục tiêu, lập kế hoạch và quản lý  trongggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg                                                                                                                                                                                                                                                      ', 1, 1, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[categoryBlog] ON 

INSERT [dbo].[categoryBlog] ([categoryBlog_id], [categoryBlog_name]) VALUES (1, N'Kids Education                                                                                                                                        ')
INSERT [dbo].[categoryBlog] ([categoryBlog_id], [categoryBlog_name]) VALUES (2, N'Finance                                                                                                                                               ')
INSERT [dbo].[categoryBlog] ([categoryBlog_id], [categoryBlog_name]) VALUES (3, N'Article                                                                                                                                               ')
SET IDENTITY_INSERT [dbo].[categoryBlog] OFF
GO
INSERT [dbo].[CategoryCourse] ([id], [name]) VALUES (1, N'Front-end ')
INSERT [dbo].[CategoryCourse] ([id], [name]) VALUES (2, N'Back-end ')
INSERT [dbo].[CategoryCourse] ([id], [name]) VALUES (3, N'Java Core')
INSERT [dbo].[CategoryCourse] ([id], [name]) VALUES (4, N'Java Web')
INSERT [dbo].[CategoryCourse] ([id], [name]) VALUES (5, N'JavaScript from Zero')
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (1, N'Learn HTML 1                                                                                                                                          ', N'Learn HTML                                                                                                                                            ', 1000000000.0000, 1000000000.0000, N'Master cutting-edge programming skills and prepare for a high-growth tech career                                                                      ', 2, 1, N'image/ggg.png', CAST(N'2023-05-22' AS Date), 9, 8, 1)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (2, N'SQL server                                                                                                                                            ', N'SQL server                                                                                                                                            ', 10000000.0000, 10000000.0000, N'Skills you will gain: Using version control, python programming, automation                                                                           ', 2, 1, N'image/course_2.jpg', CAST(N'2023-02-19' AS Date), 2, 4, 1)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (3, N'Advanced with SQL                                                                                                                                     ', N'Advanced with SQL                                                                                                                                     ', 1000.0000, 1000.0000, N'Explore a Career as a Software Engineer. Learn the basics of programming and software development                                                     ', 2, 1, N'image/course_3.jpg', CAST(N'2022-06-22' AS Date), 3, 6, 0)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (4, N'Learn CSS                                                                                                                                             ', N'Learn CSS                                                                                                                                             ', 10.0000, 10.0000, N'Learn in-demand skills like Python, Git, and IT automation to advance your career                                                                     ', 1, 1, N'image/course_4.png', CAST(N'2021-05-22' AS Date), 1, 7, 1)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (5, N'Java tutorial                                                                                                                                         ', N'Java tutorial                                                                                                                                         ', 10000000.0000, 10000000.0000, N'Learn the fundamentals of blockchain technology. Featuring Don Tapscott, world-renowned expert on business innovation and technology                  ', 3, 1, N'image/course_5.jpg', CAST(N'2023-01-12' AS Date), 1, 8, 1)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (6, N'Bootstrap framework                                                                                                                                   ', N'Bootstrap framework                                                                                                                                   ', 1000000.0000, 1000000.0000, N'This course will provide you with the key knowledge and tools to understand the fundamentals and practical implications of precision medicine         ', 1, 1, N'image/course_6.jpg', CAST(N'2020-09-30' AS Date), 1, 9, 1)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (7, N'Sort Algorthrim                                                                                                                                       ', N'Sort Algorthrim                                                                                                                                       ', 10.0000, 10.0000, N'This course will provide you with the key knowledge and tools to understand the fundamentals and practical implications of precision medicine         ', 3, 1, N'image/course_7.jpg', CAST(N'2022-11-19' AS Date), 1, 10, 0)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (8, N'Java Servlet                                                                                                                                          ', N'Java Servlet                                                                                                                                          ', 111111.0000, 1111.0000, N'Nasdasdasdasdasdad                                                                                                                                    ', 2, 1, N'image/course_8.jpg', CAST(N'2022-11-19' AS Date), 1, 6, 1)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (9, N'MongoDB                                                                                                                                               ', N'MongoDB                                                                                                                                               ', 11111.0000, 111.0000, N'This course will provide you with the key knowledge and tools to understand the fundamentals and practical implications of precision medicine         ', 2, 1, N'image/course_9.jpg', CAST(N'2023-01-12' AS Date), 2, 6, 0)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (10, N'Nodejs                                                                                                                                                ', N'Nodejs                                                                                                                                                ', 222222.0000, 2222.0000, N'Explore a Career as a Software Engineer. Learn the basics of programming and software development                                                     ', 1, 1, N'image/course_10.png', CAST(N'2020-09-30' AS Date), 3, 5, 1)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (11, N'Reactjs                                                                                                                                               ', N'Reactjs                                                                                                                                               ', 111.0000, 11.0000, N'Explore a Career as a Software Engineer. Learn the basics of programming and software development                                                     ', 1, 1, N'image/course_11.jpg', CAST(N'2022-09-13' AS Date), 1, 1, 0)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (12, N'Java Spring                                                                                                                                           ', N'Java Spring                                                                                                                                           ', 123.0000, 12.0000, N'Explore a Career as a Software Engineer. Learn the basics of programming and software development                                                     ', 4, 1, N'image/course_12.jpg', CAST(N'2022-06-06' AS Date), 1, 9, 1)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (13, N'Nextjs                                                                                                                                                ', N'Nextjs                                                                                                                                                ', 99999.0000, 999.0000, N'Master cutting-edge programming skills and prepare for a high-growth tech career                                                                      ', 1, 1, N'image/course_13.jpg', CAST(N'2022-06-13' AS Date), 1, 4, 1)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (14, N'javaScript basic                                                                                                                                      ', N'javaScript basic                                                                                                                                      ', 999.0000, 99.0000, N'This course will provide you with the key knowledge and tools to understand the fundamentals and practical implications of precision medicine         ', 5, 1, N'image/course_14.jpg', CAST(N'2023-04-04' AS Date), 1, 7, 1)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (15, N'Jquery                                                                                                                                                ', N'Jquery                                                                                                                                                ', 9999.0000, 99.0000, N'This course will provide you with the key knowledge and tools to understand the fundamentals and practical implications of precision medicine         ', 5, 1, N'image/course_15.jpg', CAST(N'2023-06-26' AS Date), 1, 5, 1)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (16, N'Java OOP                                                                                                                                              ', N'Java OOP                                                                                                                                              ', 9999.0000, 99.0000, N'This course will provide you with the key knowledge and tools to understand the fundamentals and practical implications of precision medicine         ', 3, 1, N'image/course_16.jpg', CAST(N'2022-01-01' AS Date), 1, 11, 1)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (17, N'AJAX                                                                                                                                                  ', N'AJAX                                                                                                                                                  ', 999.0000, 99.0000, N'This course will provide you with the key knowledge and tools to understand the fundamentals and practical implications of precision medicine         ', 5, 1, N'image/course_17.jpg', CAST(N'2023-06-06' AS Date), 1, 8, 0)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (18, N'JS OOP                                                                                                                                                ', N'JS OOP                                                                                                                                                ', 8888.0000, 88.0000, N'This course will provide you with the key knowledge and tools to understand the fundamentals and practical implications of precision medicine         ', 5, 1, N'image/course_18.jpg', CAST(N'2023-06-06' AS Date), 1, 8, 1)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (19, N'JSP 2                                                                                                                                                 ', NULL, NULL, NULL, N'afdsaf                                                                                                                                                ', 1, NULL, N'image/ggg.png', CAST(N'2023-07-24' AS Date), 9, NULL, 1)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (20, N'JAVA CORE                                                                                                                                             ', NULL, NULL, NULL, N'cbdw                                                                                                                                                  ', 3, NULL, N'image/ggg.png', CAST(N'2023-07-24' AS Date), 9, NULL, 1)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (21, N'Learn HTML 2                                                                                                                                          ', NULL, NULL, NULL, N'Master cutting-edge programming skills and prepare for a high-growth tech career    ss                                                                ', 4, NULL, N'image/ggg.png', CAST(N'2023-07-24' AS Date), 9, NULL, 1)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (22, N'Learn HTML8 s       ss                                                                                                                                ', NULL, NULL, NULL, N'Master cutting-edge programming skills and prepare for a high-growth tech career                                                                      ', 1, NULL, N'image/ggg.png', CAST(N'2023-07-24' AS Date), 9, NULL, 1)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (23, N'JCVO  24                                                                                                                                              ', NULL, NULL, NULL, N'asdcsdac                                                                                                                                              ', 2, NULL, N'image/ggg.png', CAST(N'2023-07-24' AS Date), 9, NULL, 1)
INSERT [dbo].[Course] ([course_id], [name], [title], [original_price], [sale_price], [brief_infor], [cate_id], [sale_id], [image], [course_date], [user_id], [lessons], [status]) VALUES (25, N'cccc                                                                                                                                                  ', NULL, NULL, NULL, N'aDSDSADSA                                                                                                                                             ', 1, NULL, N'image/gioi-thieu-ve-html-ngon-ngu-web-pho-bien-nhat-hien-nay-1024x557.png', CAST(N'2023-07-26' AS Date), 9, NULL, 1)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[lesson] ON 

INSERT [dbo].[lesson] ([id], [subject_id], [topic_id], [name], [type_id], [order], [video_link], [html_content], [status]) VALUES (17, 1, 1, N'fsdsd', 1, 1, N'dfvzffs', N'<p>', 1)
INSERT [dbo].[lesson] ([id], [subject_id], [topic_id], [name], [type_id], [order], [video_link], [html_content], [status]) VALUES (18, 2, 2, N'dsgdgs', 2, 2, N'ffdsfd', N'<p>dcs</p>

<p><img src=&quot;https://img-cache.coccoc.com/image2?i=1&amp;l=32/920952192&quot; style=&quot;height:1100px; width:2600px&quot; /></p>
', 1)
INSERT [dbo].[lesson] ([id], [subject_id], [topic_id], [name], [type_id], [order], [video_link], [html_content], [status]) VALUES (19, 2, 1, N'vdds', 1, 5, N'dsgdsgdsf', N'<p><img alt=&quot;&quot; src=&quot;https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHZAq08u4YaR0Jsu2CgeptdxC74y-9QEeFYEAb6YHP&amp;s&quot; style=&quot;height:123px; width:164px&quot; />dsgdsgsd</p>
', 1)
INSERT [dbo].[lesson] ([id], [subject_id], [topic_id], [name], [type_id], [order], [video_link], [html_content], [status]) VALUES (20, 2, 1, N'gfnfgn', 1, 5, N'gfdgd', N'<p>ergergernbvbfb</p>
', 1)
SET IDENTITY_INSERT [dbo].[lesson] OFF
GO
SET IDENTITY_INSERT [dbo].[lesson_topic] ON 

INSERT [dbo].[lesson_topic] ([id], [name]) VALUES (1, N'sdgv')
INSERT [dbo].[lesson_topic] ([id], [name]) VALUES (2, N'dfg')
SET IDENTITY_INSERT [dbo].[lesson_topic] OFF
GO
SET IDENTITY_INSERT [dbo].[lesson_type] ON 

INSERT [dbo].[lesson_type] ([id], [name]) VALUES (1, N'fb')
INSERT [dbo].[lesson_type] ([id], [name]) VALUES (2, N'trh')
SET IDENTITY_INSERT [dbo].[lesson_type] OFF
GO
SET IDENTITY_INSERT [dbo].[price_package] ON 

INSERT [dbo].[price_package] ([id], [duration], [price], [sale], [status]) VALUES (1, 1, 100000.0000, CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[price_package] ([id], [duration], [price], [sale], [status]) VALUES (2, 7, 200000.0000, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[price_package] ([id], [duration], [price], [sale], [status]) VALUES (3, 30, 300000.0000, CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[price_package] ([id], [duration], [price], [sale], [status]) VALUES (4, 90, 400000.0000, CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[price_package] ([id], [duration], [price], [sale], [status]) VALUES (5, 360, 500000.0000, CAST(0 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[price_package] OFF
GO
SET IDENTITY_INSERT [dbo].[registration] ON 

INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (18, 4, 4, 3, CAST(N'2023-05-22T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (28, 5, 1, 3, CAST(N'2023-06-08T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (29, 5, 4, 3, CAST(N'2023-05-07T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (30, 5, 2, 3, CAST(N'2023-05-28T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (32, 4, 3, 4, CAST(N'2023-06-08T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (34, 4, 5, 4, CAST(N'2023-05-28T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (35, 1, 1, 1, CAST(N'2023-05-22T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (36, 2, 3, 1, CAST(N'2023-06-08T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (37, 3, 4, 1, CAST(N'2023-05-07T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (38, 4, 1, 1, CAST(N'2023-05-28T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (43, 1, 1, 3, CAST(N'2023-05-22T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (44, 5, 1, 3, CAST(N'2023-06-08T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (45, 5, 4, 3, CAST(N'2023-05-07T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (46, 5, 2, 3, CAST(N'2023-05-28T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (50, 4, 5, 4, CAST(N'2023-05-28T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (51, 1, 1, 1, CAST(N'2023-06-09T10:31:59.023' AS DateTime), NULL)
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (52, 1, 1, 1, CAST(N'2023-06-09T10:36:34.640' AS DateTime), NULL)
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (53, 1, 1, 1, CAST(N'2023-06-09T11:18:39.053' AS DateTime), NULL)
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (54, 4, 2, 2, CAST(N'2023-05-22T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (58, 5, 5, 2, CAST(N'2023-04-02T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (60, 4, 4, 2, CAST(N'2023-06-02T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (63, 6, 1, 2, CAST(N'2023-05-22T00:00:00.000' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (66, 21, 4, 1, CAST(N'2023-07-24T23:02:16.003' AS DateTime), N'Done')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (67, 6, 3, 1, CAST(N'2023-07-25T21:58:34.080' AS DateTime), N'Submitted')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (68, 5, 1, 1, CAST(N'2023-07-25T22:08:43.550' AS DateTime), N'Submitted')
INSERT [dbo].[registration] ([registration_id], [course_id], [price_package_id], [user_id], [created], [regis_status]) VALUES (69, 9, 5, 1, CAST(N'2023-07-26T00:21:39.427' AS DateTime), N'Done')
SET IDENTITY_INSERT [dbo].[registration] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([role_id], [role_name]) VALUES (1, N'Customer')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (2, N'Marketing')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (3, N'Sale')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (4, N'Expert')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (5, N'Admin')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[Setting] ON 

INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (1, N'Customer', 1, N'My Course', 2, 1, N'If the registration is still in the submitted status, the users can choose to cancel it or comming back to the Course Register pop-up to edit it)')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (2, N'Customer', 1, N'My Registration', 2, 0, N'for the customer to view his/her access-allowed courses')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (3, N'Marketing', 2, N'Slider List', 3, 0, N'Show the paginated list of sliders (including sliders'' id, title, image, backlink, status)')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (4, N'Marketing', 2, N'Slider Detail', 2, 1, N'Show detailed slider information (image, title, backlink, status, notes)')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (5, N'Admin', 5, N'User List', 1, 1, N'Show the paginated list of registered users (include users'' id, full name, gender, email, mobile, role, status)')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (6, N'Admin', 5, N'User Detail', 3, 0, N'Show detailed user information (avatar, full name, gender, email, mobile, role, address, status), from that allow the user to add new')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (7, N'Admin', 5, N'Setting List', 2, 0, N'Show the paginated list of settings (include settings'' id, type, value, order, status)')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (8, N'Admin', 5, N'Setting Detail', 4, 1, N'Show detailed user information (type, value, order, description, status), from that allow the user to add new, view or edit setting information')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (9, N'Expert', 4, N'Subject List', 3, 0, N'Show the list of course paginatedly. The shown information for each subject include the id, name, category, number of lessons, owner, and status')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (10, N'Marketing', 4, N'Dashboard', 5, 0, N'Show statistics of new subjects (new, all), new registrations (success, cancelled, submitted)')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (11, N'Expert', 1, N'Subject Details', 2, 1, N'This page allows the admin and the assigned expert to access and prepare the subject information')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (12, N'Sale', 3, N'Registrations List', 1, 1, N'Show the list of users'' registrations')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (13, N'Sale', 3, N'Registration Details', 1, 1, N'Show detailed registration information (subject, package with list price/sale price, full name, gender, email, mobile), registration time, sale')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (14, N'Marketing', 2, N'Post Details', 1, 1, N'Show detailed post information (thumbnail, category, title, brief information,  description, flag to turn the featurning on/off, status)')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (15, NULL, 1, N'sadsadas', 1, 0, N'qweqe')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (16, N'ádhjgdsahgjdsag', 1, N'jhdhjs dakskjdsa', 5, 0, N'dasdsadasdasdsa')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (17, N'dsadsa', 1, N'sadasdsa', 7, 0, N'ddsadsadsaads')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (18, N'Lesson', 1, N'My course', 2, 0, N'Lesson view to view ')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (19, N'mncxc', 1, N'sdadsasd', 3, 0, N'áddsaasd')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (20, N'ccssaasd', 1, N'dasddsa', 2, 0, N'dsdsasdsd')
INSERT [dbo].[Setting] ([setting_id], [setting_name], [type], [value], [order], [status], [description]) VALUES (21, N'nnnnnnnnnnnnn', 2, N'gf', 3, 0, N'daaaaaaaasdssda')
SET IDENTITY_INSERT [dbo].[Setting] OFF
GO
SET IDENTITY_INSERT [dbo].[slider] ON 

INSERT [dbo].[slider] ([id], [title], [image], [backlink], [status], [created], [modified]) VALUES (2, N'Chegg', N'https://i.pcmag.com/imagery/reviews/07buAANY8wyfRXvDdbCtlw7-1.fit_scale.size_760x427.v1617389466.png', N'https://www.chegg.com/', 1, CAST(N'2023-06-07T00:34:04.263' AS DateTime), NULL)
INSERT [dbo].[slider] ([id], [title], [image], [backlink], [status], [created], [modified]) VALUES (3, N'Coursera', N'image/abc.jpg', N'https://www.coursera.org/', 0, CAST(N'2023-06-07T00:34:04.263' AS DateTime), CAST(N'2023-06-28T08:47:03.233' AS DateTime))
INSERT [dbo].[slider] ([id], [title], [image], [backlink], [status], [created], [modified]) VALUES (4, N'EdX', N'https://edx.org/contentful/ii9ehdcj88bc/24nI9FEfxhYsu4JtOI8esA/6405f3a237472501ca21a3ffcfa1cdc4/edx-homepage-preview.png?w=1116&h=585&fm=webp', N'https://www.edx.org/', 1, CAST(N'2023-06-07T00:34:04.263' AS DateTime), NULL)
INSERT [dbo].[slider] ([id], [title], [image], [backlink], [status], [created], [modified]) VALUES (5, N'FAP', N'https://it.fpt.edu.vn/wp-content/uploads/2022/01/2021-FPTU-Eng.jpg', N'https://fap.fpt.edu.vn/Default.aspx', 1, CAST(N'2023-06-07T00:34:04.263' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[slider] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (1, N'Phùng Quang Mạnh', N'quangmanh279123312@gmail.com', N'111111', 1, N'Hà Nội', N'0976852120', N'271144', 0, 1, 1, N'./image/lovepik-confident-workplace-business-male-image-png-image_400441790_wh1200 (1).png')
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (2, N'Huy Vu', N'admin', N'123456', 1, N'Hà N?i', N'123224123', N'123', 1, 1, 5, N'./image/lovepik-confident-workplace-business-male-image-png-image_400441790_wh1200.png')
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (3, N'Minh Quang', N'quangnguyen3922@gmail.com', N'123456', 1, N'HCM', N'79873543', N'123', 1, 1, 2, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (4, N'Vu', N'vunhh1231239@fpt.edu.vn', N'123456', 1, N'Hòa Bình', N'756785775', N'123', 1, 0, 2, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (5, N'H?i Bình', N'tranhaibinh120102@gmail.com', N'111111', 1, N'Hà N?i', N'7825345', N'123', 1, 1, 2, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (6, N'Mạnh mèo', N'quangmanhph@gmail.com', N'11092002', 1, N'Hà Nội', N'0123456789', N'589669', 0, 1, 2, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (7, N'qwe', N'quan@gmail.com', N'12345eqw', 1, N'eqwe', N'123123123', N'1104832', 0, 1, 1, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (8, N'eqwe', N'quangmanh2@gmail.com', N'123123', 1, N'qweqwe', N'123123123', N'61320', 0, 1, 1, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (9, N'quangphon', N'quangphon@gmail.com', N'999999', 1, N'Trung Quoc', N'99978788', NULL, 1, 1, 4, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (10, N'Ha', N'quangmanh279sdf@gmail.com', N'12312321', 1, N'HCM', N'03223223', N'637686', 0, 1, 1, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (11, N'Huy', N'vunhhe161239@fpt.edu.vn', N'123456', 1, N'Ha Noi', N'09213213', N'469219', 0, 1, 3, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (12, N'Na', N'quangma@gmail.com', N'123456', 1, N'HCM', N'03216266', N'1215382', 0, 1, 1, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (13, N'Ha', N'quangmanh279sdf@gmail.com', N'123123', 1, N'Ha noi', N'0123123123', N'101996', 0, 1, 1, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (14, N'HUy a', N'vunhhe161239@fpt.edu.vn', N'123456', 1, N'hai duong', N'00123213', N'910624', 0, 1, 1, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (15, N'Huy a', N'vunhhe161239@fpt.edu.vn', N'123456', 1, N'HCM', N'09123123', N'29589', 0, 1, 1, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (16, N'Hai Binh', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (17, N'Quang Mạnh Phùng', N'manhpqhe160909@fpt.edu.vn', N'11092002', 1, N'Hòa Lạc - Hà Nội', N'0976852120', N'306869', 0, 1, 1, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (18, N'Hoàng Việt Anh', N'hvanh0612@gmail.com', N'1234567', 1, N'Gia Lâm - Hà Nội', N'0384332592', N'259574', 0, 1, 1, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (19, N'Ví Lưu Hải Long', N'longvlhhe163776@fpt.edu.vn', N'0987654321', 1, N'Cầu Giấy - Hà Nội', N'0987654321', N'352283', 1, 1, 1, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (20, N'Huy Vũ dz', N'cafeomcua1@gmail.com', N'222222', 1, N'Hà Nội nổi nhất phố', N'0978563412', N'734861', 1, 1, 1, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (21, N'Vũ Huy Super', N'cafeomcua21@gmail.com', N'213456', 1, N'Hà Nội mặt phố', N'0769812345', N'1054271', 1, 1, 1, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (22, N'Nguyễn Vũ', N'cafeomcua2@gmail.com', N'444444', 1, N'Hòa Lạc - Thạch Thất', N'0432198765', N'289852', 1, 1, 1, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (23, N'eqwe', N'1234@gmail.com', N'123456', NULL, NULL, NULL, NULL, 1, 1, 1, NULL)
INSERT [dbo].[user] ([user_id], [full_name], [email], [password], [gender], [address], [phone_number], [verification_code], [is_verified], [status], [role_id], [image]) VALUES (27, N'bfdbdf', N'ngkien112@gmail.com', N'sdfsdte', 1, N'fdbdfbd', N'1234567890', N'886142', 0, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[user] OFF
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [blog_fk11] FOREIGN KEY([cate_id])
REFERENCES [dbo].[categoryBlog] ([categoryBlog_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [blog_fk11]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_user] FOREIGN KEY([author])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_user]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Cate] FOREIGN KEY([cate_id])
REFERENCES [dbo].[CategoryCourse] ([id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Cate]
GO
ALTER TABLE [dbo].[lesson]  WITH CHECK ADD  CONSTRAINT [FK_lesson_Course] FOREIGN KEY([subject_id])
REFERENCES [dbo].[Course] ([course_id])
GO
ALTER TABLE [dbo].[lesson] CHECK CONSTRAINT [FK_lesson_Course]
GO
ALTER TABLE [dbo].[lesson]  WITH CHECK ADD  CONSTRAINT [lesson_fk1] FOREIGN KEY([type_id])
REFERENCES [dbo].[lesson_type] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[lesson] CHECK CONSTRAINT [lesson_fk1]
GO
ALTER TABLE [dbo].[lesson]  WITH CHECK ADD  CONSTRAINT [lesson_fk2] FOREIGN KEY([topic_id])
REFERENCES [dbo].[lesson_topic] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[lesson] CHECK CONSTRAINT [lesson_fk2]
GO
ALTER TABLE [dbo].[registration]  WITH CHECK ADD  CONSTRAINT [registration_fk0] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([course_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[registration] CHECK CONSTRAINT [registration_fk0]
GO
ALTER TABLE [dbo].[registration]  WITH CHECK ADD  CONSTRAINT [registration_fk1] FOREIGN KEY([price_package_id])
REFERENCES [dbo].[price_package] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[registration] CHECK CONSTRAINT [registration_fk1]
GO
ALTER TABLE [dbo].[registration]  WITH CHECK ADD  CONSTRAINT [registration_fk3] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[registration] CHECK CONSTRAINT [registration_fk3]
GO
ALTER TABLE [dbo].[Setting]  WITH CHECK ADD  CONSTRAINT [FK_Setting_role] FOREIGN KEY([type])
REFERENCES [dbo].[role] ([role_id])
GO
ALTER TABLE [dbo].[Setting] CHECK CONSTRAINT [FK_Setting_role]
GO
ALTER TABLE [dbo].[slider]  WITH CHECK ADD  CONSTRAINT [FK_slider_user] FOREIGN KEY([id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[slider] CHECK CONSTRAINT [FK_slider_user]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [user_fk0] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [user_fk0]
GO
USE [master]
GO
ALTER DATABASE [SWP391_Project] SET  READ_WRITE 
GO
