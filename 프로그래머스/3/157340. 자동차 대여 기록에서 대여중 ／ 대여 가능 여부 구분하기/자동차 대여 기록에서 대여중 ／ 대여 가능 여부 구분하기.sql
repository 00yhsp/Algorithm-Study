-- 코드를 입력하세요
SELECT 
    CAR_ID,
    CASE WHEN SUM(DATE('2022-10-16') BETWEEN START_DATE AND END_DATE) > 0
         THEN '대여중'
         ELSE '대여 가능'
    END AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY 1 DESC