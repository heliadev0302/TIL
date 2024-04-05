use 한빛무역;

select sum(마일리지)
from 고객
where 도시 = '대전광역시';

/*
select 집계함수
from 테이블명
조건절
*/

select count(*)
from 고객;

select count(고객번호)
from 고객;

select count(지역)
from 고객; /*null 제외 */

select count(*), count(도시), count(고객번호), count(지역)
from 고객; /*null 제외 */

select sum(마일리지), avg(마일리지), min(마일리지), max(마일리지)
from 고객;

/* 고객 테이블에서 '서울특별시' 고객에 대한 마일리지합, 최대 마일리지, 최소마일리지, 평균 마일리지 출력 */

select sum(마일리지), max(마일리지), min(마일리지), avg(마일리지)
from 고객
where 도시 = "서웉특별시";

/* group by절: 그룹별로  묶어서 요약
select 그룹으로 묶을열, 집계함수
from 테이블명
[where 조건절]
group by 그룹으로 묶을 열(번호)
*/

/*도시 단위로 그룹화 -> 그룹별 마일리지의 합계 */
select 도시, sum(마일리지) as 마일리지합계, avg(마일리지) as 마일리지평균
from 고객
group by 1;

/*각 도시별 '고객수' 열을 추가 */
select 도시, count(도시) as 고객수
from 고객
group by 도시;

select * from 고객;

select 담당자직위
from 고객
group by 담당자직위;

select 도시
from 고객
group by 도시;

/* 담당자직위별로 그룹화, 같은 담당자직위에 대해서 도시별로 그룹화 -> 집계 */
select 담당자직위, 도시, avg(마일리지) as 평균마일리지, count(*) as 고객수
from 고객
group by 담당자직위, 도시;

/* having 절: group by에 대한 조건
select 그룹으로 묶을 열, 집계함수
from 테이블명
[where 조건절]
group by 그룹으로 묶을 열(번호)
[having 절];
*/
/*도시별로 그룹화, 고객수, 평균마일리지 출력 */
select 도시, count(*) as 고객수, avg(마일리지) as 평균마일리지 
from 고객 
group by 도시;

/* 이중에 고객수가 3명이상인 레코드만출력 */
select 도시, count(*) as 고객수, avg(마일리지) as 평균마일리지 
from 고객 
group by 도시
having count(*) >= 3;

/*
1) 고객테이블에서 고객 번호 T로 시작하는 고객을 검색하시오
2) T로 시작하는 고객을 도시별로 묶어서 고객의 마일리지 합계를 구하세요
3) 이때 마일리지 합계가 500점 이상인 데이터만 출력
*/
select 도시, sum(마일리지) as 마일리지합
from 고객
where 고객번호 like "T%"
group by 도시
having sum(마일리지) >= 500;

/* '광역시' 고객에 대해 담당자직위별로 최대마일리지를 출력하는데,
최대마일리지가 5000점 이상인 레코드만 출력하시오 */
select 담당자직위, max(마일리지) as 최대마일리지
from 고객
where  도시 like "%광역시"
group by 담당자직위 
having 최대마일리지 >= 5000;

/* with rollup:  그룹별 소계, 전체 총계 구하고자 할때 사용*/
select 도시, count(*) as 고객수, avg(마일리지) as 평균마일리지
from 고객
where 지역 is null
group by 도시
with rollup;

/*담당자직위에 '마케팅'이 포함된 고객에대해,
고객(담당자직위, 도시)별 고객수를 출력
담당자 직위 도시 고객수 */

select 담당자직위, 도시, count(*) as 고객수
from 고객
where 담당자직위 like "%마케팅%"
group by 담당자직위, 도시
with rollup;