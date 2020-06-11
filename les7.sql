use shop;

'������� 1'

select 
id
from users where id in (select user_id from orders);

'������� 2'

select
name, catalog_id,
(select name from catalogs where products.catalog_id=catalogs.id) as cet
from products;


'������� 3'

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  `from` VARCHAR(255),
  `to` VARCHAR(255)
); 

INSERT INTO flights (`from`, `to`) values
  ('moscow', 'omsk'),
  ('novgorod', 'kazan'),
  ('irkutsk', 'moscow'),
  ('omsk', 'irkutsk'),
  ('moscow', 'kazan');
 
DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  label VARCHAR(255),
  name VARCHAR(255)
); 

INSERT INTO cities (label, name) values
  ('moscow', '������'),
  ('novgorod', '��������'),
  ('irkutsk', '�������'),
  ('omsk', '����'),
  ('kazan', '������');
 
 select id, 
 (select name from cities where flights.`from`=cities.label) as ������,
 (select name from cities where flights.`to`=cities.label) as ����
 from flights; 
