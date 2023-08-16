CREATE DEFINER=`root`@`localhost` PROCEDURE `get_market_badge`(
IN in_market varchar(45),
IN in_fiscal_year year,
OUT out_badge varchar(45),
OUT out_market varchar(45)
)
BEGIN
declare qty int default 0;
declare mat varchar(45);

# set default market to be india 
if in_market ="" then 
set mat ="india";
else 
set mat = in_market;
end if ;

# set default fiscal year to be 2021 
if in_fiscal_year IS NULL then 
set in_fiscal_year =2020;
end if ;

# retrive total qty for a given market _fyear

 select dc.market,sum(sold_quantity) into mat, qty from fact_sales_monthly s
        join dim_customer dc on 
        s.customer_code= dc.customer_code
        where get_fiscal_year(s.date)= in_fiscal_year and market=mat
        group by dc.market;
        
        # determine market badge
        
        if qty > 5000000 then 
         set out_badge = "gold";
        else
        set out_badge = "silver";
        end if;
        
        set out_market = mat;
 END