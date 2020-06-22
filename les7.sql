'задание 1.1'

select * from shop.users;

start transaction;

insert into sample.users select id, name from shop.users where id=1;

delete from shop.users where id=1;

commit;

'задание 1.2'
use shop;

create or replace view pr_cat as
select pr.name product, ct.name catal
from products as pr join catalogs as ct on pr.catalog_id = ct.id;

select *from pr_cat;

'задание 3.1'


delimiter //

create function hallo ()
returns tinytext not deterministic
begin
	declare hour int;
    set hour = hour(now));
    case
     when hour between 0 and 5 then 
      return 'оброй ночи';
     when hour between 6 and 11 then 
      return 'обро утро';
     when hour between 12 and 17 then 
      return 'оброый день';
     when hour between 18 and 23 then 
      return 'обрый вечер';
     end case;
end//

'задание 3.2'


create trigger valid_name before insert on shop.products 
for each row begin 
	if new.name is null and new.description is null then 
	  signal sqlstate '45000'
	  set message_text = 'is null'
	end if;
end//




