DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CopyDB`(sourceDB VARCHAR(64),targetDB VARCHAR(64))
TheStoredProcedure:BEGIN

    DECLARE found_count,ndx,ndx_last INT;
    DECLARE sqlcmd VARCHAR(1024);

    SELECT COUNT(1) INTO found_count
    FROM information_schema.tables
    WHERE table_schema = sourceDB;
    IF found_count = 0 THEN
        LEAVE TheStoredProcedure;
    END IF;

    DROP TABLE IF EXISTS DBTablesToCopy;
    CREATE TABLE DBTablesToCopy
    (
        id INT NOT NULL AUTO_INCREMENT,
        src  VARCHAR(64),
        tgt  VARCHAR(64),
        tbl  VARCHAR(64),
        PRIMARY KEY (id)
    );
    DROP TABLE IF EXISTS SQLScriptToCopyTables;
    CREATE TABLE SQLScriptToCopyTables
    (
        id INT NOT NULL AUTO_INCREMENT,
        sqltext VARCHAR(1024),
        PRIMARY KEY (id)
    );

    INSERT INTO DBTablesToCopy (src,tgt,tbl)
    SELECT sourceDB,targetDB,table_name
    FROM information_schema.tables
    WHERE table_schema = sourceDB;

    SELECT MAX(id) INTO ndx_last FROM DBTablesToCopy;
    SET ndx = 0;
    WHILE ndx < ndx_last DO
        SET ndx = ndx + 1;
        INSERT INTO SQLScriptToCopyTables (sqltext)
        SELECT CONCAT('DROP TABLE IF EXISTS ',tgt,'.',tbl)
        FROM DBTablesToCopy WHERE id = ndx;
    END WHILE;
    SET ndx = 0;
    WHILE ndx < ndx_last DO
        SET ndx = ndx + 1;
        INSERT INTO SQLScriptToCopyTables (sqltext)
        SELECT CONCAT('CREATE TABLE ',tgt,'.',tbl,' LIKE ',src,'.',tbl)
        FROM DBTablesToCopy WHERE id = ndx;
    END WHILE;
    SET ndx = 0;
    WHILE ndx < ndx_last DO
        SET ndx = ndx + 1;
        INSERT INTO SQLScriptToCopyTables (sqltext)
        SELECT CONCAT('INSERT ',tgt,'.',tbl,' SELECT * FROM ',src,'.',tbl)
        FROM DBTablesToCopy WHERE id = ndx;
    END WHILE;

    SELECT MAX(id) INTO ndx_last FROM SQLScriptToCopyTables;
    SET ndx = 0;
    WHILE ndx < ndx_last DO
        SET ndx = ndx + 1;
        SELECT sqltext INTO @stmt FROM SQLScriptToCopyTables WHERE id = ndx;
        PREPARE s1 FROM @stmt;
        EXECUTE s1;
        DEALLOCATE PREPARE s1;
    END WHILE;
    
    DROP TABLE IF EXISTS DBTablesToCopy;
    DROP TABLE IF EXISTS SQLScriptToCopyTables;
END$$
DELIMITER ;
