SELECT TO_CHAR(SYSDATE, 'DD') || DECODE(TO_CHAR(SYSDATE, 'DAY'),
'������', '01', 'ȭ����', '11', '������', '21', '�����', '31',
'�ݿ���', '41', '�����', '51', '�Ͽ���', '61') SEC_KEY
FROM DUAL;