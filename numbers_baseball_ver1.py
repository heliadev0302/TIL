import random
import time

print("숫자야구게임을 시작하겠습니다")
time.sleep(0.5)

def numbers_baseball():
    com_nums = []
    i = 0
    while i < 3:
        if not com_nums:
            new_nums = random.randint(1,9)
        else:
            new_nums = random.randint(0,9)
        if new_nums not in com_nums:
            com_nums.append(new_nums)
            i += 1
    return com_nums
print("숫자 3개를 모두 골랐습니다.")
time.sleep(1)

def user_numbers():
    print("숫자를 3개를 차례대로 하나씩 입력해주세요")
    user_nums = []
    i = 0
    while i < 3:
        new_nums = int(input("{}번째 숫자를 입력하세요.".format(i+1)))
        if new_nums == 0 and i == 0:
            print("첫번째 숫자는 0이 올 수 없습니다")
            continue
        elif new_nums > 9 or new_nums < 0:
            print("0~9까지 범위 내의 숫자로 다시 입력하세요.")
            continue
        if new_nums in user_nums:
            print("숫자가 중복 되었습니다. 다시 입력하세요.")
        else:
            user_nums.append(new_nums)
            i += 1
    return user_nums

def game_score(user, computer):
    strike = 0
    ball = 0
    out = 0
    i = 0
    while i < 3:
        if user[i] == computer[i]:
            strike += 1
        elif user[i] in computer:
            ball += 1
        else:
            out += 1
        i += 1
    return strike, ball, out

tries = 0
while 1:
    strike, ball, out = game_score(user_numbers(), numbers_baseball())
    print("{}Strike {}Ball {}Out".format(strike, ball, out))

    if strike == 3:
        tries += 1
        break
    else:
        tries += 1

print("축하합니다. {}번 만에 숫자 3개의 값과 위치를 모두 맞추셨습니다.".format(tries))