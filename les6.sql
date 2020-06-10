
'������� 2 '

SELECT * FROM messages WHERE (from_user_id = 1 and to_user_id  IN (
  SELECT initiator_user_id FROM friend_requests WHERE (target_user_id = 1) AND status='approved'
  union
  SELECT target_user_id FROM friend_requests WHERE (initiator_user_id = 1) AND status='approved')) or
  (from_user_id IN (
  SELECT initiator_user_id FROM friend_requests WHERE (target_user_id = 1) AND status='approved'
  union
  SELECT target_user_id FROM friend_requests WHERE (initiator_user_id = 1) AND status='approved') and to_user_id = 1 )

'1 ���� ���� ����� �������� � 3��'

'������� 3'

'���� ������� ���-�� ������, �� �� ������ ������� ��� ��� �������� � ���������. ��������� ������ ������� �� 1�� ����� ��������� ����������'
select user_id,
TIMESTAMPDIFF(YEAR, birthday, NOW()) as age
from profiles where user_id in (select user_id from likes group by user_id)
order by age limit 10;


select profiles.user_id, TIMESTAMPDIFF(YEAR, birthday, NOW()) as age
from profiles join likes on profiles.user_id = likes.user_id
order by age limit 10;



'������� 4'

select gender,
count(*) 
from profiles join likes on profiles.user_id = likes.user_id
group by gender;

'������� �������� ������'

'������� 5'


select profiles.user_id, count(*) from profiles join media on profiles.user_id = media.user_id join messages on messages.from_user_id = media.user_id 
group by profiles.user_id ����� -10;

'��� ������������ ����� 1�� � 2�� �� ������� '

