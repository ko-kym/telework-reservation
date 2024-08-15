-- スキーマの削除
DROP SCHEMA IF EXISTS office_reservation CASCADE;

-- スキーマの作成
CREATE SCHEMA office_reservation;

-- 従業員テーブルの作成 (スキーマ: office_reservation)
CREATE TABLE office_reservation.employees (
    employee_id TEXT PRIMARY KEY,  -- 従業員ID: テキスト形式で一意のID
    employee_name TEXT NOT NULL,            -- 従業員名: テキスト形式で必須
    email TEXT NOT NULL UNIQUE,             -- メールアドレス: 一意で必須
    password TEXT NOT NULL,                 -- パスワード: テキスト形式で必須
    role TEXT NOT NULL CHECK (role IN ('ADMIN', 'NOT_ADMIN')),  -- 役割: 'ADMIN' または 'NOT_ADMIN' のみ許可
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,  -- 作成日時: デフォルトで現在のタイムスタンプ
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP   -- 更新日時: デフォルトで現在のタイムスタンプ
);

-- コメントの追加
COMMENT ON TABLE office_reservation.employees IS '従業員情報を格納するテーブル';
COMMENT ON COLUMN office_reservation.employees.employee_id IS '従業員ID: 一意のID';
COMMENT ON COLUMN office_reservation.employees.employee_name IS '従業員名';
COMMENT ON COLUMN office_reservation.employees.email IS 'メールアドレス: 一意で必須';
COMMENT ON COLUMN office_reservation.employees.password IS 'パスワード';
COMMENT ON COLUMN office_reservation.employees.role IS '役割: 管理者(ADMIN) または一般従業員(NOT_ADMIN)';
COMMENT ON COLUMN office_reservation.employees.created_at IS '作成日時';
COMMENT ON COLUMN office_reservation.employees.updated_at IS '更新日時';

-- 部屋テーブルの作成 (スキーマ: office_reservation)
CREATE TABLE office_reservation.rooms (
    room_id TEXT PRIMARY KEY,  -- 部屋ID: テキスト形式で一意ID
    room_name TEXT NOT NULL,     -- 部屋名: テキスト形式で必須
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,  -- 作成日時: デフォルトで現在のタイムスタンプ
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP   -- 更新日時: デフォルトで現在のタイムスタンプ
);

-- コメントの追加
COMMENT ON TABLE office_reservation.rooms IS '予約可能な部屋情報を格納するテーブル';
COMMENT ON COLUMN office_reservation.rooms.room_id IS '部屋ID: 一意のID';
COMMENT ON COLUMN office_reservation.rooms.room_name IS '部屋名';
COMMENT ON COLUMN office_reservation.rooms.created_at IS '作成日時';
COMMENT ON COLUMN office_reservation.rooms.updated_at IS '更新日時';

-- 予約テーブルの作成 (スキーマ: office_reservation)
CREATE TABLE office_reservation.reservations (
    reservation_id TEXT PRIMARY KEY,  -- 予約ID: テキスト形式で一意ID
    employee_id TEXT NOT NULL,          -- 従業員ID
    room_id TEXT NOT NULL,           -- 部屋ID
    reservation_date DATE NOT NULL,     -- 予約日: 日付形式で必須
    status TEXT NOT NULL CHECK (status IN ('RESERVED', 'PENDING')),  -- 予約ステータス: 'RESERVED' または 'PENDING' のみ許可
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,  -- 作成日時: デフォルトで現在のタイムスタンプ
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP  -- 更新日時: デフォルトで現在のタイムスタンプ
);

-- コメントの追加
COMMENT ON TABLE office_reservation.reservations IS '部屋予約情報を格納するテーブル';
COMMENT ON COLUMN office_reservation.reservations.reservation_id IS '予約ID: 一意のID';
COMMENT ON COLUMN office_reservation.reservations.employee_id IS '従業員ID';
COMMENT ON COLUMN office_reservation.reservations.room_id IS '部屋ID';
COMMENT ON COLUMN office_reservation.reservations.reservation_date IS '予約日';
COMMENT ON COLUMN office_reservation.reservations.status IS '予約ステータス: 予約済み(RESERVED) または 保留中(PENDING)';
COMMENT ON COLUMN office_reservation.reservations.created_at IS '作成日時';
COMMENT ON COLUMN office_reservation.reservations.updated_at IS '更新日時';