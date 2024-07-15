DROP TABLE IF EXISTS reservations;

DROP TABLE IF EXISTS employees;

DROP TABLE IF EXISTS rooms;

CREATE TABLE
    employees (
        employee_id TEXT NOT NULL PRIMARY KEY,
        employee_name TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL,
        role TEXT NOT NULL CHECK (role IN ('ADMIN', 'NOT_ADMIN')),
        created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE
    rooms (
        room_id SERIAL PRIMARY KEY,
        room_name TEXT NOT NULL,
        created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE
    reservations (
        reservation_id SERIAL PRIMARY KEY,
        employee_id TEXT NOT NULL,
        room_id INTEGER NOT NULL,
        reservation_date DATE NOT NULL,
        status TEXT NOT NULL CHECK (status IN ('RESERVED', 'PENDING')),
        created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
        FOREIGN KEY (room_id) REFERENCES rooms (room_id)
    );