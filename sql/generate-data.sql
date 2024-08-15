DELETE FROM office_reservation.employees;
DELETE FROM office_reservation.rooms;
DELETE FROM office_reservation.reservations;

INSERT INTO
    office_reservation.employees (employee_id, employee_name, email, password, role)
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
    office_reservation.rooms (room_id, room_name)
VALUES
    ('R001', '101'),
    ('R002', '102'),
    ('R003', '103'),
    ('R004', '104'),
    ('R005', '105'),
    ('R006', '106'),
    ('R007', '107'),
    ('R008', '108'),
    ('R009', '109'),
    ('R010', '110'),
    ('R011', '111'),
    ('R012', '112'),
    ('R013', '113'),
    ('R014', '114'),
    ('R015', '115'),
    ('R016', '116'),
    ('R017', '117'),
    ('R018', '118'),
    ('R019', '119'),
    ('R020', '120');

INSERT INTO 
    office_reservation.reservations (reservation_id, employee_id, room_id, reservation_date, status)
VALUES
    ('RE001', 'E0001', 'R001', '2024-10-01', 'RESERVED'),
    ('RE002', 'E0002', 'R002', '2024-10-01', 'RESERVED'),
    ('RE003', 'E0003', 'R003', '2024-10-01', 'RESERVED'),
    ('RE004', 'E0004', 'R004', '2024-10-01', 'RESERVED'),
    ('RE005', 'E0002', 'R002', '2024-10-02', 'PENDING'),
    ('RE006', 'E0003', 'R003', '2024-10-02', 'PENDING'),
    ('RE007', 'E0002', 'R004', '2024-10-02', 'PENDING'),
    ('RE008', 'E0003', 'R003', '2024-10-03', 'RESERVED'),
    ('RE009', 'E0004', 'R004', '2024-10-04', 'PENDING'),
    ('RE010', 'E0005', 'R005', '2024-10-05', 'RESERVED'),
    ('RE011', 'E0006', 'R006', '2024-10-06', 'PENDING'),
    ('RE012', 'E0007', 'R007', '2024-10-07', 'RESERVED'),
    ('RE013', 'E0008', 'R008', '2024-10-08', 'PENDING'),
    ('RE014', 'E0009', 'R009', '2024-10-09', 'RESERVED'),
    ('RE015', 'E0010', 'R010', '2024-10-10', 'PENDING'),
    ('RE016', 'E0011', 'R011', '2024-10-11', 'RESERVED'),
    ('RE017', 'E0012', 'R012', '2024-10-12', 'PENDING'),
    ('RE018', 'E0013', 'R013', '2024-10-13', 'RESERVED'),
    ('RE019', 'E0014', 'R014', '2024-10-14', 'PENDING'),
    ('RE020', 'E0015', 'R015', '2024-10-15', 'RESERVED'),
    ('RE021', 'E0016', 'R016', '2024-10-16', 'PENDING'),
    ('RE022', 'E0017', 'R017', '2024-10-17', 'RESERVED'),
    ('RE023', 'E0018', 'R018', '2024-10-18', 'PENDING'),
    ('RE024', 'E0019', 'R019', '2024-10-19', 'RESERVED'),
    ('RE025', 'E0020', 'R020', '2024-10-20', 'PENDING'),
    ('RE026', 'E0001', 'R001', '2024-11-15', 'RESERVED'),
    ('RE027', 'E0002', 'R002', '2024-11-15', 'RESERVED'),
    ('RE028', 'E0003', 'R003', '2024-11-15', 'RESERVED'),
    ('RE029', 'E0004', 'R004', '2024-11-15', 'RESERVED'),
    ('RE030', 'E0002', 'R002', '2024-11-17', 'PENDING'),
    ('RE031', 'E0003', 'R003', '2024-11-17', 'PENDING'),
    ('RE032', 'E0002', 'R004', '2024-11-17', 'PENDING'),
    ('RE033', 'E0003', 'R003', '2024-12-03', 'RESERVED'),
    ('RE034', 'E0004', 'R004', '2024-12-04', 'PENDING'),
    ('RE035', 'E0005', 'R005', '2024-12-05', 'RESERVED');