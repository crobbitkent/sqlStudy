--SUBSTR
--EMP_ID�� ù��°���� �׹�°�� ���� �ҷ����� +1�� ���� 1998�� ������ ��ȸ
SELECT EMP_ID, EMP_NAME
FROM TEMP
WHERE SUBSTR(EMP_ID,1,4) + 1 = 1998;