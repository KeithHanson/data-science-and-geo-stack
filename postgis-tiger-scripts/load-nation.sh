#!/bin/bash

set -e

export POSTGRES_DB=gis
export PGHOST=localhost
export PGBIN="\/usr\/lib\/postgresql\/12\/bin"

apt update
apt install wget unzip postgis -y

echo "dropping any existing nation data ..."

drop_script="/tmp/drop-nation.sql"
echo "SELECT drop_nation_tables_generate_script();" | psql -tA -o "${drop_script}"
cat "${drop_script}" | psql -tA

echo "downloading and creating nation data ..."

load_script="/tmp/load-nation.sh"
echo "SELECT loader_generate_nation_script('sh');" | psql -tA -o "${load_script}"

echo "set -e" | cat - "${load_script}" > /tmp/scratch.tmp && mv /tmp/scratch.tmp "${load_script}"
/bin/sed -i "s/^export PGHOST=.*$/export PGHOST=localhost/g" "${load_script}"
/bin/sed -i "s/^export PGUSER=.*$/export PGUSER=${PG_USER}/g" "${load_script}"
/bin/sed -i "s/^export PGDATABASE=.*$/export PGDATABASE=${POSTGRES_DB}/g" "${load_script}"
/bin/sed -i "s/^export PGPASSWORD=.*$/export PGPASSWORD=${PG_PASS}/g" "${load_script}"
/bin/sed -i "s/^export PGBIN=.*$/export PGBIN=${PGBIN}/g" "${load_script}"

# OMG! >.< The following sed is because the damn script forgets a quotation. 
/bin/sed -i "s/^\${PSQL} -c \"ALTER TABLE tiger.zcta5.*$/\${PSQL} -c \"ALTER TABLE tiger.zcta5 DROP CONSTRAINT IF EXISTS enforce_geotype_the_geom; CREATE TABLE tiger_data.zcta5_all(CONSTRAINT pk_zcta5_all PRIMARY KEY (zcta5ce,statefp), CONSTRAINT uidx_zcta5_raw_all_gid UNIQUE (gid)) INHERITS(tiger.zcta5);\"/g" "${load_script}"

/bin/sh "${load_script}"

echo "... done!"
