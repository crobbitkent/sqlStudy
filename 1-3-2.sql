-- NULL ���ϱ� (NULL�̸� ���, �׸��� ����� ��� ��ȸ)
SELECT EMP_NAME FROM TEMP 
WHERE NVL(HOBBY, '���') = '���'; 