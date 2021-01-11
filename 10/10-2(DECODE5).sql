SELECT TO_CHAR(SYSDATE, 'DD') || DECODE(TO_CHAR(SYSDATE, 'DAY'),
'월요일', '01', '화요일', '11', '수요일', '21', '목요일', '31',
'금요일', '41', '토요일', '51', '일요일', '61') SEC_KEY
FROM DUAL;