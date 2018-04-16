DROP DATABASE IF EXISTS testDatabase;
CREATE DATABASE testDatabase;
USE testDatabase;

DROP TABLE IF EXISTS randomNumber;
CREATE TABLE randomNumber(number DOUBLE);

DELIMITER //
CREATE PROCEDURE InitTable(IN n INT)
	BEGIN
		DECLARE i INT;
		SET i = 0;
		WHILE i < n DO
			INSERT INTO randomNumber VALUES (rand()*1000);
			SET i = i + 1;
		END WHILE;
    END //
    
DELIMITER ;

CALL InitTable(100);

SELECT * FROM randomNumber;