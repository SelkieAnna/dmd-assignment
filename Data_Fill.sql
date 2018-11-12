USE Car_sharing;

INSERT INTO Customer (residence, full_name, username, email, phone_number)
            VALUES
                   ('1225 N Willow St, Telluride, CO, 81435', 'Anna Lvova', 'selkie', 'an.lvova@innopolis.ru', '12345678'),
                   ('9500 Fm 210, Olney, TX, 76374', 'Kamil Saitov', 'Sariell', 'k.saitov@innopolis.ru', '12345678'),
                   ('345 Jerry Ln, Erwin, NC, 28339', 'Timerlan Nasyrov', 'Timerlanchik', 't.nasyrov@innopolis.ru', '12345678'),
                   ('2003 Jay St, Walnut Ridge, AR, 72476', 'Andrey Chertkov', 'Andryusha', 'a.chertkov@innopolis.ru', '12345678');

INSERT INTO Car (registration_number, car_model, location, color, charge_level, full_charge, busy, `condition`, is_charging)
            VALUES
                   ('X123UY', '1', 'uni, 1', 'violet', '4000', '10000', '0', '1', '0'),
                   ('K234EK', '2', 'uni, 2', 'sky blue', '3000', '12000', '0', '0', '0'),
                   ('P234OH', '2', 'Kazahstan', 'space earl grey', '2000', '12000', '0', '0', '0'),
                   ('E235BA', '3', 'uni, 2', 'skyblue', '3000', '12000', '0', '0', '0');
INSERT INTO Car_model (company, model, plug_type)
            VALUES
                   ('Ford', 'Focus', 'regular'),
                   ('BMW', 'M3', 'regular'),
                   ('Gaz', 'el', 'truck'),
                   ('Volkswagen', 'Transporter', 'Microbus');
INSERT INTO Car_order (customer_id, car_id, point_a, point_b, date_time, price)
            VALUES
                   ('0', '1', '225 N Willow St, Telluride, CO, 81435', '2003 Jay St, Walnut Ridge, AR, 72476', '11-11-2011 11:11:11', '400'),
                   ('1', '2', '55 Hoover Holw, Garrett, KY, 41630', '95 Royal Dr, Carson City, NV, 89706', '04-10-2018 12:15:17', '300'),
                   ('2', '3', '505 Center Pl, Williamsport, PA, 17701', '1541 Owenwood Cir, Sandy, UT, 84092', '05-10-2018 15:54:56', '500');

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
