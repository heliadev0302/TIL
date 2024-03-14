#1.주어진 문자열(공백 없이 쉼표로 구분되어 있음)을 가지고 아래 문제에 대한 프로그램을 작성하세요.

#이유덕,이재영,권종표,이재영,박민호,강상희,이재영,김지완,최승혁,이성연,박영서,박민호,전경헌,송정환,김재성,이유덕,전경헌

#1)김씨와 이씨는 각각 몇 명 인가요?
#2)"이재영"이란 이름이 몇 번 반복되나요?
#3)중복을 제거한 이름을 출력하세요.
#4)중복을 제거한 이름을 오름차순으로 정렬하여 출력하세요.
names = "이유덕,이재영,권종표,이재영,박민호,강상희,이재영,김지완,최승혁,이성연,박영서,박민호,전경헌,송정환,김재성,이유덕,전경헌"
names
name_lst = names.split(",")
kim = 0
lee = 0

for n in name_lst:
    if (n[0] == '김'):
        kim += 1
    elif (n[0] == '이'):
        lee += 1
print("김씨 수:", kim)
print("이씨 수:", lee)
leejaeyoung = 0

for n in name_lst:
    if(n == '이재영'):
        leejaeyoung += 1
print("이재영이름 반복수:",leejaeyoung)
single = list(set(name_lst))
single.sort()
print(single)

# 2.n개의 정수를 가진 배열이 있다. 이 배열은 양의정수와 음의 정수를 모두 가지고 있다.
# 이제 당신은 이 배열을 좀 특별한 방법으로 정렬해야 한다.
# 정렬이 되고 난 후, 음의 정수는 앞쪽에 양의정수는 뒷쪽에 있어야 한다.
# 또한 양의정수와 음의정수의 순서에는 변함이 없어야 한다.
# 예. -1 1 3 -2 2 ans: -1 -2 1 3 2
data = '-1 1 3 -2 2'
data_to_list = data.split()
plus = []
minus = []


m = list(i for i in data_to_list if int(i)<0)
p = list(i for i in data_to_list if int(i)>0)
print(*(m+p))

# 3.디지털 시계에 하루동안(00:00~23:59) 3이 표시되는 시간을 초로 환산하면 총 몇 초(second) 일까요?

# 디지털 시계는 하루동안 다음과 같이 시:분(00:00~23:59)으로 표시됩니다.

# 현재 시각 : 01시 3분 00초~59초이라면 -> 60초
# 현재 시각 : 03시 정각 -> 03시00분00초~3시59분59초 -> 1시간
# 13:00

# 00:00 (60초간 표시됨)
# 00:01
# 00:02
# ...
# 23:59
h = 0 # 시간 횟수
m = 0 # 분 횟수
for i in range(24):
    if '3' in str(i): # 시간 단위에 3이 들어가면
        h += 1
    else:
        for j in range(60):
            if '3' in str(j): # 분 단위에 3이 들어가면
                m += 1
h = h * 60 * 60
m = m * 60
print('시, 분만 계산했을 때,',h+m,'초동안 3의 숫자를 가짐')


# 4.A씨는 두 개의 버전을 비교하는 프로그램을 작성해야 한다.
# 버전은 다음처럼 "." 으로 구분된 문자열이다.

# 버전 예) 1.0.0, 1.0.23, 1.1

# 두 개의 버전을 비교하는 프로그램을 작성하시오.
# 다음은 버전 비교의 예이다.

# 0.0.2 > 0.0.1
# 1.0.10 > 1.0.3
# 1.2.0 > 1.1.99
# 1.1 > 1.0.1

front_v, back_v = input('입력 예시: 1.0.0 1.0.23').split()
f, b = front_v.split('.'), back_v.split('.')
best_len = 0
if len(f)>len(b):
    best_len = len(f)
else:
    best_len = len(b)
for i in range(best_len):
    if(f[i]>b[i]):
        print(front_v,'>', back_v)
    elif(f[i]<b[i]):
        print(back_v, '<', front_v)
# 5.수 범위 입력받아 범위 내에 있는 각 숫자를 분해하여 곱한 결과의 전체합을 구하시오.
# 예로, 10~15까지의 각 숫자 분해하여 곱하기의 전체 합은 다음과 같다.

# 10 = 1 * 0 = 0
# 11 = 1 * 1 = 1
# 12 = 1 * 2 = 2
# 13 = 1 * 3 = 3
# 14 = 1 * 4 = 4
# 15 = 1 * 5 = 5

# 그러므로, 이 경우의 답은 0+1+2+3+4+5 = 15

num1, num2 = map(int, input().split())
sum = 0
for i in range(num1, num2+1):
    text = ''
    for j in str(i):
        if(j != '0'):
            text += j+'*'
        else:
            text += '0*'
    print(text[:-1])
    sum += eval(text[:-1])
print(sum)
