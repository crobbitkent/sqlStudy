SELECT EMP_ID, EMP_NAME
FROM TEMP
WHERE DEPT_CODE IN 
(SELECT DEPT_CODE FROM TDEPT WHERE AREA = '��õ');