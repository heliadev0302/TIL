#1.10미만의 자연수에서 3과 5의 배수를 구하면 3,5,6,9이다. 이들의 총합은 23이다. 1000미만의 자연수에서 3,5의 배수의 총합을 구하라.
samoh = 0
for i in range(0,1000):
    if (i%3 == 0 or i%5 == 0):

        samoh += i

#print(samoh)

#2
# 어떤 자연수 n이 있을 때, d(n)을 n의 각 자릿수 숫자들과 n 자신을 더한 숫자라고 정의하자.
# 예를 들어
# d(91) = 9 + 1 + 91 = 101
# 이 때, n을 d(n)의 제네레이터(generator)라고 한다. 위의 예에서 91은 101의 제네레이터이다.
# 어떤 숫자들은 하나 이상의 제네레이터를 가지고 있는데, 101의 제네레이터는 91 뿐 아니라 100도 있다.
# 그런데 반대로, 제네레이터가 없는 숫자들도 있으며, 이런 숫자를 인도의 수학자 Kaprekar가 셀프 넘버(self-number)라 이름 붙였다.
# 예를 들어 1,3,5,7,9,20,31 은 셀프 넘버 들이다.
# 1 이상이고 5000 보다 작은 모든 셀프 넘버들의 합을 구하라.
# 1<= n <5000
def d(n):
    res = 0
    n = str(n)
    for i in n:
        res += int(i)
    return res + int(n)

lst1 = list(i for i in range(1, 5000))
lst2 = []
for i in range(1,5000):
    lst2.append(d(i))

result = list(i for i in lst1 if i not in lst2)
res = 0
for i in result:
    res += i

print(*result)
print(f'총합: {res}')
print(f'총 개수는 {len(result)}')
#3 1차원의 점들이 주어졌을 때, 그 중 가장 거리가 짧은 것의 쌍을 출력하는 함수를 작성하시오. (단 점들의 배열은 모두 정렬되어있다고 가정한다.)
# 예를들어 S={1, 3, 4, 8, 13, 17, 20} 이 주어졌다면, 결과값은 (3, 4)가 될 것이다.

# S={1, 3, 4, 8, 13, 17, 20}
S={1, 9, 40, 100, 13, 17, 21}
S_list = list(S)
S_list.sort()
best_couple = []
for i, num in enumerate(S_list):
    if i == 1: # 1 이전은 계산하지 않음
        best_couple = [S_list[i-1],S_list[i]]
        best = abs(S_list[i-1] - S_list[i])
    elif i > 1: # 1이 넘어간 시점에서 계산
        if(best > abs(S_list[i-1] - S_list[i])): # 이미 순서대로 정렬해놓았으므로 순차적으로 비교
            best_couple = [S_list[i-1],S_list[i]]
            best = abs(S_list[i-1] - S_list[i])

print(f'최적 조합은 {best_couple}')
print(f'간격은 {best}')

#4 초보자 프로그래머 홍길동은 사용자가 입력한 양의정수(범위는 int)각 자리수를 더해 출력하는 프로그램을 만들고 싶어한다.
# ex) 5923의 결과는 5+9+2+3인 19이다 ex) 200의 결과는 2+0+0인 2이다 ex) 6719283의 결과는 6+7+1+9+2+8+3인 36이다.
num = int(input("숫자를 입력하시오:"))

def num_hap(num):
    newnum = str(num)
    hap = 0
    for newnums in newnum:
        hap += int(newnums)
    return  hap

print(num_hap(num))


