SELECT TO_CHAR(sal, '$99,999.99') FROM emp;
SELECT TO_CHAR(23233, '99999.99') FROM dual;
SELECT TO_CHAR(32323.54555, '999999.999') FROM dual;
SELECT TO_CHAR(SYSDATE, 'dd-mm-yyyy') FROM dual;
SELECT TO_CHAR(SYSDATE, 'mon') FROM dual;
SELECT TO_CHAR(SYSDATE, 'dy-month-year') FROM dual;
SELECT TO_CHAR(32, '0000999') FROM dual;
SELECT TO_CHAR(23233, '9999.99') FROM dual;
SELECT TO_CHAR(32323.54534, '999999.999') FROM dual;
SELECT TO_CHAR(SYSDATE, 'mm-dd-yyyy') FROM dual;
SELECT TO_CHAR(SYSDATE, 'mm-day-yyyy') FROM dual;
SELECT TO_CHAR(SYSDATE, 'mm-day-year') FROM dual;
SELECT TO_CHAR(SYSDATE, 'dy') FROM dual;
SELECT TO_CHAR(SYSDATE, 'day-month-year hh-mi-ss') FROM dual;
SELECT TO_CHAR(32, '0009') FROM dual;

SELECT TO_NUMBER('4343.34', '9999.99') FROM dual;  
SELECT TO_NUMBER('434', '9999') FROM dual;  
SELECT TO_NUMBER('00434', '999999') FROM dual;  


SELECT TO_DATE('2020-06-23', 'yyyy-mm-dd') FROM dual;  
SELECT TO_DATE('20-06-23', 'yy-mm-dd') FROM dual;  
SELECT TO_DATE('20-06-2', 'yy-dd-mm') FROM dual;  

SELECT CONCAT(ename, sal) FROM emp;  
SELECT CONCAT('seshu', ' chakravarthy') FROM dual;  


SELECT LPAD(ename, 10, '_') FROM emp;
SELECT RPAD(ename, 10, '_') FROM emp;

SELECT LTRIM(' seshu chakravarthy', ' ') FROM dual;
SELECT RTRIM('hello world*******', '*') FROM dual;

SELECT LOWER(ename) FROM emp;
SELECT UPPER(ename) FROM emp;
SELECT INITCAP(ename) FROM emp;

SELECT ename, LENGTH(ename) FROM emp;
SELECT ename, SUBSTR(ename, 2, 4) FROM emp;
SELECT ename, INSTR(ename, 'LL') FROM emp;

SELECT SYSDATE FROM dual;
SELECT NEXT_DAY(SYSDATE, 'sunday') FROM dual;
SELECT ADD_MONTHS('02-SEP-88', 23) FROM dual;
SELECT LAST_DAY('01-MAR-2019') FROM dual;
SELECT MONTHS_BETWEEN(SYSDATE, '02-aug-1987') FROM dual;

SELECT LEAST(300, 400, 123, 544) FROM dual;
SELECT GREATEST(4343, 33, 3434, 32222) FROM dual;
SELECT TRUNC(SYSDATE, 'mm') FROM dual;
SELECT TRUNC(43432.434, 2) FROM dual;
SELECT ROUND(34.734, 2) FROM dual;
SELECT ROUND(3334.734, -2) FROM dual;
SELECT ROUND(34.7, 0) FROM dual;  
SELECT ROUND(34.7, 1) FROM dual;  
SELECT ROUND(34.734, 2) FROM dual;  
SELECT ROUND(34.734, -2) FROM dual;  
SELECT ROUND(3334.734, -2) FROM dual;  

