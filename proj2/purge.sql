BEGIN
  FOR cur_rec IN (SELECT
                    object_name,
                    object_type
                  FROM user_objects
                  WHERE object_type IN
                        ('TABLE',
                         'VIEW',
                         'PACKAGE',
                         'PROCEDURE',
                         'FUNCTION',
                         'SEQUENCE'
                        ))
  LOOP
    BEGIN
      IF cur_rec.object_type = 'TABLE'
      THEN
        EXECUTE IMMEDIATE 'DROP '
                          || cur_rec.object_type
                          || ' "'
                          || cur_rec.object_name
                          || '" CASCADE CONSTRAINTS';
      ELSE
        EXECUTE IMMEDIATE 'DROP '
                          || cur_rec.object_type
                          || ' "'
                          || cur_rec.object_name
                          || '"';
      END IF;
      EXCEPTION
      WHEN OTHERS
      THEN
      DBMS_OUTPUT.put_line('FAILED: DROP '
                           || cur_rec.object_type
                           || ' "'
                           || cur_rec.object_name
                           || '"'
      );
    END;
  END LOOP;

  FOR uo IN (SELECT *
             FROM user_objects
             WHERE object_type = 'TYPE') LOOP
    BEGIN
      EXECUTE IMMEDIATE ('DROP ' || uo.object_type || ' ' || uo.object_name || ' FORCE');
    EXCEPTION
      WHEN OTHERS THEN
      CONTINUE;
    END;
  END LOOP;
END;

PURGE RECYCLEBIN;