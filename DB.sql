USE [placementcell]
GO
/****** Object:  Table [dbo].[admission_session]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admission_session](
	[Admission_Session_id] [int] NOT NULL,
	[Admission_Session_Name] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Admission_Session_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[block]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[block](
	[District_Id] [int] NULL,
	[Block_Id] [int] NOT NULL,
	[Block_Name] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[college]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[college](
	[College_Id] [int] NOT NULL,
	[Name] [varchar](100) NULL,
 CONSTRAINT [PK_college] PRIMARY KEY CLUSTERED 
(
	[College_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companiesfiles]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companiesfiles](
	[Company_Id] [int] IDENTITY(1,1) NOT NULL,
	[Company_Logo_Url] [nvarchar](255) NULL,
	[Company_Logo] [nvarchar](255) NULL,
	[Company_Broucher] [nvarchar](255) NULL,
	[Company_Other_Doc_Url] [nvarchar](255) NULL,
	[Created_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Company_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company_category]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company_category](
	[Category_Type_Id] [int] NOT NULL,
	[Category_Name] [varchar](50) NULL,
 CONSTRAINT [PK_company_category] PRIMARY KEY CLUSTERED 
(
	[Category_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company_registration]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company_registration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Company_Id] [nvarchar](99) NOT NULL,
	[Company_Registration_No] [nvarchar](50) NOT NULL,
	[Tnp_Registration_No] [nvarchar](50) NOT NULL,
	[Company_Name] [varchar](50) NOT NULL,
	[Company_Type] [smallint] NULL,
	[Company_Category] [smallint] NULL,
	[Company_Email] [nvarchar](50) NOT NULL,
	[Company_Phone_Number] [varchar](20) NOT NULL,
	[Hr_Name] [varchar](30) NOT NULL,
	[Hr_Contact_No] [varchar](30) NOT NULL,
	[Hr_Email] [nvarchar](50) NOT NULL,
	[Contact_Person] [varchar](50) NOT NULL,
	[Contact_Person_Email] [nvarchar](50) NOT NULL,
	[Contact_Person_Phone] [nvarchar](12) NOT NULL,
	[Company_Short_Name] [varchar](20) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[State] [smallint] NULL,
	[District] [smallint] NULL,
	[Block] [smallint] NULL,
	[Company_Profile] [varchar](1000) NULL,
	[Website] [varchar](5000) NULL,
	[Company_Logo_Url] [nvarchar](2000) NULL,
	[Company_Logo] [nvarchar](2000) NULL,
	[Company_Broucher] [nvarchar](2000) NULL,
	[Company_Other_Doc_Url] [nvarchar](2000) NULL,
	[Created_By] [varchar](30) NOT NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](50) NOT NULL,
	[Modified_Date] [datetime] NULL,
	[Delete_Flag] [char](1) NOT NULL,
	[Public_IP_Address] [varchar](20) NOT NULL,
	[Private_IP_Address] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Company_registration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company_type]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company_type](
	[Company_Id] [int] NOT NULL,
	[Company_Type] [varchar](50) NULL,
 CONSTRAINT [PK_company_type] PRIMARY KEY CLUSTERED 
(
	[Company_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyImg]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyImg](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imagePath] [nvarchar](255) NULL,
	[imageName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Current_Country_Id] [smallint] NOT NULL,
	[S_No] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[degree_program]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[degree_program](
	[Degree_Programme_Type_Id] [smallint] NULL,
	[Program_Id] [int] NOT NULL,
	[Degree_Program_Name] [varchar](50) NULL,
 CONSTRAINT [PK_degree_program] PRIMARY KEY CLUSTERED 
(
	[Program_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[degree_type]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[degree_type](
	[Degree_Programme_Type_Id] [int] NOT NULL,
	[Degree_Name] [varchar](50) NULL,
 CONSTRAINT [PK_degree_type] PRIMARY KEY CLUSTERED 
(
	[Degree_Programme_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[district]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[district](
	[State_Id] [int] NULL,
	[District_Id] [int] NULL,
	[District_Name] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fileuploads]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fileuploads](
	[files_Id] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [nvarchar](50) NULL,
	[Application_Submission_Date] [date] NULL,
	[Resume_Path] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[files_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gender]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gender](
	[Gender_Id] [int] NOT NULL,
	[Value] [varchar](50) NULL,
 CONSTRAINT [PK_gender] PRIMARY KEY CLUSTERED 
(
	[Gender_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HindiTextTable]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HindiTextTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HindiColumn] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login_table]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_table](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NULL,
	[Emp_Id] [varchar](10) NULL,
	[role] [int] NOT NULL,
 CONSTRAINT [PK_login_table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[passing_out_year]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[passing_out_year](
	[PassingOut_Year_Id] [int] NOT NULL,
	[PassingOut_Year_Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PassingOut_Year_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registration_type]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registration_type](
	[Registration_Type_Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Registration_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salutation_e]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salutation_e](
	[Salutation_Id] [int] NOT NULL,
	[Value] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Salutation_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salutation_h]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salutation_h](
	[Salutation_Id] [int] NOT NULL,
	[Value] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Salutation_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[state]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state](
	[Country_Id] [int] NULL,
	[State_Id] [int] NULL,
	[State_Name] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_registration]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_registration](
	[TnP_Student_Master_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UE_ID] [varchar](50) NULL,
	[Registration_Type] [char](1) NULL,
	[Salutation_E] [tinyint] NULL,
	[Salutation_H] [tinyint] NULL,
	[Student_First_Name_E] [varchar](50) NULL,
	[Student_Middle_Name_E] [varchar](50) NULL,
	[Student_Last_Name_E] [varchar](50) NULL,
	[Student_First_Name_H] [nvarchar](50) NULL,
	[Student_Middle_Name_H] [nvarchar](50) NULL,
	[Student_Last_Name_H] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[Gender_Id] [char](1) NULL,
	[Mobile_No] [varchar](12) NULL,
	[Email_Id] [varchar](50) NULL,
	[Father_Name_E] [varchar](50) NULL,
	[Mother_Name_E] [varchar](50) NULL,
	[Father_Name_H] [nvarchar](50) NULL,
	[Mother_Name_H] [nvarchar](50) NULL,
	[Guardian_Name_E] [varchar](50) NULL,
	[Spouse_Name_E] [varchar](50) NULL,
	[profilephoto_Url] [nvarchar](2000) NULL,
	[Created_By] [varchar](20) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](20) NULL,
	[Modified_Date] [datetime] NULL,
	[Delete_Flag] [char](1) NULL,
	[Public_IP_Address] [varchar](20) NULL,
	[Private_IP_Address] [varchar](20) NULL,
 CONSTRAINT [PK_student_registration] PRIMARY KEY CLUSTERED 
(
	[TnP_Student_Master_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[age] [int] NOT NULL,
	[gender] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subjects]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subjects](
	[Subject_Entry_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Subject_Id] [tinyint] NOT NULL,
	[Subject_Name_E] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Subject_Entry_Id] ASC,
	[Subject_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tnp_student_academic_details]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tnp_student_academic_details](
	[Academic_Detail_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Ten_Institute_Name] [varchar](50) NULL,
	[Ten_Major_Subject] [varchar](50) NULL,
	[Ten_Year_Of_Passing] [smallint] NULL,
	[Ten_Marks] [float] NULL,
	[Ten_Marksheet_Url] [varchar](1000) NULL,
	[Twelve_Institute_Name] [varchar](50) NULL,
	[Twelve_Major_Subject] [varchar](50) NULL,
	[Twelve_Year_Of_Passing] [smallint] NULL,
	[Twelve_Marks] [float] NULL,
	[Twelve_Marksheet_Url] [varchar](1000) NULL,
	[Student_Id] [varchar](50) NULL,
	[Created_By] [varchar](20) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](20) NULL,
	[Modified_Date] [datetime] NULL,
	[Delete_Flag] [char](1) NULL,
	[Public_IP_Address] [varchar](20) NULL,
	[Private_IP_Address] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Academic_Detail_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tnp_student_academic_details_array]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tnp_student_academic_details_array](
	[Academic_Detail_Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Registration_No] [varchar](50) NULL,
	[Degree_Programme_Type_Id] [tinyint] NULL,
	[Degree_Programme_Id] [smallint] NULL,
	[Student_Enroll_Id] [varchar](50) NULL,
	[College_Name] [varchar](50) NULL,
	[Subject_Id] [smallint] NULL,
	[OGPA] [float] NULL,
	[Marksheet_Url] [varchar](1000) NULL,
	[Admission_Year_Id] [smallint] NULL,
	[PassingOut_Year_Id] [smallint] NULL,
	[Student_Id] [varchar](50) NULL,
	[Created_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [datetime] NULL,
	[Delete_Flag] [char](1) NULL,
	[Public_IP_Address] [varchar](20) NULL,
	[Private_IP_Address] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Academic_Detail_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tnp_student_application_details]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tnp_student_application_details](
	[Student_Application_ID] [int] IDENTITY(1,1) NOT NULL,
	[Vacancy_ID] [nvarchar](50) NULL,
	[Company_Name] [varchar](50) NOT NULL,
	[Company_ID] [nvarchar](50) NULL,
	[Student_ID] [nvarchar](50) NULL,
	[Application_Submission_Date] [date] NULL,
	[Full_Name] [nvarchar](100) NULL,
	[Post_Name] [nvarchar](100) NULL,
	[Fathers_Name] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Mobile] [nvarchar](13) NULL,
	[Status] [nvarchar](20) NULL,
	[Resume_Path] [nvarchar](2000) NULL,
	[Created_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Student_Application_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tnp_student_experience]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tnp_student_experience](
	[Workplace_Detail_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Student_ID] [varchar](50) NULL,
	[Registration_No] [varchar](20) NOT NULL,
	[Organization_Name] [varchar](200) NOT NULL,
	[Post_Name] [varchar](100) NULL,
	[WorkPlace_Address] [varchar](250) NULL,
	[WorkPlace_District_Id] [smallint] NULL,
	[WorkPlace_State_Id] [smallint] NULL,
	[WorkPlace_Country_Id] [varchar](50) NULL,
	[City_Name] [varchar](50) NULL,
	[Description] [varchar](250) NULL,
	[Period_From] [date] NULL,
	[Period_To] [date] NULL,
	[Is_Currently_working_YN] [char](1) NULL,
	[Salary] [decimal](10, 2) NULL,
	[Created_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Workplace_Detail_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tnp_student_skills]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tnp_student_skills](
	[Student_Skill_ID] [int] IDENTITY(1,1) NOT NULL,
	[Student_ID] [varchar](50) NULL,
	[Registration_No] [varchar](50) NULL,
	[Skill_Id] [int] NULL,
	[Skill_Certificate_Url] [varchar](1000) NULL,
	[Created_By] [varchar](50) NULL,
	[Created_Date] [date] NULL,
	[Deleted_Flag] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[Student_Skill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tnp_vacancy_details]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tnp_vacancy_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Vacancy_ID] [varchar](50) NOT NULL,
	[Company_Id] [varchar](50) NOT NULL,
	[Company_Name] [varchar](50) NOT NULL,
	[Company_Registration_No] [varchar](50) NULL,
	[Job_Title] [varchar](50) NULL,
	[Job_Description] [varchar](2000) NULL,
	[Job_Selection] [varchar](50) NULL,
	[Job_Location] [varchar](50) NULL,
	[No_Of_Post] [int] NULL,
	[Salary] [varchar](50) NULL,
	[Last_Date_for_apply] [date] NULL,
	[Min_Experience_in_Year] [smallint] NULL,
	[Maximum_Age] [smallint] NULL,
	[Preferred_Gender] [varchar](50) NULL,
	[Prefered_Language] [varchar](50) NULL,
	[Notice_Url] [nvarchar](2000) NULL,
	[Status] [varchar](50) NULL,
	[Created_By] [varchar](20) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](20) NULL,
	[Modified_Date] [datetime] NULL,
	[Delete_Flag] [char](1) NULL,
	[Public_IP_Address] [varchar](20) NULL,
	[Private_IP_Address] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[photoOriginalName] [varchar](255) NULL,
	[photoMimeType] [varchar](255) NULL,
	[photoDestination] [varchar](255) NULL,
	[photoFileName] [varchar](255) NULL,
	[photoPath] [varchar](255) NULL,
	[photoSize] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VacancyApplication]    Script Date: 9/9/2024 4:25:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VacancyApplication](
	[Vacancy_ID] [nvarchar](50) NOT NULL,
	[Company_ID] [nvarchar](50) NOT NULL,
	[Company_Name] [varchar](50) NOT NULL,
	[Student_ID] [nvarchar](50) NOT NULL,
	[Full_Name] [nvarchar](100) NOT NULL,
	[Post_Name] [nvarchar](100) NOT NULL,
	[Fathers_Name] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Mobile] [nvarchar](13) NULL,
	[Status] [nvarchar](20) NULL,
	[Application_Submission_Date] [date] NULL,
 CONSTRAINT [PK_VacancyApplication] PRIMARY KEY CLUSTERED 
(
	[Vacancy_ID] ASC,
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[admission_session] ADD  DEFAULT ('') FOR [Admission_Session_Name]
GO
ALTER TABLE [dbo].[block] ADD  DEFAULT (NULL) FOR [District_Id]
GO
ALTER TABLE [dbo].[block] ADD  DEFAULT (NULL) FOR [Block_Name]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Company_Name]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ((0)) FOR [Company_Type]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ((0)) FOR [Company_Category]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Company_Email]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Company_Phone_Number]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Hr_Name]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Hr_Contact_No]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Hr_Email]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Contact_Person]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Contact_Person_Email]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Contact_Person_Phone]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Company_Short_Name]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Address]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ((0)) FOR [State]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ((0)) FOR [District]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ((0)) FOR [Block]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Company_Profile]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Website]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Company_Logo_Url]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Company_Logo]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Company_Broucher]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Company_Other_Doc_Url]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Created_By]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT (getdate()) FOR [Created_Date]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Modified_By]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT (NULL) FOR [Modified_Date]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('n') FOR [Delete_Flag]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Public_IP_Address]
GO
ALTER TABLE [dbo].[company_registration] ADD  DEFAULT ('') FOR [Private_IP_Address]
GO
ALTER TABLE [dbo].[Country] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[district] ADD  DEFAULT (NULL) FOR [State_Id]
GO
ALTER TABLE [dbo].[district] ADD  DEFAULT (NULL) FOR [District_Id]
GO
ALTER TABLE [dbo].[district] ADD  DEFAULT (NULL) FOR [District_Name]
GO
ALTER TABLE [dbo].[fileuploads] ADD  DEFAULT (NULL) FOR [Company_ID]
GO
ALTER TABLE [dbo].[fileuploads] ADD  DEFAULT (getdate()) FOR [Application_Submission_Date]
GO
ALTER TABLE [dbo].[fileuploads] ADD  DEFAULT ('') FOR [Resume_Path]
GO
ALTER TABLE [dbo].[login_table] ADD  DEFAULT ((1)) FOR [role]
GO
ALTER TABLE [dbo].[passing_out_year] ADD  DEFAULT (NULL) FOR [PassingOut_Year_Name]
GO
ALTER TABLE [dbo].[salutation_e] ADD  DEFAULT ('') FOR [Value]
GO
ALTER TABLE [dbo].[state] ADD  DEFAULT (NULL) FOR [Country_Id]
GO
ALTER TABLE [dbo].[state] ADD  DEFAULT (NULL) FOR [State_Id]
GO
ALTER TABLE [dbo].[state] ADD  DEFAULT (NULL) FOR [State_Name]
GO
ALTER TABLE [dbo].[student_registration] ADD  DEFAULT ('') FOR [profilephoto_Url]
GO
ALTER TABLE [dbo].[subjects] ADD  DEFAULT ((0)) FOR [Subject_Id]
GO
ALTER TABLE [dbo].[subjects] ADD  DEFAULT ('0') FOR [Subject_Name_E]
GO
ALTER TABLE [dbo].[tnp_student_academic_details] ADD  DEFAULT (NULL) FOR [Ten_Institute_Name]
GO
ALTER TABLE [dbo].[tnp_student_academic_details] ADD  DEFAULT (NULL) FOR [Ten_Major_Subject]
GO
ALTER TABLE [dbo].[tnp_student_academic_details] ADD  DEFAULT (NULL) FOR [Ten_Year_Of_Passing]
GO
ALTER TABLE [dbo].[tnp_student_academic_details] ADD  DEFAULT (NULL) FOR [Ten_Marks]
GO
ALTER TABLE [dbo].[tnp_student_academic_details] ADD  DEFAULT (NULL) FOR [Ten_Marksheet_Url]
GO
ALTER TABLE [dbo].[tnp_student_academic_details] ADD  DEFAULT (NULL) FOR [Twelve_Institute_Name]
GO
ALTER TABLE [dbo].[tnp_student_academic_details] ADD  DEFAULT (NULL) FOR [Twelve_Major_Subject]
GO
ALTER TABLE [dbo].[tnp_student_academic_details] ADD  DEFAULT (NULL) FOR [Twelve_Year_Of_Passing]
GO
ALTER TABLE [dbo].[tnp_student_academic_details] ADD  DEFAULT (NULL) FOR [Twelve_Marks]
GO
ALTER TABLE [dbo].[tnp_student_academic_details] ADD  DEFAULT (NULL) FOR [Twelve_Marksheet_Url]
GO
ALTER TABLE [dbo].[tnp_student_academic_details] ADD  DEFAULT (NULL) FOR [Student_Id]
GO
ALTER TABLE [dbo].[tnp_student_academic_details] ADD  DEFAULT (NULL) FOR [Created_By]
GO
ALTER TABLE [dbo].[tnp_student_academic_details] ADD  DEFAULT (NULL) FOR [Created_Date]
GO
ALTER TABLE [dbo].[tnp_student_academic_details] ADD  DEFAULT (NULL) FOR [Modified_By]
GO
ALTER TABLE [dbo].[tnp_student_academic_details] ADD  DEFAULT (NULL) FOR [Modified_Date]
GO
ALTER TABLE [dbo].[tnp_student_academic_details] ADD  DEFAULT ('N') FOR [Delete_Flag]
GO
ALTER TABLE [dbo].[tnp_student_academic_details] ADD  DEFAULT (NULL) FOR [Public_IP_Address]
GO
ALTER TABLE [dbo].[tnp_student_academic_details] ADD  DEFAULT (NULL) FOR [Private_IP_Address]
GO
ALTER TABLE [dbo].[tnp_student_academic_details_array] ADD  DEFAULT ('n') FOR [Delete_Flag]
GO
ALTER TABLE [dbo].[tnp_student_application_details] ADD  DEFAULT (NULL) FOR [Vacancy_ID]
GO
ALTER TABLE [dbo].[tnp_student_application_details] ADD  DEFAULT ('') FOR [Company_Name]
GO
ALTER TABLE [dbo].[tnp_student_application_details] ADD  DEFAULT (NULL) FOR [Company_ID]
GO
ALTER TABLE [dbo].[tnp_student_application_details] ADD  DEFAULT (NULL) FOR [Student_ID]
GO
ALTER TABLE [dbo].[tnp_student_application_details] ADD  DEFAULT (getdate()) FOR [Application_Submission_Date]
GO
ALTER TABLE [dbo].[tnp_student_application_details] ADD  DEFAULT (NULL) FOR [Full_Name]
GO
ALTER TABLE [dbo].[tnp_student_application_details] ADD  DEFAULT (NULL) FOR [Post_Name]
GO
ALTER TABLE [dbo].[tnp_student_application_details] ADD  DEFAULT (NULL) FOR [Fathers_Name]
GO
ALTER TABLE [dbo].[tnp_student_application_details] ADD  DEFAULT (NULL) FOR [Email]
GO
ALTER TABLE [dbo].[tnp_student_application_details] ADD  DEFAULT (NULL) FOR [Mobile]
GO
ALTER TABLE [dbo].[tnp_student_application_details] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[tnp_student_application_details] ADD  DEFAULT ('') FOR [Resume_Path]
GO
ALTER TABLE [dbo].[tnp_student_application_details] ADD  DEFAULT (getdate()) FOR [Created_Date]
GO
ALTER TABLE [dbo].[tnp_student_experience] ADD  DEFAULT (NULL) FOR [Student_ID]
GO
ALTER TABLE [dbo].[tnp_student_experience] ADD  DEFAULT (NULL) FOR [Post_Name]
GO
ALTER TABLE [dbo].[tnp_student_experience] ADD  DEFAULT (NULL) FOR [WorkPlace_Address]
GO
ALTER TABLE [dbo].[tnp_student_experience] ADD  DEFAULT (NULL) FOR [WorkPlace_District_Id]
GO
ALTER TABLE [dbo].[tnp_student_experience] ADD  DEFAULT (NULL) FOR [WorkPlace_State_Id]
GO
ALTER TABLE [dbo].[tnp_student_experience] ADD  DEFAULT (NULL) FOR [WorkPlace_Country_Id]
GO
ALTER TABLE [dbo].[tnp_student_experience] ADD  DEFAULT (NULL) FOR [City_Name]
GO
ALTER TABLE [dbo].[tnp_student_experience] ADD  DEFAULT (NULL) FOR [Description]
GO
ALTER TABLE [dbo].[tnp_student_experience] ADD  DEFAULT (NULL) FOR [Period_From]
GO
ALTER TABLE [dbo].[tnp_student_experience] ADD  DEFAULT (NULL) FOR [Period_To]
GO
ALTER TABLE [dbo].[tnp_student_experience] ADD  DEFAULT (NULL) FOR [Is_Currently_working_YN]
GO
ALTER TABLE [dbo].[tnp_student_experience] ADD  DEFAULT (NULL) FOR [Salary]
GO
ALTER TABLE [dbo].[tnp_student_experience] ADD  DEFAULT (NULL) FOR [Created_Date]
GO
ALTER TABLE [dbo].[tnp_student_skills] ADD  DEFAULT (NULL) FOR [Student_ID]
GO
ALTER TABLE [dbo].[tnp_student_skills] ADD  DEFAULT (NULL) FOR [Registration_No]
GO
ALTER TABLE [dbo].[tnp_student_skills] ADD  DEFAULT (NULL) FOR [Skill_Id]
GO
ALTER TABLE [dbo].[tnp_student_skills] ADD  DEFAULT (NULL) FOR [Skill_Certificate_Url]
GO
ALTER TABLE [dbo].[tnp_student_skills] ADD  DEFAULT (NULL) FOR [Created_By]
GO
ALTER TABLE [dbo].[tnp_student_skills] ADD  DEFAULT (getdate()) FOR [Created_Date]
GO
ALTER TABLE [dbo].[tnp_student_skills] ADD  DEFAULT ('n') FOR [Deleted_Flag]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT ('') FOR [Vacancy_ID]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT ('') FOR [Company_Id]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT ('') FOR [Company_Name]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [Company_Registration_No]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [Job_Title]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [Job_Description]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [Job_Selection]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [Job_Location]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [No_Of_Post]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [Salary]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [Last_Date_for_apply]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [Min_Experience_in_Year]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [Maximum_Age]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [Preferred_Gender]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [Prefered_Language]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT ('') FOR [Notice_Url]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [Created_By]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [Created_Date]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [Modified_By]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [Modified_Date]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [Delete_Flag]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [Public_IP_Address]
GO
ALTER TABLE [dbo].[tnp_vacancy_details] ADD  DEFAULT (NULL) FOR [Private_IP_Address]
GO
