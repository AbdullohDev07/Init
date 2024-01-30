create or replace function myfunc_for_trigger_update_and_after()
returns trigger
language PLPGSQL
AS $$
begin
--	logic
	if old.fullname <> new.fullname or old.age <> new.age then
	
	insert into archive_students(oldid, fullname, age)
	values (old.id, old.fullname, old.age);
	
	end if;
	return new;
end
$$

create or replace function myfunc_for_trigger_delete()
returns trigger
language PLPGSQL
AS $$
begin
--	logic
--	if old.fullname <> new.fullname or old.age <> new.age then
	
	insert into archive_students(oldid, fullname, age)
	values (old.id, old.fullname, old.age);
	
--	end if;
	return old;
end
$$

create or replace trigger trigger_for_students_with_update
before update
on students
for each row
execute procedure myfunc_for_trigger_update_and_after();

create or replace trigger trigger_for_students_with_after
after update
on students
for each row
execute procedure myfunc_for_trigger_update_and_after();

create or replace trigger trigger_for_students_with_delete
after delete
on students
for each row
execute procedure myfunc_for_trigger_delete();