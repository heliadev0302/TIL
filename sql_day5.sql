select *from 주문;

select * from 부서;  /*4건 자료*/
select * from 사원; /*10건 자료*/

select * from 부서 cross join 사원;

select * 
from 부서 
cross join 사원
where 이름= '이소미';

/*ANSI SQL*/
select 부서.부서번호,부서명, 이름, 사원.부서번호 as 사원부서번호  
from 부서 
cross join 사원
where 이름= '이소미';

/*NON-ANSI SQL*/
select 부서.부서번호,부서명, 이름, 사원.부서번호 as 사원부서번호  
from 부서, 사원
where 이름= '이소미';

select * from 사원; /* 10건 */

select * from 부서; /* 부서번호, 부서명 4건 */

select *
from 사원
inner join 부서
on 사원.부서번호 = 부서.부서번호
where 이름 = '이소미';

select *
from 사원, 부서
where 사원.부서번호 = 부서.부서번호 and 이름 = '이소미';

select *
from 고객;

select *
from 주문;

select *
from 고객
inner join 주문
on 고객.고객번호 = 주문.고객번호;

select 고객.고객번호, 담당자명, 고객회사명, count(*) as 주문건수
from 고객
inner join 주문
on 고객.고객번호 = 주문.고객번호
group by 고객.고객번호, 담당자명, 고객회사명
order by count(*) desc;

select 고객.고객번호, 담당자명, 고객회사명, count(*) as 주문건수
from 고객, 주문
where 고객.고객번호 = 주문.고객번호
group by 고객.고객번호, 담당자명, 고객회사명
order by count(*) desc;

select 고객번호, 고객회사명, 담당자명
from 고객;

select *
from 주문;

select 고객.고객번호, 고객회사명, 담당자명
from 고객
inner join 주문
on 고객.고객번호 = 주문.고객번호;

select *
from 주문세부;

/*고객별 주문 금액의 합계: SUM(주문수량 * 단가)를 출력(내림차순)*/
SELECT 고객.고객번호, 고객회사명, 담당자명,SUM(주문수량 * 단가) AS 주문금액합계
FROM 고객
INNER JOIN 주문
ON 고객.고객번호 = 주문.고객번호
INNER JOIN 주문세부
ON 주문.주문번호 = 주문세부.주문번호
GROUP BY 고객.고객번호, 고객회사명, 담당자명;

SELECT * FROM 한빛무역.고객;

select *
from 주문세부;

select 고객번호, 담당자명, 마일리지, 등급명, 하한마일리지, 상한마일리지
from 고객
cross join 마일리지등급
where 담당자명 = '이은광';

/*고객 테이블에서 담당자명이 '이은광'인 경우의 고객번호, 고객회사명
,담당자명, 마일리지, 마일리지등급을 출력*/
/*고객 테이블의 마일리지 값을 마일리지 등급 테이블의 하한, 
상한마일리지 값의 범위에 따라 조인*/
select 고객번호, 고객회사명, 담당자명, 마일리지, 등급명
from 고객
inner join 마일리지등급
on 마일리지 >= 하한마일리지 and 마일리지 <= 상한마일리지
where 담당자명 = '이은광';

select 고객번호, 고객회사명, 담당자명, 마일리지, 등급명
from 고객
inner join 마일리지등급
on 마일리지 between 하한마일리지 and 상한마일리지
where 담당자명 = '이은광';

/*사원 테이블을 기준으로 부서 테이블과 외부 조인 */
select *
from 사원
left outer join 부서/*left, right, full(mysql 지원x -> union 사용)*/
on 사원.부서번호 = 부서.부서번호
where 성별 = '여'; 

/*부서 테이블을 기준으로 사원 테이블과 외부 조인 */
select *
from 사원
right outer join 부서/*left, right, full(mysql 지원x -> union 사용)*/
on 사원.부서번호 = 부서.부서번호; 

/*사원테이블(기준)과 부서테이블을 외부조인(부서번호)
=> 사원테이블의 부서번호가 NULL인 부서명을 출력하시오*/
select 부서명
from 사원
right outer join 부서
on 사원.부서번호 = 부서.부서번호
where 사원.부서번호 is null; 

/*소속 부서가 없는 사원의 이름과, 부서번호, 부서명을 출렷하시오*/
select 이름,부서.부서번호,부서명
from 사원
left outer join 부서
on 사원.부서번호 = 부서.부서번호
where 부서명 is null;

/* 셀프조인- 사원번호, 사원이름, 상사의사원번호, 상사의 이름 출력 */
select 사원.사원번호, 사원.이름, 상사.사원번호 as '상사사원번호', 상사.이름 as '상사이름'
from 사원
inner join 사원 as 상사
on 사원.상사번호 = 상사.사원번호;

/* 사원이름, 직위, 상사이름을 상사이름 순으로 정렬해서 출력
상사가 없는 사원의 이름도 함계 출력
-셀프 조인으로 상사와 사원 정보를 확인, 외부 조인으로 상사가 없는 사원 정보를 확인*/
select 사원.이름, 사원.직위, 상사.이름 as '상사이름'
from 사원
left outer join 사원 as 상사
on 사원.상사번호 = 상사.사원번호
order by 상사.이름;

-- 1
select 제품명,sum(주문수량) as 주문수량합, sum(주문수량*주문세부.단가) as 주문금액합
from 제품
inner join 주문세부
on 주문세부.제품번호 = 제품.제품번호
group by 제품명;

-- 2
select year(주문일), 제품명, sum(주문수량) as 주문수량합
from 주문세부
inner join 제품
on 주문세부.제품번호 = 제품.제품번호
inner join 주문
on 주문.주문번호 = 주문세부.주문번호
where 제품명 like "%아이스크림%" 
group by year(주문일), 제품명;

-- 3
select 제품명, sum(주문수량) as 주문수량합
from 제품
left outer join 주문세부
on 제품.제품번호 = 주문세부.제품번호
group by 제품명;