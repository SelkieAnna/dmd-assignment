CREATE DATABASE IF NOT EXISTS Car_sharing;
USE Car_sharing;


CREATE TABLE IF NOT EXISTS Charging_station (
  id              INT             PRIMARY KEY,
  location        VARCHAR(255)    NOT NULL,
  cost_mah        FLOAT           NOT NULL
);

CREATE TABLE IF NOT EXISTS Socket (
  id              INT             NOT NULL,
  voltage         FLOAT           NOT NULL,
  station_id      INT             NOT NULL,
  cur_charging    INT             NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (station_id) REFERENCES Charging_station (id)
);

CREATE TABLE IF NOT EXISTS Car_model (
  id              INT             PRIMARY KEY,
  company         VARCHAR(255)    NOT NULL,
  model           VARCHAR(255)    NOT NULL,
  plug_type       INT             NOT NULL

);

CREATE TABLE IF NOT EXISTS Workshop (
  id               INT            PRIMARY KEY,
  location         VARCHAR(255)   NOT NULL,
  available_timing VARCHAR(255)   NOT NULL
);

CREATE TABLE IF NOT EXISTS Car (
  registration_number INT PRIMARY KEY,
  car_model INT NOT NULL,
  type            VARCHAR(255)    NOT NULL,
  location        VARCHAR(255)    NOT NULL,
  color           VARCHAR(255)    NOT NULL,
  charge_level    INT             NOT NULL,
  full_charge     INT             NOT NULL,
  busy            TINYINT         NOT NULL,
  `condition`     TINYINT         NOT NULL,
  is_charging     INT             NOT NULL,

  FOREIGN KEY (car_model) REFERENCES Car_model (id)
);

CREATE TABLE IF NOT EXISTS Customer (
  id              INT             PRIMARY KEY,
  residence       VARCHAR(255)    NOT NULL,
  full_name       VARCHAR(255)    NOT NULL,
  username        VARCHAR(255)    NOT NULL,
  email           VARCHAR(255)    NOT NULL,
  phone_number    VARCHAR(255)    NOT NULL
);

CREATE TABLE IF NOT EXISTS Part_provider (
  id              INT             PRIMARY KEY,
  address         INT             NOT NULL,
  phone_number    VARCHAR(255)    NOT NULL,
  name            VARCHAR(255)    NOT NULL
);

CREATE TABLE IF NOT EXISTS Car_part (
  id              INT             PRIMARY KEY,
  color           VARCHAR(255)    NOT NULL,
  cost            DECIMAL         NOT NULL,
  name            INT             NOT NULL
);

CREATE TABLE IF NOT EXISTS Socket_car (
  socket_id       INT             NOT NULL,
  car_id          INT             NOT NULL,
  time_date       DATETIME        NOT NULL,

  FOREIGN KEY (socket_id) REFERENCES Socket (id),
  FOREIGN KEY (car_id) REFERENCES Car (registration_number)
);

CREATE TABLE IF NOT EXISTS Fixes (
  time_and_date   DATETIME        NOT NULL ,
  car_id          INT             NOT NULL ,
  workshop_id     INT             NOT NULL ,

  FOREIGN KEY  (car_id) REFERENCES Car (registration_number),
  FOREIGN KEY  (workshop_id) REFERENCES Workshop (id)
);

CREATE TABLE IF NOT EXISTS Has_availble (
  workshop_id     INT             NOT NULL ,
  car_part_id     INT             NOT NULL ,
  amount          INT             NOT NULL ,

  FOREIGN KEY (workshop_id) REFERENCES Workshop (id),
  FOREIGN KEY (car_part_id) REFERENCES Car_part (id)
);

CREATE TABLE IF NOT EXISTS Provides(
  car_part_id     INT             NOT NULL ,
  part_drovider   INT             NOT NULL ,

  FOREIGN KEY (car_part_id) REFERENCES Car_part (id),
  FOREIGN KEY (part_drovider) REFERENCES Part_provider (id)
);

CREATE TABLE IF NOT EXISTS Car_order (
  customer_id     INT             NOT NULL,
  car_id          INT             NOT NULL,
  point_a         VARCHAR(255)    NOT NULL,
  point_b         VARCHAR(255)    NOT NULL,
  date_time       DATETIME        NOT NULL,
  price           DECIMAL         NOT NULL,

  FOREIGN KEY (customer_id) REFERENCES Customer (id),
  FOREIGN KEY (car_id) REFERENCES Car (registration_number)
);

CREATE TABLE IF NOT EXISTS Part_order (
  provider_id     INT             NOT NULL,
  workshop_id     INT             NOT NULL,
  part_id         INT             NOT NULL,
  amount          DECIMAL         NOT NULL,

  FOREIGN KEY (provider_id) REFERENCES Part_provider (id),
  FOREIGN KEY (workshop_id) REFERENCES Workshop (id),
  FOREIGN KEY (part_id) REFERENCES Car_part (id)
);

CREATE TABLE IF NOT EXISTS Repairable (
  model_id        INT,
  part_id         INT,

  FOREIGN KEY (model_id) REFERENCES Car_model (id),
  FOREIGN KEY (part_id) REFERENCES Car_part (id)
);
