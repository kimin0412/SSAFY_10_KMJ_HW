-- create database HW;
-- use HW;

CREATE TABLE EMP
(	EMPNO int(4)  PRIMARY KEY,
	ENAME VARCHAR(10),
	JOB VARCHAR(9),
	MGR int(4),
	HIREDATE DATE,
	SAL decimal(7,2),
	COMM decimal(7,2),
	DEPTNO int(2)	);
drop table emp;

INSERT INTO EMP (`EMPNO`, `ENAME`, `JOB`, `MGR`, `HIREDATE`, `SAL`, `COMM`, `DEPTNO`) VALUES
(7369,'SMITH','CLERK',7902,cast('2010-10-19' as date),800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,cast('2000-10-19' as date),1600,300,30),
(7521,'WARD','SALESMAN',7698,cast('2013-05-19' as date),1250,500,30),
(7566,'JONES','MANAGER',7839,cast('2018-10-19' as date),2975,NULL,20),
(7654,'MARTIN','SALESMAN',7698,cast('2008-04-19' as date),1250,1400,30),
(7698,'BLAKE','MANAGER',7839,cast('2016-11-19' as date),2850,NULL,30),
(7782,'CLARK','MANAGER',7839,cast('2017-10-19' as date),2450,NULL,10),
(7788,'SCOTT','ANALYST',7566,cast('2013-10-11' as date),3000,NULL,20),
(7839,'KING','PRESIDENT',NULL,cast('2014-08-19' as date),5000,NULL,10),
(7844,'TURNER','SALESMAN',7698,cast('2010-10-19' as date),1500,0,30),
(7876,'ADAMS','CLERK',7788,cast('2000-09-19' as date),1100,NULL,20),
(7900,'JAMES','CLERK',7698,cast('2018-10-19' as date),950,NULL,30),
(7902,'FORD','ANALYST',7566,cast('2003-10-19' as date),3000,NULL,20),
(7934,'MILLER','CLERK',7782,cast('2002-10-19' as date),1300,NULL,10);
select * from emp;

CREATE TABLE DEPT
(	DEPTNO int(2)  PRIMARY KEY,
	DNAME VARCHAR(14),
	LOC VARCHAR(13)	);
drop table dept;

INSERT INTO DEPT (`DEPTNO`, `DNAME`, `LOC`) VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');
select * from dept;

-- 1. 부서위치가 CHICAGO인 모든 사원에 대해 이름,업무,급여 출력하는 SQL을 작성하세요.
select ename 이름, job 업무, sal 급여
from emp
where deptno = (select deptno from dept where loc = 'CHICAGO');

-- 2. 부하직원이 없는 사원의 사원번호,이름,업무,부서번호 출력하는 SQL을 작성하세요.
select empno 사원번호, ename 이름, job 업무, deptno 부서번호
from emp
where empno not in (select distinct mgr from emp where mgr is not null);

-- 3. BLAKE와 같은 상사를 가진 사원의 이름,업무,상사번호 출력하는 SQL을 작성하세요.
select ename 이름, job 업무, mgr 상사번호
from emp
where mgr = (select empno from emp where ename = 'BLAKE');

-- 4. 입사일이 가장 오래된 사람 5명을 검색하세요.
select *
from emp
order by hiredate
limit 0, 5;

-- 5. JONES 의 부하 직원의 이름, 업무, 부서명을 검색하세요.
select ename 이름, job 업무, dname 부서명
from emp join dept
using (deptno)
where mgr = (select empno from emp where ename = 'JONES');

