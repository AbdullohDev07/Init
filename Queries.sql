update students
set fullname = 'salom'
where id = 1;

truncate archive_students;

select * from students;
select * from archive_students;

DELETE FROM "studentsXgroups"
WHERE "studentId" = 1;

DELETE FROM students
WHERE id = 1;