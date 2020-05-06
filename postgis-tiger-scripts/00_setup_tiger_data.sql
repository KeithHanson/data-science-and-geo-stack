CREATE EXTENSION fuzzystrmatch;
CREATE EXTENSION postgis_tiger_geocoder;
CREATE EXTENSION address_standardizer;

UPDATE tiger.loader_lookuptables SET load = true WHERE table_name = 'zcta510';
UPDATE tiger.loader_variables SET staging_fold = '/tiger-data'

-- Create a folder called gisdata on root of server or your local pc if you have a fast network connection to the server. This folder is where the tiger files will be downloaded to and processed. If you are not happy with having the folder on the root of the server, or simply want to change to a different folder for staging, then edit the field staging_fold in the tiger.loader_variables table.
-- INSERT INTO tiger.loader_platform(os, declare_sect, pgbin, wget, unzip_command, psql, path_sep,
--	loader, environ_set_command, county_process_command)
--SELECT 'debbie', declare_sect, pgbin, wget, unzip_command, psql, path_sep, loader, environ_set_command, county_process_command FROM tiger.loader_platform
--WHERE os = 'sh';
