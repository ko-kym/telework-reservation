DELETE FROM reservations;

DELETE FROM rooms;

DELETE FROM employees;

ALTER SEQUENCE rooms_room_id_seq
RESTART WITH 1;

ALTER SEQUENCE reservations_reservation_id_seq
RESTART WITH 1;

INSERT INTO
    employees (employee_id, employee_name, email, password, role)
VALUES
    (
        'E0001',
        '田中 太郎',
        'tanaka1@example.com',
        'pass123',
        'ADMIN'
    ),
    (
        'E0002',
        '田中 次郎',
        'tanaka2@example.com',
        'pass124',
        'NOT_ADMIN'
    ),
    (
        'E0003',
        '田中 三郎',
        'tanaka3@example.com',
        'pass125',
        'NOT_ADMIN'
    ),
    (
        'E0004',
        '佐藤 四郎',
        'sato4@example.com',
        'pass126',
        'NOT_ADMIN'
    ),
    (
        'E0005',
        '佐藤 五郎',
        'sato5@example.com',
        'pass127',
        'ADMIN'
    ),
    (
        'E0006',
        '鈴木 六郎',
        'suzuki6@example.com',
        'pass128',
        'NOT_ADMIN'
    ),
    (
        'E0007',
        '鈴木 七郎',
        'suzuki7@example.com',
        'pass129',
        'NOT_ADMIN'
    ),
    (
        'E0008',
        '伊藤 八郎',
        'ito8@example.com',
        'pass130',
        'ADMIN'
    ),
    (
        'E0009',
        '伊藤 九郎',
        'ito9@example.com',
        'pass131',
        'NOT_ADMIN'
    ),
    (
        'E0010',
        '加藤 十郎',
        'kato10@example.com',
        'pass132',
        'NOT_ADMIN'
    ),
    (
        'E0011',
        '加藤 十一郎',
        'kato11@example.com',
        'pass133',
        'NOT_ADMIN'
    ),
    (
        'E0012',
        '山田 十二郎',
        'yamada12@example.com',
        'pass134',
        'NOT_ADMIN'
    ),
    (
        'E0013',
        '山田 十三郎',
        'yamada13@example.com',
        'pass135',
        'ADMIN'
    ),
    (
        'E0014',
        '中村 十四郎',
        'nakamura14@example.com',
        'pass136',
        'NOT_ADMIN'
    ),
    (
        'E0015',
        '中村 十五郎',
        'nakamura15@example.com',
        'pass137',
        'NOT_ADMIN'
    ),
    (
        'E0016',
        '小林 十六郎',
        'kobayashi16@example.com',
        'pass138',
        'NOT_ADMIN'
    ),
    (
        'E0017',
        '小林 十七郎',
        'kobayashi17@example.com',
        'pass139',
        'NOT_ADMIN'
    ),
    (
        'E0018',
        '高橋 十八郎',
        'takahashi18@example.com',
        'pass140',
        'ADMIN'
    ),
    (
        'E0019',
        '高橋 十九郎',
        'takahashi19@example.com',
        'pass141',
        'NOT_ADMIN'
    ),
    (
        'E0020',
        '高橋 二十郎',
        'takahashi20@example.com',
        'pass142',
        'NOT_ADMIN'
    );

INSERT INTO
    rooms (room_name)
VALUES
    ('101'),
    ('102'),
    ('103'),
    ('104'),
    ('105'),
    ('106'),
    ('107'),
    ('108'),
    ('109'),
    ('110'),
    ('111'),
    ('112'),
    ('113'),
    ('114'),
    ('115'),
    ('116'),
    ('117'),
    ('118'),
    ('119'),
    ('120');

INSERT INTO
    reservations (employee_id, room_id, reservation_date, status)
VALUES
    ('E0001', 1, '2024-08-01', 'RESERVED'),
    ('E0002', 2, '2024-08-01', 'RESERVED'),
    ('E0003', 3, '2024-08-01', 'RESERVED'),
    ('E0004', 4, '2024-08-01', 'RESERVED'),
    ('E0002', 2, '2024-08-02', 'PENDING'),
    ('E0003', 3, '2024-08-02', 'PENDING'),
    ('E0002', 4, '2024-08-02', 'PENDING'),
    ('E0003', 3, '2024-08-03', 'RESERVED'),
    ('E0004', 4, '2024-08-04', 'PENDING'),
    ('E0005', 5, '2024-08-05', 'RESERVED'),
    ('E0006', 6, '2024-08-06', 'PENDING'),
    ('E0007', 7, '2024-08-07', 'RESERVED'),
    ('E0008', 8, '2024-08-08', 'PENDING'),
    ('E0009', 9, '2024-08-09', 'RESERVED'),
    ('E0010', 10, '2024-08-10', 'PENDING'),
    ('E0011', 11, '2024-08-11', 'RESERVED'),
    ('E0012', 12, '2024-08-12', 'PENDING'),
    ('E0013', 13, '2024-08-13', 'RESERVED'),
    ('E0014', 14, '2024-08-14', 'PENDING'),
    ('E0015', 15, '2024-08-15', 'RESERVED'),
    ('E0016', 16, '2024-08-16', 'PENDING'),
    ('E0017', 17, '2024-08-17', 'RESERVED'),
    ('E0018', 18, '2024-08-18', 'PENDING'),
    ('E0019', 19, '2024-08-19', 'RESERVED'),
    ('E0020', 20, '2024-08-20', 'PENDING'),
    ('E0001', 1, '2024-09-15', 'RESERVED'),
    ('E0002', 2, '2024-09-15', 'RESERVED'),
    ('E0003', 3, '2024-09-15', 'RESERVED'),
    ('E0004', 4, '2024-09-15', 'RESERVED'),
    ('E0002', 2, '2024-09-17', 'PENDING'),
    ('E0003', 3, '2024-09-17', 'PENDING'),
    ('E0002', 4, '2024-09-17', 'PENDING'),
    ('E0003', 3, '2024-10-03', 'RESERVED'),
    ('E0004', 4, '2024-10-04', 'PENDING'),
    ('E0005', 5, '2024-11-05', 'RESERVED');