-- 1. Create the schema
CREATE TABLE dept (
    deptno INT PRIMARY KEY,
    dname VARCHAR(50),
    loc VARCHAR(50)
);

CREATE TABLE emp (
    empno INT PRIMARY KEY,
    ename VARCHAR(50),
    job VARCHAR(50),
    mgr INT,
    hiredate DATE,
    sal INT,
    comm INT,
    deptno INT,
    FOREIGN KEY (deptno) REFERENCES dept(deptno)
);

-- 2. Insert data into dept table
INSERT INTO dept (deptno, dname, loc) VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept (deptno, dname, loc) VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO dept (deptno, dname, loc) VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO dept (deptno, dname, loc) VALUES (40, 'OPERATIONS', 'BOSTON');

-- 2. Insert data into emp table
INSERT INTO emp VALUES (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10);
INSERT INTO emp VALUES (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30);
INSERT INTO emp VALUES (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10);
INSERT INTO emp VALUES (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20);
INSERT INTO emp VALUES (7788, 'SCOTT', 'ANALYST', 7566, '1987-07-13', 3000, NULL, 20);
INSERT INTO emp VALUES (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20);
INSERT INTO emp VALUES (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20);
INSERT INTO emp VALUES (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30);
INSERT INTO emp VALUES (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30);
INSERT INTO emp VALUES (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30);
INSERT INTO emp VALUES (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30);
INSERT INTO emp VALUES (7876, 'ADAMS', 'CLERK', 7788, '1987-05-23', 1100, NULL, 20);
INSERT INTO emp VALUES (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30);
INSERT INTO emp VALUES (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);

-- 3. Queries with Output Format

-- Query 1: List out all the information stored in employee table.
SELECT * FROM emp;

-- Query 2: Retrieve all the enames from the emp.
SELECT ename FROM emp;

-- Query 3: Retrieve all the emp names and salary from emp.
SELECT ename, sal FROM emp;

-- Query 4: Retrieve all the emp names and salary who are earning more than 3000.
SELECT ename, sal FROM emp WHERE sal > 3000;

-- Query 5: List out all the emp names and deptno who are working in deptno 10.
SELECT ename, deptno FROM emp WHERE deptno = 10;

-- Query 6: Retrieve all the emp names and jobs who are working as analyst.
SELECT ename, job FROM emp WHERE job = 'ANALYST';

-- Query 7: List out the manager number for emp ‘smith’.
SELECT mgr FROM emp WHERE ename = 'SMITH';

-- Query 8: List out the jobs in emp.
SELECT DISTINCT job FROM emp;

-- Query 9: List out the department numbers in emp.
SELECT DISTINCT deptno FROM emp;

-- Query 10: Select all the emp names and jobs who are getting comm.
SELECT ename, job FROM emp WHERE comm IS NOT NULL AND comm > 0;

-- Query 11: Retrieve all the emp names, salary and comm whose comm is greater than their salary.
SELECT ename, sal, comm FROM emp WHERE comm > sal;

-- Query 12: Retrieve all the emp details in deptno 20 and who are working as ‘clerk’.
SELECT * FROM emp WHERE deptno = 20 AND job = 'CLERK';

-- Query 13: Retrieve all the emp details in deptno 20 or who are working as ‘clerk’.
SELECT * FROM emp WHERE deptno = 20 OR job = 'CLERK';

-- Query 14: List out all the emp details in deptno 30 and who are earning more than 1000.
SELECT * FROM emp WHERE deptno = 30 AND sal > 1000;

-- Query 15: Retrieve all the dept names.
SELECT dname FROM dept;

-- Query 16: Find out the name of dept 10.
SELECT dname FROM dept WHERE deptno = 10;

-- Query 17: List out all names, locations of dept.
SELECT dname, loc FROM dept;

-- Query 18: List out the deptno which is located in ‘dallas’.
SELECT deptno FROM dept WHERE loc = 'DALLAS';

-- Query 19: List out all the dept’s whose deptno is greater than 10.
SELECT * FROM dept WHERE deptno > 10;

-- Query 20: List out all the employees who are joined on the ’28-sep-1981’.
SELECT * FROM emp WHERE hiredate = '1981-09-28';

-- Query 21: List out all the emp names in descending order.
SELECT ename FROM emp ORDER BY ename DESC;

-- Query 22: List out all the salary information in ascending order.
SELECT sal FROM emp ORDER BY sal ASC;

-- Query 23: List out all the information who are joined after 1980.
SELECT * FROM emp WHERE hiredate > '1980-12-31';

-- Query 24: List out all the information who are in deptno 10 and 20.
SELECT * FROM emp WHERE deptno IN (10, 20);

-- Query 25: List out all the information who are earning salary from 1000 to 2000.
SELECT * FROM emp WHERE sal BETWEEN 1000 AND 2000;

-- Query 26: List out all the emps whose names are starting with letter ‘a’.
SELECT * FROM emp WHERE ename LIKE 'A%';

-- Query 27: List out all the information whose jobs ends with letter ‘t’.
SELECT * FROM emp WHERE job LIKE '%T';

-- Query 28: List out all the information of emp except president in ascending order of salary.
SELECT * FROM emp WHERE job <> 'PRESIDENT' ORDER BY sal ASC;

-- Query 29: List out emp in below format ‘SMITH is working as CLERK’.
SELECT CONCAT(ename, ' is working as ', job) AS Employee_Info FROM emp;
