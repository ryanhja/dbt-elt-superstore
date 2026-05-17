create table if not exists fact.fact_sales (
	fk_date int4 NULL,
	customer_id varchar(50) NULL,
	location_id int8 NULL,
	product_id varchar(50) NULL
);