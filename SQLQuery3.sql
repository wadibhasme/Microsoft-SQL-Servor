-- ####### read data from table
USE students1
SELECT * FROM train
-- ######## 1) Find total no of rows in table
SELECT COUNT(*) FROM train
-- ####################################### Univariate Analysis ##############################################
-- ## Find How many Passenger are survied ??
SELECT COUNT(*) FROM train WHERE Survived=1
-- ## Find How many Passenger has died ??
SELECT COUNT(*) FROM train WHERE Survived=0
-- ####### Find how many categories in Pclass
SELECT COUNT(Pclass) from train GROUP BY Pclass
-- ######## Find how many male passenger and female are travel ??
SELECT COUNT(Sex) from train WHERE Sex='male'
-- ### USING GROUP BY 
SELECT COUNT(Sex) from train GROUP BY Sex  
-- ################ Find the maximum age of passenger
SELECT MAX(Age) FROM train
-- ### Find min Age of passenger
SELECT MIN(Age) FROM train
--##### FIND AVG AGE OF PASSENGER
SELECT AVG(Age) from train
-- ######## Find no of categories in Embarked ??
SELECT COUNT(DISTINCT(Embarked)) from train
-- ####################################### Bivariate Analysis #################################################
-- ##### How many passenger are survived from pclass 1 ??
SELECT COUNT(*) FROM train where Pclass=1 AND Survived=1
-- ##### How many passenger are survived from pclass 2 ??
SELECT COUNT(*) FROM train where Pclass=2 AND Survived=1
-- ##### How many passenger are survived from pclass 3 ??
SELECT COUNT(*) FROM train where Pclass=3 AND Survived=1
-- ###### Find the age of passenger who are survived from every pclass  ??
SELECT Age FROM train where Pclass=1 AND Survived=1
SELECT Age FROM train where Pclass=2 AND Survived=1
SELECT Age FROM train where Pclass=3 AND Survived=1
-- ############### Fill the nan values
--ALTER TABLE train ALTER COLUMN Age int
--UPDATE train set Age='30' WHERE Age='NULL'
--############## find the name of the passenger with no family member are travel??
SELECT Name, SibSp+Parch  AS Family FROM train
-- ################## find the current age of passenger.. the titanic accident was happend in 1998 (Expression)
SELECT Name,Age,Age+(2023-1998) AS current_age FROM train
-- ######### Use of constant
SELECT Name,10000 AS compensation FROM train
-- ############## DISTINCT
SELECT DISTINCT Sex FROM train
SELECT DISTINCT Embarked FROM train
SELECT DISTINCT Pclass,Embarked FROM train
-- ########## Find how many passenger has travel whose age is between 10 to 15
SELECT COUNT(*) FROM train WHERE Age BETWEEN 10 AND 15
-- ######################################################################
-- ############################################################## Having is used to filter the outcome of group by
SELECT Embarked,COUNT(PassengerId) from train GROUP BY Embarked HAVING COUNT(PassengerId)>2
SELECT Pclass ,COUNT(PassengerId),AVG(Age) FROM train GROUP BY Pclass HAVING AVG(Age)>26
-- ##############
SELECT Pclass,COUNT(*) ,AVG(Age) from train GROUP BY Pclass 

-- #########################################################################################################