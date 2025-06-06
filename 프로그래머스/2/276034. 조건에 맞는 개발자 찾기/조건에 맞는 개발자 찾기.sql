-- 코드를 작성해주세요
SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPERS D
WHERE EXISTS (
    SELECT 1
    FROM SKILLCODES S
    WHERE S.NAME IN ('Python','C#')
      AND (D.SKILL_CODE & S.CODE) = S.CODE
  )
ORDER BY ID