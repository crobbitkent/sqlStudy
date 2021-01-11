--SELECT EMP_ID, EMP_NAME
--FROM TEMP
--WHERE SALARY > AVG(SALARY)
--AND SALARY IN
--(SELECT SALARY FROM TEMP 
--GROUP BY LEV) 

SELECT EMP_ID, EMP_NAME
FROM TEMP A
WHERE SALARY > (SELECT AVG(SALARY) FROM TEMP B
WHERE B.LEV = A.LEV)
