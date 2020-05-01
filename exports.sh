# This is my setup. Yours will be different.

export DNSIMPLE_OAUTH_TOKEN=XXXXXXXXXX #Used for automated SSL via Traefik & ACME
export TRAEFIK_DOMAIN=analyze.keithhanson.io #Subdomains off of this domain will be used to route
export ACME_DNS_PROVIDER=dnsimple #choose whatever provider YOU use here
export ACME_EMAIL=keith@keithhanson.io #your email
export PGADMIN_DEFAULT_EMAIL=keith@keithhanson.io #PGAdmin 4 is included. This is the master account email
export PGADMIN_DEFAULT_PASSWORD=SuperSecret #Master account password
export PG_USER=docker #This is the PostGIS (db) database default user
export PG_PASS=docker #This is the PostGIS (db) database default pass

