SELECT EMP_ID, EMP_NAME, SALARY
FROM TEMP
WHERE SALARY > ALL (SELECT SALARY FROM TEMP
WHERE LEV = '����')