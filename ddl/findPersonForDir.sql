CREATE PROCEDURE
findPersonForDir
@entryId smallint
AS
SELECT     PERSON_ENTRY_ID, ENTRY_ID, FIRST_NAME, LAST_NAME, BIRTH_DATE, MEMBER_IND
FROM         PERSON_ENTRY
WHERE     (ENTRY_ID = @entryId) AND ((DEL_IND IS NULL) OR
                      (DEL_IND = 0))
ORDER BY PERSON_SEQ