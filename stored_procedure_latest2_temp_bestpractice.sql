CREATE DEFINER=`root`@`localhost` PROCEDURE `get_market_badge`(
IN in_market varchar(45),
IN in_fiscal_year year,
OUT out_badge varchar(45),
OUT out_market varchar(45)
)
BEGIN
declare qty int default 0;
declare temp_market varchar(45);
DECLARE temp_fiscal_year year;
#declare mat varchar(45);

 SET temp_market = in_market;
    SET temp_fiscal_year = in_fiscal_year;
    
# set default market to be india 
if temp_market = "" then 
set temp_market = "india";
end if ;

# set default fiscal year to be 2021 
if temp_fiscal_year IS NULL then 
set temp_fiscal_year =2020;
end if ;

# retrive total qty for a given market _fyear

 select dc.market,sum(sold_quantity) into temp_market, qty from fact_sales_monthly s
        join dim_customer dc on 
        s.customer_code= dc.customer_code
        where get_fiscal_year(s.date)= temp_fiscal_year and market=temp_market
        group by dc.market;
        
        # determine market badge
        
        if qty > 5000000 then 
         set out_badge = "gold";
        else
        set out_badge = "silver";
        end if;
        
        set out_market = temp_market;
 END