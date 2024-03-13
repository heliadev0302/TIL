#1 0부터 9999까지 8을 포함 하지 않는 수는 총 몇개일까?
not_eight = 0
for  num in range(10000):
    if '8' not in str(num):
        not_eight += 1

print(not_eight)

#2컴퓨터가 1~100 숫자(정수 범위) 중 하나를 랜덤으로 정합니다. (이를 알려주지 않습니다.)
#사용자는 이 숫자를 맞추어야 합니다.
#입력한 숫자보다 정답이 크면 → "UP" 출력,
#입력한 숫자보다 정답이 작으면 → "DOWN" 출력.
#정답을 맞추면 → "정답"을 출력하고, 지금까지 숫자를 입력한 횟수를 알려줍니다.

import random

ans = random.randint(1,100)
count = 1

while True:
    you_ans = int(input('1~100 숫자 입력: '))
    if ans == you_ans:
        print(f'정답입니다. {count}회 만에 맞췄어요.')
        break
    elif ans > you_ans:
        print('Up')
    else:
        print('Down')
    count += 1

#3 .직각삼각형의 밑변이 x, 높이가 y일 때 남은 변(대각선)의 길이를 구하는 함수를 만들어주세요.
def res(x, y):
    return (x**2 + y**2)**(1/2)
res(9,12)


#4 0~9까지의 문자로 된 숫자를 입력 받았을 때, 이 입력 값이 0~9까지의 숫자가 각각 한 번 씩만 사용된 것인지 확인하는 함수를 구하시오.
compare_data = list(range(10))
data = list(input('sample inputs:').split())
res = []
for i in range(len(data)):
    for j in range(len(compare_data)):
        if(data[i].count(str(j)) != 1):
            print(str(i).count(str(j)))
            res.append('false')
            break
        if(j == 9):
            res.append('true')
print(res)


#5 양의 정수만 입력으로 받고 그 수의 자릿수를 출력해보자
data = int(input())
print(f'{len(data)}자리수')

 #6  A사무실에는 특정일자의 출퇴근 시간이 기록된 거대한 로그파일이 있다고 한다.

#파일의 형식은 다음과 같다. (한 라인에서 앞부분은 출근시간(HH:MM:SS), 뒷부분은 퇴근시간이다)

#09:12:23 11:14:35
#10:34:01 13:23:40
#10:34:31 11:20:10
#특정시간을 입력(예:11:05:20)으로 주었을 때 그 시간에 총 몇 명이 사무실에 있었는지 알려주는 함수를 작성하시오.
from datetime import datetime
date_form = "%H:%M:%S" 
datas = ['09:12:23', '11:14:35',
        '10:34:01', '13:23:40',
        '10:34:31', '11:20:10']

input_time = datetime.strptime(input(), date_form)

people = 0
for i in range(0,len(datas),2):
    datas_i = datetime.strptime(datas[i], date_form)
    datas_j = datetime.strptime(datas[i+1], date_form)
    if(datas_i < input_time < datas_j):
        people += 1

print(people)