SELECT EMP_ID, EMP_NAME, SALARY
FROM TEMP
WHERE SALARY > ANY( SELECT SALARY FROM TEMP
WHERE LEV = '����')