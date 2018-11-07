CREATE TABLE IF NOT EXISTS Charging_station (
  id INT PRIMARY KEY,
  location   VARCHAR(255) NOT NULL,
  cost_mah   FLOAT        NOT NULL
);

CREATE TABLE IF NOT EXISTS Socket (
  id         INT   NOT NULL,
  voltage    FLOAT NOT NULL,
  station_id INT   NOT NULL,
  cur_charging INT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (station_id) REFERENCES Charging_station (id),
  FOREIGN KEY (cur_charging) REFERENCES Socket_car (socket_id)
);

CREATE TABLE IF NOT EXISTS Car_model (
  id        INT PRIMARY KEY,
  company   VARCHAR(255) NOT NULL,
  model     VARCHAR(255) NOT NULL,
  plug_type INT          NOT NULL

);

CREATE TABLE IF NOT EXISTS Workshop (
  id               INT PRIMARY KEY,
  location         VARCHAR(255) NOT NULL,
  available_timing VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Car (
  registration_number INT PRIMARY KEY,
  car_model INT NOT NULL,
  type                VARCHAR(255) NOT NULL,
  location            VARCHAR(255) NOT NULL,
  color               VARCHAR(255) NOT NULL,
  charge_level_in_MaH INT          NOT NULL,
  full_charge_in_MaH  INT          NOT NULL,
  busy                TINYINT      NOT NULL,
  `condition`         TINYINT      NOT NULL,

  current_charge INT NULL,

  FOREIGN KEY (car_model) REFERENCES Car_model (id),
  FOREIGN KEY (current_charge) REFERENCES Socket_car (car_id)
);

CREATE TABLE IF NOT EXISTS Socket_car (
  socket_id INT NOT NULL,
  car_id INT NOT NULL,
  time_date DATETIME NOT NULL,

  FOREIGN KEY (socket_id) REFERENCES Socket (id),
  FOREIGN KEY (car_id) REFERENCES Car (registration_number)
);

CREATE TABLE IF NOT EXISTS Fixes (
  time_and_date VARCHAR(255) NOT NULL ,
  car_id        INT          NOT NULL ,
  workshop_id   INT          NOT NULL ,
  FOREIGN KEY  (car_id) REFERENCES Car(id),
  FOREIGN KEY  (workshop_id) REFERENCES Workshop(id)
);

CREATE TABLE IF NOT EXISTS Has_availble (
  workshop_id   INT        NOT NULL ,
  car_part_id   INT        NOT NULL ,
  amount        INT        NOT NULL ,
  FOREIGN KEY (workshop_id) REFERENCES Workshop(id),
  FOREIGN KEY (car_part_id) REFERENCES Car_part(id)
);



