select * from lesson;
delete from lesson where id=6;

select * from paper;
update paper set id=id-1 where id>1;
show tables;

select * from question;
update question set type='s' where type='S';
delete from question where id=15;


select * from student;
update student set pwd=111 where id is not null;
select * from stu_result;

select * from stu_result;
delete from stu_result where id>0;