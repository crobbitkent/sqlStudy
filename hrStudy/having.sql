select lev, max(emp_id) SABUN from TEMP
group by lev
having substr(max(emp_id), 0, 4) = 1997;