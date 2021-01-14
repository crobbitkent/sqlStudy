select lpad(operation, length(operation) + 2 * (level -1)) ||
decode(id, 0, 'Cost Estimate:' || decode(position, '0',
'N/A', position), null) || '' || options ||
decode(object_name, null, null, ':') || rpad(object_owner,
length(object_name) + 1, ',') || object_name ||
decode(object_type, 'UNIQUE', ' (U) ', 'NIN_UNIQUE',
' (NU)', null) || decode(object_instance, null, null, '(' || object_instance || ')')
PLAN from PLAN_TABLE
start with ID=0 and statement_id = 'random'
connect by prior id=parent_id and statement_id='random'