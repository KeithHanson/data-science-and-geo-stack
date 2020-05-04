# Data Science and Geo Docker Stack

A Docker Compose script to handle a great variety of data analysis, visualization, and mapping needs.

The goal of this repository is not to create tools, but to maintain a single docker compose script 
and docker images (if needed) for a collection of tools to accomplish the goals of the various users
of such a system. 

This stack of tools aims to bring big enterprise features like what Esri or Tableau provides, but in an
open-source way. 

These desires were born out of everyday operations in my own personal experience. 

## In short, the ambition of this repository is to provide:
 
1. Database (PostGIS)
1. ETL Tools (n8n.io + PGFutter)
1. Data Science and Analysis Tools (Jupyter Notebook Server)
1. Visualization Tools (Chronograf for TimeSeries, Grafana for Dashboard/Visualization)
1. Geospatial Tools (GeoServer + Kepler.gl)
1. Dashboard (Grafana or ???)
1. Communication tools (TBD)

### (Best Case) Usage Scenarios:

These are a few contrived and not-so-contrived reasons you may want to use these tools.

1. Your small business is growing and needs insights. Use this tool to import exported CSVs, turn 
them into visualizations, map your customers, and project profits.
1. You are an local independent political candidate, who needs to knock doors, poll voters, communicate 
to supporters, and create a dashboard around your progress.
1. You are a data scientist who needs to play with maps and share them in an easy and standard way for other
researchers to use your work fully, while still allowing access to the public.
1. Your organization is looking to cut costs and you're the one who needs to pull all these tools together to
continue smooth operations.

## User Stories this repository supports:

### The system admin

1. As a system admin, I want a single point of entry for all service endpoints (I don't want to deal with ports)
1. As a system admin, I want a single point of entry over SSL, managed as automatically as possible (Let's Encrypt)
1. As a system admin, I want to know the entire suite of tools are being backed up regularly to the cloud
1. As a system admin, I want to easily restore the entire stack
1. As a system admin, I want to easily selectively restore a single part of the stack
1. As a system admin, I want to easily deploy this on a single host
1. As a system admin, I want to easily deploy this on a swarm
1. As a system admin, I want the system to be deployed with sane defaults and warnings in place
1. As a system admin, it would be nice to have an interactive configuration generator (or at least a heavily commented file)
1. As a system admin, it would be nice to be able to swap individual components of the stack with equivalent competitors

### The data analyst

1. As a data analyst, I want to be able to upload a CSV and create a reasonably optimized database table
1. As a data analyst, I want to be able to query data available to me quickly
1. As a data analyst, I want to be able to visualize and share my analysis quickly
1. As a data analyst, I want to be able to run complex modeling and predictions and publish them
1. As a data analyst, I want to be able to store and visualize time series data quickly
1. As a data analyst, I want to be able to publish my work as a shareable dashboard
1. As a data analyst, I want a robust suite of ETL tools to import large datasets from different sources

### The geospatial information systems (GIS) analyst

1. As a GIS analyst, I want to have access to popular geospatial formats for desktop tools
1. As a GIS analyst, I want to be able to import layers from other services easily
1. As a GIS analyst, I want to be able to join data and perform complex formatting for layers in my GIS application
1. As a GIS analyst, I want to be able to share my maps online with others easily
1. As a GIS analyst, I want to be able to provide data with addresses and have them geocoded automatically
1. As a GIS analyst, I want to be able to provide data with latitude and longitude fields and have them mapped automatically
1. As a GIS analyst, I want to be able to provide symbols on a map that are complex, categorical, and/or data driven

### The business user

1. As a business user, I want to send messaging to interested parties
1. As a business user, I want to collect responses from survey data
1. As a business user, I want to receive alerts when thresholds are hit on timeseries data I care about.
1. As a business user, I want to view a dashboard of all of the analysts work, and explore data behind the dashboard more deeply
