with date_series as (
	select
		generate_series((current_date - interval '5 year')::date, (current_date)::date, interval '1 day')::date as date_day
)
select
	cast(to_char(date_day, 'YYYYMMDD') as int) as date_id,
	date_day,
	date_part('YEAR', date_day) as year,
	date_part('QUARTER', date_day) as quarter,
	date_part('MONTH', date_day) as month,
	to_char(date_day, 'Month') as month_name,
	to_char(date_day, 'dd') as month_day,
	date_part('WEEK', date_day) as week,
	to_char(date_day, 'Day') as day_name
from date_series
order by date_day desc