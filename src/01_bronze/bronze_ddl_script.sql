-- exec sp_databases;

-- use greenmile_db;
-- select name from sys.schemas;

-- Create a new table called 'drivers' in schema 'bronze'
-- Drop the table if it already exists
IF OBJECT_ID('bronze.drivers', 'U') IS NOT NULL
DROP TABLE bronze.drivers
GO
-- Create the table in the specified schema
CREATE TABLE bronze.drivers
(
    driver_id VARCHAR(50) PRIMARY KEY,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    hire_date DATE,
    termination_date DATE,
    license_number NVARCHAR(100),
    license_state CHAR(10),
    date_of_birth DATE,
    home_terminal NVARCHAR(50),
    employment_status NVARCHAR(50),
    cdl_class CHAR(10),
    years_experience SMALLINT
);
GO

-- Create a new table called 'trucks' in schema 'bronze'
-- Drop the table if it already exists
IF OBJECT_ID('bronze.trucks', 'U') IS NOT NULL
DROP TABLE bronze.trucks
GO
-- Create the table in the specified schema
CREATE TABLE bronze.trucks
(
    truck_id VARCHAR(50) PRIMARY KEY,
    unit_number INT,
    make NVARCHAR(50),
    model_year SMALLINT,
    vin NVARCHAR(100),
    acquisition_date DATE,
    acquisition_mileage INT,
    fuel_type NVARCHAR(50),
    tank_capacity_gallons SMALLINT,
    status NVARCHAR(50),
    home_terminal NVARCHAR(50)
);
GO

-- Create a new table called 'trailers' in schema 'bronze'
-- Drop the table if it already exists
IF OBJECT_ID('bronze.trailers', 'U') IS NOT NULL
DROP TABLE bronze.trailers
GO
-- Create the table in the specified schema
CREATE TABLE bronze.trailers
(
    trailer_id VARCHAR(50) PRIMARY KEY,
    trailer_number INT,
    trailer_type NVARCHAR(50),
    length_feet SMALLINT,
    model_year SMALLINT,
    vin NVARCHAR(100),
    acquisition_date DATE,
    status NVARCHAR(50),
    current_location NVARCHAR(50)
);
GO

-- Create a new table called 'customers' in schema 'bronze'
-- Drop the table if it already exists
IF OBJECT_ID('bronze.customers', 'U') IS NOT NULL
DROP TABLE bronze.customers
GO
-- Create the table in the specified schema
CREATE TABLE bronze.customers
(
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name NVARCHAR(50),
    customer_type NVARCHAR(50),
    credit_terms_days SMALLINT,
    primary_freight_type NVARCHAR(50),
    account_status NVARCHAR(50),
    contract_start_date DATE,
    annual_revenue_potential DECIMAL(15,2)
);
GO

-- Create a new table called 'facilities' in schema 'bronze'
-- Drop the table if it already exists
IF OBJECT_ID('bronze.facilities', 'U') IS NOT NULL
DROP TABLE bronze.facilities
GO
-- Create the table in the specified schema
CREATE TABLE bronze.facilities
(
    facility_id VARCHAR(50) PRIMARY KEY,
    facility_name NVARCHAR(50),
    facility_type NVARCHAR(50),
    city NVARCHAR(50),
    state CHAR(10),
    latitude DECIMAL(8,6),
    longitude DECIMAL(9,6),
    dock_doors SMALLINT,
    operating_hours VARCHAR(20)
);
GO

-- Create a new table called 'routes' in schema 'bronze'
-- Drop the table if it already exists
IF OBJECT_ID('bronze.routes', 'U') IS NOT NULL
DROP TABLE bronze.routes
GO
-- Create the table in the specified schema
CREATE TABLE bronze.routes
(
    route_id NVARCHAR(50),
    origin_city NVARCHAR(50),
    origin_state CHAR(10),
    destination_city NVARCHAR(50),
    destination_state CHAR(10),
    typical_distance_miles INT,
    base_rate_per_mile DECIMAL(3,2),
    fuel_surcharge_rate DECIMAL(3,2),
    typical_transit_days SMALLINT
);
GO