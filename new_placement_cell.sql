-- For student module
-- Required table list 
    -- login_table
    -- student_registration
    -- tnp_student_application_details
    -- VacancyApplication
    -- degree_program
    -- salutation_h
    -- registration_type
    -- admission_session
    -- college
    -- passing_out_year
    -- tnp_student_skills
    -- tnp_student_experience
    -- tnp_student_academic_details_array  
    -- tnp_student_experience

-- Quries/schema
-- login_table
CREATE TABLE dbo.login_table (
  id int IDENTITY(1,1) NOT NULL,
  name varchar(255) NOT NULL,
  username varchar(255) NOT NULL,
  password varchar(255) NULL,
  Emp_Id VARCHAR(10) NULL,
  role int NOT NULL DEFAULT 1,
  CONSTRAINT PK_login_table PRIMARY KEY (id)
);



-- student_registration
CREATE TABLE student_registration (
  TnP_Student_Master_Id BIGINT NOT NULL IDENTITY(1,1),
  UE_ID VARCHAR(50) UNIQUE NULL,
  Registration_Type CHAR(1) NULL,
  Salutation_E TINYINT NULL,
  Salutation_H TINYINT NULL,
  Student_First_Name_E VARCHAR(50) NULL,
  Student_Middle_Name_E VARCHAR(50) NULL,
  Student_Last_Name_E VARCHAR(50) NULL,
  Student_First_Name_H NVarChar(50) NULL,
  Student_Middle_Name_H NVarChar(50) NULL,
  Student_Last_Name_H NVarChar(50) NULL,
  DOB DATE NULL,
  Gender_Id CHAR(1) NULL,
  Mobile_No VARCHAR(12) NULL,
  Email_Id VARCHAR(50) NULL,
  Father_Name_E VARCHAR(50) NULL,
  Mother_Name_E VARCHAR(50) NULL,
  Father_Name_H NVarChar(50) NULL,
  Mother_Name_H NVarChar(50) NULL,
  Guardian_Name_E VARCHAR(50) NULL,
  Spouse_Name_E VARCHAR(50) NULL,
  profilephoto_Url VARCHAR(2000) DEFAULT '',
  Created_By VARCHAR(20) NULL,
  Created_Date DATETIME NULL,
  Modified_By VARCHAR(20) NULL,
  Modified_Date DATETIME NULL,
  Delete_Flag CHAR(1) NULL,
  Public_IP_Address VARCHAR(20) NULL,
  Private_IP_Address VARCHAR(20) NULL,
  CONSTRAINT PK_student_registration PRIMARY KEY (TnP_Student_Master_Id)
);

-- tnp_student_application_details
CREATE TABLE tnp_student_application_details (
  Student_Application_ID INT PRIMARY KEY IDENTITY(1,1),
  Vacancy_ID NVARCHAR(50) DEFAULT NULL,  
  Company_Name varchar(50) NOT NULL DEFAULT '',
  Company_ID NVARCHAR(50) DEFAULT NULL,
  Student_ID NVARCHAR(50) DEFAULT NULL,
  Application_Submission_Date DATE DEFAULT (GETDATE()),
  Full_Name NVARCHAR(100) DEFAULT NULL,
  Post_Name NVARCHAR(100) DEFAULT NULL,
  Fathers_Name NVARCHAR(100) DEFAULT NULL,
  Email NVARCHAR(100) DEFAULT NULL,
  Mobile NVARCHAR(13) DEFAULT NULL,
  Status NVARCHAR(20) DEFAULT 'Pending',
  Resume_Path NVARCHAR(2000) DEFAULT '',
  Created_Date DATETIME DEFAULT (GETDATE()),
);


-- VacancyApplication
CREATE TABLE VacancyApplication (
    Company_ID VARCHAR(255),
    Mobile VARCHAR(15),
    Student_ID VARCHAR(255),
	Full_Name VARCHAR(255),
	Post_Name VARCHAR(255),
    Fathers_Name VARCHAR(255),
    Vacancy_ID VARCHAR(255),
    Job_Title VARCHAR(255),
    Email VARCHAR(255),
    Application_Submission_Date DATE,
    Status VARCHAR(50)
);

-- degree_program
CREATE TABLE dbo.degree_program (
  Degree_Programme_Type_Id smallint NULL,
  Program_Id int NOT NULL,
  Degree_Program_Name varchar(50) NULL,
  CONSTRAINT PK_degree_program PRIMARY KEY (Program_Id)
);
INSERT INTO dbo.degree_program (Degree_Programme_Type_Id, Program_Id, Degree_Program_Name) VALUES
	(3, 0, '--select--'),
	(3, 1, 'B.Sc.Forestry(Hons)'),
	(3, 2, 'B.Sc.Horti[Hons]'),
	(3, 3, 'B.Tech(Agril)'),
	(3, 4, 'B.Tech(Food Technology)'),
	(4, 5, '--select--'),
	(4, 6, 'M.Sc(hort.)'),
	(4, 7, 'MBA(ABM)'),
	(4, 8, 'M.sc(agril)'),
	(5, 9, '--select--'),
	(5, 10, 'Ph.D(in Agril.Engg)'),
	(5, 11, 'Ph.D(in Horticulture)'),
	(5, 12, 'Ph.D(in Food Technolog)');




-- salutation_h
CREATE TABLE salutation_h (
  Salutation_Id INT NOT NULL PRIMARY KEY,
  Value NVARCHAR(10) NULL
);
INSERT INTO salutation_h (Salutation_Id, Value) VALUES
    (1, N'श्री'),
    (2, N'कु.'),
    (3, N'श्रीमति'),
    (4, N'डॉ.'),
    (5, N'प्रो.');


-- registration_type
CREATE TABLE registration_type (
    Registration_Type_Id INT NOT NULL PRIMARY KEY,   
    Name NVARCHAR(50) NOT NULL,                                   
);
INSERT INTO registration_type (Registration_Type_Id, Name) VALUES
    (1, 'Student'),
    (2, 'Professional'),
    (3, 'Guest');


-- admission_session
CREATE TABLE admission_session (
  Admission_Session_id int NOT NULL,
  Admission_Session_Name varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (Admission_Session_id)
);
INSERT INTO admission_session (Admission_Session_id, Admission_Session_Name) VALUES
	(13, '2013-2014'),
	(14, '2014-2015'),
	(15, '2015-2016'),
	(16, '2016-2017'),
	(17, '2017-2018'),
	(18, '2018-2019'),
	(19, '2019-2020'),
	(20, '2020-2021'),
	(21, '2021-2022'),
	(22, '2022-2023'),
	(23, '2023-2024');



-- college
CREATE TABLE dbo.college (
  College_Id int NOT NULL,
  Name varchar(100) NULL,
  CONSTRAINT PK_college PRIMARY KEY (College_Id)
);
INSERT INTO dbo.college (College_Id, Name) VALUES (1, 'Springfield College');
INSERT INTO dbo.college (College_Id, Name) VALUES (2, 'prsu');



-- passing_out_year
CREATE TABLE passing_out_year (
  PassingOut_Year_Id int NOT NULL,
  PassingOut_Year_Name varchar(50) DEFAULT NULL,
  PRIMARY KEY (PassingOut_Year_Id)
);
-- Dumping data for table placementcell.passing_out_year: ~10 rows (approximately)
INSERT INTO passing_out_year (PassingOut_Year_Id, PassingOut_Year_Name) VALUES
	(13, '2013-2014'),
	(14, '2014-2015'),
	(15, '2015-2016'),
	(16, '2016-2017'),
	(17, '2017-2018'),
	(18, '2018-2019'),
	(19, '2019-2020'),
	(20, '2020-2021'),
	(21, '2021-2022'),
	(22, '2022-2023'),
	(23, '2023-2024');


-- tnp_student_skills
CREATE TABLE tnp_student_skills (
  Student_Skill_ID int NOT NULL identity(1,1),
  Student_ID int DEFAULT NULL,
  Registration_No varchar(50) DEFAULT NULL,
  Skill_Id int DEFAULT NULL,
  Skill_Cetificate_Url varchar(100) DEFAULT NULL,
  Created_By varchar(50) DEFAULT NULL,
  Created_Date date DEFAULT getdate(),
  Deleted_Flag varchar(3) DEFAULT 'n',
  PRIMARY KEY (Student_Skill_ID)
);

-- tnp_student_experience
	CREATE TABLE tnp_student_experience (
    Registration_No NVARCHAR(20) NOT NULL,
    Organization_Name VARCHAR(20) NOT NULL,
    Post_Name VARCHAR(100) NOT NULL,
    WorkPlace_Address VARCHAR(250) NOT NULL,
    WorkPlace_District_Id SMALLINT NOT NULL,
    WorkPlace_State_Id SMALLINT NOT NULL,
    WorkPlace_Country_Id VARCHAR(50) NOT NULL,
    City_Name VARCHAR(50) NOT NULL,
    Description VARCHAR(250) NOT NULL,
    Period_From DATE NOT NULL,
    Period_To DATE NOT NULL,
    Is_Currently_working_YN CHAR(1) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Created_Date DATETIME NOT NULL,
    PRIMARY KEY (Registration_No) 
);

-- tnp_student_academic_details_array  
CREATE TABLE tnp_student_academic_details_array (
    Academic_Detail_Id TINYINT NOT NULL IDENTITY(1,1),
    Registration_No VARCHAR(50) NULL,
    Degree_Programme_Type_Id TINYINT NULL,
    Degree_Programme_Id SMALLINT NULL,
    Student_Enroll_Id VARCHAR(50) NULL,
    College_Name VARCHAR(50) NULL,
    Subject_Id SMALLINT NULL,
    OGPA FLOAT NULL,
    Marksheet_Url VARCHAR(1000) NULL,
    Admission_Year_Id SMALLINT NULL,
    PassingOut_Year_Id SMALLINT NULL,
    Student_Id VARCHAR(50) NULL,
    Created_By VARCHAR(50) NULL,
    Created_Date DATETIME NULL,
    Modified_By VARCHAR(50) NULL,
    Modified_Date DATETIME NULL,
    Delete_Flag CHAR(1) DEFAULT 'n',
    Public_IP_Address VARCHAR(20) NULL,
    Private_IP_Address VARCHAR(20) NULL,
    PRIMARY KEY (Academic_Detail_Id)
);
-- For student module end
 






-- For company module start
-- Required table list 
        -- tnp_vacancy_details
        -- company_registration
        -- company_category
        -- company_type
        -- state
        -- district
        -- block
        -- Companiesfiles
        -- 

-- query  
-- tnp_vacancy_details
CREATE TABLE tnp_vacancy_details (
  id BIGINT NOT NULL IDENTITY(1,1),
  Vacancy_ID VARCHAR(50) NOT NULL DEFAULT '',
  Company_Id VARCHAR(50) NOT NULL DEFAULT '',
  Company_Name VARCHAR(50) NOT NULL DEFAULT '',
  Company_Registration_No VARCHAR(50) DEFAULT NULL,
  Job_Title VARCHAR(50) DEFAULT NULL,
  Job_Description VARCHAR(2000) DEFAULT NULL,
  Job_Selection VARCHAR(50) DEFAULT NULL,
  Job_Location VARCHAR(50) DEFAULT NULL,
  No_Of_Post INT DEFAULT NULL,
  Salary VARCHAR(50) DEFAULT NULL,
  Last_Date_for_apply DATE DEFAULT NULL,
  Min_Experience_in_Year SMALLINT DEFAULT NULL,
  Maximum_Age SMALLINT DEFAULT NULL,
  Preferred_Gender VARCHAR(50) DEFAULT NULL,
  Prefered_Language VARCHAR(50) DEFAULT NULL,
  Notice_Url NVARCHAR(2000) DEFAULT '',
  Status VARCHAR(50) DEFAULT 'Pending',
  Created_By VARCHAR(20) DEFAULT NULL,
  Created_Date DATETIME DEFAULT NULL,
  Modified_By VARCHAR(20) DEFAULT NULL,
  Modified_Date DATETIME DEFAULT NULL,
  Delete_Flag CHAR(1) DEFAULT NULL,
  Public_IP_Address VARCHAR(20) DEFAULT NULL,
  Private_IP_Address VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (id)  -- Composite key
);





-- company_registration
CREATE TABLE company_registration (
  Id int NOT NULL IDENTITY(1,1),
  Company_Id nvarchar(99) NOT NULL,
  Company_Registration_No nvarchar(50) NOT NULL,
  Tnp_Registration_No nvarchar(50) NOT NULL,
  Company_Name varchar(50) NOT NULL DEFAULT '',
  Company_Type smallint DEFAULT 0,
  Company_Category smallint DEFAULT 0,
  Company_Email nvarchar(50) NOT NULL DEFAULT '',
  Company_Phone_Number varchar(20) NOT NULL DEFAULT '',
  Hr_Name varchar(30) NOT NULL DEFAULT '',
  Hr_Contact_No varchar(30) NOT NULL DEFAULT '',
  Hr_Email nvarchar(50) NOT NULL DEFAULT '',
  Contact_Person varchar(50) NOT NULL DEFAULT '',
  Contact_Person_Email nvarchar(50) NOT NULL DEFAULT '',
  Contact_Person_Phone nvarchar(12) NOT NULL DEFAULT '',
  Company_Short_Name varchar(20) NOT NULL DEFAULT '',
  Address varchar(100) NOT NULL DEFAULT '',
  State smallint DEFAULT 0,
  District smallint DEFAULT 0,
  Block smallint DEFAULT 0,
  Company_Profile varchar(1000) DEFAULT '',
  Website varchar(5000) DEFAULT '',
  Company_Logo_Url NVARCHAR(2000) DEFAULT '',
  Company_Logo NVARCHAR(2000) DEFAULT '',
  Company_Broucher NVARCHAR(2000) DEFAULT '',
  Company_Other_Doc_Url NVARCHAR(2000) DEFAULT '',
  Created_By varchar(30) NOT NULL DEFAULT '',
  Created_Date datetime DEFAULT GETDATE(),
  Modified_By varchar(50) NOT NULL DEFAULT '',
  Modified_Date datetime DEFAULT NULL,
  Delete_Flag char(1) NOT NULL DEFAULT 'n',
  Public_IP_Address varchar(20) NOT NULL DEFAULT '',
  Private_IP_Address varchar(20) NOT NULL DEFAULT '',
  CONSTRAINT PK_Company_registration PRIMARY KEY (Id)
);


-- company_category
CREATE TABLE dbo.company_category (
  Category_Type_Id int NOT NULL,
  Category_Name varchar(50) NULL,
  CONSTRAINT PK_company_category PRIMARY KEY (Category_Type_Id)
);
INSERT INTO dbo.company_category (Category_Type_Id, Category_Name)
VALUES
	(1, 'Private Limited'),
	(2, 'Public Limited Company'),
	(3, 'NGO'),
	(4, 'Micro Company'),
	(5, 'Medium Company'),
	(6, 'PSU'),
	(7, 'MNC');


-- company_type
CREATE TABLE dbo.company_type (
  Company_Id int NOT NULL,
  Company_Type varchar(50) NULL,
  CONSTRAINT PK_company_type PRIMARY KEY (Company_Id)
);
INSERT INTO company_type (Company_Id, Company_Type) VALUES
	(1, 'Government'),
	(2, 'Private'),
	(3, 'SemiGovernment'),
	(4, 'International');


-- state
CREATE TABLE state (
  Country_Id int DEFAULT NULL,
  State_Id int DEFAULT NULL,
  State_Name varchar(20) DEFAULT NULL
);
INSERT INTO state (Country_Id, State_Id, State_Name) VALUES
    (7, 4, 'Andhra Pradesh'),
    (7, 5, 'Arunachal Pradesh'),
    (7, 6, 'Assam'),
    (7, 7, 'Bihar'),
    (7, 8, 'Goa'),
    (7, 9, 'Gujarat'),
    (7, 10, 'Haryana'),
    (7, 11, 'Himachal Pradesh'),
    (7, 12, 'Jharkhand'),
    (7, 13, 'Karnataka'),
    (7, 14, 'Kerala'),
    (7, 15, 'Madhya Pradesh'),
    (7, 16, 'Maharashtra'),
    (7, 17, 'Manipur'),
    (7, 18, 'Meghalaya'),
    (7, 19, 'Mizoram'),
    (7, 20, 'Nagaland'),
    (7, 21, 'Odisha'),
    (7, 22, 'Punjab'),
    (7, 23, 'Rajasthan'),
    (7, 24, 'Sikkim'),
    (7, 25, 'Tamil Nadu'),
    (7, 26, 'Telangana'),
    (7, 27, 'Tripura'),
    (7, 28, 'Uttar Pradesh'),
    (7, 29, 'Uttarakhand'),
    (7, 30, 'West Bengal');

-- district
CREATE TABLE block (
  District_Id int DEFAULT NULL,
  Block_Id int NOT NULL,
  Block_Name varchar(50) DEFAULT NULL
);
INSERT INTO district (State_Id, District_Id, District_Name) VALUES
    (1, 1, 'Raipur'),
    (1, 2, 'Bilaspur'),
    (1, 3, 'Mahasamund'),
    (1, 4, 'Durg'),
    (1, 5, 'Bastar'),
    (1, 6, 'Kanker'),
    (1, 7, 'Raigarh'),
    (1, 8, 'Surguja'),
    (1, 9, 'Korba'),
    (1, 10, 'Dantewada'),
    (1, 11, 'Jashpur'),
    (1, 12, 'Kawardha'),
    (1, 13, 'Rajnandgaon'),
    (1, 14, 'Balod'),
    (1, 15, 'Baloda Bazar'),
    (1, 16, 'Gariaband'),
    (1, 17, 'Mungeli'),
    (1, 18, 'Balrampur'),
    (1, 19, 'Bemetara'),
    (1, 20, 'Bijapur'),
    (1, 21, 'Narayanpur'),
    (1, 22, 'Sukma'),
    (1, 23, 'Kondagaon'),
    (1, 24, 'Surajpur'),
    (1, 25, 'Gaurela-Pendra-Marwahi');


-- block
CREATE TABLE block (
  District_Id int DEFAULT NULL,
  Block_Id int NOT NULL,
  Block_Name varchar(50) DEFAULT NULL
);
INSERT INTO block (District_Id, Block_Id, Block_Name) VALUES
	(1, 1, 'Abhanpur'),
	(1, 2, 'Arang'),
	(1, 3, 'BalodaBazar'),
	(1, 4, 'Bhatapara'),
	(3, 1, 'Mahasamund'),
	(3, 2, 'Saraipali'),
	(3, 3, 'Basana'),
	(3, 4, 'Pithora'),
	(2, 1, 'Bilaspur'),
	(2, 2, 'Bilha'),
	(2, 3, 'Kota'),
	(2, 4, 'Lormi');


-- Companiesfiles
CREATE TABLE Companiesfiles (
    Company_Id INT PRIMARY KEY IDENTITY(1,1),
    Company_Logo_Url NVARCHAR(255) NULL,
    Company_Logo NVARCHAR(255) NULL,
    Company_Broucher NVARCHAR(255) NULL,
    Company_Other_Doc_Url NVARCHAR(255) NULL,
	Created_Date DATE
);


-- for company module end
