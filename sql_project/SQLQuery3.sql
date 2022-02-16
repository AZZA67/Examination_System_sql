

---------------------------------- add instructor---------------------------------------------------------------
alter proc insertInstructor (@id int,@name nvarchar(50),@phone nvarchar(20),@salary int ,@hire date ,@bd date)
as
begin  
	insert into [dbo].[instructor] values(@id,@name,@phone,@salary,@hire,@bd)
end
go
exec insertInstructor @id=1,@name='ehab',@phone=0128393,@salary=3000,@hire='2-2-2000',@bd='2-2-1980'
exec insertInstructor @id=2,@name='ali',@phone=0128393,@salary=3000,@hire='2-2-2000' ,@bd='2-2-1980'
exec insertInstructor @id=3,@name='saad',@phone=0128393,@salary=3000,@hire='2-2-2000',@bd='2-2-1980'
exec insertInstructor @id=4,@name='adel',@phone=0128393,@salary=3000,@hire='2-2-2000',@bd='2-2-1980'
exec insertInstructor @id=5,@name='bob',@phone=0128393,@salary=3000,@hire='2-2-2000',@bd='2-2-1980'
exec insertInstructor @id=6,@name='ramy',@phone=0128393,@salary=3000,@hire='2-2-2000',@bd='2-2-1980'
exec insertInstructor @id=7,@name='ahmed',@phone=0128393,@salary=3000,@hire='2-2-2000',@bd='2-2-1980'
exec insertInstructor @id=8,@name='monsef',@phone=0128393,@salary=3000,@hire='2-2-2000',@bd='2-2-1980'
exec insertInstructor @id=9,@name='fady',@phone=0128393,@salary=3000,@hire='2-2-2000',@bd='2-2-1980'
exec insertInstructor @id=10,@name='saher',@phone=0128393,@salary=3000,@hire='2-2-2000',@bd='2-2-1980'
exec insertInstructor @id=11,@name='denia',@phone=0128393,@salary=3000,@hire='2-2-2000',@bd='2-2-1980'
exec insertInstructor @id=12,@name='sohila',@phone=0128393,@salary=3000,@hire='2-2-2000',@bd='2-2-1980'
exec insertInstructor @id=13,@name='ehab',@phone=0128393,@salary=3000,@hire='2-2-2000',@bd='2-2-1980'
exec insertInstructor @id=14,@name='nassem',@phone=0128393,@salary=3000,@hire='2-2-2000',@bd='2-2-1980'
exec insertInstructor @id=15,@name='khaled',@phone=0128393,@salary=3000,@hire='2-2-2000',@bd='2-2-1980'
exec insertInstructor @id=16,@name='beshoy',@phone=0128393,@salary=3000,@hire='2-2-2000',@bd='2-2-1980'
exec insertInstructor @id=17,@name='ehab',@phone=0128393,@salary=3000,@hire='2-2-2000',@bd='2-2-1980'

--view
create view AllInstructors
as 
(
select * from [dbo].[instructor]
)
select *from AllInstructors

--search by name

create proc searchDataInstructore (@name nvarchar(50))
as 
begin
	begin try
				if(@name IS NOT NULL)
					begin
						select * from [dbo].[instructor]
						where [Name] like @name
					end
				else
					begin
						print 'not found name'
					end
	end try
	begin catch
		print 'error in search name instryctore'
	end catch
end
go
exec searchDataInstructore @name='ehab'
exec searchDataInstructore @name=null

-------------------------------add course---------------------------------


create proc insertCourse (@id int,@id_Instructore int,@MinDegree int,@maxDegree int , @description nvarchar(max),@name nvarchar(50))
as
begin  
	begin try
		insert into [dbo].[Course] values(@id,@id_Instructore,@MinDegree,@maxDegree,@description,@name)
	end try
	begin catch
		select 'error in sert data'
	end catch
end
go
exec insertCourse @id=1,@id_Instructore=1,@MinDegree=60,@maxDegree=100,@description='test word descripations',@name='C#'
exec insertCourse @id=2,@id_Instructore=1,@MinDegree=60,@maxDegree=100,@description='test word descripations',@name='java'
exec insertCourse @id=3,@id_Instructore=12,@MinDegree=60,@maxDegree=100,@description='test word descripations',@name='php'
exec insertCourse @id=4,@id_Instructore=1,@MinDegree=60,@maxDegree=100,@description='test word descripations',@name='Css'
exec insertCourse @id=5,@id_Instructore=2,@MinDegree=60,@maxDegree=100,@description='test word descripations',@name='C++'
exec insertCourse @id=6,@id_Instructore=1,@MinDegree=60,@maxDegree=100,@description='test word descripations',@name='C'
exec insertCourse @id=7,@id_Instructore=4,@MinDegree=60,@maxDegree=100,@description='test word descripations',@name='html'
exec insertCourse @id=8,@id_Instructore=4,@MinDegree=60,@maxDegree=100,@description='test word descripations',@name='html5'
exec insertCourse @id=9,@id_Instructore=1,@MinDegree=60,@maxDegree=100,@description='test word descripations',@name='git'
exec insertCourse @id=10,@id_Instructore=4,@MinDegree=60,@maxDegree=100,@description='test word descripations',@name='tfc'
exec insertCourse @id=11,@id_Instructore=1,@MinDegree=60,@maxDegree=100,@description='test word descripations',@name='DB'
exec insertCourse @id=12,@id_Instructore=8,@MinDegree=60,@maxDegree=100,@description='test word descripations',@name='mangoDB'
exec insertCourse @id=13,@id_Instructore=1,@MinDegree=60,@maxDegree=100,@description='test word descripations',@name='sql'
exec insertCourse @id=14,@id_Instructore=9,@MinDegree=60,@maxDegree=100,@description='test word descripations',@name='mvc'

--view 
		create view AllCourses
		as 
		(
		select * from [dbo].[Course]
		)

	select *from AllCourses


--search by name

create proc searchDataCourses (@name nvarchar(50))
as 
begin
	begin try
				if(@name IS NOT NULL)
					begin
						select * from [dbo].[Course]
						where [Course_Name] like @name
					end
				else
					begin
						print 'not found name'
					end
	end try
	begin catch
		print 'error in search name instryctore'
	end catch
end
exec searchDataCourses @name='C#'
exec searchDataInstructore @name=null

------------------------------------ add Branch------------------------------------------
create proc insertBranch (@id int,@Location nvarchar(200),@training_managerid int)
as
begin  
	begin try
		insert into [dbo].[Branch] values(@id,@Location,@training_managerid)
	end try
	begin catch
		select 'error in sert data'
	end catch
end
go
exec insertBranch @id=1,@Location='assiout',@training_managerid=1
exec insertBranch @id=2,@Location='miniya',@training_managerid=2
exec insertBranch @id=3,@Location='alx',@training_managerid=3
exec insertBranch @id=4,@Location='cairo',@training_managerid=4
exec insertBranch @id=5,@Location='mansoura',@training_managerid=5
exec insertBranch @id=6,@Location='giza',@training_managerid=6
exec insertBranch @id=7,@Location='sohag',@training_managerid=7
exec insertBranch @id=8,@Location='smart',@training_managerid=8
exec insertBranch @id=9,@Location='asmeliae' ,@training_managerid=9


--view
	create view AllBranch
		as 
		(
		select * from  [dbo].[Branch]
		)

	select *from AllBranch
	
	--search by name

	go
create proc searchByBranch (@name nvarchar(50))
as 
begin
	begin try
				if(@name IS NOT NULL)
					begin
						select * from  [dbo].[Branch]
						where [Location] like @name
					end
				else
					begin
						print 'not found name'
					end
	end try
	begin catch
		print 'error in search name instryctore'
	end catch
end
go
exec searchByBranch @name='assiout'
exec searchDataInstructore @name=null
------------------------------------------- add department------------------------------------

go
create proc insertDepartment (@id int,@id_branch int,@name nvarchar(50))
as
begin  
	begin try
		insert into  [dbo].[Depatment] values(@id,@name,@id_branch)
	end try
	begin catch
		select 'error in sert data'
	end catch
end
go
exec insertDepartment @id=1,@id_branch=1,@name='sd'
exec insertDepartment @id=2,@id_branch=2,@name='full satck'
exec insertDepartment @id=3,@id_branch=2,@name='php'
exec insertDepartment @id=4,@id_branch=4,@name='open source'
exec insertDepartment @id=5,@id_branch=3,@name='java '
exec insertDepartment @id=6,@id_branch=3,@name='BI'
exec insertDepartment @id=7,@id_branch=6,@name='graghic'
exec insertDepartment @id=8,@id_branch=2,@name='animations'
exec insertDepartment @id=9,@id_branch=2,@name='gameing'
exec insertDepartment @id=10,@id_branch=1,@name='network'


--view
	create view AllDepartment
		as 
		(
		select * from   [dbo].[Depatment]
		)

	select *from AllDepartment
	
	--search by name

	
create proc searchByDepartment (@name nvarchar(50))
as 
begin
	begin try
				if(@name IS NOT NULL)
					begin
						select * from  [dbo].[Depatment]
						where [Name]  like @name
					end
				else
					begin
						print 'not found name'
					end
	end try
	begin catch
		print 'error in search name instryctore'
	end catch
end
exec searchByDepartment @name='sd'
exec searchByDepartment @name=null
------------------------------ add Intake----------------------------------------------

create proc insertIntake (@id int )
as
begin  
	begin try
		insert into  [dbo].[Intake] values(@id)
	end try
	begin catch
		select 'error insert data'
	end catch
end
go
exec insertIntake @id=1 
exec insertIntake @id=2 
exec insertIntake @id=12 
exec insertIntake @id=40 
exec insertIntake @id=42 
exec insertIntake @id=41 
exec insertIntake @id=22
exec insertIntake @id=24 
exec insertIntake @id=30 

--view
	create view AllIntake
		as 
		(
		select * from  [dbo].[Intake]
		)

	select *from AllIntake
	
	--search by name
	go
alter proc searchByIntake (@number int)
as 
begin
	begin try
				if(@number IS NOT NULL)
					begin
						select * from [dbo].[Intake]
						where [Intake_ID]=@number
					end
				else
					begin
						print 'not found intake number'
					end
	end try
	begin catch
		print 'error in intake search '
	end catch
end
exec searchByIntake @number=42
exec searchByIntake @number=null
-------------------------------------------------- add track-------------------------------------------------------
go
create proc insertTrack (@id int,@name nvarchar(200),@id_Dep int)
as
begin  
	begin try
		insert into  [dbo].[Track] values(@id,@name,@id_Dep)
	end try
	begin catch
		select 'error in sert data'
	end catch
end
go
exec insertTrack @id=1,@id_Dep=1,@name='sdgg'
exec insertTrack @id=2,@id_Dep=2,@name='test'
exec insertTrack @id=3,@id_Dep=1,@name='exam'
exec insertTrack @id=4,@id_Dep=3,@name='sdgg'
exec insertTrack @id=5,@id_Dep=3,@name='rt'
exec insertTrack @id=6,@id_Dep=5,@name='d'
exec insertTrack @id=7,@id_Dep=7,@name='asd'
exec insertTrack @id=8,@id_Dep=8,@name='sdgg'
exec insertTrack @id=9,@id_Dep=1,@name='r4'


--view
	create view AllTracks
		as 
		(
		select * from  [dbo].[Track]
		)

	select *from AllTracks
	
	--search by name

	
create proc searchByTracks (@name nvarchar(50))
as 
begin
	begin try
				if(@name IS NOT NULL)
					begin
						select * from  [dbo].[Track]
						where [Name]  like @name
					end
				else
					begin
						print 'not found name'
					end
	end try
	begin catch
		print 'error in search name instryctore'
	end catch
end
exec searchByTracks @name='sdgg'
exec searchByTracks @name=null
----------------------------------------add class---------------------------------------------------------
go
create proc insertClass (@id int,@id_Branch int,@intakeID int,@trackID int)
as
begin  
	begin try
		insert into  [dbo].[class]  values(@id,@id_Branch,@intakeID,@trackID)
	end try
	begin catch
		select 'error in sert data'
	end catch
end
go
exec insertClass @id=1,@id_Branch=1,@intakeID=12,@trackID=1
exec insertClass @id=2,@id_Branch=2,@intakeID=40,@trackID=2
exec insertClass @id=3,@id_Branch=3,@intakeID=42,@trackID=2
exec insertClass @id=4,@id_Branch=3,@intakeID=40,@trackID=2
exec insertClass @id=5,@id_Branch=2,@intakeID=41,@trackID=3
exec insertClass @id=6,@id_Branch=1,@intakeID=40,@trackID=4
exec insertClass @id=7,@id_Branch=6,@intakeID=22,@trackID=4
exec insertClass @id=8,@id_Branch=6,@intakeID=1,@trackID=2
exec insertClass @id=9,@id_Branch=8,@intakeID=2,@trackID=2
exec insertClass @id=10,@id_Branch=1,@intakeID=40,@trackID=6


--view
	create view AllClass
		as 
		(
		select * from  [dbo].[class]
		)

	select *from AllClass
	
	--search by name
	go
create proc searchByClass (@num int)
as 
begin
	begin try
				if(@num IS NOT NULL)
					begin
						select * from  class
						where [classID]=@num
					end
				else
					begin
						print 'not found class'
					end
	end try
	begin catch
		print 'error in search class'
	end catch
end
go
exec searchByClass @num=1
exec searchByClass @num=null

---------------------------------------add Student----------------------------------------------------------
go
create proc insertStudent (@id int ,@name nvarchar(50) ,@brithday date,@phone nvarchar(20),@address nvarchar(100),@idClass int)
as
begin  
	begin try
		insert into  [dbo].[Student] values(@name,@id,@phone,@brithday,@address,@idClass)
	end try
	begin catch
		select 'error in sert data'
	end catch
end
go
exec insertStudent @id=1,@name='Ali',@brithday='2-3-2001',@phone=091237928,@address='miniya',@idClass=1
exec insertStudent @id=2,@name='mona',@brithday='2-3-2001',@phone=091237928,@address='assiout',@idClass=2
exec insertStudent @id=3,@name='sara',@brithday='2-3-2001',@phone=091237928,@address='miniya',@idClass=3
exec insertStudent @id=4,@name='saad',@brithday='2-3-2001',@phone=091237928,@address='sohag',@idClass=2
exec insertStudent @id=5,@name='ehab',@brithday='2-3-2001',@phone=091237928,@address='alx',@idClass=2
exec insertStudent @id=6,@name='ahmed',@brithday='2-3-2001',@phone=091237928,@address='smart',@idClass=5
exec insertStudent @id=7,@name='Ali',@brithday='2-3-2001',@phone=091237928,@address='cairo',@idClass=3
exec insertStudent @id=8,@name='nasser',@brithday='2-3-2001',@phone=091237928,@address='miniya',@idClass=6
exec insertStudent @id=9,@name='Ali',@brithday='2-3-2001',@phone=091237928,@address='alex',@idClass=8
go
--view 
		create view AllStudents
		as 
		(
		select * from  [dbo].[Student]
		)

	select *from AllStudents


--search by name

create proc searchDataStudent (@name nvarchar(50))
as 
begin
	begin try
				if(@name IS NOT NULL)
					begin
						select * from student
						where Name like @name
					end
				else
					begin
						print 'not found name'
					end
	end try
	begin catch
		print 'error in search student'
	end catch
end
exec searchDataStudent @name='ali'
exec searchDataStudent @name=null
---------------------------------add questions----------------------------------------

exec insertQuestions @id=2 ,@insid=1,@content ='any text', @QuestionType ='t_f' ,@idCourse=2
exec insertQuestions @id=3 ,  @insid=1,@content ='any text', @QuestionType ='mcq' ,@idCourse=1
exec insertQuestions @id=4 ,  @insid=1,@content ='any text', @QuestionType ='text' ,@idCourse=3
exec insertQuestions @id=5 ,  @insid=1,@content ='any text', @QuestionType ='t_f' ,@idCourse=3
exec insertQuestions @id=6 ,  @insid=1,@content ='any text', @QuestionType ='text' ,@idCourse=4
exec insertQuestions @id=7 ,  @insid=1,@content ='any text', @QuestionType ='t_f' ,@idCourse=1
exec insertQuestions @id=8 ,  @insid=1,@content ='any text', @QuestionType ='t_f' ,@idCourse=5
exec insertQuestions @id=9 ,  @insid=1,@content ='any text', @QuestionType ='t_f' ,@idCourse=5
exec insertQuestions @id=10 ,  @insid=1,@content ='any text', @QuestionType ='text' ,@idCourse=1
exec insertQuestions @id=11 ,  @insid=1,@content ='any text', @QuestionType ='mcq' ,@idCourse=1
exec insertQuestions @id=12 ,  @insid=1,@content ='any text', @QuestionType ='mcq' ,@idCourse=1
exec insertQuestions @id=13 ,  @insid=1,@content ='any text', @QuestionType ='mcq' ,@idCourse=1
exec insertQuestions @id=14 ,  @insid=1,@content ='any text', @QuestionType ='mcq' ,@idCourse=1
go
--view 
go
		create view AllQuestionsContent
		as 
		(
		select * from   [dbo].[Question]
		)

	select *from AllQuestionsContent


--search by name
go
alter proc searchDataContent (@name nvarchar(50))
as 
begin
	begin try
				if(@name IS NOT NULL)
					begin
						select * from [dbo].[Question]
						where [Question_type] like '%'+@name+'%'
					end
				else
					begin
						print 'not found name'
					end
	end try
	begin catch
		print 'error in search name instryctore'
	end catch
end
go
exec searchDataContent @name='t_f'
exec searchDataContent @name=null



------------------------------------------ add true_And_false answer------------------------------------
go
alter proc insertDataTrueAnd_false(@id int,@Qanswer nvarchar(150))
as
begin  
	begin try
	if @id in (select [Question_ID] from [dbo].[Question]
 where [Question_type] ='t_f')
      begin
		insert into   [dbo].[True_And_False] values(@Qanswer,@id)
		end
	end try
	begin catch
		select 'error insert data'
	end catch
 end


go
exec insertDataTrueAnd_false @id=1,@Qanswer='true'
exec insertDataTrueAnd_false @id=2,@Qanswer='true'
exec insertDataTrueAnd_false @id=3,@Qanswer='false'
exec insertDataTrueAnd_false @id=4,@Qanswer='true'
exec insertDataTrueAnd_false @id=5,@Qanswer='true'
exec insertDataTrueAnd_false @id=6,@Qanswer='true'
exec insertDataTrueAnd_false @id=7,@Qanswer='false'
exec insertDataTrueAnd_false @id=8,@Qanswer='false'
exec insertDataTrueAnd_false @id=9,@Qanswer='false'
exec insertDataTrueAnd_false @id=10,@Qanswer='false'

go
--view
	create view AllTrueAnd_False
		as 
		(
		select * from   [dbo].[True_And_False]
		)

	select *from AllTrueAnd_False
	
	 
	----------------------------------add Text_Questions--------------------------
	go
alter proc insertQuestionsText (@id int ,@correct nvarchar(50))
as
begin  
		begin try
	if @id in (select [Question_ID] from [dbo].[Question]
 where [Question_type] ='text')
      begin
		insert into  [dbo].[Text_questions]  values(@correct,@id)
		end
	end try
	begin catch
		select 'error insert data'
	end catch
 end
go
exec insertQuestionsText @id=1 ,@correct ='any text' 
exec insertQuestionsText @id=2 ,@correct ='any text' 
exec insertQuestionsText @id=3 ,@correct ='any text' 
exec insertQuestionsText @id=4 ,@correct ='any text' 
exec insertQuestionsText @id=5 ,@correct ='any text' 
exec insertQuestionsText @id=6 ,@correct ='any text' 
exec insertQuestionsText @id=7 ,@correct ='any text' 
exec insertQuestionsText @id=8 ,@correct ='any text' 
exec insertQuestionsText @id=9 ,@correct ='any text' 
exec insertQuestionsText @id=10 ,@correct ='any text' 
exec insertQuestionsText @id=11 ,@correct ='any text' 
exec insertQuestionsText @id=12 ,@correct ='any text' 
exec insertQuestionsText @id=13 ,@correct ='any text' 

--view 
		create view AllQuestionsText
		as 
		(
		select * from   [dbo].[Question]
		)

	select *from AllQuestionsText


--search by name
go
alter proc searchDataText_Questions (@name nvarchar(50))
as 
begin
	begin try
				if(@name IS NOT NULL)
					begin
						select * from  [dbo].[Text_questions]
						where  [Correct_Answer] like '%'+@name+'%'
					end
				else
					begin
						print 'not found name'
					end
	end try
	begin catch
		print 'error in search name error'
	end catch
end
go
exec searchDataText_Questions @name='text'
exec searchDataText_Questions @name=null


----------------------------------------add true And False_Choose-----------------------------------------------------------
go
create proc insertintable_t_f_Choose (@id_quiz int ,@Choose1 nvarchar(150),@Choose2 nvarchar(150))
as
begin  
	begin try

		insert into  [dbo].[True_And_False_choices]  values(@Choose1 ,@Choose2,@id_quiz)
	end try
	begin catch
		select 'error in sert data'
	end catch
end
go
exec insertintable_t_f_Choose @id_quiz=1 ,@Choose1 ='true', @Choose2='false'
exec insertintable_t_f_Choose @id_quiz=2 ,@Choose1 ='true', @Choose2='false'
exec insertintable_t_f_Choose @id_quiz=3 ,@Choose1 ='true', @Choose2='false'
exec insertintable_t_f_Choose @id_quiz=4 ,@Choose1 ='true', @Choose2='false'
exec insertintable_t_f_Choose @id_quiz=5 ,@Choose1 ='true', @Choose2='false'
exec insertintable_t_f_Choose @id_quiz=6 ,@Choose1 ='true', @Choose2='false'
exec insertintable_t_f_Choose @id_quiz=7 ,@Choose1 ='true', @Choose2='false'
exec insertintable_t_f_Choose @id_quiz=8 ,@Choose1 ='true', @Choose2='false'
exec insertintable_t_f_Choose @id_quiz=9 ,@Choose1 ='true', @Choose2='false'
exec insertintable_t_f_Choose @id_quiz=10 ,@Choose1 ='true', @Choose2='false'
exec insertintable_t_f_Choose @id_quiz=11 ,@Choose1 ='true', @Choose2='false'
exec insertintable_t_f_Choose @id_quiz=12 ,@Choose1 ='true', @Choose2='false'
exec insertintable_t_f_Choose @id_quiz=14 ,@Choose1 ='true', @Choose2='false'
exec insertintable_t_f_Choose @id_quiz=15 ,@Choose1 ='true', @Choose2='false'

--view 
		create view AllT_F_Choos
		as 
		(
		select * from   [dbo].[True_And_False_choices]
		)

	select *from AllT_F_Choos


--search by name

alter proc searchDataT_F_Choose (@num int)
as 
begin
	begin try
				if(@num IS NOT NULL)
					begin
						select * from   [dbo].[True_And_False_choices]
						where   [QuestionID] =@num
					end
				else
					begin
						print 'not found name'
					end
	end try
	begin catch
		print 'error in search name instryctore'
	end catch
end
exec searchDataT_F_Choose @num=2
exec searchDataText_Questions @name=null
-----------------------------------insert mcq choices----------------------------------------------------------------------------


go
create proc insertintable_MCQ_choices (@id_quiz int ,@Choose1 nvarchar(150),@Choose2 nvarchar(150),@Choose3 nvarchar(150))
as
begin  
	begin try

		insert into  [dbo].[MCQ_choices]  values(@Choose1 ,@Choose2,@Choose3 ,@id_quiz)
	end try
	begin catch
		select 'error insert data'
	end catch
end
go
exec insertintable_MCQ_choices @id_quiz=1 ,@Choose1 ='true', @Choose2='false',@Choose3='false'
exec insertintable_MCQ_choices @id_quiz=2 ,@Choose1 ='true', @Choose2='false',@Choose3='true'
exec insertintable_MCQ_choices @id_quiz=3 ,@Choose1 ='true', @Choose2='false',@Choose3='false'
exec insertintable_MCQ_choices @id_quiz=4 ,@Choose1 ='true', @Choose2='false',@Choose3='false'
exec insertintable_MCQ_choices @id_quiz=5 ,@Choose1 ='true', @Choose2='false',@Choose3='false'
exec insertintable_MCQ_choices @id_quiz=6 ,@Choose1 ='true', @Choose2='false',@Choose3='false'
exec insertintable_MCQ_choices @id_quiz=7 ,@Choose1 ='true', @Choose2='false',@Choose3='true'
exec insertintable_MCQ_choices @id_quiz=8 ,@Choose1 ='true', @Choose2='false',@Choose3='false'
exec insertintable_MCQ_choices @id_quiz=9 ,@Choose1 ='true', @Choose2='false',@Choose3='false'
exec insertintable_MCQ_choices @id_quiz=10 ,@Choose1 ='true', @Choose2='false',@Choose3='true'
exec insertintable_MCQ_choices @id_quiz=11 ,@Choose1 ='true', @Choose2='false',@Choose3='false'
exec insertintable_MCQ_choices @id_quiz=12 ,@Choose1 ='true', @Choose2='false',@Choose3='false'
exec insertintable_MCQ_choices @id_quiz=14 ,@Choose1 ='true', @Choose2='false',@Choose3='true'
exec insertintable_MCQ_choices @id_quiz=15 ,@Choose1 ='true', @Choose2='false',@Choose3='false'
------------------------------------------insert mcq question-------------------------------------------------------------------
GO
create proc insertmcq(@id int,@Qanswer nvarchar(150))
as
begin  
	begin try
	if @id in (select [Question_ID] from [dbo].[Question]
 where [Question_type] ='mcq')
      begin
		insert into [dbo].[MCQ]  values(@Qanswer,@id)
		end
	end try
	begin catch
		select 'error insert data'
	end catch
 end

 exec insertmcq @id=1,@Qanswer='A'
exec insertmcq @id=2,@Qanswer='B'
exec insertmcq @id=3,@Qanswer='c'
exec insertmcq @id=11,@Qanswer='A'
exec insertmcq @id=12,@Qanswer='C'
exec insertmcq @id=13,@Qanswer='A'
exec insertmcq @id=14,@Qanswer='C'

-------------------------------------insert exam--------------------------
go
create proc insert_exam (@examid int ,@start_time time,@end_time time ,@exam_date date,
@exam_type nvarchar(50) ,@allowance_option nvarchar(50) ,@courseid int )
as begin 
begin try 
if @courseid in (select  [ID] from [dbo].[course])
begin
insert into [dbo].[Exam] values (@examid,@start_time,@end_time,@exam_date,
@exam_type,@allowance_option,@courseid,null)
end
end try
begin catch 
select 'error insert data'
end catch 
end 

exec insert_exam @examid =4,@start_time= '19:00:00',@end_time= '21:00:00' ,@exam_date = '2022-02-01',
@exam_type='exam' ,@allowance_option ='calculator' ,@courseid= 1

exec insert_exam @examid =2,@start_time= '07:00:00',@end_time= '09:00:00' ,@exam_date = '2022-02-06',
@exam_type='exam' ,@allowance_option ='calculator' ,@courseid= 2
exec insert_exam @examid =3,@start_time= '09:00:00',@end_time= '11:00:00' ,@exam_date = '2022-02-11',
@exam_type='exam' ,@allowance_option ='calculator' ,@courseid= 3
-----------------------------------------insert questions----------------------------------------------
go
alter proc insertQuestions(@id int ,@insid int,@content nvarchar(200), @QuestionType nvarchar(40),@idCourse int)
as
begin  

if	@insid =(select [Inst_ID] from [dbo].[course]
	where [ID]=@idCourse)
	begin
	begin try
		insert into [dbo].[Question] values(@id ,@content , @QuestionType  ,@idCourse )
	end try
	begin catch
		select 'error insert data'
	end catch
	end
	else
	BEGIN 
	RAISERROR('you are not allowed to insert here',10,11)
		
	END 
end
go
exec insertQuestions @id=4 ,@insid=1 ,@content ='any text', @QuestionType ='mcq' ,@idCourse=2
go
alter proc UpdateQuestion(@Id_inst int,@id_question int,@Content nvarchar(200),@courseid int)
as
	begin
	Declare @id int
if	@Id_inst =(select [Inst_ID] from [dbo].[course]
	where [ID]=@courseid)
				begin
					UPDATE [dbo].[Question]
					SET [Content]=@Content
					WHERE  [Question_ID]= @id_question;
				end
			else
				begin
				RAISERROR ('You are not allowed to Edit ', 10, 11)
				end
	end
exec UpdateQuestion @Id_inst=1,@id_question=1,@Content='update text' ,@courseid=1

go
create proc DeletQuestion(@Id_inst int,@id_question int,@courseid int)
as
	begin
	
	if	@Id_inst =(select [Inst_ID] from [dbo].[course]
	where [ID]=@courseid)
				begin
					 DELETE FROM [dbo].[Question] WHERE  [Question_ID]=@id_question
				end
			else
				begin
				RAISERROR ('You are not allowed to edit', 10, 11)
				end

	end

exec DeletQuestion @Id_inst=1,@id_question=4,@courseid=2

----------------------------------------------------------------------------