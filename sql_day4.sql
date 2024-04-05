use 한빛무역;
select char_length("hello"),
char_length("반갑습니다"), 
length("hello"),
length("반갑습니다");

select concat("반갑습니다", "안녕하세요", "잘거가세요"),
concat_ws("-","반갑습니다", "안녕하세요", "잘거가세요");

select left("ai 서비스 개발", 5),
right("ai 서비스 개발", 5),
substr("ai 서비스 개발",2 ,4),
substr("ai 서비스 개발",2);

/* 왼쪽에서 2번째 공백 이후를 모두 제거 */
select substring_index("서울특별시 강남구 역삼동", " ", 2);
select substring_index("강북구강남구영등포구", "구", 2);

/* 오른쪽에서 2번째 공백 이전를 모두 제거 */
select substring_index("서울특별시 강남구 역삼동", " ", -2);

select lpad('sql', 5, "#");
select rpad('sql', 5, "#");

/*공백 제거 */
select ltrim("    sql    ");
select rtrim("    sql    ");
select trim("    sql    ");

/* 양쪽, 왼쪽, 오른쪽 동일 문자열 제거 */
select trim(both "ab" from "ababcdab");
select trim(leading "ab" from "ababcdab");
select trim(trailing "ab" from "ababcdab");

/*field (찾고자하는 문자열, 문자열1...)*/
select field("java", "sql", "java", "c");
select find_in_set("java", "sql,java,c");

/*instr(문자열, 찾고자하는 문자열)*/
select instr("네 인생을 살아라", "인생");
select locate("인생", "네 인생을 살아라");

/* elt(찾을문자열위치, "문자열1",...) */
select elt(2, "sql", "java", "c");

/* 문자열 반복 함수 repeat(문자열,횟수) */
select repeat("z",10);

/* 문자열 치환 함수 replace("문자열", "원래문자열", "바꿀문자열") */
select replace("010.1234.5678", ".", "-");

/*문자열 뒤집기