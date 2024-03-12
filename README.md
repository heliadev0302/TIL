# Python Day 5
match(),
search() 등등 관련 코드

## 코드 사용 용어
[^범위]+ : [] 안에 ^는  낫의 의미

^[범위]+ : ^를 []앞에 붙이면 특정 문자(범위)로 시작하는 패턴식 즉 는 1개이상의 범위로 시작하는 문자열인 경우 매칭된다

[범위]+$ / [범위]*$ : 특정 문자(숫자) 범위로 끝나는지 확인

[0-9] == \d

숫자를 제외한 모든 문자 == \D ==[^0-9]

[a-zA-Z0-9] == \w

[^a-zA-Z0-9] == \W

\s : 공백, 줄바꿈, 탭

findall(): search와다르게  다찾아주며 리스트로 나온다

finditer(): 공백 기준으로 문자(숫자)들이 나눠서 결과값으로 나옴

ex) res = re.finditer("[a-zA-Z]+", "Do you have some money")

실행결과: <re.Match object; span=(0, 2), match='Do'>
<re.Match object; span=(3, 6), match='you'>
<re.Match object; span=(7, 11), match='have'>
<re.Match object; span=(12, 16), match='some'>
<re.Match object; span=(17, 22), match='money'>

### (정규식)(정규식) / 그룹 : (정규식)

ex) res = re.match("([0-9]+) ([0-9]+)", "100 200 300")
 
 res.group() 패턴에 매치 된 문자열을 튜플 형식으로 리턴


 ### 패턴 구룹에 대한 이름 부여 / (?P<그룹이름>정규식)
 ex)
 
 import re

res = re.match("(?P<func>[a-z]+)", "print(100)")

res.group('func') 실행시 -> 'print' = func 그룹이름에 해당되는 패턴에 매치된 문자열을 리턴

### re.sub("정규식", "바꿀 문자열", "문자열", "변경횟수") / 자연어처리에서 문자열 전처리시 많이 사용되는 함수  /  변경횟수는 생략시 매칭된 문자열을 모두 변경
ex)

def func_db(test):
    return str(int(test.group())*10)
re.sub("\d+",func_db,"1 2 3 abc 4 def") => 10 20 30 abc 4 def
 
윗코드를 더 간결하게 하고 싶다면 lambda를 사용하면된다
re.sub("\d+", lambda x: str(int(x.group())*10),test) 이렇게 쓰면 결과는 같으나 더 간결하다