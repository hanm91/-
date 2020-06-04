
'������������ ������� �� ���� ����������, ����������, ���������� � �����������'

'1.����� � ������� users ���� created_at � updated_at ��������� ��������������. ��������� �� �������� ����� � ��������. ���������'

'2.������� users ���� �������� ��������������. ������ created_at � updated_at ���� ������ ����� VARCHAR � � ��� ������ ����� ���������� 
�������� � ������� "20.10.2017 8:10". ���������� ������������� ���� � ���� DATETIME, �������� �������� ����� ��������.���������' 

'3. � ������� ��������� ������� storehouses_products � ���� value ����� ����������� ����� ������ �����: 0, ���� ����� ���������� 
� ���� ����, ���� �� ������ ������� ������. ���������� ������������� ������ ����� �������, 
����� ��� ���������� � ������� ���������� �������� value. ������, ������� ������ ������ ���������� � �����, ����� ���� �������.'

INSERT INTO shop.storehouses_products
  (value)
VALUES
  (0),
  (2500),
  (0),
  (30),
  (500),
  (1);
  
SELECT 
   * 
FROM 
  shop.storehouses_products 
order by 
  value in (0), value asc;


'4. �� ������� users ���������� ������� �������������, ���������� � ������� � ���. ������ ������ � ���� ������ 
���������� �������� ("may", "august")'

use shop;
SELECT 
  * 
FROM 
  shop.users 
where 
  month (birthday_at) LIKE 05 or month (birthday_at) like 08;

SELECT 
  name, 
  monthname(birthday_at) 
FROM 
  shop.users 
where
  monthname(birthday_at) LIKE 'may' or monthname(birthday_at)  like 'august';

'5. �� ������� catalogs ����������� ������ ��� ������ �������. SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
������������ ������ � �������, �������� � ������ IN.'

SELECT 
  * 
FROM 
  shop.catalogs 
WHERE 
  id IN (5, 1, 2)
order by 
  FIELD (id,5, 1, 2);


'������������ ������� ���� ���������� �������'

'1.����������� ������� ������� ������������� � ������� users'

SELECT 
  avg(floor((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25)) AS age_avg  
 FROM 
  shop.users; 

SELECT
  name,
  avg(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS age_avg
FROM
  shop.users;

'2.����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������. 
������� ������, ��� ���������� ��� ������ �������� ����, � �� ���� ��������.'

SELECT 
  name, 
  count(*), DAYNAME(Concat(2020,'-',month(birthday_at),'-',day(birthday_at))) 
FROM 
  shop.users 
group by
  DAYNAME(Concat(2020,'-',month(birthday_at),'-',day(birthday_at)));

'3.����������� ������������ ����� � ������� �������'

select 
  exp(sum(ln(field))) 
from 
  tab;


