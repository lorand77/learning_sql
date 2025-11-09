CREATE TABLE Players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(50),
    age INT,
    location VARCHAR(50),
    cash INT
);

INSERT INTO Players (player_id, player_name, age, location, cash)
VALUES
(1, 'Michael De Santa', 45, 'Rockford Hills', 250000),
(2, 'Franklin Clinton', 26, 'Strawberry', 85000),
(3, 'Trevor Philips', 47, 'Sandy Shores', 120000);

SELECT * from Players;

SELECT * from players where cash > 100000;

update Players
set cash = cash + 10000
where player_name =  'Franklin Clinton';

insert into players (player_id, player_name, age, location, cash)
VALUES
(4, 'Lamar', 26, 'Shit Hole', -10000);

DELETE from players
WHERE cash < 0;


CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY,
    owner_name VARCHAR(50),
    vehicle_model VARCHAR(50),
    vehicle_type VARCHAR(30),
    color VARCHAR(20),
    value INT
);

INSERT INTO Vehicles (vehicle_id, owner_name, vehicle_model, vehicle_type, color, value)
VALUES
(1, 'Michael De Santa', 'Obey Tailgater', 'Sedan', 'Black', 55000),
(2, 'Franklin Clinton', 'Bravado Buffalo S', 'Sports', 'White', 120000),
(3, 'Trevor Philips', 'Canis Bodhi', 'Off-Road', 'Red', 45000),
(4, 'Franklin Clinton', 'Pegassi Zentorno', 'Super', 'Lime Green', 725000),
(5, 'Michael De Santa', 'Dewbauchee Exemplar', 'Coupe', 'Silver', 205000);

SELECT * from vehicles;

SELECT * from "Vehicles" where owner_name = 'Franklin Clinton';

SELECT vehicle_model, location from players JOIN vehicles on players.player_name = vehicles.owner_name;
