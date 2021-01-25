explain plan set statement_id = 'random' for
select hobby, count(hobby) from temp
group by hobby;