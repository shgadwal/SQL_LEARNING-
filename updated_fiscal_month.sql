CREATE DEFINER=`root`@`localhost` FUNCTION `get_fiscal_month_year`(
calender_date date) RETURNS varchar(11) CHARSET latin1
DETERMINISTIC
BEGIN
declare fiscal_mon_year varchar(11);
SET fiscal_mon_year = date_format(date_add(calender_date, interval 4 month),'%m-%y');
return fiscal_mon_year;

END