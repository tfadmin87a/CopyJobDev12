CREATE TABLE [dbo].[green_tripdata_2019] (

	[VendorID] bigint NULL, 
	[lpep_pickup_datetime] datetime2(6) NULL, 
	[lpep_dropoff_datetime] datetime2(6) NULL, 
	[store_and_fwd_flag] varchar(8000) NULL, 
	[RatecodeID] bigint NULL, 
	[PULocationID] bigint NULL, 
	[DOLocationID] bigint NULL, 
	[passenger_count] bigint NULL, 
	[trip_distance] float NULL, 
	[fare_amount] float NULL, 
	[extra] float NULL, 
	[mta_tax] float NULL, 
	[tip_amount] float NULL, 
	[tolls_amount] float NULL, 
	[ehail_fee] float NULL, 
	[improvement_surcharge] float NULL, 
	[total_amount] float NULL, 
	[payment_type] bigint NULL, 
	[trip_type] bigint NULL, 
	[congestion_surcharge] float NULL, 
	[source_file] varchar(8000) NULL
);