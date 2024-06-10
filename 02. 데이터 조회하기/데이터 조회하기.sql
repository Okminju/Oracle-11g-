--2장. 데이터 조회하기
--[문제]'이름이 SCOTT'인 사원의 '모든 정보' 출력

select *
from employee
where ename = 'SCOTT'; 


--[문제] '이름이 SCOTT'인 사원의 '사원번호, 업무, 부서번호' 출력
select ENO, JOB, DNO
from employee
where ename = 'SCOTT'; 

select ENO, JOB, DNO
from employee
where ename = upper('scott'); --UPPER('대문자로 변환')

select ENO, JOB, DNO
from employee
where LOWER(ename)='scott'; --LOWER('소문자로 변환')

--[문제] '1981년 1월 1일 이전에 입사'한 사원의 '모든 정보' 출력
-- ※ 1900년 01월 01일 => 1 기준, 1900년 12월 31일 => 365

select *
from employee
where hiredate < '1981-01-01';

select ename, hiredate
from employee
where hiredate < '1981-01-01';

/**
 1. 비교 연산자
    초과 >   미만 <   이상 >=   이하 <=
    같다 = (※ JAVA의 같다 == 대입연산자 =)
    다르다 != <> ^= (※JAVA의 다르다 !=   ^=는 복합대입연산자)
    
   
 2. 논리 연산자 not -> and -> or 
    (※ JAVA : ! -> && -> ||)  
    */
    
--[문제] 10번 부서에 소속된 사원들 중에서 직급이 Manager인 사원 정보 검색

select *
from employee;

select *
from employee
where dno = 10 and job='MANAGER' ;

select *
from employee
where dno = 10 and upper(job)= upper('manager') ;

--[문제] 10번 부서에 소속이거나 사원들 중에서 직급이 Manager인 사원 정보 검색

select *
from employee
where dno = 10 or upper(job)= upper('manager') ;

--[문제] 10번 부서에 소속된 사원만 제외하고 사원 정보 검색

select *
from employee
where dno != 10 ;

select *
from employee
where NOT dno = 10 ; --NOT 뒤에 true or false가 되는 대상이 있어야함

--급여가 1100인 사원정보 검색

select *
from EMPLOYEE
where salary = 1100;

--급여가 1300인 사원정보 검색

select *
from EMPLOYEE
where salary = 1300;

--[문제] 급여가 1000이상 1500 이하인 사원 정보 출력(1000,1500)\

select *
from EMPLOYEE
where 1000<= salary and salary <= 1500;

select *
from EMPLOYEE
where salary BETWEEN 1000 AND 1500;

--[문제] 급여가 1000미만이거나 1500 초과인 사원 정보 출력

select *
from EMPLOYEE
where 1000> salary or salary> 1500;

select *
from EMPLOYEE
where salary NOT BETWEEN 1000 AND 1500;

--[문제] commission이 300이거나 500이거나 1400인 사원 정보 조회

select *
from EMPLOYEE
where commission = 300 or commission = 500 or commission = 1400;

select *
from EMPLOYEE
where commission in(300, 500, 1400);

--[문제] commission이 300, 500, 1400이 모두 아닌 사원 정보 조회

select *
from EMPLOYEE
where not (commission = 300 or commission = 500 or commission = 1400);

select *
from EMPLOYEE
where commission != 300 and commission != 500 and commission != 1400;

select *
from EMPLOYEE
where commission not in(300, 500, 1400);

--결과에서 commission이 NULL인 사원은 제외됨(이유? NULL은 비교연산자로 비교x)


--<commission이 NULL인 사원도 결과에 출력되도록 하기 위해 '함수 사용' 하여 해결>

select *
from EMPLOYEE
where not (NVL(commission, 0)=300 or NVL(commission, 0)=500 or NVL(commission, 0)= 1400);

select *
from EMPLOYEE
where NVL(commission,0) not in(300, 500, 1400);

--------------------------------------------------------------------------
--와일드 카드 : %
--[문제] 이름이 'F로 시작'하는 사원 정보 조회

select *
from employee
where ename LIKE 'F%'; --'F'  'Fa'
--% 의미 : 문자가 없거나 하나 이상의 문자가 어떤 값이 와도 상관없다. 

--[문제] 이름이 'M이 포함'되는 사원 정보 조회
select *
from employee
where ename LIKE '%M%'; --'M' 'aM' 'Ma' 'aMa'

--[문제] 이름이 'M으로' 끝나는 사원 정보 조회
select *
from employee
where ename LIKE '%M'; --'M' 'aM'

--[문제] 이름의 '두번째 글자가 A'인 사원 정보 조회
select *
from employee
where ename LIKE '_A%'; 
--_의미 : 하나의 문자가 어떤 값이 와도 상관없다.

--[문제] 이름의 '세번째 글자가 A'인 사원 정보 조회
select *
from employee
where ename LIKE '__A%'; 

--[문제] 이름이 'M이 포함'되지 않는 사원 정보 조회
select *
from employee
where ename not LIKE '%M%';

---------------------------------------------------------------------
--[문제] commission 을 받지 못하는 사원 정보 조회
select *
from employee
where COMMISSION = null;--Null은 비교연산자로 비교불가(=>참이 되는 결과가 없음)

select *
from employee
where COMMISSION is null;

--[문제] commission을 받는 사원 정보 조회

select *
from employee
where not COMMISSION is null;

select *
from employee
where COMMISSION is not null;

select *
from employee
where job ='SALESMAN';


------------------------------------------------
--정렬 : 오름차순 asc(기본), 내림차순 desc

--사원정보 조회 시 사원의 급여가 적은 순부터 출력

select * 
from employee
--where 
order by SALARY asc;

--사원정보 조회 시 사원의 급여가 적은 순부터 출력(급여가 같으면 commission 많은 순부터 출력)

select * 
from employee
--where 
order by SALARY asc, COMMISSION desc;

--사원정보 조회 시 사원의 급여가 적은 순부터 출력(급여가 같으면 commission 많은 순부터 출력, commission 같으면 사원이름을 알파벳순(=오름차순) 출력)

select * 
from employee
--where 
order by SALARY asc, COMMISSION desc, ENAME asc;

select ename, salary, commission, dno 
from employee
--where LOWER(ename) like '%a%'
order by SALARY asc, COMMISSION desc, ENAME asc; --[정렬방법 -1]

select ename, salary, commission, dno --index 1 2 3 4 
from employee
order by 2 asc, 3 desc, 1 asc; --[정렬방법 -2]

select ename AS 사원이름, salary "급 여", commission "Cms", dno 부서번호 --컬럼명의 별칭 
from employee
order by "급 여" asc, "Cms" desc, 사원이름 asc; --[정렬방법 -3]

-- ※ 주의:오라클 select 실행순서 참조
select ename AS 사원이름, salary "급 여", commission "Cms", dno 부서번호 --컬럼명의 별칭 
from employee
where ENAME like '%A%'
--where 사원이름 like '%A%'--오류? ORA-00904: "사원이름": invalid identifier
order by "급 여" asc, "Cms" desc, 사원이름 asc;


/*
 *2장 혼자 해보기(65~72p)
 */

--1.덧셈 연산자를 이용하여 모든 사원에 대해서 300의 급여인상을 계산한 후 
--사원의 이름, 급여, 인상된 급여 출력
select ename, salary, salary+300 "300이 인상된 급여"
from employee; 

--2.사원의 이름,급여,연간 총수입을 총 수입이 많은 것부터 작은 순으로 출력
--연간 총수입=월급*12+상여금100
select ename, salary, salary*12+100 "연간 총 수입"
from employee
order by salary*12+100 desc;
--order by 3 desc; --index이용하여 위치 입력
--order by "연간총수입" desc;

--3.'급여가 2000을 넘는' 사원의 이름과 급여를 '급여가 많은 것부터 작은 순'으로 출력
select ename, salary
from employee
where salary > 2000
order by salary desc; 
--order by 2 desc;

--4.사원번호가 7788인 사원의 이름과 부서번호를 출력
select ename, dno
from employee
where eno = 7788;
-- order by

--5.급여가 2000에서 3000 사이에 포함되지 않는 사원의 이름과 급여 출력
select ename, salary
from employee
where 2000 >= salary or salary >= 3000; 
--order by
--[정답x] 이유? 2000과 3000이 포함되지 않아
select ename, salary
from employee
where salary not between 2000 and 3000;

--5-2. 급여가 2000에서 3000 사이에 포함되는 사원의 이름과 급여 출력
-- 2000 < 급여 < 3000
--[정답] 2000에서 3000 사이? 2000과 3000 포함 안 됨
select ename, salary
from employee
where 2000 < salary and salary < 3000; 
--사이의 경우 2000과 3000을 포함하지 않고, between의 경우 2000과 3000을 포함하므로 between 사용x
--order by
--[정답x] 이유? 2000과 3000이 포함되어
select ename, salary
from employee
where salary between 2000 and 3000;

--6.1981년 2월 20일부터 1981년 5월 1일까지 입사한 사원의 이름, 담당업무, 입사일 출력
--오라클의 기본날짜 형식은 'YY/MM/DD'
select ename, job, hiredate
from employee
where '1981-02-20' <= hiredate and hiredate <= '1981-05-01';
--where hiredate between '1981-02-20' and '1981-05-01' ;
--order by

--7.부서번호가 20 및 30에 속한 사원의 이름과 부서번호를 출력하되 
--이름을 기준으로 영문자순으로 출력
select ename, dno
from employee
where dno in (20, 30) 
--where dno = 20 or dno = 30
order by ename asc;


--8.'사원의 급여가 2000에서 3000사이에 포함'되고 '부서번호가 20 또는 30'인 사원의 이름, 급여와 부서번호를 출력하되 
--이름순(오름차순)으로 출력
--[방법1] 잘못된 결과 나옴 
--(이유? 연산자 우선순위로 문제 발생(우선순위 not -> and -> or)
select ename, salary, dno
from employee
where 2000 < salary and salary < 3000 
AND dno = 20 or dno = 30
order by ename asc;

--해결법 : 정확한 결과를 위해 ()로 우선순위 변경
select ename, salary, dno
from employee
where 2000 < salary and salary < 3000 
AND (dno = 20 or dno = 30)
order by ename asc;

--[방법2]
select ename, salary, dno
from employee
where 2000 < salary and salary < 3000 
and dno in (20, 30)
order by ename asc;

--9. 1981년도에 입사한 사원의 이름과 입사일 출력(like연산자와 와일드카드(% _) 사용)
--[방법-1]
select ename, hiredate
from employee
where hiredate like '81%';
--where hired date like '1981%'; 결과없음
--오라클의 기본날짜 형식은 'YY/MM/DD'
--order by

--[방법-2]
--[1]
select *
from employee;
--[2] TO_CHAR(수나 날짜, '서식') : 수나 날짜 -> 문자로 변환
select ename, hiredate, 
 	   TO_CHAR(hiredate, 'yyyy'),
 	   TO_CHAR(hiredate, 'yyyy-mm'),
 	   TO_CHAR(hiredate, 'yyyy-mm-dd')
from employee;
--[3]
select ename, hiredate
from employee
--where TO_CHAR(hiredate,'yyyy') like '1981';--ok
--where TO_CHAR(hiredate,'yyyy') like '1981%';--ok
--where TO_CHAR(hiredate,'yyyy') = '1981';--ok
--where TO_CHAR(hiredate,'yyyy') = '1981%';--결과없음
where TO_CHAR(hiredate,'yyyy-mm') like '1981';--결과없음	
where TO_CHAR(hiredate,'yyyy-mm') like '1981%';--결과없음	

--10.관리자(=상사)가 없는 사원의 이름과 담당업무
select ename, job
from employee
where Manager is null ;
-- order by

--11.'커미션을 받을 수 있는 자격'이 되는 사원의 이름, 급여, 커미션을 출력하되
--급여 및 커미션을 기준으로 내림차순 정렬
select ename, salary, commission
from employee
where commission is not null
order by salary desc, commission desc; 

--12.이름의 세번째 문자가 R인 사원의 이름 표시
select ename
from employee
where ename like '__R%';
--order by

--13.이름에 A와 E를 모두 포함하고 있는 사원이름 표시
select ename
from employee
where ename like '%A%' 
and ename like '%E%';
--order by

--★14.'담당 업무가 사무원(CLERK) 또는 영업사원(SALESMAN)'이면서 
--'급여가 1600,950 또는 1300이 아닌' 사원이름, 담당업무, 급여 출력
select ename, job, salary
from employee
where job in ('CLERK',  'SALESMAN') 
and salary not in(1600, 950, 1300); 
--order by

--15.'커미션이 500이상'인 사원이름과 급여, 커미션 출력
select ename, salary, commission
from employee
where commission > 500; 
--order by
