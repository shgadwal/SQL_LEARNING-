CREATE FUNCTION `get_fiscal_month_year` (
calender_date date)
RETURNS varchar(11)
DETERMINISTIC
BEGIN
declare fiscal_mon_year varchar(11);
SET fiscal_mon_year = date_format(date_add(date, interval 4 month),'%m-%y');
return fiscal_mon_year;

END
