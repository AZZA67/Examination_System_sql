create table Class_Tracks
(
	ClassID int ,
	TrackID int 

Constraint primaryKey_class_tracks Primary Key (ClassID, TrackID)
)
create table Text_questions
(
	Correct_Answer nvarchar(50) not null,
	QuestionIDa int 

Constraint primaryKey_Text_questions Primary Key (QuestionIDa)
)

create table True_And_False_choices
(
	Choice1 nvarchar(150) not null,
	Choice2 nvarchar(150) not null,
	QuestionID int 

Constraint primaryKey_Treu_And_False_choices Primary Key (QuestionID)
)
create table True_And_False
(
	Correct_Answer nvarchar(150) not null,
	QuestionID int 

Constraint primaryKey_Treu_And_False Primary Key (QuestionID)
)

create table MCQ_choices
(
	Choice1 nvarchar(150) not null,
	Choice2 nvarchar(150) not null,
	Choice3 nvarchar(150) not null,
	QuestionID int 

Constraint primaryKey_MCQ_choices Primary Key (QuestionID)
)

create table MCQ
(
	Correct_Answer nvarchar(150) not null,
	QuestionID int 

Constraint primaryKey_MCQ Primary Key (QuestionID)
)

create table class
(
	classID int ,
	BranchID int,
	IntakeID int

Constraint primaryKey_class Primary Key (classID,BranchID,IntakeID)
)

create table Depatment
(
	Dept_ID int Primary key,
	[Name] nvarchar(50),
	Branch_ID int
)

create table Exam
(
	Exam_ID int Primary key,	
	Start_time time,
	End_time time,
	Exam_Data date,
	exam_type nvarchar(50),
	Total_Time float,
	Allowance_Options nvarchar(50),
	Total_Degree float,
	courseID int
)

create table Exam_Answers_Students
(
   	Exam_ID	int,
	Student_ID int,
	Question_ID int,
	mcq_answers char,
	T_F_answers bit,
	Text_Answers nvarchar(max)
	Constraint Exam_Answers_Students_PK Primary Key (Exam_ID, Student_ID,Question_ID)
)

create table Exam_Questions
(
	Exam_ID	int,
	Question_ID int,
	Question_degree int
	Constraint Exam_Questions_PK Primary Key (Exam_ID,Question_ID)
)


create table Question
(
	Question_ID int ,
	Content nvarchar(200) not null,
	Question_type nvarchar(40) not null,
	CourseID int
Constraint primaryKey_Question Primary Key (Question_ID,CourseID)
)

create table Track
(
	Track_ID int ,
	Name nvarchar(200) not null,
	Dep_ID int
Constraint primaryKey_Track Primary Key (Track_ID)
)

create table Branch
(
	Branch_ID int ,
	Location nvarchar(200) not null,
Constraint primaryKey_Branch Primary Key (Branch_ID)
)
create table Course_Students
(
	Course_ID int,
	Student_ID int,
	Final_Result float
	constraint Course_Students_PK Primary Key (Course_ID,Student_ID)

)

create table Intake
(
	Intake_ID int Primary Key,
	Number int
)
drop table [dbo].[Class_Tracks] 


--alter table [dbo].[Question] 
--add constraint [Question_type] check([Question_type] in ('t_f','mcq','text'))

--alter table [dbo].[Exam_Answers_Students]
--add constraint [Q_type] check( [Question_type] in ('t_f','mcq','text'))