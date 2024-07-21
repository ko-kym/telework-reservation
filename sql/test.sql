-- select rooms.room_name,reservations.status,employee_id from rooms LEFT JOIN reservations on rooms.room_id = reservations.room_id AND reservations.reservation_date ='2024-08-01';
-- INSERT INTO reservations (employee_id, room_id, reservation_date, status) VALUES ('E0002', (SELECT room_id FROM rooms WHERE room_name = '104'), '2024-07-19', 'PENDING');

-- INSERT INTO reservations (employee_id, room_id, reservation_date, status) VALUES ( 'E0001', (SELECT room_id FROM rooms WHERE room_name = ' 101 '), '2024-07-20', 'PENDING');

SELECT * FROM reservations
WHERE EXTRACT(YEAR FROM reservation_date) = 2024
  AND EXTRACT(MONTH FROM reservation_date) = 8;


