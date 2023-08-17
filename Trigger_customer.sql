create or alter trigger CustomerCheck on Customer for update as
begin
declare @old_city nvarchar (40);
declare @new_city nvarchar (40);
select @old_city = city from deleted; 
select @new_city = city from inserted; 
if @old_city != @new_city
begin
print'the Old city not equle new city';
ROLLBACK;
end
end

update Customer set city = 'Berlin' where id= 1;
update Customer set city = 'London' where id= 1;