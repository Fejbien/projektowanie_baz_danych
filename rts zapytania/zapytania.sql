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

SELECT * FROM stats_and_resources INNER JOIN resources_types ON stats_and_resources.id=resources_types.resources_id;