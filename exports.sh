# This is my setup. Yours will be different.

# SSL
export ACME_EMAIL=keith@keithhanson.io #your email
export ACME_DNS_PROVIDER=dnsimple #choose whatever provider YOU use here
export DNSIMPLE_OAUTH_TOKEN=XXXXXXXXXX #Used for automated SSL via Traefik & ACME - if you use a different provider, look up the environment variables for it

# TRAEFIK config
export TRAEFIK_DOMAIN=analyze.keithhanson.io #Subdomains off of this domain will be used to route

# PostGIS/Postgres related
export PGADMIN_DEFAULT_EMAIL=keith@keithhanson.io #PGAdmin 4 is included. This is the master account email
export PGADMIN_DEFAULT_PASSWORD=SuperSecret #Master account password
export PG_USER=docker #This is the PostGIS (db) database default user
export PG_PASS=docker #This is the PostGIS (db) database default pass

# upload(dot) subdomain will use this as the backend to upload metadata and file contents to.
export AWS_ACCESS_KEY_ID=XXXXXXXX # https://console.aws.amazon.com/iam/home#/security_credentials
export AWS_SECRET_ACCESS_KEY=XXXXXX/XXXXXXXXXXXX
export AWS_REGION=us-east-2
export AWS_S3_BUCKET=upload.analyze.keithhanson.io # You put your bucket here after creating it.
