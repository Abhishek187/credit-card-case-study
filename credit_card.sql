SELECT * FROM credit_card.bankchurners;

/*Distribution of Attrited Customers based on age range*/
SELECT CASE WHEN Customer_Age<20 then "0-20" when Customer_Age between 20 and 30 then '20-30'
when Customer_Age between 30 and 40 then '30-40' when Customer_Age between 40 and 50 then '40-50'
when Customer_Age between 50 and 60 then "50-60" when Customer_Age between 60 and 70 then '60-70'
when Customer_Age between 70 and 80 then '70-80' when Customer_Age>80 then 'Above 80' END as Age_Range, Count(*)
from credit_card.bankchurners where Attrition_Flag ="Attrited Customer" group by Age_Range order by Age_Range;


/*"Number of Males vs Females in Existing & Attrited Customers*/

SELECT SUM(IF(Gender='M',1,"NULL")) as MaleExistingcustomers, SUM(IF(Gender="F",1,"NULL")) as FemaleExistingCustomers 
from credit_card.bankchurners where Attrition_Flag="Existing Customer";
SELECT SUM(IF(Gender='M',1,"Null")) as MaleAttritedCustomers, SUM(IF(Gender="F",1,"NULL")) as FemaleAttritedCustomers
from credit_card.bankchurners where Attrition_Flag='Attrited Customer';

/*Dependent count wise distribution of existing and attrited customers*/
SELECT Dependent_count,Count(*) from credit_card.bankchurners where Attrition_Flag='Existing Customer' group by Dependent_count Order by Dependent_count;
SELECT Dependent_count,Count(*) from credit_card.bankchurners where Attrition_Flag="Attrited Customer" group by Dependent_count Order by Dependent_count;

/*Education Level wise distribution of existing and attrited customers*/
SELECT Education_Level,Count(*) from credit_card.bankchurners where Attrition_Flag="Existing Customer" group by Education_Level order by Count(*);
SELECT Education_Level,Count(*) from credit_card.bankchurners where Attrition_Flag="Attrited Customer" group by Education_Level order by Count(*);

/*Marital Status wise distribution of existing and attrited customers*/

SELECT Marital_Status,Count(*) from credit_card.bankchurners where Attrition_Flag="Existing Customer" group by Marital_Status order by Count(*); 
SELECT Marital_Status,Count(*) from credit_card.bankchurners where Attrition_Flag="Attrited customer" group by Marital_Status order by Count(*);

/*Card Category wise distribution of existing and attrited customers*/

SELECT Card_Category,Count(*) from credit_card.bankchurners where Attrition_Flag ="Attrited Customer" group by Card_Category order by Count(*);
SELECT Card_Category,Count(*) from credit_card.bankchurners where Attrition_Flag ="Existing Customer" group by Card_Category order by Count(*);

/*Distribution of Attrited customers based on Months on book*/

SELECT CASE WHEN Months_on_book < 20 then "0-20" when Months_on_book between 20 and 30 then "20-30"
when Months_on_book between 30 and 40 then "30-40" when Months_on_book between 40 and 50 then "40-50"
when Months_on_book between 50 and 60 then "50-60" when Months_on_book > 60 then "Above 50" END as Monthonbook_Range,
Count(*) from credit_card.bankchurners where Attrition_Flag = "Attrited Customer" group by Monthonbook_Range order by Monthonbook_Range;