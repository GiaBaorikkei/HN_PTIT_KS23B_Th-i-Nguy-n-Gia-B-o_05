CREATE DATABASE manager;
USE manager;

-- Tạo bảng
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Customer_info (
    customer_id INT PRIMARY KEY,
    membership_level ENUM('Standard', 'VIP', 'VVIP') NOT NULL,
    registration_date DATE,
    total_spent DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_name VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    duration INT,
    release_date DATE
);

CREATE TABLE Showtimes (
    showtime_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    show_date DATETIME NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE
);

CREATE TABLE Tickets (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    showtime_id INT,
    customer_id INT,
    seat_number VARCHAR(10) NOT NULL,
    booking_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Confirmed', 'Cancelled') NOT NULL,
    FOREIGN KEY (showtime_id) REFERENCES Showtimes(showtime_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- Chèn dữ liệu
INSERT INTO Movies (movie_name, genre, duration, rating) VALUES
('Blala', 'Hành động', 181, 8.5),
('Nakroth', 'Hoạt hình', 103, 7.2),
('Arthur', 'TÌnh yêu', 148, 8.8);

INSERT INTO Customers (customer_name, phone, email) VALUES
('Nguyễn Văn A', '0123456789', 'nva@gmail.com'),
('Trần Thị B', '0987654321', 'ttb@gmail.com'),
('Lê Văn C', '0365478912', 'lvc@gmail.com');

INSERT INTO Customer_info (customer_id, membership_level, registration_date, total_spent) VALUES
(1, 'VIP', '2024-01-10', 500.00),
(2, 'Standard', '2024-02-15', 200.00),
(3, 'VVIP', '2024-03-20', 1000.00);

INSERT INTO Showtimes (movie_id, show_date, price) VALUES
(1, '2024-02-10 10:00:00', 120000),
(2, '2024-02-10 20:00:00', 100000),
(3, '2024-02-11 19:30:00', 150000);

INSERT INTO Tickets (showtime_id, customer_id, seat_number, booking_date, status) VALUES
(1, 1, 'A1', '2024-02-09 10:00:00', 'Confirmed'),
(2, 2, 'B3', '2024-02-09 11:00:00', 'Confirmed'),
(3, 3, 'C5', '2024-02-10 12:00:00', 'Cancelled');




