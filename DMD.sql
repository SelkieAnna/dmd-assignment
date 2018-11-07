CREATE TABLE IF NOT EXISTS Charging_station (
  id INT PRIMARY KEY,
  location   VARCHAR(255) NOT NULL,
  cost_mah   FLOAT        NOT NULL
);

CREATE TABLE IF NOT EXISTS Socket (
  id         INT   NOT NULL,
  voltage    FLOAT NOT NULL,
  station_id INT   NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (station_id) REFERENCES Charging_station (id)
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
  type                VARCHAR(255) NOT NULL,
  location            VARCHAR(255) NOT NULL,
  color               VARCHAR(255) NOT NULL,
  charge_level_in_MaH INT          NOT NULL,
  full_charge_in_MaH  INT          NOT NULL,
  busy                TINYINT      NOT NULL,
  `condition`         TINYINT      NOT NULL
);

