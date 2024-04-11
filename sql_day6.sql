/* 서브쿼리(subquery): sql내부에서 사용되는 select문 괄호 안에 기술, 복잡한 데이터 추출 
서브쿼리가 먼저 실행된 후 메인 쿼리 실행
select *
from 테이블명
where 컬럼 = (select 컬럼명 from 테이블명);
*/

select *
from 고객
where 마일리지 = (select max(마일리지) from 고객);

/*고객 테이블에서 주문번호가 'H0250' 인 고객에 대해 고객회사명, 담당자명을 추출 */
select 고객회사명, 담당자명
from 고객
inner join 주문
on 고객.고객번호 = 주문.고객번호
where 주문번호 = (select 주문번호 from 주문 where 주문번호 = 'H0250');

SELECT 고객회사명, 담당자명
FROM 고객
INNER JOIN 주문
ON 고객.고객번호 = 주문.고객번호
WHERE 주문번호='H0250';

SELECT 고객회사명, 담당자명
FROM 고객
where 고객번호 = (select 고객번호 from 주문 where 주문번호 = 'H0250');

/* 부산광역시 고객의 최소마일리지보다 더 큰 마일리지를 가진 모든 고객 정보를 추출 */
select *
from 고객
where 마일리지 > (select min(마일리지) from 고객 where 도시 = '부산광역시');

/* 부산광역시 고객의 전체 주문건수를 출력 */
select count(*) as 총주문건수
from 주문 
where 고객번호 in (select 고객번호 from 고객 where 도시 = '부산광역시');

/* 부산광역시 전체 고객의 마일리지를 추출 */
select 마일리지
from 고객
where 마일리지 in (select 마일리지 from 고객 where 도시 = '부산광역시');

/* 부산광역시 전체 고객의 마일리지를 추출  -> 최소 1명 이상의 부산광역시 고객의 마일리지보다 더큰 고객의 정보를 출력*/
/* any: 서브쿼리의 각 결과에 대해 비교 했을때 최소 1건 이상 조건이 만족되는 자료를 추출 */
select *
from 고객
where 마일리지 > any (select 마일리지 from 고객 where 도시 = '부산광역시');

/* 고객 테이블에서 지역별로 마일리지 평균을 구하시오 */
select 지역, avg(마일리지) as 마일리지평균
from 고객
group by 지역;

/* 각 지역의 어느 평균 마일리지보다도 더 큰 마일리지를 갖고있는 고객 정보를 추출 */
/* any: 여러 개 중에 적어도 1개 이상 조건에 부합되면 추춣 */
/* all: 여러 개 중에 모두에 대해 조건에 부합되면 추출 */
select *
from 고객
where 마일리지 > all(select avg(마일리지) as 마일리지평균 from 고객 group by 지역);

/* 고객 중에서 최소 1번 이상 주문한 적이 있다면 해당 고객의 정보를 추출하시오 */
select *
from 고객
where 고객번호 in (select 고객번호 from 주문);

/* exists: 해당데이터가있다면 추출 */
select *
from 고객
where exists (select 고객번호 from 주문 where 고객번호 = 고객.고객번호);

select distinct 고객회사명
from 고객
inner join 주문
on 고객.고객번호 = 주문.고객번호;

/* 고객 전체의 평균 마일리지 보다 평균 마일리지가 큰 도시에 대해 도시명, 도시의 평균마일리지를 추출 */
select 도시, avg(마일리지) as 평균마일리지
from 고객
group by 도시
having avg(마일리지) > (select avg(마일리지) from 고객);

/* DML: 데이터 조작어 */
/* 부서번호: A5, 부서명: 마케팅부 추가 */

select *
from 부서;

insert into 부서
values('A5', '마케팅부');

insert into 제품
values(999, '맛동산', 1500, 10); /* 포당단위 누락 -> 에러발생 */

insert into 제품
values(999, '맛동산', null, 1500, 10);

select *
from 제품;

insert into 제품(제품번호, 제품명, 단가, 재고)
values(888, '새우깡', 2000, 50);

insert into 제품(제품명, 단가, 재고)
values('감자깡', 1000, 50); /* 에러발생, pk값 누락 */

insert into 사원(사원번호, 이름, 직위, 성별, 입사일)
values('E20', '홍길동', '수습사원', '남', curdate());

select * from 사원;

insert into 사원(사원번호, 이름, 직위, 성별, 입사일)
values('E21', '임꺽정', '수습사원', '남', curdate()),
('E22', '신사임당', '수습사원', '여', curdate());

/* update: 데이터를 변경
update 테이블명
set 컬럼 = 값,
컬럼 = 값
where 조건

E01 자료 검색 => 이름: 김소미 변경 
*/
update 사원
set 이름 = '김소미'
where 사원번호 = 'E01';

/* 1) 고래밥, 제품번호:111, 단가: 2500, 재고: 40추가
   2) 고래밥 -> 상어밥으로 변경
   3) 새우깡의 단가를 10%인상
   4) 맛동산의 재고를 10 증가
*/
select * from 제품;

insert into 제품(제품번호, 제품명, 단가 ,재고)
values(111, '고래밥', 2500, 40);

update 제품
set 제품명 = '상어밥'
where 제품번호 = '111';

update 제품
set 단가 = 단가*1.1
where 제품번호 = '888';

update 제품
set 재고 = 재고+10
where 제품번호 = '999';

/*
delete from 테이블명
where 조건 <- 안쓸시 다삭제
*/
select * from 제품;

delete from 제품
where 제품번호 = 999;

select * from 사원
order by 입사일 desc
limit 3;

delete from 사원
order by 입사일 desc
limit 3;

/* 데이터 추가시 이미 데이터가 있으면 값을 변경하고, 없으면 데이터를 제거 */
select * from 부서;

/* A1 부서명: 총무부를 추가 */
insert into 부서(부서번호, 부서명)
values('A1', '총무부')
on duplicate key update
부서명 = '총무부';

/*추가 commit(작업저장 => 복원 x), rollback(복원) */
/* autocommit : 설정(1) */

/*select 문 수행 결과를 다른 테이블 추가 
insert into 테이블명 (컬럼1, 컬럼2,...)
values(값1, 값2,...)

insert into 테이블명 (컬럼1, 컬럼2,...)
select 컬럼1, 컬럼2,...
from 테이블명
where 조건;
*/
/*
insert into 고객(고객번호, 담당자명, 주소 마일리지)
select 고객번호, 담당자명, 주소 마일리지
from 고객2
where 주소 = "서울특별시";
고객2테이블에서 주소가 서울특별시인 고객의 고객번호, 담당자명, 주소 마일리지를 각각 추출하여 고객 테이블의 고객번호, 담당자명, 주소 마일리지열에 추가
*/

create table 고객2
(
고객번호 char(5) primary key,
담당자명 varchar(20),
주소  varchar(50),
마일리지 int
);

select * from 고객2;

insert into 고객2(고객번호, 담당자명, 주소, 마일리지)
values("AAAAA", '홍길동', '서울특별시', 50000);

insert into 고객(고객번호, 담당자명, 주소, 마일리지)
select 고객번호, 담당자명, 주소, 마일리지
from 고객2;

select * from 고객;

/* 1)고객2에 'BBBBB', '임꺽정', '광주광역시', 10000 레고드추가
   2) 고객에 고객번호가 'AAAAA'인 자료 제거
   3) 고객2 테이블에 있는 자료를 고객 테이블에 추가
*/
insert into 고객2(고객번호, 담당자명, 주소, 마일리지)
values('BBBBB', '임꺽정', '광주광역시', 10000);

delete from 고객
where 고객번호 = 'AAAAA';

insert into 고객(고객번호, 담당자명, 주소, 마일리지)
select 고객번호, 담당자명, 주소, 마일리지
from 고객2;

