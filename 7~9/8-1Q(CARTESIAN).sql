-- SELECT LEV 1, LEV 2, EMP_ID, EMP_NAME, SALARY
-- WHERE LEV ='����'
-- FROM TEMP;

SELECT NO, A.EMP_ID, A.EMP_NAME, A.SALARY
FROM TEMP A,
MOD_TEST B
WHERE B.NO <= 2
AND A.LEV = '����';