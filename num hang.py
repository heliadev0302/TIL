import random
import time

def Menu():
    print("===================MENU===================")
    print("===============1.숫자 야구==================")
    print("===============2.행맨 게임==================")
    print("===========================================")

def numbers_baseball():
    print("숫자야구게임을 시작하겠습니다")
    time.sleep(0.5)

    # Generate random numbers
    com_nums = []
    i = 0
    while i < 4:
        if not com_nums:
            new_nums = random.randint(1, 9)
        else:
            new_nums = random.randint(0, 9)
        if new_nums not in com_nums:
            com_nums.append(new_nums)
            i += 1

    tries = 0
    while True:
        print("숫자를 4개를 차례대로 하나씩 입력해주세요")
        user_nums = []
        i = 0
        while i < 4:
            new_nums = int(input("{}번째 숫자를 입력하세요.".format(i + 1)))
            if new_nums == 0 and i == 0:
                print("첫번째숫자는 0이 올수없습니다")
                continue
            elif new_nums > 9 or new_nums < 0:
                print("0~9까지 범위내의 숫자로 다시 입력 세요.")
                continue
            if new_nums in user_nums:
                print("숫자가 중복되었습니다. 다시입력하세요.")
            else:
                user_nums.append(new_nums)
                i += 1

        strike = 0
        ball = 0
        out = 0
        for i in range(4):
            if user_nums[i] == com_nums[i]:
                strike += 1
            elif user_nums[i] in com_nums:
                ball += 1
            else:
                out += 1

        print("{}Strike {}Ball {}Out".format(strike, ball, out))

        if strike == 4:
            tries += 1
            print("축하합니다. {}번 만에 숫자 4개의 값과 위치를 모두 맞추셨습니다.".format(tries))
            Menu()
            break

        else:
            tries += 1

        if tries == 9:
            print("기회를 9번 안에 못 맞쳐서 패배 했습니다.")
            print("답은 {} 였습니다.".format(com_nums()))
            Menu()
            break
def hangman():
    words = ["account",
             "act",
             "agreement",
             "air",
             "amount",
             "animal",
             "answer",
             "art",
             "attack",
             "attempt",
             "attention",
             "back",
             "balance",
             "base",
             "behavior",
             "birth",
             "bit",
             "bite",
             "blood",
             "blow",
             "body",
             "bread",
             "breath",
             "brother",
             "business",
             "butter",
             "canvas",
             "care",
             "cause",
             "chance",
             "change",
             "cloth",
             "color",
             "company"
             "control",
             "cook",
             "copy",
             "country",
             "credit",
             "crush",
             "cry",
             "current",
             "curve",
             "damage",
             "danger",
             "day",
             "death",
             "degree",
             "design",
             "detail",
             "development",
             "discovery",
             "disgust",
             "drink",
             "dust",
             "earth",
             "edge",
             "effect",
             "end",
             "error",
             "event",
             "example",
             "exchange",
             "fact",
             "fall",
             "family",
             "father",
             "fiction",
             "field",
             "fight",
             "fire",
             "flame",
             "flower",
             "food",
             "force",
             "friend",
             "front",
             "fruit",
             "glass",
             "gold",
             "government",
             "grain",
             "grass",
             "group",
             "guide",
             "harmony",
             "hate",
             "heat",
             "help",
             "history",
             "hole",
             "hope",
             "hour",
             "ice",
             "idea",
             "ink",
             "insect",
             "invention",
             "jelly",
             "join",
             "jump",
             "kick",
             "kiss",
             "land",
             "language",
             "low",
             "lead",
             "level",
             "lift",
             "light",
             "limit",
             "list",
             "look",
             "loss",
             "love",
             "man",
             "manager",
             "mark",
             "market",
             "meat",
             "meeting",
             "memory",
             "metal",
             "angle",
             "ant",
             "apple",
             "arm",
             "army",
             "baby",
             "bag",
             "ball",
             "band",
             "basket",
             "bath",
             "bed",
             "bee",
             "bell",
             "berry",
             "bird",
             "board",
             "boat",
             "bone",
             "book",
             "boot",
             "bottle",
             "box",
             "boy",
             "brain",
             "button",
             "cake",
             "camera",
             "card",
             "cart",
             "cat",
             "cheese",
             "chess",
             "circle",
             "clock",
             "cloud",
             "coat",
             "cow",
             "cup",
             "dog",
             "door",
             "dress",
             "drop",
             "ear",
             "egg",
             "engine",
             "eye",
             "face",
             "farm",
             "feather",
             "finger",
             "fish",
             "flag",
             "floor",
             "fly",
             "foot",
             "fork",
             "fowl",
             "frame",
             "garden",
             "girl",
             "glove",
             "goat",
             "gun",
             "hair",
             "hammer",
             "hand",
             "hat",
             "head",
             "heart",
             "hook",
             "horn",
             "horse",
             "hospital",
             "house",
             "island",
             "jewel",
             "kettle",
             "key",
             "middle",
             "milk",
             "mind",
             "mine",
             "minute",
             "mist",
             "money",
             "month",
             "morning",
             "mother",
             "motion",
             "mountain",
             "move",
             "music",
             "name",
             "nation",
             "need",
             "news",
             "night",
             "noise",
             "note",
             "number",
             "owner",
             "page",
             "pain",
             "paint",
             "paper",
             "part",
             "paste",
             "peace",
             "person",
             "place",
             "plant",
             "play",
             "point",
             "poison",
             "polish",
             "porter",
             "position",
             "powder",
             "power",
             "price",
             "push",
             "quality",
             "question",
             "rain",
             "range",
             "rate",
             "ray",
             "rhythm",
             "rice",
             "river",
             "road",
             "roll",
             "room",
             "rub",
             "rule",
             "run",
             "salt",
             "sand",
             "scale",
             "science",
             "sea",
             "seat",
             "self",
             "sense",
             "size",
             "sky",
             "sleep",
             "slip",
             "slope",
             "smash",
             "smell",
             "smile",
             "smoke",
             "sneeze",
             "snow",
             "soap",
             "stone",
             "stop",
             "story",
             "summer",
             "support",
             "surprise",
             "swim",
             "system",
             "talk",
             "taste",
             "umbrella",
             "worm",
             ]

    word = random.choice(words)
    life = 10
    user_words = []

    while life > 0:
        new_word = input("알파벳를 입력하세요: ")
        if life != 1:
            print("한 글자만 입력하세요.")
            continue

        user_words.append(new_word)
        time.sleep(0.5)

        if new_word not in word:
            life -= 1
            print("틀렸습니다! 남은 목숨:", life)

        for letter in word:
            if letter in user_words:
                print(letter, end=" ")
            else:
                print("_", end=" ")

        print()
        dap = True
        for letter in word:
            if letter not in user_words:
                dap = False
                break
        if dap:
            print("축하합니다! 정답입니다.")
            Menu()
            break

    if life == 0:
        print("!!!게임 종료!!! 정답은:", word)
        Menu()


while True:
    Menu()
    choice = input("게임을 선택하세요.")

    if choice == '1':
        numbers_baseball()
    elif choice == '2':
        hangman()
    else:
        exit()
