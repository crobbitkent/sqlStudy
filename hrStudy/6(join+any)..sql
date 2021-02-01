select emp_id, emp_name, SALARY from TEMP
where salary > (select min(salary) from temp where lev = '과장');

select emp_id, emp_name, SALARY from TEMP
where salary > any(select salary from temp where lev = '과장');

