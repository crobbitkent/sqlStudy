(SELECT EMP_ID FROM TEMP INTERSECT SELECT EMP_ID FROM TCOM)
UNION
(SELECT EMP_ID FROM TEMP MINUS SELECT EMP_ID FROM TCOM);