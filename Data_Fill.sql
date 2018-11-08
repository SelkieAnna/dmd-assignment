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




