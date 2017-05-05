ALTER TYPE ITEM_T ADD ORDER MEMBER FUNCTION match(other_item ITEM_T)
  RETURN INTEGER CASCADE;

CREATE OR REPLACE TYPE BODY ITEM_T AS
  ORDER MEMBER FUNCTION match(other_item ITEM_T)
    RETURN INTEGER IS
    date_format               VARCHAR2(32767);
    date_char_self            TIMESTAMP;
    date_char_other           TIMESTAMP;
    number_of_downloads_self  INTEGER;
    number_of_downloads_other INTEGER;
    BEGIN
      date_format := 'YY-MM-DD';
      date_char_self := TO_TIMESTAMP(to_char(SELF.published_date, date_format), date_format);
      date_char_other := TO_TIMESTAMP(to_char(other_item.published_date, date_format), date_format);

      IF date_char_self < date_char_other
      THEN
        RETURN -1;
      ELSIF date_char_self > date_char_other
        THEN
          RETURN 1;
      ELSE
        SELECT count(*)
        INTO number_of_downloads_self
        FROM client_table c, TABLE (c.downloaded_items) di
        WHERE di.downloaded_item.id = SELF.id;

        SELECT count(*)
        INTO number_of_downloads_other
        FROM client_table c, TABLE (c.downloaded_items) di
        WHERE di.downloaded_item.id = other_item.id;

        IF number_of_downloads_self < number_of_downloads_other
        THEN
          RETURN -1;
        ELSIF number_of_downloads_self > number_of_downloads_other
          THEN
            RETURN 1;
        ELSE RETURN 0;
        END IF;
      END IF;
    END;
END;