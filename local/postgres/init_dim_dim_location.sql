create table  if not exists dim.dim_location (
	location_id int8 NULL,
	country varchar(50) NULL,
	city varchar(50) NULL,
	state varchar(50) NULL,
	postal_code int4 NULL,
	region varchar(50) NULL
);