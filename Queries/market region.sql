SELECT distinct
customer,market,region
from dim_customer
where customer="ATLIQ EXCLUSIVE"
and    region="APAC";
