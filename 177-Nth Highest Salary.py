# Write a SQL query to get the nth highest salary from the Employee table.

# +----+--------+
# | Id | Salary |
# +----+--------+
# | 1  | 100    |
# | 2  | 200    |
# | 3  | 300    |
# +----+--------+
# For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.

# +------------------------+
# | getNthHighestSalary(2) |
# +------------------------+
# | 200                    |
# +------------------------+


CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    CASE WHEN N <= (select count(distinct salary) b from employee) 
      THEN (select * from (select distinct salary from employee order by salary desc limit N)       a order by a.salary asc limit 1)
      ELSE NULL
      END
  );
END
