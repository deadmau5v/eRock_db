import random

import faker


class Creater:
    def __init__(self, name, duplicate=False):
        self.datas = []  # 用于去重
        self.name = name
        self.duplicate = duplicate

    def create(self):
        pass


class UUID(Creater):
    # 3ac2db54-3435-4261-965d-b86e4cc07507  36位UUID
    def __init__(self, ):
        super().__init__("UUID")

    def create(self):
        import uuid
        res = str(uuid.uuid4())
        if self.duplicate:
            return res
        else:
            while res in self.datas:
                res = str(uuid.uuid4())
            self.datas.append(res)
            return res


class Number(Creater):
    # 0..1..2..3  999..1000..1001 连续的数字
    def __init__(self, start=0, end=100000):
        super().__init__("连续数字")
        self.start = start
        self.end = end
        self._create = self.__create()

    def __create(self):
        for i in range(self.start, self.end):
            yield i

    def create(self):
        return next(self._create)


class Name(Creater):
    def __init__(self):
        super().__init__("中文名称")

    def create(self):
        from faker import Faker
        fake = Faker("zh_CN")
        res = fake.name()
        if self.duplicate:
            return res
        else:
            while res in self.datas:
                res = fake.name()
            self.datas.append(res)
            return res


class Date(Creater):
    # 2000-01-01 2024-02-01 日期
    def __init__(self, start="2000-01-01", end="2020-12-31", step=1):
        super().__init__("日期")
        self.start = start
        self.end = end
        self.step = step
        self._create = self.__create()

    def __create(self):
        import datetime
        # 时间差
        start = datetime.datetime.strptime(self.start, "%Y-%m-%d")
        end = datetime.datetime.strptime(self.end, "%Y-%m-%d")
        step = datetime.timedelta(days=self.step)
        # 生成日期
        while True:
            yield start.strftime("%Y-%m-%d")
            start += step
            if start > end:
                break

    def create(self):
        return next(self._create)


class Gender(Creater):
    def __init__(self):
        super().__init__("性别")

    def create(self):
        return random.choice(["男", "女"])


class RandomDateTime(Creater):
    # 2000-01-01 12:16:50,  2024-02-01 12:16:50 日期+时间
    def __init__(self, start="2000-01-01 00:00:00", end="2024-12-31 23:59:59"):
        super().__init__("随机日期时间")
        self.start = start
        self.end = end

    def create(self):
        import datetime
        start = datetime.datetime.strptime(self.start, "%Y-%m-%d %H:%M:%S")
        end = datetime.datetime.strptime(self.end, "%Y-%m-%d %H:%M:%S")
        return (start + (end - start) * random.random()).strftime("%Y-%m-%d %H:%M:%S")


class Word(Creater):
    def __init__(self):
        super().__init__("单词")
        with open("semantic.txt", "r", encoding="utf-8") as f:
            w = f.readlines()
        self.words = []
        for i in w:
            if i.strip():
                [self.words.append(j.strip()) for j in i.split(" ")]

    def create(self):
        return random.choice(self.words)


class Task(Creater):
    def __init__(self):
        super().__init__("任务")

    def create(self):
        tasks = {
            "任务1 运球": "运球是篮球运动的基本功之一，是指球员在场上运球时，用手控制篮球，使篮球在地面上反弹，从而使球员能够在场上移动。",
            "任务2 传球": "传球是篮球运动中的一项基本技术，是指球员用手将篮球传递给队友。",
            "任务3 投篮": "投篮是篮球运动中的一项基本技术，是指球员将篮球投向篮筐，以得分。",
            "任务4 防守": "防守是篮球运动中的一项基本技术，是指球员在场上阻止对方球员得分。",
            "任务5 篮板球": "篮板球是篮球运动中的一项基本技术，是指球员在场上抢到篮球。",
            "任务6 进攻": "进攻是篮球运动中的一项基本技术，是指球员在场上进攻对方篮筐。",
            "任务7 控球": "控球是篮球运动中的一项基本技术，是指球员在场上控制篮球。",
            "任务8 突破": "突破是篮球运动中的一项基本技术，是指球员在场上突破对方防守。",
            "任务9 传接球": "传接球是篮球运动中的一项基本技术，是指球员在场上传球并接球。",
            "任务10 篮球战术": "篮球战术是篮球运动中的一项基本技术，是指球员在场上进行战术。",
            "任务11 篮球规范": "篮球规范是篮球运动中的一项基本技术，是指球员在场上遵守篮球规范。",
            "任务12 利益": "利益是篮球运动中的一项基本技术，是指球员在场上争取利益。",
            "任务13 球员": "球员是篮球运动中的一项基本技术，是指球员在场上进行比赛。",
            "任务14 球队": "球队是篮球运动中的一项基本技术，是指球员组成的团队。",
            "任务15 球场": "球场是篮球运动中的一项基本技术，是指球员比赛的场地。",
            "任务16 球": "球是篮球运动中的一项基本技术，是指篮球运动的器材。",
            "任务17 篮球": "篮球是篮球运动中的一项基本技术，是指篮球运动的器材。",
            "任务18 实操": "在篮球运动中进行实际操作。",
            "任务19 球技": "球技是篮球运动中的一项基本技术，是指球员在场上的技术。",
            "任务20 球感": "球感是篮球运动中的一项基本技术，是指球员在场上的感觉。",

        }
        return random.choice(list(tasks.items()))


class DateTime:
    # AM8. ~ PM17. 40分钟一次课 连续的时间 sep 间隔/分钟
    def __init__(self, start="2000-01-01 00:00:00", sep=40):
        self.start = start
        self.sep = sep
        self._create = self.__create()

    def __create(self):
        import datetime
        step = datetime.timedelta(minutes=self.sep)
        start = datetime.datetime.strptime(self.start, "%Y-%m-%d %H:%M:%S")
        while True:

            if start.hour < 8:
                start = start.replace(hour=8, minute=0, second=0)
            elif start.hour > 17:
                start = start.replace(hour=8, minute=0, second=0) + datetime.timedelta(days=1)
            else:
                start += step

            yield start.strftime("%Y-%m-%d %H:%M:%S")

    def create(self):
        return next(self._create)


class Nalysis(Creater):
    """篮球训练 评价"""

    def __init__(self):
        super().__init__("篮球训练 评价")

    def create(self):
        nalysis = [
            "运动量有待提升,整体不错！",
            "运动量适中,整体不错！",
            "运动量过大,整体不错！",
            "运动量有待提升,整体一般！",
            "运动量适中,整体一般！",
            "投篮命中率有待提升,整体一般！",
            "投篮命中率适中,整体一般！",
            "投篮命中率过高,整体一般！",
            "运动量有待提升,整体不错！",
        ]

        return random.choice(nalysis)


if __name__ == '__main__':
    dt = DateTime(start="2024-03-14 08:00:00")
