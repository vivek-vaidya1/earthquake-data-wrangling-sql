CREATE DATABASE earthquake_project;
USE earthquake_project;
SELECT * FROM earthquake_dataset;
DESCRIBE earthquake;
SELECT LENGTH(DATE),COUNT(*)
FROM earthquake_dataset
GROUP BY LENGTH(Date);
UPDATE earthquake_dataset
SET Date = LEFT(Date,10)
WHERE LENGTH(Date)>10;
SET SQL_SAFE_UPDATES = 0;
ALTER TABLE earthquake_dataset
ADD Date2 Date;
UPDATE earthquake_dataset
SET Date2 = STR_TO_DATE(Date,'%m/%d/%Y');
SELECT date 
FROM earthquake_dataset
WHERE STR_TO_DATE(Date,'%m,%d,%Y') IS NULL
ALTER TABLE earthquake_dataset
ADD Time2 TIME;
SELECT LENGTH(Time),COUNT(*)
FROM earthquake_dataset
group by LENGTH(Time);
UPDATE earthquake_dataset
SET Time = SUBSTRING(Time,1,8)
WHERE length(Time)>8;
UPDATE earthquake_dataset
SET Time2 = CAST(Time as TIME);
select count(*)
from earthquake_dataset
WHERE DEPTH = '';
UPDATE earthquake_dataset
SET Depth = 0
WHERE Depth = '';
SELECT * FROM earthquake_dataset;
ALTER TABLE earthquake_dataset
modify Depth Double;
ALTER TABLE earthquake_dataset
modify Latitude Double;
ALTER TABLE earthquake_dataset
modify Longitude Double;
ALTER TABLE earthquake_dataset
modify Magnetude Double;
with duplicate_cte AS
(
SELECT *,
row_number() OVER(partition by Date,Time,Latitude,Longitude) AS row_num
from earthquake_dataset
)
select *
FROM duplicate_cte
where row_num>1;
ALTER TABLE earthquake_dataset
ADD Year1 INT;
UPDATE earthquake_dataset
SET Year1 = EXtract(YEAR FROM Date2);
ALTER TABLE earthquake_dataset
ADD Month1 int;
UPDATE earthquake_dataset
SET Month1 = EXTRACT(MONTH FROM Date2);
ALTER TABLE earthquake_dataset
ADD Day_Name VARCHAR(20);
UPDATE earthquake_dataset
SET Day_Name = DAYNAME(Date2);
SELECT *
FROM earthquake_dataset
Where Magnitude < 5.5;
ALTER TABLE earthquake_dataset
DROP COLUMN Date,
DROP COLUMN Time;
SELECT*FROM earthquake_dataset;


