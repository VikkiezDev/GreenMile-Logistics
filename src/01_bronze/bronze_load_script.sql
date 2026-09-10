-- ======================================================================================
-- BULK INSERTING DRIVERS DATA
-- ======================================================================================
TRUNCATE TABLE bronze.drivers;

BULK INSERT bronze.drivers
from "/var/opt/mssql/data/raw/drivers.csv"
WITH(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

-- ======================================================================================
-- BULK INSERTING TRUCKS DATA
-- ======================================================================================
TRUNCATE TABLE bronze.trucks;

BULK INSERT bronze.trucks
from "/var/opt/mssql/data/raw/trucks.csv"
WITH(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

-- ======================================================================================
-- BULK INSERTING TRAILERS DATA
-- ======================================================================================
TRUNCATE TABLE bronze.trailers;

BULK INSERT bronze.trailers
from "/var/opt/mssql/data/raw/trailers.csv"
WITH(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

-- ======================================================================================
-- BULK INSERTING CUSTOMERS DATA
-- ======================================================================================
TRUNCATE TABLE bronze.customers;

BULK INSERT bronze.customers
from "/var/opt/mssql/data/raw/customers.csv"
WITH(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

-- ======================================================================================
-- BULK INSERTING FACILITIES DATA
-- ======================================================================================
TRUNCATE TABLE bronze.facilities;

BULK INSERT bronze.facilities
from "/var/opt/mssql/data/raw/facilities.csv"
WITH(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

-- ======================================================================================
-- BULK INSERTING ROUTES DATA
-- ======================================================================================
TRUNCATE TABLE bronze.routes;

BULK INSERT bronze.routes
from "/var/opt/mssql/data/raw/routes.csv"
WITH(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

-- ======================================================================================
-- BULK INSERTING LOADS DATA
-- ======================================================================================
TRUNCATE TABLE bronze.loads;

BULK INSERT bronze.loads
from "/var/opt/mssql/data/raw/loads.csv"
WITH(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

-- ======================================================================================
-- BULK INSERTING TRIPS DATA
-- ======================================================================================
TRUNCATE TABLE bronze.trips;

BULK INSERT bronze.trips
from "/var/opt/mssql/data/raw/trips.csv"
WITH(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

-- ======================================================================================
-- BULK INSERTING FUEL_PURCHASES DATA
-- ======================================================================================
TRUNCATE TABLE bronze.fuel_purchases;

BULK INSERT bronze.fuel_purchases
from "/var/opt/mssql/data/raw/fuel_purchases.csv"
WITH(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

-- ======================================================================================
-- BULK INSERTING MAINTAINENCE_RECORDS DATA
-- ======================================================================================
TRUNCATE TABLE bronze.maintenance_records;

BULK INSERT bronze.maintenance_records
from "/var/opt/mssql/data/raw/maintenance_records.csv"
WITH(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

-- ======================================================================================
-- BULK INSERTING DELIVERY_EVENTS DATA
-- ======================================================================================
TRUNCATE TABLE bronze.delivery_events;

BULK INSERT bronze.delivery_events
from "/var/opt/mssql/data/raw/delivery_events.csv"
WITH(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

-- ======================================================================================
-- BULK INSERTING SAFETY_INCIDENTS DATA
-- ======================================================================================
TRUNCATE TABLE bronze.safety_incidents;

BULK INSERT bronze.safety_incidents
from "/var/opt/mssql/data/raw/safety_incidents.csv"
WITH(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

-- ======================================================================================
-- BULK INSERTING DRIVER_MONTHLY_METRICS DATA
-- ======================================================================================
TRUNCATE TABLE bronze.driver_monthly_metrics;

BULK INSERT bronze.driver_monthly_metrics
from "/var/opt/mssql/data/raw/driver_monthly_metrics.csv"
WITH(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

-- ======================================================================================
-- BULK INSERTING TRUCK_UTILIZATION_METRICS DATA
-- ======================================================================================
TRUNCATE TABLE bronze.truck_utilization_metrics;

BULK INSERT bronze.truck_utilization_metrics
from "/var/opt/mssql/data/raw/truck_utilization_metrics.csv"
WITH(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO