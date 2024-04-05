-- select 고객번호, 
-- 		담당자명,
-- 		도시, 
-- 		마일리지
-- from 고객
-- where 도시='서울특별시'
-- order by 담당자명 desc; /* asc: 오름, desc : 내림차순 정렬 */고객고객

select 고객번호, 
		담당자명,
		도시, 
		마일리지
from 고객
order by 도시, 담당자명 desc; /* asc는 생략 가능 */

select *
from 고객
order by 3 desc
limit 5;


-- 고객 테이블에서 마일리지가 가장 높은 10명의 고객 정보를 모두조회하시오

select *
from 고객
order by 마일리지 desc
limit 10;

-- 담장자직위가 '영업 사원'이 아닌 모든 고객의 정보를 추출
select * from 고객 where 담당자직위 != '영업 사원';

-- 도시가 부산광역시면서 마일리지가 1000점 이상
select *
from 고객
where 도시 = '부산광역시' and 마일리지 >= 1000;

-- 담장자 직위가 '영업사원'이거나 도시가 '서울 특별시'인 고객 검색

select *
from 고객
where 담당자직위 = '영업 사원' or 도시 = '서울특별시';

-- 담장자 직위가 '영업 과장'이 아니거나 마일리지가 10000점이상인고객검색
select *
from 고객
where 담당자직위 != '영업 과장' or 마일리지 >= 10000;

-- 도시가 '서울 특별시'이거나 마일지가 1000점 이상이면서 담장자 직위가 '영업사원'이면 추출
select *
from 고객
where 도시 = '서울특별시' or 마일리지 >= 1000 and 담당자직위 = '영업 사원';

-- '부산광역시'에 거주하거나 마일리지가 1000점보다 작은 고객에 대해
-- 고객번호, 담장명 ,마일리지, 도시를 출력하시오 고객번호를 기준으로 정려
select 고객번호, 담장명 ,마일리지, 도시
from 고객
where 도시 = '부산광역시' or 마일리지 < 1000
order by 고객번호;

select 담당자명, 마일리지, 도시, 주소
from 고객 
where 도시 = '부산광역시'
union
select 담당자명, 마일리지, 도시, 주소
from 고객 
where 마일리지 < 1000
order by 마일리지;

select * from 고객;

select * from 고객 where 지역 = "";
select * from 고객 where 지역 IS NULL;
-- null은 알수 없는값, ""는 빈 문자열

/* CSV(비어있는 셀에는 "" 빈문자열이 저장) -> 테이블로 import 

n=null
바구니(변수)가 준비되어 있는 상태, 사과(값)가 들어있다
바구니=사과
바구니(변수)만 준비되어 있다
바구니=null
바구니(변수)가 준비되어 있으며, 아무것도 없다(먹어서 없는것인지, 원래 없던것인지는 모름)
바구니=""
그래서 바구니를 참조할때
바구니 IS NULL 문장과 바구니=""는 다르다.
고객 테이블에서 지역이 빈 문자열이면 모두 NULL로변경하시오
변경: update 테이블명 set  열 = 값 where 조건식;
*/

update 고객
set 지역 = null
where 지역 = "";

select * from 고객
where 지역 IS NULL;

select * from 고객 where 지역 = "";
update 고객
set 지역 = null
where 지역 = "";

/*update시 에러 발생 -> safe mode 해제(edit -> prefences -> sql editor)
-> safe updates 항목 체크 해제! -> workbench 재시작 */
use 한빛무역;

UPDATE 고객
SET 지역 = NULL
WHERE 지역 = "";

select * from 고객 WHERE 지역="";

select * from 고객
where 담당자직위 in ('영업 과장', '마케팅 과장');

-- 마일리지가 5만점이상 20만점이하인 고객을 추출하시오
select *
from 고객
where 마일리지 between 50000 and 200000;

/* %문자 여러개, _:문자한개 */

select *
from 고객
where 도시 like "대전광역시";

select *
from 고객
where 도시 like "%광역시";
select *
from 고객
where 도시 like "%광역%";
select *
from 고객
where 도시 like "%천광%";

select *
from 고객
where 도시 like "__특%";

select *
from 고객
where 도시 like "__광%";

-- 주소 중에서 '중구'에 해당되는 자료를 모두 추출alter
select *
from 고객
where 주소 like "%중구%";

-- 도시가 '광역시' 이면서 고객번호의 2번째 또는 3번쨰극자가 'c'인 고객 정보추출
select *
from 고객
where 도시 like "%광역시" and (고객번호 like "_C%" or 고객번호 like "__C%");
-- 1
select *
from 고객 
where 주소 = "서울특별시" and (마일리지 between 50000 and 200000);

-- 2
select 지역, 도시
from 고객 
order by 지역, 도시;

-- 3
select *
from 고객
where 도시 = "춘천시" or 도시 = "과천시" or 도시 = "광명시" 
and (담장자직위 = "이사" or 담장자직위 = "사원");

-- 4
select *
from 고객
where 도시 NOT LIKE "%광역시" or 도시 NOT LIKE "%특별시"
order by 마일리지 desc
Limit 3;

-- 5
select *
from 고객
where 지역 IS NOT NULL and 담장자직위 != "대표이사";

-- 6
select *
from 고객
where 전화번호 LIKE "%45";

-- 7
select *
from 고객
where 전화번호 LIKE "%45_";

-- 8
select *
from 고객
where 전화번호 LIKE "%45&";





