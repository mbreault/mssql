

/****** Object:  Table [dbo].[Employee]    Script Date: 5/5/2020 1:23:10 PM ******/
ALTER TABLE [dbo].[Employee] SET ( SYSTEM_VERSIONING = OFF  )
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 5/5/2020 1:23:10 PM ******/
DROP TABLE [dbo].[Employee]
GO

/****** Object:  Table [dbo].[EmployeeHistory]    Script Date: 5/5/2020 1:23:10 PM ******/
DROP TABLE [dbo].[EmployeeHistory]
GO

CREATE TABLE dbo.Employee(
  EMPNO   INT,
  ENAME    VARCHAR(10),
  JOB      VARCHAR(9),
  MGR      INT,
  HIREDATE DATE,
  SAL      NUMERIC(7,2),
  COMM     NUMERIC(7,2),
  DEPTNO   INT,
     CONSTRAINT EMP_PK PRIMARY KEY (EMPNO),
   SysStartTime datetime2 GENERATED ALWAYS AS ROW START NOT NULL
  ,SysEndTime datetime2 GENERATED ALWAYS AS ROW END NOT NULL
  ,PERIOD FOR SYSTEM_TIME (SysStartTime,SysEndTime)) WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.EmployeeHistory, DATA_CONSISTENCY_CHECK = ON));

  INSERT INTO employee (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
  VALUES
 (7369, 'SMITH', 'CLERK', 7902, '02-MAR-1970', 8000, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '20-MAR-1971', 1600, 3000, 30),
(7521, 'WARD', 'SALESMAN', 7698, '07-FEB-1983', 1250, 5000, 30),
(7566, 'JONES', 'MANAGER', 7839, '02-JUN-1961', 2975, 50000, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '28-FEB-1971', 1250, 14000, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '01-JAN-1988', 2850, 12000, 30),
(7782, 'CLARK', 'MANAGER', 7839, '09-APR-1971', 2450, 13000, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '09-DEC-1982', 3000, 1200, 20),
(7839, 'KING', 'PRESIDENT', NULL, '17-JUL-1971', 5000, 1456, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '08-AUG-1971', 1500, 0, 30),
(7876, 'ADAMS', 'CLERK', 7788, '12-MAR-1973', 1100, 0, 20),
(7900, 'JAMES', 'CLERK', 7698, '03-NOV-1971', 950, 0, 30),
(7902, 'FORD', 'ANALYST', 7566, '04-MAR-1961', 3000, 0, 20),
(7934, 'MILLER', 'CLERK', 7782, '21-JAN-1972', 1300, 0, 10);

UPDATE EMPLOYEE
SET SAL=SAL+2000
WHERE EMPNO=7369;
 
UPDATE EMPLOYEE
SET SAL=SAL+2000
WHERE EMPNO=7369;

DELETE EMPLOYEE WHERE EMPNO=7369;

SELECT * FROM EmployeeHistory WHERE EMPNO=7369;
 
SELECT *  FROM EMPLOYEE
FOR SYSTEM_TIME ALL
order by empno, SysEndTime;
