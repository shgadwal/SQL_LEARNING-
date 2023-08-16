CREATE DEFINER=`root`@`localhost` FUNCTION `get_fiscal_year`(
calender_date date) RETURNS int(11)
    DETERMINISTIC
BEGIN
declare fiscal_year INT;

SET fiscal_year =  YEAR(DATE_ADD(calender_date , interval 4 month));
return fiscal_year;

END