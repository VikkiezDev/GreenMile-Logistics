-- SET NOCOUNT ON;
-- GO

-- -- 1. Drop all tables in the silver schema
-- IF OBJECT_ID('silver.driver_monthly_metrics', 'U') IS NOT NULL DROP TABLE silver.driver_monthly_metrics;
-- IF OBJECT_ID('silver.truck_utilization_metrics', 'U') IS NOT NULL DROP TABLE silver.truck_utilization_metrics;
-- IF OBJECT_ID('silver.safety_incidents', 'U') IS NOT NULL DROP TABLE silver.safety_incidents;
-- IF OBJECT_ID('silver.delivery_events', 'U') IS NOT NULL DROP TABLE silver.delivery_events;
-- IF OBJECT_ID('silver.maintenance_records', 'U') IS NOT NULL DROP TABLE silver.maintenance_records;
-- IF OBJECT_ID('silver.fuel_purchases', 'U') IS NOT NULL DROP TABLE silver.fuel_purchases;
-- IF OBJECT_ID('silver.trips', 'U') IS NOT NULL DROP TABLE silver.trips;
-- IF OBJECT_ID('silver.loads', 'U') IS NOT NULL DROP TABLE silver.loads;
-- IF OBJECT_ID('silver.routes', 'U') IS NOT NULL DROP TABLE silver.routes;
-- IF OBJECT_ID('silver.facilities', 'U') IS NOT NULL DROP TABLE silver.facilities;
-- IF OBJECT_ID('silver.customers', 'U') IS NOT NULL DROP TABLE silver.customers;
-- IF OBJECT_ID('silver.trailers', 'U') IS NOT NULL DROP TABLE silver.trailers;
-- IF OBJECT_ID('silver.trucks', 'U') IS NOT NULL DROP TABLE silver.trucks;
-- IF OBJECT_ID('silver.drivers', 'U') IS NOT NULL DROP TABLE silver.drivers;
-- GO

-- -- 2. Drop the schema
-- DROP SCHEMA IF EXISTS silver;
-- GO

-- =======================================================================================================

-- Create a new table called 'drivers' in schema 'silver'
-- Drop the table if it already exists
IF OBJECT_ID('silver.drivers', 'U') IS NOT NULL
DROP TABLE silver.drivers
GO
-- Create the table in the specified schema
CREATE TABLE silver.drivers
(
    driver_id VARCHAR(100) PRIMARY KEY NOT NULL,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    hire_date DATE,
    termination_date DATE,
    license_number NVARCHAR(100),
    license_state CHAR(2),
    date_of_birth DATE,
    home_terminal NVARCHAR(50),
    employment_status NVARCHAR(50),
    cdl_class CHAR(2),
    years_experience SMALLINT
);
GO

-- Create a new table called 'trucks' in schema 'silver'
-- Drop the table if it already exists
IF OBJECT_ID('silver.trucks', 'U') IS NOT NULL
DROP TABLE silver.trucks
GO
-- Create the table in the specified schema
CREATE TABLE silver.trucks
(
    truck_id VARCHAR(100) PRIMARY KEY NOT NULL,
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

-- Create a new table called 'trailers' in schema 'silver'
-- Drop the table if it already exists
IF OBJECT_ID('silver.trailers', 'U') IS NOT NULL
DROP TABLE silver.trailers
GO
-- Create the table in the specified schema
CREATE TABLE silver.trailers
(
    trailer_id VARCHAR(100) PRIMARY KEY NOT NULL,
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

-- Create a new table called 'customers' in schema 'silver'
-- Drop the table if it already exists
IF OBJECT_ID('silver.customers', 'U') IS NOT NULL
DROP TABLE silver.customers
GO
-- Create the table in the specified schema
CREATE TABLE silver.customers
(
    customer_id VARCHAR(100) PRIMARY KEY NOT NULL,
    customer_name NVARCHAR(50),
    customer_type NVARCHAR(50),
    credit_terms_days SMALLINT,
    primary_freight_type NVARCHAR(50),
    account_status NVARCHAR(50),
    contract_start_date DATE,
    annual_revenue_potential DECIMAL(15,2)
);
GO

-- Create a new table called 'facilities' in schema 'silver'
-- Drop the table if it already exists
IF OBJECT_ID('silver.facilities', 'U') IS NOT NULL
DROP TABLE silver.facilities
GO
-- Create the table in the specified schema
CREATE TABLE silver.facilities
(
    facility_id VARCHAR(100) PRIMARY KEY NOT NULL,
    facility_name NVARCHAR(50),
    facility_type NVARCHAR(50),
    city NVARCHAR(50),
    state CHAR(2),
    latitude DECIMAL(8,6),
    longitude DECIMAL(9,6),
    dock_doors SMALLINT,
    operating_hours VARCHAR(100)
);
GO

-- Create a new table called 'routes' in schema 'silver'
-- Drop the table if it already exists
IF OBJECT_ID('silver.routes', 'U') IS NOT NULL
DROP TABLE silver.routes
GO
-- Create the table in the specified schema
CREATE TABLE silver.routes
(
    route_id VARCHAR(100) PRIMARY KEY NOT NULL,
    origin_city NVARCHAR(50),
    origin_state CHAR(2),
    destination_city NVARCHAR(50),
    destination_state CHAR(2),
    typical_distance_miles INT,
    base_rate_per_mile DECIMAL(5,2),
    fuel_surcharge_rate DECIMAL(5,2),
    typical_transit_days SMALLINT
);
GO

-- Create a new table called 'loads' in schema 'silver'
-- Drop the table if it already exists
IF OBJECT_ID('silver.loads', 'U') IS NOT NULL
DROP TABLE silver.loads
GO
-- Create the table in the specified schema
CREATE TABLE silver.loads
(
    load_id VARCHAR(100) PRIMARY KEY NOT NULL,
    customer_id VARCHAR(100),
    route_id VARCHAR(100),
    load_date DATE,
    load_type NVARCHAR(50),
    weight_lbs DECIMAL(8,2),
    pieces SMALLINT,
    revenue DECIMAL(10,2),
    fuel_surcharge DECIMAL(7,2),
    accessorial_charges DECIMAL(6,2),
    load_status NVARCHAR(50),
    booking_type NVARCHAR(50)
);
GO

-- Create a new table called 'trips' in schema 'silver'
-- Drop the table if it already exists
IF OBJECT_ID('silver.trips', 'U') IS NOT NULL
DROP TABLE silver.trips
GO
-- Create the table in the specified schema
CREATE TABLE silver.trips
(
    trip_id VARCHAR(100) PRIMARY KEY NOT NULL,
    load_id VARCHAR(100),
    driver_id VARCHAR(100),
    truck_id VARCHAR(100),
    trailer_id VARCHAR(100),
    dispatch_date DATE,
    actual_distance_miles DECIMAL(8,2),
    actual_duration_hours DECIMAL(5,2),
    fuel_gallons_used DECIMAL(6,1),
    average_mpg DECIMAL(4,2),
    idle_time_hours DECIMAL(4,1),
    trip_status NVARCHAR(50)
);
GO

-- Create a new table called 'fuel_purchases' in schema 'silver'
-- Drop the table if it already exists
IF OBJECT_ID('silver.fuel_purchases', 'U') IS NOT NULL
DROP TABLE silver.fuel_purchases
GO
-- Create the table in the specified schema
CREATE TABLE silver.fuel_purchases
(
    fuel_purchase_id VARCHAR(100) PRIMARY KEY NOT NULL,
    trip_id VARCHAR(100),
    truck_id VARCHAR(100),
    driver_id VARCHAR(100),
    purchase_date DATETIME2,
    location_city VARCHAR(50),
    location_state CHAR(2),
    gallons DECIMAL(5,1),
    price_per_gallon DECIMAL(5,3),
    total_cost DECIMAL(6,2),
    fuel_card_number VARCHAR(50)
);
GO

-- Create a new table called 'maintenance_records' in schema 'silver'
-- Drop the table if it already exists
IF OBJECT_ID('silver.maintenance_records', 'U') IS NOT NULL
DROP TABLE silver.maintenance_records
GO
-- Create the table in the specified schema
CREATE TABLE silver.maintenance_records
(
    maintenance_id VARCHAR(100) PRIMARY KEY NOT NULL,
    truck_id VARCHAR(100),
    maintenance_date DATE,
    maintenance_type NVARCHAR(50),
    odometer_reading INT,
    labor_hours DECIMAL(3,1),
    labor_cost DECIMAL(6,2),
    parts_cost DECIMAL(8,2),
    total_cost DECIMAL(8,2),
    facility_location NVARCHAR(50),
    downtime_hours DECIMAL(4,1),
    service_description NVARCHAR(50)
);
GO

-- Create a new table called 'delivery_events' in schema 'silver'
-- Drop the table if it already exists
IF OBJECT_ID('silver.delivery_events', 'U') IS NOT NULL
DROP TABLE silver.delivery_events
GO
-- Create the table in the specified schema
CREATE TABLE silver.delivery_events
(
    event_id VARCHAR(100) PRIMARY KEY NOT NULL,
    load_id VARCHAR(100),
    trip_id VARCHAR(100),
    event_type NVARCHAR(50),
    facility_id VARCHAR(100),
    scheduled_datetime DATETIME2,
    actual_datetime DATETIME2,
    detention_minutes INT,
    on_time_flag VARCHAR(10),
    location_city NVARCHAR(50),
    location_state CHAR(2)
);
GO

-- Create a new table called 'safety_incidents' in schema 'silver'
-- Drop the table if it already exists
IF OBJECT_ID('silver.safety_incidents', 'U') IS NOT NULL
DROP TABLE silver.safety_incidents
GO
-- Create the table in the specified schema
CREATE TABLE silver.safety_incidents
(
    incident_id VARCHAR(100) PRIMARY KEY NOT NULL,
    trip_id VARCHAR(100),
    truck_id VARCHAR(100),
    driver_id VARCHAR(100),
    incident_date DATETIME2,
    incident_type NVARCHAR(50),
    location_city NVARCHAR(50),
    location_state CHAR(2),
    at_fault_flag VARCHAR(10),
    injury_flag VARCHAR(10),
    vehicle_damage_cost DECIMAL(8,2),
    cargo_damage_cost DECIMAL(8,2),
    claim_amount DECIMAL(8,2),
    preventable_flag VARCHAR(10),
    description NVARCHAR(100)
);
GO

-- Create a new table called 'driver_monthly_metrics' in schema 'silver'
-- Drop the table if it already exists
IF OBJECT_ID('silver.driver_monthly_metrics', 'U') IS NOT NULL
DROP TABLE silver.driver_monthly_metrics
GO
-- Create the table in the specified schema
CREATE TABLE silver.driver_monthly_metrics
(
    driver_id VARCHAR(100) NOT NULL,
    month DATE NOT NULL,
    trips_completed SMALLINT,
    total_miles INT,
    total_revenue DECIMAL(8,2),
    average_mpg DECIMAL(4,2),
    total_fuel_gallons DECIMAL(5,1),
    on_time_delivery_rate DECIMAL(4,3),
    average_idle_hours DECIMAL(5,2),
    CONSTRAINT pk_driverMonthlyMetrics PRIMARY KEY(driver_id,month)
);
GO

-- Create a new table called 'truck_utilization_metrics' in schema 'silver'
-- Drop the table if it already exists
IF OBJECT_ID('silver.truck_utilization_metrics', 'U') IS NOT NULL
DROP TABLE silver.truck_utilization_metrics
GO
-- Create the table in the specified schema
CREATE TABLE silver.truck_utilization_metrics
(
    truck_id VARCHAR(100) NOT NULL,
    month DATE NOT NULL,
    trips_completed SMALLINT,
    total_miles INT,
    total_revenue DECIMAL(8,2),
    average_mpg DECIMAL(4,2),
    maintenance_events SMALLINT,
    maintenance_cost DECIMAL(10,2),
    downtime_hours DECIMAL(4,1),
    utilization_rate DECIMAL(5,3),
    CONSTRAINT pk_truckUtilizationMetrics PRIMARY KEY(truck_id, month)
);
GO