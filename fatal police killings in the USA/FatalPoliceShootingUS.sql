USE FatalPoliceShootingsUSA

-- DATA CLEANING AND PREPARATION--- 
SELECT *
FROM [fatal-police-shootings-data]

SELECT DISTINCT gender, COUNT(gender)
FROM [fatal-police-shootings-data]
GROUP BY gender
ORDER BY 2;

SELECT gender,
CASE WHEN gender = 'F'THEN 'Female'
     WHEN gender = 'M'THEN 'Male'
	 ELSE gender
	 END
FROM [fatal-police-shootings-data]

UPDATE [fatal-police-shootings-data]
SET gender =  CASE WHEN gender = 'F'THEN 'Female'
     WHEN gender = 'M'THEN 'Male'
	 ELSE gender
	 END
FROM [fatal-police-shootings-data];

SELECT DISTINCT gender, COUNT(gender)
FROM [fatal-police-shootings-data]
GROUP BY gender
ORDER BY 2;

SELECT DISTINCT race, COUNT(race)
FROM [fatal-police-shootings-data]
GROUP BY race
ORDER BY 2;

SELECT race,
CASE WHEN race = 'O'THEN 'Other'
     WHEN race = 'N'THEN 'Native American'
	 WHEN race = 'A'THEN 'Asian'
     WHEN race = 'H'THEN 'Hispanic'
	 WHEN race = 'B'THEN 'Black'
     WHEN race = 'W'THEN 'White'
	 ELSE race
	 END
FROM [fatal-police-shootings-data];

UPDATE [fatal-police-shootings-data]
SET race = CASE WHEN race = 'O'THEN 'Other'
     WHEN race = 'N'THEN 'Native American'
	 WHEN race = 'A'THEN 'Asian'
     WHEN race = 'H'THEN 'Hispanic'
	 WHEN race = 'B'THEN 'Black'
     WHEN race = 'W'THEN 'White'
	 ELSE race
	 END
FROM [fatal-police-shootings-data];

SELECT DISTINCT race, COUNT(race)
FROM [fatal-police-shootings-data]
GROUP BY race
ORDER BY 2;

SELECT *
FROM [fatal-police-shootings-data]
WHERE name IS NULL;

SELECT name,
CASE WHEN name IS NULL THEN 'Unknown'
     ELSE name
	 END
FROM [fatal-police-shootings-data];

UPDATE [fatal-police-shootings-data]
SET name = CASE WHEN name IS NULL THEN 'Unknown'
     ELSE name
	 END
FROM [fatal-police-shootings-data];

SELECT *
FROM [fatal-police-shootings-data]
WHERE race IS NULL

SELECT race,
CASE WHEN race IS NULL THEN 'Unknown'
     ELSE race
	 END
FROM [fatal-police-shootings-data];

UPDATE [fatal-police-shootings-data]
SET race = CASE WHEN race IS NULL THEN 'Unknown'
     ELSE race
	 END
FROM [fatal-police-shootings-data];

SELECT *
FROM [fatal-police-shootings-data]
WHERE gender IS NULL

SELECT gender,
CASE WHEN gender IS NULL THEN 'Other'
     ELSE gender
	 END
FROM [fatal-police-shootings-data];

UPDATE [fatal-police-shootings-data]
SET gender = CASE WHEN gender IS NULL THEN 'Other'
     ELSE gender
	 END
FROM [fatal-police-shootings-data];

SELECT *
FROM [fatal-police-shootings-data]
WHERE age IS NULL

---where age is unknown is represented as 0---
SELECT age,
CASE WHEN age IS NULL THEN 0
     ELSE age
	 END
FROM [fatal-police-shootings-data];

UPDATE [fatal-police-shootings-data]
SET age = CASE WHEN age IS NULL THEN 0
     ELSE age
	 END
FROM [fatal-police-shootings-data];

SELECT DISTINCT armed, COUNT(armed)
FROM [fatal-police-shootings-data]
GROUP BY armed
ORDER BY 2;

SELECT *
FROM [fatal-police-shootings-data]
WHERE armed IS NULL;

SELECT armed,
CASE WHEN armed IS NULL THEN 'Other'
     ELSE armed
	 END
FROM [fatal-police-shootings-data];

UPDATE [fatal-police-shootings-data]
SET armed = CASE WHEN armed IS NULL THEN 'Other'
     ELSE armed
	 END
FROM [fatal-police-shootings-data];

SELECT DISTINCT flee, COUNT(flee)
FROM [fatal-police-shootings-data]
GROUP BY flee
ORDER BY 2;

SELECT *
FROM [fatal-police-shootings-data]
WHERE flee IS NULL;

SELECT flee,
CASE WHEN flee IS NULL THEN 'Unknown'
     ELSE flee
	 END
FROM [fatal-police-shootings-data];

UPDATE [fatal-police-shootings-data]
SET flee = CASE WHEN flee IS NULL THEN 'Unknown'
     ELSE flee
	 END
FROM [fatal-police-shootings-data];

SELECT *
FROM [fatal-police-shootings-data];

---BREAKING DOWN DATES

SELECT date
FROM [fatal-police-shootings-data];

SELECT 
  PARSENAME(REPLACE(date,'-','.'), 1) AS day,
  PARSENAME(REPLACE(date,'-','.'), 2) AS month,
  PARSENAME(REPLACE(date,'-','.'), 3) AS year
FROM [fatal-police-shootings-data];

ALTER TABLE [fatal-police-shootings-data]
ADD day INT;
ALTER TABLE [fatal-police-shootings-data]
ADD month INT;
ALTER TABLE [fatal-police-shootings-data]
ADD year INT;

UPDATE [fatal-police-shootings-data]
SET day = PARSENAME(REPLACE(date,'-','.'), 1)

UPDATE [fatal-police-shootings-data]
SET month = PARSENAME(REPLACE(date,'-','.'), 2)

UPDATE [fatal-police-shootings-data]
SET year = PARSENAME(REPLACE(date,'-','.'), 3)

SELECT *
FROM [fatal-police-shootings-data];


SELECT date, DATENAME(MONTH, date) AS 'month'
FROM [fatal-police-shootings-data];

ALTER TABLE [fatal-police-shootings-data]
ADD monthname NVARCHAR(255);

UPDATE [fatal-police-shootings-data]
SET monthname = DATENAME(MONTH, date)

SELECT *
FROM [fatal-police-shootings-data];

