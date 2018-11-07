CREATE DATABASE IF NOT EXISTS Car_sharing;
USE Car_sharing;


CREATE TABLE IF NOT EXISTS Charging_station (
  id       INT PRIMARY KEY AUTO_INCREMENT,
  location VARCHAR(255) NOT NULL,
  cost_mah FLOAT        NOT NULL
);

CREATE TABLE IF NOT EXISTS Socket (
  id           INT   NOT NULL AUTO_INCREMENT,
  voltage      FLOAT NOT NULL,
  station_id   INT   NOT NULL,
  cur_charging INT   NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (station_id) REFERENCES Charging_station (id)
);

CREATE TABLE IF NOT EXISTS Car_model (
  id              INT             PRIMARY KEY,
  company         VARCHAR(255)    NOT NULL,
  type            VARCHAR(255)    NOT NULL,
  model           VARCHAR(255)    NOT NULL,
  plug_type       INT             NOT NULL
);

CREATE TABLE IF NOT EXISTS Available_time(
workshop_id      INT NOT NULL,
`date`    DATE NOT NULL, 
00h_01h   INT  NOT NULL,
01h_02h   INT  NOT NULL,
02h_03h   INT  NOT NULL,
03h_04h   INT  NOT NULL,
04h_05h   INT  NOT NULL,
05h_06h   INT  NOT NULL,
06h_07h   INT  NOT NULL,
07h_08h   INT  NOT NULL,
08h_09h   INT  NOT NULL,
09h_10h   INT  NOT NULL,
10h_11h   INT  NOT NULL,
11h_12h   INT  NOT NULL,
12h_13h   INT  NOT NULL,
13h_14h   INT  NOT NULL,
14h_15h   INT  NOT NULL,
15h_16h   INT  NOT NULL,
16h_17h   INT  NOT NULL,
17h_18h   INT  NOT NULL,
18h_19h   INT  NOT NULL,
19h_20h   INT  NOT NULL,
20h_21h   INT  NOT NULL,
21h_22h   INT  NOT NULL,
22h_23h   INT  NOT NULL,
23h_24h   INT  NOT NULL

FOREIGN KEY (workshop_id) REFERENCES Workshop (id)
);

CREATE TABLE IF NOT EXISTS Workshop (
  id               INT            PRIMARY KEY,
  location         VARCHAR(255)   NOT NULL,
);

CREATE TABLE IF NOT EXISTS Car (
  registration_number VARCHAR(255) PRIMARY KEY,
  car_model           INT          NOT NULL,
  location            VARCHAR(255) NOT NULL,
  color               VARCHAR(255) NOT NULL,
  charge_level        INT          NOT NULL,
  full_charge         INT          NOT NULL,
  busy                TINYINT      NOT NULL,
  `condition`         TINYINT      NOT NULL,
  is_charging         INT          NOT NULL,

  FOREIGN KEY (car_model) REFERENCES Car_model (id)
);

CREATE TABLE IF NOT EXISTS Customer (
  id           INT PRIMARY KEY AUTO_INCREMENT,
  residence    VARCHAR(255) NOT NULL,
  full_name    VARCHAR(255) NOT NULL,
  username     VARCHAR(255) NOT NULL,
  email        VARCHAR(255) NOT NULL,
  phone_number VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Part_provider (
  id           INT PRIMARY KEY AUTO_INCREMENT,
  address      INT          NOT NULL,
  phone_number VARCHAR(255) NOT NULL,
  name         VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Car_part (
  id    INT PRIMARY KEY AUTO_INCREMENT,
  color VARCHAR(255) NOT NULL,
  cost  DECIMAL      NOT NULL,
  name  VARCHAR(255)          NOT NULL
);

CREATE TABLE IF NOT EXISTS Socket_car (
  socket_id INT      NOT NULL,
  car_id    VARCHAR(255)      NOT NULL,
  time_date DATETIME NOT NULL,

  FOREIGN KEY (socket_id) REFERENCES Socket (id),
  FOREIGN KEY (car_id) REFERENCES Car (registration_number)
);

CREATE TABLE IF NOT EXISTS Fixes (
  time_and_date DATETIME NOT NULL,
  car_id        VARCHAR(255)      NOT NULL,
  workshop_id   INT      NOT NULL,

  FOREIGN KEY (car_id) REFERENCES Car (registration_number),
  FOREIGN KEY (workshop_id) REFERENCES Workshop (id)
);

CREATE TABLE IF NOT EXISTS Has_availble (
  workshop_id INT NOT NULL,
  car_part_id INT NOT NULL,
  amount      INT NOT NULL,

  FOREIGN KEY (workshop_id) REFERENCES Workshop (id),
  FOREIGN KEY (car_part_id) REFERENCES Car_part (id)
);

CREATE TABLE IF NOT EXISTS Provides (
  car_part_id   INT NOT NULL,
  part_drovider INT NOT NULL,

  FOREIGN KEY (car_part_id) REFERENCES Car_part (id),
  FOREIGN KEY (part_drovider) REFERENCES Part_provider (id)
);

CREATE TABLE IF NOT EXISTS Car_order (
  customer_id INT          NOT NULL,
  car_id      VARCHAR(255)          NOT NULL,
  point_a     VARCHAR(255) NOT NULL,
  point_b     VARCHAR(255) NOT NULL,
  date_time   DATETIME     NOT NULL,
  price       DECIMAL      NOT NULL,

  FOREIGN KEY (customer_id) REFERENCES Customer (id),
  FOREIGN KEY (car_id) REFERENCES Car (registration_number)
);

CREATE TABLE IF NOT EXISTS Part_order (
  provider_id INT     NOT NULL,
  workshop_id INT     NOT NULL,
  part_id     INT     NOT NULL,
  amount      DECIMAL NOT NULL,

  FOREIGN KEY (provider_id) REFERENCES Part_provider (id),
  FOREIGN KEY (workshop_id) REFERENCES Workshop (id),
  FOREIGN KEY (part_id) REFERENCES Car_part (id)
);

CREATE TABLE IF NOT EXISTS Repairable (
  model_id INT,
  part_id  INT,

  FOREIGN KEY (model_id) REFERENCES Car_model (id),
  FOREIGN KEY (part_id) REFERENCES Car_part (id)
);