SELECT A.EMP_ID, B.EMP_ID

FROM TEMP A, TCOM B

WHERE B.WORK_YEAR(+) = '2001'

AND B.EMP_ID(+) = A.EMP_ID;