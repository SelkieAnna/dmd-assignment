USE Car_sharing;

INSERT INTO Customer (residence, full_name, username, email, phone_number)
            VALUES
                   ('1-207', 'Anna Lvova', 'selkie', 'an.lvova@innopolis.ru', '12345678'),
                   ('2-226', 'Kamil Saitov', 'Sariell', 'k.saitov@innopolis.ru', '12345678'),
                   ('2-345', 'Timerlan Nasyrov', 'Timerlanchik', 't.nasyrov@innopolis.ru', '12345678'),
                   ('1-206', 'Andrey Chertkov', 'Andryusha', 'a.chertkov@innopolis.ru', '12345678');

INSERT INTO Car (registration_number, car_model, location, color, charge_level, full_charge, busy, `condition`, is_charging)
            VALUE
                   ('X123UY', '1', 'uni, 1', 'violet', '4000', '10000', '0', '1', '0'),
                   ('K234EK', '2', 'uni, 2', 'sky blue', '3000', '12000', '0', '0', '0'),
                   ('P234OH', '2', 'Kazahstan', 'space earl grey', '2000', '12000', '0', '0', '0'),
                   ('E235BA', '3', 'uni, 2', 'skyblue', '3000', '12000', '0', '0', '0');

INSERT INTO Available_time(id, `00h_01h`, `01h_02h`, `02h_03h`, `03h_04h`, `04h_05h`, `05h_06h`, `06h_07h`, `07h_08h`, `08h_09h`, `09h_10h`, `10h_11h`, `11h_12h`, `12h_13h`, `13h_14h`, `14h_15h`, `15h_16h`, `16h_17h`, `17h_18h`, `18h_19h`, `19h_20h`, `20h_21h`, `21h_22h`, `22h_23h`, `23h_24h`)
            VALUE ('1231', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3'),
                  ('1233', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3'),
                  ('1235', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3');
                  
INSERT INTO Workshop(id, location, available_timing)
            VALUE ('34324', 'Califirnication', '1231'),
                  ('34327', 'Califirnication', '1233'),
                  ('34328', 'Califirnication', '1235');

INSERT INTO Part_provider (address, phone_number, name)
    VALUES  ('55 Hoover Holw, Garrett, KY, 41630', '(606) 358-0302', 'JJohnson Group'),
            ('220 Thomas Creek Dr, Newark, AR, 72562', '(870) 799-3255', 'The Smith Corporation'),
            ('1541 Owenwood Cir, Sandy, UT, 84092', '(801) 572-6446', 'BRENT'),
            ('95 Royal Dr, Carson City, NV, 89706', '(940) 563-3108', 'K(Enterprise)mil');

INSERT INTO Car_part (color, cost, name)
    VALUES  ('Red', 90, 'Brake disc'),
            ('Blue', 100, 'Front Right Door'),
            ('Pink', 67, 'Wheel'),
            ('Black', 130, 'Seat Cover');


INSERT INTO Fixes(time_and_date, car_id, workshop_id)
            VALUES ('2017-11-08 01:29:30', 'X123UY', '34324'),
                    ('2017-11-03 12:29:30', 'K234EK', '34324'),
                    ('2017-11-05 17:12:05', 'X123UY', '34327');

INSERT INTO Has_available(workshop_id, car_part_id, amount)
            VALUES ();
