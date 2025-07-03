CREATE TABLE shops (
    shop_id SERIAL PRIMARY KEY,
    shop_name VARCHAR(100),
    address TEXT,
    city VARCHAR(50),
    open_date DATE
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100),
    employee_position VARCHAR(50),
    hire_date DATE,
    salary NUMERIC(10,2),
    shop_id INT REFERENCES shops(shop_id),
    employee_phone VARCHAR(20),
    employee_email VARCHAR(100),
    employee_address TEXT,
    employee_identity VARCHAR(20)
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_phone VARCHAR(20),
    customer_email VARCHAR(100),
    registration_date DATE,
    customer_birthday DATE,
    number_of_customer_stars INT,
    shop_id INT REFERENCES shops(shop_id)
);

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50),
    category_photo TEXT
);


CREATE TABLE menu_items (
    item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(100),
    price NUMERIC(10,2),
    category_id INT REFERENCES category(category_id),
    item_photo TEXT
);



CREATE TABLE campaigns (
    campaign_id SERIAL PRIMARY KEY,
    campaign_name VARCHAR(100),
    description TEXT,
    start_date DATE,
    end_date DATE,
    active_days VARCHAR(100),
    discount_value VARCHAR(50),
    min_order_quantity INT,
    item_id INT REFERENCES menu_items(item_id)
);


CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date TIMESTAMP,
    customer_id INT REFERENCES customers(customer_id),
    shop_id INT REFERENCES shops(shop_id),
    total_price NUMERIC(10,2),
    final_price NUMERIC(10,2),
    campaign_id INT REFERENCES campaigns(campaign_id)
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id) ON DELETE CASCADE,
    item_id INT REFERENCES menu_items(item_id),
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price NUMERIC(10,2) NOT NULL,
    total_price NUMERIC(10,2) GENERATED ALWAYS AS (quantity * unit_price) STORED
);


DROP TABLE order_items;
DROP TABLE orders;


CREATE TABLE campaigns (
    campaign_id SERIAL PRIMARY KEY,
    campaign_name VARCHAR(100),
    description TEXT,
    start_date DATE,
    end_date DATE,
    active_days VARCHAR(100),
    discount_value VARCHAR(50),
    min_order_quantity INT,
    item_id INT REFERENCES menu_items(item_id)
);




INSERT INTO shops (shop_id, shop_name, address, city, open_date) VALUES
(1, 'LUNKA', 'Bağdat Caddesi No:123, Kadıköy', 'İstanbul/Kadıköy', '2023-05-10'),
(2, 'LUNKA', 'Ziyapaşa Bulvarı No:45, Seyhan', 'Adana/Seyhan', '2023-08-15'),
(3, 'LUNKA', 'İstiklal Caddesi No:78, Beyoğlu', 'İstanbul/Beyoğlu', '2024-02-01'),
(4, 'LUNKA', 'İnönü Caddesi No:88, Battalgazi', 'Malatya/Battalgazi', '2024-06-01');


INSERT INTO customers (customer_name, customer_phone, customer_email, registration_date, customer_birthday, number_of_customer_stars, shop_id) VALUES
('Ahmet Yılmaz', '05321230001', 'ahmet.yilmaz1@example.com', '2023-01-15', '1985-06-20', 4, 1),
('Elif Demir', '05439870002', 'elif.demir2@example.com', '2022-11-05', '1990-09-10', 5, 1),
('Mehmet Can', '05551230003', 'mehmet.can3@example.com', '2023-05-22', '1988-03-18', 3, 1),
('Zeynep Kara', '05347650004', 'zeynep.kara4@example.com', '2021-08-30', '1995-12-01', 4, 1),
('Murat Kaya', '05431230005', 'murat.kaya5@example.com', '2023-03-10', '1982-01-27', 2, 1),
('Ayşe Aydın', '05547650006', 'ayse.aydin6@example.com', '2023-06-01', '1992-07-13', 5, 1),
('Fatma Öz', '05329870007', 'fatma.oz7@example.com', '2022-12-12', '1987-04-09', 3, 1),
('Canan Şahin', '05431230008', 'canan.sahin8@example.com', '2023-04-18', '1991-11-05', 4, 1),
('Ali Vural', '05549870009', 'ali.vural9@example.com', '2023-02-25', '1984-08-30', 2, 1),
('Selin Gül', '05341230010', 'selin.gul10@example.com', '2023-07-10', '1993-05-22', 5, 1),
-- 10 müşteri shop_id 1 için
('Eren Aksoy', '05321230011', 'eren.aksoy11@example.com', '2023-01-20', '1986-07-15', 4, 1),
('Deniz Yılmaz', '05439870012', 'deniz.yilmaz12@example.com', '2022-12-10', '1991-10-10', 3, 1),
('Gülcan Ateş', '05551230013', 'gulcan.ates13@example.com', '2023-06-05', '1990-04-25', 5, 1),
('Orhan Kurt', '05347650014', 'orhan.kurt14@example.com', '2021-09-15', '1985-11-19', 2, 1),
('Buse Çelik', '05431230015', 'buse.celik15@example.com', '2023-03-20', '1993-02-17', 4, 1),
('Okan Kaya', '05547650016', 'okan.kaya16@example.com', '2023-06-15', '1987-06-21', 3, 1),
('Seda Şen', '05329870017', 'seda.sen17@example.com', '2022-12-22', '1992-08-30', 5, 1),
('Volkan Öztürk', '05431230018', 'volkan.ozturk18@example.com', '2023-04-25', '1988-12-12', 4, 1),
('Şebnem Yıldız', '05549870019', 'sebnem.yildiz19@example.com', '2023-02-28', '1990-03-05', 3, 1),
('Serkan Arslan', '05341230020', 'serkan.arslan20@example.com', '2023-07-15', '1983-09-10', 2, 1),

-- 10 müşteri shop_id 2 için
('Deniz Acar', '05351230021', 'deniz.acar21@example.com', '2023-01-10', '1989-06-25', 5, 2),
('Sinem Polat', '05459870022', 'sinem.polat22@example.com', '2022-11-20', '1991-09-15', 4, 2),
('Kaan Yıldırım', '05561230023', 'kaan.yildirim23@example.com', '2023-05-18', '1985-02-12', 3, 2),
('Bahar Yılmaz', '05387650024', 'bahar.yilmaz24@example.com', '2021-07-28', '1994-12-22', 5, 2),
('Mert Can', '05481230025', 'mert.can25@example.com', '2023-03-15', '1988-01-01', 4, 2),
('Derya Demir', '05587650026', 'derya.demir26@example.com', '2023-06-10', '1992-07-04', 2, 2),
('Tolga Erdem', '05379870027', 'tolga.erdem27@example.com', '2022-12-02', '1984-05-09', 5, 2),
('Hülya Kaya', '05481230028', 'hulya.kaya28@example.com', '2023-04-12', '1990-11-18', 3, 2),
('Ece Yılmaz', '05589870029', 'ece.yilmaz29@example.com', '2023-02-20', '1993-08-14', 4, 2),
('Fatih Aydın', '05381230030', 'fatih.aydin30@example.com', '2023-07-05', '1987-10-07', 5, 2),

-- 10 müşteri shop_id 2 devam
('Seda Yıldız', '05351230031', 'seda.yildiz31@example.com', '2023-01-22', '1990-06-20', 4, 2),
('Levent Polat', '05459870032', 'levent.polat32@example.com', '2022-11-30', '1985-09-11', 2, 2),
('Pelin Kurt', '05561230033', 'pelin.kurt33@example.com', '2023-05-29', '1991-03-08', 3, 2),
('Emre Yıldırım', '05387650034', 'emre.yildirim34@example.com', '2021-08-16', '1989-12-02', 5, 2),
('Nazlı Acar', '05481230035', 'nazli.acar35@example.com', '2023-03-22', '1992-01-25', 4, 2),
('Oğuz Demir', '05587650036', 'oguz.demir36@example.com', '2023-06-08', '1988-07-30', 2, 2),
('Mine Şahin', '05379870037', 'mine.sahin37@example.com', '2022-12-18', '1993-05-10', 5, 2),
('Barış Öz', '05481230038', 'baris.oz38@example.com', '2023-04-22', '1990-11-12', 3, 2),
('Tuğba Arslan', '05589870039', 'tugba.arslan39@example.com', '2023-02-24', '1986-08-19', 4, 2),
('Serhat Can', '05381230040', 'serhat.can40@example.com', '2023-07-14', '1987-09-29', 5, 2),

-- 10 müşteri shop_id 3 için
('Gamze Kurt', '05321230041', 'gamze.kurt41@example.com', '2023-01-25', '1991-06-16', 4, 3),
('Baran Aydın', '05439870042', 'baran.aydin42@example.com', '2022-11-08', '1988-10-30', 5, 3),
('Merve Yılmaz', '05551230043', 'merve.yilmaz43@example.com', '2023-05-19', '1990-02-14', 3, 3),
('Kerem Can', '05347650044', 'kerem.can44@example.com', '2021-08-31', '1985-12-05', 4, 3),
('Seda Kaya', '05431230045', 'seda.kaya45@example.com', '2023-03-11', '1992-01-28', 2, 3),
('Engin Şen', '05547650046', 'engin.sen46@example.com', '2023-06-02', '1987-07-14', 5, 3),
('Şule Öz', '05329870047', 'sule.oz47@example.com', '2022-12-13', '1991-04-08', 3, 3),
('Cem Şahin', '05431230048', 'cem.sahin48@example.com', '2023-04-19', '1990-11-06', 4, 3),
('Ozan Vural', '05549870049', 'ozan.vural49@example.com', '2023-02-26', '1984-08-31', 2, 3),
('Selin Gül', '05341230050', 'selin.gul50@example.com', '2023-07-11', '1993-05-23', 5, 3),

-- 10 müşteri shop_id 3 devam
('Ece Yıldırım', '05321230051', 'ece.yildirim51@example.com', '2023-01-19', '1992-06-24', 4, 3),
('Serdar Arslan', '05439870052', 'serdar.arslan52@example.com', '2022-11-07', '1987-09-15', 3, 3),
('Nilay Kurt', '05551230053', 'nilay.kurt53@example.com', '2023-05-25', '1991-03-09', 5, 3),
('Can Yılmaz', '05347650054', 'can.yilmaz54@example.com', '2021-08-29', '1989-12-03', 4, 3),
('Dilara Acar', '05431230055', 'dilara.acar55@example.com', '2023-03-14', '1990-01-26', 2, 3),
('Yusuf Demir', '05547650056', 'yusuf.demir56@example.com', '2023-06-06', '1986-07-31', 5, 3),
('Hakan Şahin', '05329870057', 'hakan.sahin57@example.com', '2022-12-14', '1993-05-11', 3, 3),
('Sevgi Öz', '05431230058', 'sevgi.oz58@example.com', '2023-04-20', '1991-11-07', 4, 3),
('Erdem Arslan', '05549870059', 'erdem.arslan59@example.com', '2023-02-27', '1985-08-20', 2, 3),
('Nilüfer Can', '05341230060', 'nilufer.can60@example.com', '2023-07-12', '1988-09-30', 5, 3),

-- 10 müşteri shop_id 4 için
('Simge Kurt', '05321230061', 'simge.kurt61@example.com', '2023-01-18', '1990-06-21', 4, 4),
('Tolga Aydın', '05439870062', 'tolga.aydin62@example.com', '2022-11-09', '1987-10-31', 5, 4),
('Ebru Yılmaz', '05551230063', 'ebru.yilmaz63@example.com', '2023-05-21', '1991-02-15', 3, 4),
('Kadir Can', '05347650064', 'kadir.can64@example.com', '2021-08-27', '1986-12-06', 4, 4),
('Funda Kaya', '05431230065', 'funda.kaya65@example.com', '2023-03-12', '1993-01-29', 2, 4),
('Okan Şen', '05547650066', 'okan.sen66@example.com', '2023-06-03', '1988-07-15', 5, 4),
('Burcu Öz', '05329870067', 'burcu.oz67@example.com', '2022-12-15', '1992-04-07', 3, 4),
('Cem Şahin', '05431230068', 'cem.sahin68@example.com', '2023-04-21', '1991-11-08', 4, 4),
('Serkan Vural', '05549870069', 'serkan.vural69@example.com', '2023-02-23', '1985-08-21', 2, 4),
('Selin Gül', '05341230070', 'selin.gul70@example.com', '2023-07-13', '1989-05-24', 5, 4),

-- 10 müşteri shop_id 4 devam
('Deniz Yıldız', '05321230071', 'deniz.yildiz71@example.com', '2023-01-21', '1991-06-22', 4, 4),
('Seda Polat', '05439870072', 'seda.polat72@example.com', '2022-11-11', '1988-10-28', 3, 4),
('Levent Kurt', '05551230073', 'levent.kurt73@example.com', '2023-05-24', '1990-02-13', 5, 4),
('Emel Yıldırım', '05347650074', 'emel.yildirim74@example.com', '2021-08-26', '1986-12-04', 4, 4),
('Nihan Acar', '05431230075', 'nihan.acar75@example.com', '2023-03-13', '1993-01-30', 2, 4),
('Onur Demir', '05547650076', 'onur.demir76@example.com', '2023-06-04', '1988-07-16', 5, 4),
('Mine Şahin', '05329870077', 'mine.sahin77@example.com', '2022-12-16', '1992-04-06', 3, 4),
('Barış Öz', '05431230078', 'baris.oz78@example.com', '2023-04-22', '1991-11-09', 4, 4),
('Tuğba Arslan', '05549870079', 'tugba.arslan79@example.com', '2023-02-22', '1985-08-22', 2, 4),
('Serhat Can', '05341230080', 'serhat.can80@example.com', '2023-07-16', '1989-09-28', 5, 4),
('Ayça Demir', '05321230081', 'ayca.demir81@example.com', '2023-01-23', '1992-07-15', 4, 1),
('Barış Yıldız', '05439870082', 'baris.yildiz82@example.com', '2022-11-12', '1989-10-18', 3, 1),
('Cansu Kaya', '05551230083', 'cansu.kaya83@example.com', '2023-05-26', '1991-04-12', 5, 1),
('Deniz Şahin', '05347650084', 'deniz.sahin84@example.com', '2021-08-25', '1986-12-01', 4, 2),
('Emre Öz', '05431230085', 'emre.oz85@example.com', '2023-03-16', '1993-01-20', 2, 2),
('Fatma Acar', '05547650086', 'fatma.acar86@example.com', '2023-06-07', '1988-07-22', 5, 2),
('Gökhan Arslan', '05329870087', 'gokhan.arslan87@example.com', '2022-12-17', '1992-04-08', 3, 3),
('Hande Kurt', '05431230088', 'hande.kurt88@example.com', '2023-04-23', '1991-11-10', 4, 3),
('İsmail Can', '05549870089', 'ismail.can89@example.com', '2023-02-21', '1985-08-23', 2, 3),
('Jale Yılmaz', '05341230090', 'jale.yilmaz90@example.com', '2023-07-17', '1989-09-27', 5, 3),
('Kübra Aydın', '05321230091', 'kubra.aydin91@example.com', '2023-01-24', '1990-07-16', 4, 4),
('Levent Şen', '05439870092', 'levent.sen92@example.com', '2022-11-13', '1987-10-27', 3, 4),
('Melek Öz', '05551230093', 'melek.oz93@example.com', '2023-05-23', '1991-02-17', 5, 4),
('Nihat Vural', '05347650094', 'nihat.vural94@example.com', '2021-08-28', '1986-12-07', 4, 1),
('Oya Gül', '05431230095', 'oya.gul95@example.com', '2023-03-17', '1993-01-19', 2, 1),
('Pelin Yıldız', '05547650096', 'pelin.yildiz96@example.com', '2023-06-09', '1988-07-23', 5, 2),
('Rıza Kurt', '05329870097', 'riza.kurt97@example.com', '2022-12-18', '1992-04-09', 3, 2),
('Sibel Arslan', '05431230098', 'sibel.arslan98@example.com', '2023-04-24', '1991-11-11', 4, 3),
('Tuncay Can', '05549870099', 'tuncay.can99@example.com', '2023-02-22', '1985-08-24', 2, 3),
('Uğur Şahin', '05341230100', 'ugur.sahin100@example.com', '2023-07-18', '1989-09-26', 5, 4);

INSERT INTO employees (employee_name, employee_position, hire_date, salary, shop_id, employee_phone, employee_email, employee_address, employee_identity) VALUES
-- Şube 1 - Kadıköy (Semtler: Ümraniye, Ataşehir, Maltepe, Sancaktepe, Çekmeköy)
('Ahmet Demir', 'Garson', '2021-03-15', 20000.00, 1, '05320001111', 'ahmet.demir@example.com', 'Ümraniye', '12345678901'),
('Elif Kaya', 'Garson', '2022-06-10', 20000.00, 1, '05320002222', 'elif.kaya@example.com', 'Ataşehir', '23456789012'),
('Mehmet Yılmaz', 'Barista', '2020-01-05', 23000.00, 1, '05320003333', 'mehmet.yilmaz@example.com', 'Maltepe', '34567890123'),
('Zeynep Arslan', 'Barista', '2023-01-20', 23000.00, 1, '05320004444', 'zeynep.arslan@example.com', 'Sancaktepe', '45678901234'),
('Canan Şahin', 'Hazırlık', '2022-09-18', 21000.00, 1, '05320005555', 'canan.sahin@example.com', 'Çekmeköy', '56789012345'),
('Murat Aksoy', 'Hazırlık', '2021-04-12', 21000.00, 1, '05320006666', 'murat.aksoy@example.com', 'Ümraniye', '67890123456'),
('Selin Yıldız', 'Temizlik Görevlisi', '2023-02-15', 18000.00, 1, '05320007777', 'selin.yildiz@example.com', 'Ataşehir', '78901234567'),
('Ali Vural', 'Şube Müdürü', '2019-12-01', 35000.00, 1, '05320008888', 'ali.vural@example.com', 'Maltepe', '89012345678'),

-- Şube 2 - Beşiktaş (Semtler: Sarıyer, Şişli, Kağıthane, Beyoğlu, Bakırköy)
('Ayşe Öz', 'Garson', '2021-06-05', 20000.00, 2, '05430001111', 'ayse.oz@example.com', 'Sarıyer', '90123456789'),
('Fatma Gül', 'Garson', '2022-03-18', 20000.00, 2, '05430002222', 'fatma.gul@example.com', 'Şişli', '01234567890'),
('Ozan Şahin', 'Barista', '2019-10-20', 23000.00, 2, '05430003333', 'ozan.sahin@example.com', 'Kağıthane', '11223344556'),
('Selin Kaya', 'Barista', '2023-02-25', 23000.00, 2, '05430004444', 'selin.kaya@example.com', 'Beyoğlu', '22334455667'),
('Barış Yıldız', 'Hazırlık', '2022-07-30', 21000.00, 2, '05430005555', 'baris.yildiz@example.com', 'Bakırköy', '33445566778'),
('Deniz Acar', 'Hazırlık', '2021-05-15', 21000.00, 2, '05430006666', 'deniz.acar@example.com', 'Sarıyer', '44556677889'),
('Seda Öztürk', 'Temizlik Görevlisi', '2023-03-10', 18000.00, 2, '05430007777', 'seda.ozturk@example.com', 'Şişli', '55667788990'),
('Murat Kaya', 'Şube Müdürü', '2020-11-01', 35000.00, 2, '05430008888', 'murat.kaya@example.com', 'Kağıthane', '66778899001'),

-- Şube 3 - Üsküdar (Semtler: Sultanbeyli, Pendik, Tuzla, Kartal, Çekmeköy)
('Deniz Yıldız', 'Garson', '2021-07-20', 20000.00, 3, '05540001111', 'deniz.yildiz@example.com', 'Sultanbeyli', '77889900112'),
('Serkan Arslan', 'Garson', '2022-04-25', 20000.00, 3, '05540002222', 'serkan.arslan@example.com', 'Pendik', '88990011223'),
('Sinem Polat', 'Barista', '2019-09-15', 23000.00, 3, '05540003333', 'sinem.polat@example.com', 'Tuzla', '99001122334'),
('Kaan Yıldırım', 'Barista', '2023-01-10', 23000.00, 3, '05540004444', 'kaan.yildirim@example.com', 'Kartal', '00112233445'),
('Ece Yılmaz', 'Hazırlık', '2022-08-20', 21000.00, 3, '05540005555', 'ece.yilmaz@example.com', 'Çekmeköy', '11223344556'),
('Ozan Can', 'Hazırlık', '2021-03-30', 21000.00, 3, '05540006666', 'ozan.can@example.com', 'Sultanbeyli', '22334455667'),
('Şebnem Kara', 'Temizlik Görevlisi', '2023-04-05', 18000.00, 3, '05540007777', 'sebnem.kara@example.com', 'Pendik', '33445566778'),
('Baran Aydın', 'Şube Müdürü', '2020-10-01', 35000.00, 3, '05540008888', 'baran.aydin@example.com', 'Tuzla', '44556677889'),

-- Şube 4 - Bakırköy (Semtler: Esenyurt, Avcılar, Küçükçekmece, Bahçelievler, Bağcılar)
('Ayça Demir', 'Garson', '2021-08-15', 20000.00, 4, '05350001111', 'ayca.demir@example.com', 'Esenyurt', '55667788990'),
('Barış Yıldız', 'Garson', '2022-05-10', 20000.00, 4, '05350002222', 'baris.yildiz@example.com', 'Avcılar', '66778899001'),
('Cansu Kaya', 'Barista', '2019-08-05', 23000.00, 4, '05350003333', 'cansu.kaya@example.com', 'Küçükçekmece', '77889900112'),
('Deniz Şahin', 'Barista', '2023-03-20', 23000.00, 4, '05350004444', 'deniz.sahin@example.com', 'Bahçelievler', '88990011223'),
('Emre Öz', 'Hazırlık', '2022-09-15', 21000.00, 4, '05350005555', 'emre.oz@example.com', 'Bağcılar', '99001122334'),
('Fatma Acar', 'Hazırlık', '2021-04-25', 21000.00, 4, '05350006666', 'fatma.acar@example.com', 'Esenyurt', '00112233445'),
('Gökhan Arslan', 'Temizlik Görevlisi', '2023-05-01', 18000.00, 4, '05350007777', 'gokhan.arslan@example.com', 'Avcılar', '11223344556'),
('Hande Kurt', 'Şube Müdürü', '2020-12-10', 35000.00, 4, '05350008888', 'hande.kurt@example.com', 'Küçükçekmece', '22334455667');



INSERT INTO category (category_name, category_photo)
VALUES ('Atıştırmalık', 'https://i.ibb.co/Qsw5xHd/at-t-rmal-k.png');

INSERT INTO category (category_name, category_photo)
VALUES ('Çay', 'https://i.ibb.co/Pv1RRpp2/ay.png');

INSERT INTO category (category_name, category_photo)
VALUES ('Soğuk İçecek', 'https://i.ibb.co/4ZT404Bg/so-uk-icecek.png');

INSERT INTO category (category_name, category_photo)
VALUES ('Kahve', 'https://i.ibb.co/KjZjTGFy/so-uk-s-cak-kahve.png');

INSERT INTO category (category_name, category_photo)
VALUES ('Tatlı', 'https://i.ibb.co/Swh3T16k/tatl-lar.png');


-- Tatlılar
INSERT INTO menu_items (item_name, price, category_id, item_photo) VALUES
('San Sebastian Cheesecake', 250.00, 5, 'https://www.bekiroglubaklava.com.tr/upload/san-sebastian-cheesecake-1-12143.jpg'),
('Tiramisu', 260.00, 5, 'https://i.lezzet.com.tr/images-xxlarge-recipe/yalanci-tiramisu-fa41ff76-2e52-4d05-9b13-6c8b236e378b.jpg'),
('Magnolia (Muzlu)', 190.00, 5, 'https://tatlieller.com/wp-content/uploads/2021/04/Muzlu-Magnolia.jpg'),
('Browni', 220.00, 5, 'https://image.hurimg.com/i/hurriyet/75/750x422/674c5bdb90076a49d917f475.jpg'),
('Churros (Çikolata Soslu)', 280.00, 5, 'https://ia.tmgrup.com.tr/14a265/725/408/0/0/800/450?u=https://i.tmgrup.com.tr/sfr/2024/12/30/churros-1735579557697.jpg'),
('Cookie (Double Chocolate)', 165.00, 5, 'https://www.umami.recipes/api/image/recipes/Sojoo4OIMnEgWnx85v7B/images/ShQTHWKa4RCuGYbDU11VLK?w=640&q=75'),
('Profiterol', 240.00, 5, 'https://online.dilek.com.tr/image/cache/catalog/products_2022/profiterol-paketi-500x500.jpg'),
('Red Velvet Dilim Pasta', 225.00, 5, 'https://tastycake.com.tr/wp-content/uploads/2023/10/Red-Velvet.jpg'),

-- Atıştırmalıklar
('Tavuklu Sandviç', 220.00, 1, 'https://www.diyetkolik.com/site_media/media/foodrecipe_images/tavuklu-sandvic.png'),
('Kruvasan (Çikolatalı)', 250.00, 1, 'https://www.borgiabistro.com/wp-content/uploads/2025/01/kurvasan-cikolata-kah.jpeg'),
('Sebzeli Bowl', 350.00, 1, 'https://i.lezzet.com.tr/images-xxlarge-recipe/pirincli-bowl-bdc2862b-1d5d-4b98-bf1a-7504848da033.jpg'),
('Soğuk Sandviç (Mozarella)', 190.00, 1, 'https://www.jrsouschef.com/Uploads/Products/sipsak-hazirlayabileceginiz-5-soguk-sandvic-3-11-2022-12-59-13.jpg'),
('Kaşarlı Tost', 180.00, 1, 'https://static.ticimax.cloud/47294/Uploads/Blog/Yamandan-Kasarli-Tost-Tarifi-ve-Puf-Nokt-57a3.jpg'),
('Hindi Füme Sandviç', 190.00, 1, 'https://d15r0pauj874pp.cloudfront.net/files/8lydz6wo0-fumehindili-182204252.jpg'),
('Avokadolu Ekmek', 225.00, 1, 'https://image.milimaj.com/i/milliyet/75/0x410/61a630e286b24a173018babc.jpg'),
('Bagel (Somonlu)', 280.00, 1, 'https://cdn.yemek.com/mncrop/940/625/uploads/2016/03/fume-somonlu-sandvic.jpg'),

-- Sıcak Kahveler
('Americano (Sıcak)', 160.00, 4, 'https://img.elele.com.tr/rcman/Cw780h439q95gc/storage/files/images/2024/11/18/americano-8ks3_cover.jpg'),
('Latte (Sıcak)', 190.00, 4, 'https://nucleuscoffee.com/cdn/shop/articles/Latte-recipe.jpg?v=1714499640'),
('Espresso Double', 160.00, 4, 'https://cdn.shopify.com/s/files/1/0879/7536/2843/files/perfect-double-shot-espresso_480x480.jpg?v=1721785033'),
('Flat White', 200.00, 4, 'https://prod-app.breville.com/thumbnail/recipe/1724048842/Flat+White-Leaf+Latte+1080x1440_1080x1440.jpg'),
('Cappuccino', 200.00, 4, 'https://www.thespruceeats.com/thmb/U6RVXqbh1q1u19NgUkuMO993z3Y=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/how-to-make-cappuccinos-766116-hero-01-a754d567739b4ee0b209305138ecb996.jpg'),

-- Soğuk Kahveler
('Iced Mocha (Soğuk)', 220.00, 4, 'https://vibrantlygfree.com/wp-content/uploads/2023/07/iced-mocha-1.jpg'),
('Cold Brew', 250.00, 4, 'https://menu.myqrcodemenu.com/files/products/5165a60e-0817-4570-b379-2225e49f4ce319e55243-7810-40ab-a402-e9e4c24ea90e.jpg'),
('Iced Latte', 200.00, 4, 'https://menu.myqrcodemenu.com/files/products/cd13b8f5-770a-4686-8442-75c7470c4f189dbd9fc1-8bc5-45bb-b845-f4545c10b6d9.jpg'),
('Frappe (Karamel)', 235.00, 4, 'https://cdn.ankaramasasi.com/2023/8/8/soguk-kahve-karamel-frappe-tarifi-ceohkibs.png'),

-- Çaylar
('Demleme Siyah Çay', 100.00, 2, 'https://i.pinimg.com/736x/3f/2e/e5/3f2ee5f6647c6cfadbf3aa5d13f3d08b.jpg'),
('Yeşil Çay', 140.00, 2, 'https://www.buyukanadoluhastanesi.com/images/news/actual/Yesil_Cayin_Faydalari_Nelerdir_-_Buyuk_Anadolu_Hastanesi.jpg'),
('Papatya Çayı', 140.00, 2, 'https://www.buyukanadoluhastanesi.com/images/news/actual/Yesil_Cayin_Faydalari_Nelerdir_-_Buyuk_Anadolu_Hastanesi.jpg'),
('Earl Grey', 120.00, 2, 'https://i.lezzet.com.tr/images-xxlarge-secondary/ac-karnina-cay-icmek-zararli-mi-fe626678-237e-4407-a88e-5693bf434a71.jpg'),
('Detoks Bitki Çayı', 180.00, 2, 'https://cdn.muhiku.com/blog/wp-content/uploads/2019/09/Ginger-tea-min.jpg'),
('Matcha Çayı', 200.00, 2, 'https://www.nazligulsahdogan.com/upload/matcha-cayi-faydalari.jpg'),
('Jasmine Tea', 140.00, 2, 'https://www.acibadem.com.tr/hayat/Images/YayinMakaleler/yasemin-cayi-faydalari_197952_1.jpg');



INSERT INTO campaigns (campaign_id, campaign_name, description, start_date, end_date, active_days, discount_value, min_order_quantity, item_id) VALUES
(1, '5 Kahveye 1 Bedava!', '5 ve üzeri kahve siparişine 1 adet hediye kahve verilir.', '2025-01-01', '2025-12-31', 'All Days', '1 bedava', 10, 17), -- Americano
(2, '%20 Tatlı İndirimi - Cuma Günleri', 'Her Cuma tüm tatlılarda %20 indirim uygulanır.', '2025-01-01', '2025-12-31', 'Friday', '%20', NULL, 1), -- San Sebastian
(3, 'Kahve + Tatlı Menüsü – 300 TL', 'Paket olarak alınan kahve ve kek menüsü indirimli.', '2025-01-01', '2025-12-31', '15th of each month', '300 TL', 1, 18), -- Latte + Magnolia
(4, 'Sadakat Kampanyası', '10. siparişinizde %30 indirim kazanın.', '2025-01-01', '2025-12-31', 'All Days', '%30', 5, 2), -- Tiramisu
(5, 'Doğum Gününe Özel Pasta', 'Müşterilerin doğum günlerinde ücretsiz brownie ikram edilir.', '2025-01-01', '2025-12-31', 'Birthday', 'Ücretsiz', NULL, 4), -- Browni
(6, 'Pazartesi Günleri Atıştırmalık + Çay – 250 TL', 'Pazartesi günleri seçili atıştırmalık ve çay menüsü indirimli.', '2025-01-01', '2025-12-31', 'Monday', '250 TL', 1, 9); -- Tavuklu Sandviç + Demleme Çay




INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (1, '2025-05-26 00:00:00', 20, 4, 340.00, 316.20, 3);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (2, '2025-05-22 00:00:00', 54, 1, 190.00, 176.70, 4);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (3, '2025-02-17 00:00:00', 28, 2, 305.00, 283.65, 6);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (4, '2025-04-07 00:00:00', 27, 2, 850.00, 790.50, 4);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (5, '2025-05-02 00:00:00', 88, 4, 300.00, 279.00, 4);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (6, '2025-02-18 00:00:00', 17, 1, 785.00, 730.05, 5);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (7, '2025-05-29 00:00:00', 88, 1, 845.00, 845.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (8, '2025-03-06 00:00:00', 93, 2, 855.00, 855.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (9, '2025-05-18 00:00:00', 69, 4, 855.00, 795.15, 4);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (10, '2025-03-08 00:00:00', 86, 3, 760.00, 760.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (11, '2025-02-24 00:00:00', 1, 2, 600.00, 558.00, 2);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (12, '2025-06-23 00:00:00', 98, 1, 260.00, 241.80, 6);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (14, '2025-04-25 00:00:00', 62, 1, 400.00, 372.00, 5);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (15, '2025-06-08 00:00:00', 27, 4, 160.00, 160.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (16, '2025-01-12 00:00:00', 55, 3, 390.00, 390.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (17, '2025-04-10 00:00:00', 99, 1, 200.00, 200.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (18, '2025-01-14 00:00:00', 32, 1, 820.00, 762.60, 4);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (19, '2025-02-19 00:00:00', 25, 4, 500.00, 500.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (20, '2025-05-22 00:00:00', 2, 1, 600.00, 600.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (21, '2025-02-23 00:00:00', 35, 2, 165.00, 165.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (22, '2025-05-27 00:00:00', 32, 2, 580.00, 580.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (23, '2025-01-20 00:00:00', 51, 2, 390.00, 390.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (24, '2025-01-28 00:00:00', 92, 2, 200.00, 186.00, 5);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (25, '2025-06-15 00:00:00', 78, 1, 390.00, 390.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (26, '2025-03-23 00:00:00', 34, 2, 225.00, 225.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (27, '2025-04-10 00:00:00', 94, 4, 500.00, 500.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (28, '2025-03-14 00:00:00', 30, 2, 200.00, 200.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (29, '2025-06-06 00:00:00', 56, 1, 280.00, 280.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (30, '2025-05-07 00:00:00', 8, 3, 390.00, 390.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (31, '2025-03-16 00:00:00', 37, 3, 780.00, 780.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (32, '2025-02-10 00:00:00', 4, 3, 190.00, 190.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (33, '2025-03-06 00:00:00', 95, 1, 190.00, 190.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (34, '2025-02-15 00:00:00', 72, 2, 490.00, 490.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (35, '2025-02-21 00:00:00', 81, 1, 765.00, 711.45, 1);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (36, '2025-02-14 00:00:00', 13, 4, 600.00, 600.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (37, '2025-05-24 00:00:00', 45, 3, 990.00, 920.70, 1);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (38, '2025-06-01 00:00:00', 27, 3, 340.00, 340.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (39, '2025-06-05 00:00:00', 85, 2, 220.00, 220.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (40, '2025-02-02 00:00:00', 9, 4, 660.00, 660.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (41, '2025-01-28 00:00:00', 38, 3, 850.00, 790.50, 6);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (42, '2025-04-29 00:00:00', 45, 1, 875.00, 875.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (43, '2025-04-13 00:00:00', 68, 2, 250.00, 250.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (44, '2025-06-16 00:00:00', 77, 2, 260.00, 260.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (45, '2025-02-13 00:00:00', 48, 3, 590.00, 590.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (46, '2025-04-17 00:00:00', 79, 1, 790.00, 790.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (47, '2025-06-13 00:00:00', 26, 3, 670.00, 670.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (48, '2025-06-01 00:00:00', 29, 4, 895.00, 832.35, 6);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (49, '2025-03-07 00:00:00', 63, 1, 555.00, 555.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (50, '2025-06-11 00:00:00', 81, 3, 755.00, 702.15, 4);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (51, '2025-01-05 00:00:00', 63, 4, 180.00, 167.40, 6);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (52, '2025-05-12 00:00:00', 52, 2, 530.00, 530.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (53, '2025-06-29 00:00:00', 18, 2, 595.00, 595.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (54, '2025-01-26 00:00:00', 71, 2, 320.00, 320.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (55, '2025-04-14 00:00:00', 60, 2, 890.00, 890.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (56, '2025-04-14 00:00:00', 53, 4, 520.00, 483.60, 6);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (57, '2025-05-03 00:00:00', 88, 3, 600.00, 600.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (58, '2025-01-08 00:00:00', 49, 1, 380.00, 353.40, 2);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (59, '2025-03-17 00:00:00', 54, 2, 280.00, 260.40, 1);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (60, '2025-02-17 00:00:00', 20, 3, 925.00, 860.25, 1);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (61, '2025-05-20 00:00:00', 46, 3, 875.00, 875.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (62, '2025-04-22 00:00:00', 62, 3, 855.00, 855.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (63, '2025-05-29 00:00:00', 3, 4, 680.00, 632.40, 5);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (64, '2025-03-30 00:00:00', 30, 3, 570.00, 530.10, 4);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (65, '2025-05-22 00:00:00', 1, 1, 545.00, 506.85, 4);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (66, '2025-05-04 00:00:00', 40, 4, 520.00, 520.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (67, '2025-01-21 00:00:00', 43, 1, 400.00, 400.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (68, '2025-01-18 00:00:00', 38, 2, 340.00, 340.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (69, '2025-01-15 00:00:00', 91, 1, 585.00, 585.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (70, '2025-05-29 00:00:00', 27, 1, 550.00, 550.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (71, '2025-05-07 00:00:00', 92, 4, 390.00, 390.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (72, '2025-05-26 00:00:00', 53, 2, 725.00, 674.25, 1);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (73, '2025-01-16 00:00:00', 33, 4, 280.00, 260.40, 3);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (74, '2025-05-22 00:00:00', 50, 1, 420.00, 390.60, 2);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (75, '2025-02-12 00:00:00', 55, 3, 820.00, 820.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (76, '2025-02-27 00:00:00', 21, 3, 220.00, 204.60, 2);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (77, '2025-05-16 00:00:00', 2, 4, 885.00, 885.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (78, '2025-02-04 00:00:00', 64, 3, 905.00, 905.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (79, '2025-03-27 00:00:00', 21, 1, 380.00, 353.40, 3);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (80, '2025-03-04 00:00:00', 23, 2, 755.00, 702.15, 5);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (81, '2025-04-22 00:00:00', 84, 3, 510.00, 510.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (82, '2025-05-07 00:00:00', 34, 4, 645.00, 645.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (83, '2025-01-17 00:00:00', 49, 4, 360.00, 360.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (84, '2025-06-22 00:00:00', 68, 2, 810.00, 810.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (85, '2025-05-25 00:00:00', 17, 3, 280.00, 260.40, 4);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (86, '2025-04-22 00:00:00', 32, 1, 670.00, 623.10, 2);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (87, '2025-03-04 00:00:00', 5, 1, 900.00, 900.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (88, '2025-01-11 00:00:00', 64, 1, 770.00, 770.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (89, '2025-03-02 00:00:00', 42, 2, 690.00, 690.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (90, '2025-05-23 00:00:00', 68, 3, 665.00, 665.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (91, '2025-04-17 00:00:00', 60, 1, 200.00, 200.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (92, '2025-04-15 00:00:00', 38, 2, 650.00, 650.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (93, '2025-05-23 00:00:00', 53, 2, 545.00, 506.85, 1);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (94, '2025-01-06 00:00:00', 50, 4, 725.00, 725.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (95, '2025-03-24 00:00:00', 88, 1, 140.00, 140.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (96, '2025-01-28 00:00:00', 77, 3, 585.00, 585.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (97, '2025-02-04 00:00:00', 95, 3, 490.00, 490.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (98, '2025-03-06 00:00:00', 82, 3, 660.00, 660.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (99, '2025-02-17 00:00:00', 12, 4, 445.00, 445.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (100, '2025-01-27 00:00:00', 28, 4, 890.00, 827.70, 1);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (101, '2025-03-30 00:00:00', 19, 1, 650.00, 650.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (102, '2025-05-02 00:00:00', 34, 3, 680.00, 680.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (103, '2025-01-28 00:00:00', 66, 3, 505.00, 505.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (104, '2025-01-02 00:00:00', 57, 2, 850.00, 850.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (105, '2025-03-26 00:00:00', 73, 3, 595.00, 595.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (106, '2025-06-03 00:00:00', 30, 1, 720.00, 720.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (107, '2025-06-15 00:00:00', 80, 3, 385.00, 358.05, 2);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (108, '2025-06-13 00:00:00', 43, 4, 720.00, 669.60, 4);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (109, '2025-02-13 00:00:00', 55, 1, 250.00, 250.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (110, '2025-04-02 00:00:00', 97, 3, 280.00, 260.40, 2);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (111, '2025-01-04 00:00:00', 82, 1, 480.00, 480.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (112, '2025-01-04 00:00:00', 58, 3, 340.00, 316.20, 2);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (113, '2025-06-06 00:00:00', 35, 4, 600.00, 600.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (114, '2025-02-04 00:00:00', 77, 1, 815.00, 815.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (115, '2025-04-20 00:00:00', 21, 2, 600.00, 600.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (116, '2025-05-16 00:00:00', 69, 2, 695.00, 646.35, 6);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (117, '2025-01-18 00:00:00', 22, 4, 795.00, 739.35, 5);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (118, '2025-04-09 00:00:00', 40, 4, 190.00, 190.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (119, '2025-05-21 00:00:00', 62, 2, 605.00, 562.65, 3);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (120, '2025-05-09 00:00:00', 75, 4, 860.00, 799.80, 2);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (121, '2025-06-17 00:00:00', 50, 3, 680.00, 632.40, 6);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (122, '2025-06-21 00:00:00', 95, 3, 800.00, 800.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (123, '2025-02-05 00:00:00', 58, 1, 720.00, 669.60, 3);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (124, '2025-04-08 00:00:00', 5, 2, 200.00, 200.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (125, '2025-03-07 00:00:00', 53, 4, 720.00, 669.60, 4);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (126, '2025-03-07 00:00:00', 70, 3, 510.00, 510.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (127, '2025-05-07 00:00:00', 54, 1, 550.00, 550.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (128, '2025-03-31 00:00:00', 32, 4, 510.00, 474.30, 5);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (129, '2025-05-01 00:00:00', 44, 2, 220.00, 204.60, 3);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (130, '2025-03-27 00:00:00', 44, 4, 220.00, 204.60, 2);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (131, '2025-01-11 00:00:00', 90, 4, 795.00, 795.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (132, '2025-02-24 00:00:00', 51, 3, 720.00, 720.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (133, '2025-04-12 00:00:00', 15, 4, 735.00, 683.55, 6);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (134, '2025-03-23 00:00:00', 9, 4, 670.00, 670.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (135, '2025-04-04 00:00:00', 10, 3, 570.00, 570.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (136, '2025-05-21 00:00:00', 81, 4, 120.00, 120.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (137, '2025-06-06 00:00:00', 10, 1, 520.00, 520.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (139, '2025-02-14 00:00:00', 80, 4, 250.00, 250.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (140, '2025-01-02 00:00:00', 81, 1, 665.00, 665.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (141, '2025-05-03 00:00:00', 27, 4, 585.00, 585.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (142, '2025-03-26 00:00:00', 84, 4, 780.00, 725.40, 4);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (143, '2025-01-02 00:00:00', 78, 3, 665.00, 665.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (144, '2025-03-17 00:00:00', 92, 1, 575.00, 575.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (145, '2025-01-09 00:00:00', 27, 2, 440.00, 409.20, 6);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (146, '2025-01-05 00:00:00', 31, 2, 655.00, 609.15, 4);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (147, '2025-04-01 00:00:00', 33, 2, 740.00, 740.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (148, '2025-01-10 00:00:00', 28, 3, 580.00, 580.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (149, '2025-06-02 00:00:00', 12, 2, 140.00, 130.20, 3);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (150, '2025-01-16 00:00:00', 74, 2, 500.00, 500.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (151, '2025-02-23 00:00:00', 2, 1, 280.00, 280.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (152, '2025-02-03 00:00:00', 37, 1, 500.00, 500.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (153, '2025-04-07 00:00:00', 83, 2, 540.00, 540.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (154, '2025-04-18 00:00:00', 21, 2, 380.00, 380.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (155, '2025-05-08 00:00:00', 44, 1, 610.00, 567.30, 3);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (156, '2025-02-27 00:00:00', 47, 1, 200.00, 200.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (157, '2025-01-20 00:00:00', 22, 3, 225.00, 225.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (158, '2025-05-23 00:00:00', 95, 2, 790.00, 790.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (159, '2025-06-28 00:00:00', 50, 3, 820.00, 762.60, 4);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (160, '2025-06-29 00:00:00', 26, 3, 300.00, 300.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (161, '2025-03-27 00:00:00', 59, 1, 720.00, 669.60, 6);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (162, '2025-06-02 00:00:00', 48, 3, 430.00, 430.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (163, '2025-06-11 00:00:00', 95, 1, 625.00, 625.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (164, '2025-02-25 00:00:00', 52, 2, 490.00, 490.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (166, '2025-05-16 00:00:00', 66, 1, 320.00, 320.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (167, '2025-02-28 00:00:00', 13, 3, 220.00, 220.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (168, '2025-05-17 00:00:00', 50, 1, 350.00, 325.50, 4);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (169, '2025-05-25 00:00:00', 46, 2, 825.00, 825.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (170, '2025-03-24 00:00:00', 99, 3, 790.00, 734.70, 4);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (171, '2025-03-14 00:00:00', 86, 1, 890.00, 827.70, 2);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (172, '2025-01-20 00:00:00', 94, 3, 365.00, 365.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (173, '2025-02-20 00:00:00', 13, 4, 390.00, 390.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (174, '2025-03-13 00:00:00', 97, 3, 555.00, 516.15, 6);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (175, '2025-03-12 00:00:00', 53, 2, 250.00, 250.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (176, '2025-03-13 00:00:00', 66, 4, 365.00, 365.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (177, '2025-01-11 00:00:00', 100, 3, 180.00, 180.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (178, '2025-02-24 00:00:00', 43, 2, 370.00, 344.10, 2);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (179, '2025-04-10 00:00:00', 16, 4, 870.00, 809.10, 6);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (180, '2025-05-11 00:00:00', 37, 2, 855.00, 855.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (181, '2025-01-23 00:00:00', 4, 3, 220.00, 204.60, 5);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (182, '2025-04-14 00:00:00', 2, 4, 845.00, 845.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (183, '2025-05-04 00:00:00', 14, 2, 490.00, 455.70, 2);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (184, '2025-03-19 00:00:00', 2, 3, 480.00, 480.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (185, '2025-04-25 00:00:00', 23, 2, 365.00, 365.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (186, '2025-06-07 00:00:00', 33, 2, 700.00, 651.00, 3);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (187, '2025-06-24 00:00:00', 57, 1, 650.00, 650.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (188, '2025-04-23 00:00:00', 54, 1, 550.00, 550.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (189, '2025-04-01 00:00:00', 22, 1, 815.00, 757.95, 6);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (190, '2025-03-30 00:00:00', 40, 4, 485.00, 485.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (191, '2025-01-05 00:00:00', 77, 3, 470.00, 437.10, 3);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (192, '2025-04-20 00:00:00', 99, 3, 200.00, 200.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (193, '2025-03-05 00:00:00', 27, 4, 550.00, 511.50, 3);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (194, '2025-05-09 00:00:00', 36, 4, 740.00, 740.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (195, '2025-03-29 00:00:00', 21, 4, 410.00, 381.30, 3);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (196, '2025-01-07 00:00:00', 14, 3, 845.00, 845.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (197, '2025-03-06 00:00:00', 11, 2, 510.00, 510.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (198, '2025-01-15 00:00:00', 25, 1, 370.00, 370.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (199, '2025-02-12 00:00:00', 87, 4, 350.00, 350.00, NULL);
INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id) VALUES (200, '2025-02-13 00:00:00', 12, 1, 695.00, 695.00, NULL);


--TRUNCATE TABLE category RESTART IDENTITY CASCADE; -- tablodaki verileri siler komple 


INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (1, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (1, 21, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (2, 12, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (3, 6, 1, 165.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (3, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (4, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (4, 18, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (4, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (4, 5, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (5, 19, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (6, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (6, 6, 1, 165.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (6, 14, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (6, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (7, 21, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (7, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (7, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (7, 16, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (8, 15, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (8, 1, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (8, 20, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (8, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (9, 16, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (9, 11, 1, 350.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (9, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (10, 24, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (10, 12, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (10, 21, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (10, 29, 1, 120.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (11, 31, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (11, 19, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (11, 7, 1, 240.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (12, 2, 1, 260.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (14, 29, 1, 120.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (14, 28, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (14, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (15, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (16, 23, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (17, 21, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (18, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (18, 24, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (18, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (18, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (19, 31, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (19, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (19, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (20, 26, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (20, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (20, 28, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (20, 29, 1, 120.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (21, 6, 1, 165.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (22, 21, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (22, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (22, 4, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (23, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (23, 23, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (24, 31, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (25, 31, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (25, 3, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (26, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (27, 28, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (27, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (27, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (28, 20, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (29, 16, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (30, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (30, 28, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (31, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (31, 11, 1, 350.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (31, 24, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (32, 14, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (33, 3, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (34, 1, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (34, 7, 1, 240.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (35, 15, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (35, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (35, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (35, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (36, 26, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (36, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (36, 16, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (37, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (37, 11, 1, 350.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (37, 16, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (38, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (38, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (39, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (40, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (40, 26, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (40, 19, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (41, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (41, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (41, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (41, 4, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (42, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (42, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (42, 5, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (42, 25, 1, 235.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (43, 23, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (44, 2, 1, 260.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (45, 14, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (45, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (45, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (46, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (46, 20, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (46, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (46, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (47, 12, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (47, 31, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (47, 29, 1, 120.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (47, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (48, 23, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (48, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (48, 5, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (49, 28, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (49, 25, 1, 235.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (49, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (50, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (50, 23, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (50, 29, 1, 120.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (50, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (51, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (52, 18, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (52, 31, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (53, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (53, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (53, 25, 1, 235.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (54, 26, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (55, 2, 1, 260.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (55, 24, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (55, 19, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (55, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (56, 12, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (56, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (56, 14, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (57, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (57, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (57, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (58, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (58, 4, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (59, 5, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (60, 25, 1, 235.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (60, 24, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (60, 3, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (60, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (61, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (61, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (61, 7, 1, 240.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (61, 1, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (62, 3, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (62, 5, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (62, 6, 1, 165.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (62, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (63, 26, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (63, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (63, 16, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (64, 20, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (64, 3, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (64, 26, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (65, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (65, 19, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (65, 6, 1, 165.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (66, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (66, 20, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (67, 7, 1, 240.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (67, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (68, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (68, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (69, 6, 1, 165.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (69, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (69, 31, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (70, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (70, 19, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (70, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (71, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (71, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (72, 5, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (72, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (72, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (73, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (73, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (74, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (74, 21, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (75, 18, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (75, 19, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (75, 16, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (75, 14, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (76, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (77, 12, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (77, 4, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (77, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (77, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (78, 26, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (78, 24, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (78, 1, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (78, 15, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (79, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (79, 20, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (80, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (80, 11, 1, 350.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (80, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (81, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (81, 3, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (81, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (82, 18, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (82, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (82, 25, 1, 235.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (83, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (84, 11, 1, 350.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (84, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (84, 26, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (85, 5, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (86, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (86, 11, 1, 350.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (86, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (87, 23, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (87, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (87, 1, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (87, 26, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (88, 26, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (88, 11, 1, 350.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (88, 7, 1, 240.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (89, 28, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (89, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (89, 3, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (89, 20, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (90, 6, 1, 165.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (90, 24, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (90, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (91, 21, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (92, 2, 1, 260.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (92, 1, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (92, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (93, 15, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (93, 26, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (94, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (94, 6, 1, 165.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (94, 28, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (94, 20, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (95, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (96, 20, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (96, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (96, 19, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (97, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (97, 11, 1, 350.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (98, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (98, 19, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (98, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (99, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (99, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (100, 19, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (100, 23, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (100, 16, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (100, 21, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (101, 18, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (101, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (101, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (102, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (102, 25, 1, 235.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (102, 15, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (103, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (103, 5, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (104, 18, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (104, 12, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (104, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (104, 4, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (105, 1, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (105, 26, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (105, 6, 1, 165.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (106, 2, 1, 260.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (106, 25, 1, 235.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (106, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (107, 6, 1, 165.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (107, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (108, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (108, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (108, 28, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (108, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (109, 24, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (110, 16, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (111, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (111, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (111, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (112, 31, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (112, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (113, 11, 1, 350.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (113, 23, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (114, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (114, 21, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (114, 28, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (114, 24, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (115, 4, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (115, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (115, 7, 1, 240.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (116, 5, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (116, 23, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (116, 6, 1, 165.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (117, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (117, 4, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (117, 25, 1, 235.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (117, 19, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (118, 18, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (119, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (119, 6, 1, 165.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (119, 3, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (120, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (120, 21, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (120, 3, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (120, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (121, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (121, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (121, 28, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (122, 4, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (122, 16, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (122, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (122, 19, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (123, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (123, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (123, 12, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (124, 20, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (125, 23, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (125, 14, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (125, 5, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (126, 18, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (126, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (126, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (127, 14, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (127, 31, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (127, 19, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (128, 19, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (128, 11, 1, 350.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (129, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (130, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (131, 25, 1, 235.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (131, 20, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (131, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (131, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (132, 28, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (132, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (132, 26, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (132, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (133, 25, 1, 235.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (133, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (133, 16, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (134, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (134, 24, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (134, 2, 1, 260.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (135, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (135, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (135, 24, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (136, 29, 1, 120.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (137, 18, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (137, 3, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (139, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (140, 4, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (140, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (140, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (141, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (141, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (141, 4, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (142, 19, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (142, 26, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (142, 1, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (142, 14, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (143, 15, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (143, 12, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (143, 24, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (144, 19, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (144, 14, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (144, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (145, 24, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (145, 12, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (146, 24, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (146, 26, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (146, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (147, 7, 1, 240.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (147, 16, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (147, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (148, 21, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (148, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (148, 7, 1, 240.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (149, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (150, 16, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (150, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (151, 16, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (152, 5, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (152, 4, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (153, 11, 1, 350.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (153, 3, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (154, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (154, 21, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (155, 19, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (155, 2, 1, 260.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (155, 12, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (156, 31, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (157, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (158, 11, 1, 350.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (158, 3, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (158, 1, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (159, 12, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (159, 11, 1, 350.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (159, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (159, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (160, 29, 1, 120.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (160, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (161, 12, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (161, 31, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (161, 14, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (162, 14, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (162, 7, 1, 240.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (163, 7, 1, 240.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (163, 4, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (163, 6, 1, 165.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (164, 23, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (164, 7, 1, 240.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (166, 28, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (166, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (167, 4, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (168, 11, 1, 350.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (169, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (169, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (169, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (169, 21, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (170, 17, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (170, 2, 1, 260.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (170, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (170, 3, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (171, 23, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (171, 26, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (171, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (171, 16, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (172, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (173, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (173, 1, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (174, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (174, 3, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (174, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (175, 23, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (176, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (176, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (177, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (178, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (178, 18, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (179, 3, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (179, 7, 1, 240.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (179, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (179, 18, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (180, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (180, 7, 1, 240.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (180, 25, 1, 235.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (180, 31, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (181, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (182, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (182, 2, 1, 260.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (182, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (182, 15, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (183, 18, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (183, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (183, 29, 1, 120.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (184, 31, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (184, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (185, 27, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (185, 8, 1, 225.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (186, 21, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (186, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (186, 23, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (187, 18, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (187, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (187, 7, 1, 240.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (188, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (188, 28, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (188, 3, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (189, 14, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (189, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (189, 25, 1, 235.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (189, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (190, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (190, 6, 1, 165.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (190, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (191, 9, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (191, 10, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (192, 20, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (193, 19, 1, 160.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (193, 1, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (193, 32, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (194, 18, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (194, 11, 1, 350.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (194, 20, 1, 200.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (195, 22, 1, 220.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (195, 3, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (196, 24, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (196, 30, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (196, 25, 1, 235.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (196, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (197, 28, 1, 140.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (197, 23, 1, 250.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (197, 29, 1, 120.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (198, 13, 1, 180.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (198, 3, 1, 190.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (199, 11, 1, 350.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (200, 6, 1, 165.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (200, 16, 1, 280.00);
INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES (200, 1, 1, 250.00);
