select emp_id, emp_name, lev, dept_code from temp
where substr(emp_name, 0, 1) = any ('±è', '¹Ú')
