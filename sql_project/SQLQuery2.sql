---------------------------------------------------------------
--stored procedure  to make instructor be able to  pick  the questions of the exam  randomly
go
alter proc select_questions_randomly @exam_id int , @num_of_mcq int ,@num_of_tf int,
@num_of_text int , @degree_of_mcq int ,@degree_of_text int ,@degree_of_tf int ,@courseID int ,@instructorid int
 as begin 
 if @instructorid in (select [Inst_ID] from [dbo].[course] where [ID]=@courseID )
 begin 
  declare @total int 
 set @total =(@num_of_mcq*@degree_of_mcq)+(@num_of_tf*@degree_of_tf)+
 (@num_of_text*@degree_of_text)
 if @total > (select [Max_degree] from [dbo].[course] c where c.ID=@courseID )
 begin
 return @@ERROR 
 end
declare crs cursor for select top (@num_of_mcq) [QuestionID] from [dbo].[MCQ]
where QuestionID in (select [Question_ID] from [dbo].[Question] where [CourseID]=@courseID)
order by RAND()
for update
open crs
declare @QuestionID int
fetch NEXT FROM crs into @QuestionID
while @@FETCH_STATUS =0
begin

insert into [dbo].[Exam_Questions] values(@exam_id,@QuestionID,@degree_of_mcq)
fetch NEXT FROM crs into @QuestionID
end
close crs 
deallocate crs 

declare crs1 cursor for select top (@num_of_tf) [QuestionID] from [dbo].[True_And_False]
where QuestionID in (select [Question_ID] from [dbo].[Question] where [CourseID]=@courseID)
order by RAND()
for update
open crs1
declare @QuestionID1 int
fetch NEXT FROM crs1 into @QuestionID1
while @@FETCH_STATUS =0
begin
insert into [dbo].[Exam_Questions] values(@exam_id,@QuestionID1,@degree_of_tf)
fetch NEXT FROM crs1 into @QuestionID1
end
close crs1 
deallocate crs1 

declare crs2 cursor for select top (@num_of_text) [QuestionID] from [dbo].[Text_questions]
where QuestionID in (select [Question_ID] from [dbo].[Question] where [CourseID]=@courseID)
order by RAND()
for update
open crs2
declare @QuestionID2 int
fetch NEXT FROM crs2 into @QuestionID2
while @@FETCH_STATUS =0
begin
insert into [dbo].[Exam_Questions] values(@exam_id,@QuestionID2,@degree_of_text)
fetch NEXT FROM crs2 into @QuestionID2
end
close crs2 
deallocate crs2 
end
end
exec select_questions_randomly 4 ,3,2,3,2,4,1,1,1 
-------------------------------------------------------------------------

--stored procedure  to calculate total degree of the exam 
alter proc exam_total_degree @examID int
as begin 
declare @total_degree int
select @total_degree= sum([Question_degree]) 
from [dbo].[Exam_Questions] 
where [Exam_ID]=@examID
update [dbo].[Exam] set [total_degree]=@total_degree where [Exam_ID]=@examID
end
   exec exam_total_degree  @examID=4 
   ---------------------------------------------------------------------
--stored procedure  to make instructor be able to  assign specific students to specific exam
go
alter proc assign_students_to_exam @classid int , @examid int 
as begin 
declare @total_degree int
select @total_degree =[total_degree] from [dbo].[Exam]
where [Exam_ID]=@examid
declare @courseid int
select @courseid =[courseID] from [dbo].[Exam]
where [Exam_ID] =@examid
declare crs2 cursor for select [ID] from [dbo].[student] 
where [dbo].[student].classID=@classid
for UPDATE 
open crs2
declare @Studentid int 
fetch NEXT FROM crs2 into @Studentid
while @@FETCH_STATUS =0
begin
insert into [dbo].[Course_Students]([Course_ID],[Student_ID],[exam_total_degree]) values(@courseid,@Studentid,@total_degree)
fetch NEXT FROM crs2 into @Studentid
end
close crs2 --stop lock on table
deallocate crs2 --deallocate result set in memory
end   
exec assign_students_to_exam 2,4
---------------------------------
--procedure to make Students can see the exam on the specified time
go
alter procedure show_exam (@examid int)
as begin
declare @questionid int
declare @cuurent_time time
set @cuurent_time = CONVERT(time, GETDATE()) 
  if  @cuurent_time  < (select [Start_time] from [dbo].[Exam] 
  where [Exam_ID] =@examid)
   begin
    RAISERROR ('You are not allowed to Answer Now', 10, 11)
    END
   else if @cuurent_time  > (select [End_time] from [dbo].[Exam] 
  where  [Exam_ID] =@examid )
   begin
    RAISERROR ('You are not allowed to Answer Now', 10, 11)
    END
 else if GETDATE() != (select [Exam_Data] from [dbo].[Exam] 
  where [Exam_ID] =@examid)
  begin
    RAISERROR ('You are not allowed to Answer Now', 10, 11)
    END
else
	begin
	select * from [dbo].[Exam] 
	where [Exam_ID] =@examid
	
	declare crs cursor for select  [Question_type],eq.Question_ID from [dbo].[Exam_Questions] eq
	inner join [dbo].[Question] q on q.Question_ID =eq.Question_ID
for update  
open crs
declare @questiontype nvarchar(40)
fetch NEXT FROM crs into @questiontype ,@questionid
while @@FETCH_STATUS =0
begin
if @questiontype='t_f'
begin 
select [Content] ,tf.Choice1,tf.Choice2  from [dbo].[Question] q , [dbo].[True_And_False_choices] tf 
where q.Question_ID =tf.QuestionID and tf.QuestionID= @questionid
end 
 if @questiontype='mcq'
begin 

select [Content] ,mcq.Choice1,mcq.Choice2,mcq.Choice3  from [dbo].[Question] q , [dbo].[MCQ_choices] mcq
where q.Question_ID =mcq.QuestionID and mcq.QuestionID= @questionid
end

 if @questiontype='text'
begin
select [Content]   from [dbo].[Question] q
where q.Question_ID =@questionid
end
fetch NEXT FROM crs into @questiontype ,@questionid
end 
close crs 
deallocate crs 
end
end
exec show_exam 4
----------------------------------------------------------------------

--procedure to make Students can do the exam on the specified time

go
alter trigger exam_time_check on [dbo].[Exam_Answers_Students] 
INSTEAD OF INSERT
AS BEGIN
declare @cuurent_time time
declare @examid int
declare @Studentid int
declare @questionid int
declare @mcq_answers char(1)
declare @T_F_answers bit
declare @text_answers nvarchar(max)
declare @questionType nvarchar(40)
select @questionType=[Question_type] from [dbo].[Question]
where [Question_ID] =(select [Question_ID] from inserted )
(select @examid= [Exam_ID],@Studentid=[Student_ID],@questionid=[Question_ID]
,@mcq_answers =[mcq_answers],@T_F_answers =[T_F_answers], @text_answers=[Text_Answers]
from inserted)
set @cuurent_time = CONVERT(time, GETDATE()) 
    if  @cuurent_time  < (select [Start_time] from [dbo].[Exam] 
  where [Exam_ID] =(select  @examid from inserted))
   begin
    RAISERROR ('You are not allowed to Answer Now', 10, 11)
    END
   else if @cuurent_time  > (select [End_time] from [dbo].[Exam] 
  where  [Exam_ID] =(select  @examid from inserted))
   begin
    RAISERROR ('You are not allowed to Answer Now', 10, 11)
    END
	else
	begin
	INSERT INTO [dbo].[Exam_Answers_Students] values (@examid,@Studentid,@questionid,
	     @mcq_answers,@T_F_answers,@text_answers,@questionType  )
		 end
  end
   INSERT INTO [dbo].[Exam_Answers_Students] ( [Exam_ID],[Student_ID] ,[Question_ID], [mcq_answers]
   , [T_F_answers],[Text_Answers]) values(1,2,12,'B',null,null)
  INSERT INTO [dbo].[Exam_Answers_Students]  values (4,4,10,null,null,'any text','text')
  INSERT INTO [dbo].[Exam_Answers_Students] values (4,2,3,'A',null,null,'mcq')
  INSERT INTO [dbo].[Exam_Answers_Students] values (4,2,1,null,'true',null,'t_f')
  INSERT INTO [dbo].[Exam_Answers_Students] values (4,2,10,null,null,'any text','text') 
  INSERT INTO [dbo].[Exam_Answers_Students] values (4,2,10,null,null,'any text','text')
 ----------------------------------------------------------------------------------
--stored procedure  to calculate the student exam final result 
go
alter proc student_exam_final_result @student_id int,@examid int
as begin 
declare @final_result float
set @final_result=0
print @final_result
declare crs cursor for select  [Question_type] from [dbo].[Exam_Answers_Students]
where [Student_ID]=@student_id and [Exam_ID]=@examid
for update
open crs
declare @questiontype nvarchar(40)
fetch NEXT FROM crs into @questiontype
while @@FETCH_STATUS =0
begin
if @questiontype='t_f'
begin 
select @final_result= sum([Question_degree]) from [dbo].[Exam_Questions] as eq,
[dbo].[Exam_Answers_Students] as ex_answ,[dbo].[True_And_False] as tf_correct_ans
where eq.Question_ID=ex_answ.Question_ID and  tf_correct_ans.QuestionID=ex_answ.Question_ID 
and ex_answ.T_F_answers =tf_correct_ans.Correct_Answer
print @final_result
end 
 if @questiontype='mcq'
begin 
select @final_result=@final_result+ sum([Question_degree]) from [dbo].[Exam_Questions] as eq,
[dbo].[Exam_Answers_Students] as ex_answ,[dbo].[MCQ]as mcq_correct_ans
where eq.Question_ID=ex_answ.Question_ID and  mcq_correct_ans.QuestionID=ex_answ.Question_ID 
and ex_answ.mcq_answers =mcq_correct_ans.Correct_Answer
print @final_result
end

 if @questiontype='text'
begin
select @final_result=@final_result+ sum([Question_degree]) from [dbo].[Exam_Questions] as eq,
[dbo].[Exam_Answers_Students] as ex_answ, [dbo].[Text_questions]as text_correct_ans
where eq.Question_ID=ex_answ.Question_ID and  text_correct_ans.QuestionID=ex_answ.Question_ID 
and ex_answ.Text_Answers =text_correct_ans.Correct_Answer
print @final_result
end

fetch NEXT FROM crs into @questiontype
end
update [dbo].[Course_Students] set [Final_Result]=@final_result where [Student_ID]=@student_id 
close crs 
deallocate crs 


end
exec student_exam_final_result 4,4
