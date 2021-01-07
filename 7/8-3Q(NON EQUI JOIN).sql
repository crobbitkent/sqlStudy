SELECT B.LEV, A.EMP_ID, A.EMP_NAME, A.BIRTH_DATE, A.LEV

FROM TEMP A, EMP_LEVEL B

WHERE A.BIRTH_DATE BETWEEN ADD_MONTHS(SYSDATE, -1*TO_AGE*12)

AND ADD_MONTHS(SYSDATE, -1*FROM_AGE*12)

AND B.LEV = '����';