SELECT * FROM `areas` WHERE 1;
SELECT * FROM `areas_out_of_area` WHERE 1;
SELECT * FROM `buildings` WHERE 1;
SELECT * FROM `buildings_has_warriors` WHERE 1;
SELECT * FROM `enemies` WHERE 1;
SELECT * FROM `players` WHERE 1;
SELECT * FROM `resources_types` WHERE 1;
SELECT * FROM `stats_and_resources` WHERE 1;
SELECT * FROM `warriors` WHERE 1;
SELECT * FROM `workers` WHERE 1;
SELECT * FROM `workers_has_buildings` WHERE 1;


/********/
SELECT
    players.name,
    stats_and_resources.year,
    stats_and_resources.lvl
FROM
    players
JOIN stats_and_resources ON players.resources_id = stats_and_resources.id;


/********/
SELECT
    players.name,
    stats_and_resources.year,
    stats_and_resources.lvl,
    resources_types.name,
    resources_types.count
FROM
    players
JOIN stats_and_resources ON players.resources_id = stats_and_resources.id
JOIN resources_types ON stats_and_resources.id = resources_types.resources_id;


/********/
SELECT
    players.name,
    areas.id
FROM
    players
JOIN areas ON areas.players_id = players.id;


/********/
SELECT
    players.name,
    buildings.type
FROM
    players
JOIN buildings ON buildings.areas_players_id = players.id;


/********/
SELECT
    players.name,
    buildings.type as building_type,
    warriors.typed,
    warriors.health,
    warriors.current_location
FROM
    players
JOIN buildings ON buildings.areas_players_id = players.id
JOIN buildings_has_warriors ON buildings_has_warriors.buildings_id = buildings.id
JOIN warriors ON warriors.id = buildings_has_warriors.warriors_id;


/********/
SELECT
    players.name,
    buildings.type as building_type,
    workers.type,
    workers.lvl,
    workers.speed
FROM
    players
JOIN buildings ON buildings.areas_players_id = players.id
JOIN workers_has_buildings ON workers_has_buildings.buildings_id = buildings.id
JOIN workers ON workers_has_buildings.workers_id = workers.id;


/********/
SELECT
    players.name,
    buildings.type as building_type,
    warriors.typed as warriors_type,
    warriors.health as warriors_health,
    warriors.current_location as warriors_current_location,
    areas_out_of_area.location AS possible_location_outside
FROM
    players
JOIN buildings ON buildings.areas_players_id = players.id
JOIN buildings_has_warriors ON buildings_has_warriors.buildings_id = buildings.id
JOIN warriors ON warriors.id = buildings_has_warriors.warriors_id
JOIN areas_out_of_area ON areas_out_of_area.id = warriors.areas_out_of_area_id;


/********/
SELECT
    players.name,
    buildings.type as building_type,
    warriors.typed as warriors_type,
    warriors.health as warriors_health,
    warriors.current_location as warriors_current_location,
    enemies.type as enemies_type,
    enemies.health as enemies_health,
    enemies.current_locaztion as enemies_current_location
FROM
    players
JOIN buildings ON buildings.areas_players_id = players.id
JOIN buildings_has_warriors ON buildings_has_warriors.buildings_id = buildings.id
JOIN warriors ON warriors.id = buildings_has_warriors.warriors_id
JOIN enemies ON enemies.warriors_id = warriors.id;