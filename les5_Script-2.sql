
'Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”'

'1.Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем. ВЫПОЛНЕНО'

'2.Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались 
значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.ВЫПОЛНЕНО' 

'3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился 
и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, 
чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.'

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


'4. Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка 
английских названий ("may", "august")'

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

'5. Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
Отсортируйте записи в порядке, заданном в списке IN.'

SELECT 
  * 
FROM 
  shop.catalogs 
WHERE 
  id IN (5, 1, 2)
order by 
  FIELD (id,5, 1, 2);


'Практическое задание теме “Агрегация данных”'

'1.Подсчитайте средний возраст пользователей в таблице users'

SELECT 
  avg(floor((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25)) AS age_avg  
 FROM 
  shop.users; 

SELECT
  name,
  avg(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS age_avg
FROM
  shop.users;

'2.Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
Следует учесть, что необходимы дни недели текущего года, а не года рождения.'

SELECT 
  name, 
  count(*), DAYNAME(Concat(2020,'-',month(birthday_at),'-',day(birthday_at))) 
FROM 
  shop.users 
group by
  DAYNAME(Concat(2020,'-',month(birthday_at),'-',day(birthday_at)));

'3.Подсчитайте произведение чисел в столбце таблицы'

select 
  exp(sum(ln(field))) 
from 
  tab;


