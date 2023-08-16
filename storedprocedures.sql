CREATE DEFINER=`root`@`localhost` PROCEDURE `get_market_badge`(
IN in_market varchar(45),
IN in_fiscal_year year,
OUT out_badge varchar(45)
)
BEGIN
declare qty int default 0;
# set default market to be india 
if in_market ="" then 
set in_market ="india";
end if ;
# retrive total qty for a given market _fyear

 select sum(sold_quantity) into qty from fact_sales_monthly s
        join dim_customer dc on 
        s.customer_code= dc.customer_code
        where get_fiscal_year(s.date)= in_fiscal_year and market=in_market
        group by dc.market;
        
        # determine market badge
        
        if qty > 5000000 then 
         set out_badge = "gold";
        else
        set out_badge = "silver";
        end if;
 END