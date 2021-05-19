import mysql.connector
import sys
import getopt
import os

outPath = "C:/Users/Admin/Desktop/20202/CSDL/Bài tập nhóm/SP/"
db_connection = mysql.connector.connect(
  host="127.0.0.4",
  user="root",
  passwd="sangpro",
  
)

# The INSERT template
insertTemplate = """
DELIMITER $$

DROP PROCEDURE IF EXISTS `%s`$$
CREATE PROCEDURE `%s` (%s)
BEGIN
    INSERT INTO %s (
        %s
    ) VALUES (
        %s
    );
END$$

DELIMITER ;
"""

# The UPDATE template
updateTemplate = """
DELIMITER $$

DROP PROCEDURE IF EXISTS `%s`$$
CREATE PROCEDURE `%s` (%s)
BEGIN
    UPDATE %s SET
        %s
    WHERE
        %s;
END$$

DELIMITER ;
"""

# The GET template
getTemplate = """
DELIMITER $$

DROP PROCEDURE IF EXISTS `%s`$$
CREATE PROCEDURE `%s` (%s)
BEGIN
    SELECT
        %s
    FROM %s
    WHERE
        %s;
END$$

DELIMITER ;
"""

# The DELETE template
deleteTemplate = """
DELIMITER $$

DROP PROCEDURE IF EXISTS `%s`$$
CREATE PROCEDURE `%s` (%s)
BEGIN
    DELETE FROM %s
    WHERE
        %s;
END$$

DELIMITER ;
"""

cur = db_connection.cursor()
dbname = 'mydata'
cur.execute("SHOW TABLES FROM %s" % dbname)
tables = cur.fetchall()
for table in tables:
    print ('Generating stored procs for table [%s]...' % table[0])
    
    cur.execute("SHOW COLUMNS FROM %s.%s" % (dbname, table[0]))
    columns = cur.fetchall()
    
    insertUpdateParms = ''
    getDeleteParms = ''
    whereClause = ''
    insertList = ''
    valuesList = ''
    updateList = ''

    for column in columns:
        # Append the columns to the input parms
        if (len(insertUpdateParms) > 0):
            insertUpdateParms += ',\n'
            insertList += ',\n'
            valuesList += ',\n'

        if (len(updateList) > 0):
            updateList += ',\n'
        
        temp = str(column[1])
        insertUpdateParms += 'IN p_%s ' % column[0]
        insertUpdateParms = insertUpdateParms + str(temp[2:-1])
        
        insertList = insertList + column[0]
        valuesList = valuesList + "p_" + column[0]
    
    # Generate the key parms that are used for the Get and Delete
    # stored procs, and generate the values for the WHERE clause
    # for the Update, Get and Delete stored procs
        if (column[3].lower() == 'pri'):
            if (len(getDeleteParms) > 0):
                getDeleteParms += ',\n'
            
            getDeleteParms += 'IN p_%s ' % column[0]
            getDeleteParms = getDeleteParms + str(temp[2:-1])

            
            if (len(whereClause) > 0):
                whereClause += ' AND \n'
            whereClause += '%s = p_%s' % (column[0], column[0])
        else:
            updateList += '%s = p_%s' % (column[0], column[0])
    
    # Write out the INSERT stored proc
    outPath_insert = outPath + "Insert/"
    file = open(os.path.join(outPath_insert,(table[0] + '_Insert.sql').lower()), 'w')
    file.write(insertTemplate % (table[0] + '_Insert', table[0] + '_Insert', insertUpdateParms, table[0], insertList, valuesList))
    file.close()
    
    # Write out the UPDATE stored proc
    outPath_update = outPath + "Update/"
    file = open(os.path.join(outPath_update,(table[0] + '_Update.sql').lower()), 'w')
    file.write(updateTemplate % (table[0] + '_Update', table[0] + '_Update', insertUpdateParms, table[0], updateList, whereClause))
    file.close()
    
    # Write out the GET stored proc
    outPath_get = outPath + "Get/"
    file = open(os.path.join(outPath_get,(table[0] + '_Get.sql').lower()), 'w')
    file.write(getTemplate % (table[0] + '_Get', table[0] + '_Get', getDeleteParms, insertList, table[0], whereClause))
    file.close()
        
    # Write out the DELETE stored proc
    outPath_delete = outPath + "Delete/"
    file = open(os.path.join(outPath_delete,(table[0] + '_Delete.sql').lower()), 'w')
    file.write(deleteTemplate % (table[0] + '_Delete', table[0] + '_Delete', getDeleteParms, table[0], whereClause))
    file.close()
    
    # print(getDeleteParms)
    # print(whereClause)
    # print(updateTemplate % (table[0] + '_Update', table[0] + '_Update', insertUpdateParms, table[0], updateList, whereClause))
    # print(deleteTemplate % (table[0] + '_Delete', table[0] + '_Delete', getDeleteParms, table[0], whereClause))
    # print(insertTemplate % (table[0] + '_Insert', table[0] + '_Insert', insertUpdateParms, table[0], insertList, valuesList))