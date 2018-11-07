USE Car_sharing;

INSERT INTO Customer (residence, full_name, username, email, phone_number)
            VALUES
                   ('1-207', 'Anna Lvova', 'selkie', 'an.lvova@innopolis.ru', '12345678'),
                   ('2-226', 'Kamil Saitov', 'Sariell', 'k.saitov@innopolis.ru', '12345678'),
                   ('2-345', 'Timerlan Nasyrov', 'Timerlanchik', 't.nasyrov@innopolis.ru', '12345678'),
                   ('1-206', 'Andrey Chertkov', 'Andryusha', 'a.chertkov@innopolis.ru', '12345678');

INSERT INTO Car (registration_number, car_model, type, location, color, charge_level, full_charge, busy, `condition`, is_charging)
            VALUES
                   ('X123UY', '1', 'regular', 'uni, 1', 'violet', '4000', '10000', '0', '1', '0'),
                   ('K234EK', '2', 'regular', 'uni, 2', 'sky blue', '3000', '12000', '0', '0', '0'),
                   ('P234OH', '2', 'gruzovik', 'Kazahstan', 'space earl grey', '2000', '12000', '0', '0', '0'),
                   ('E235BA', '3', 'regular', 'uni, 2', 'skyblue', '3000', '12000', '0', '0', '0');



