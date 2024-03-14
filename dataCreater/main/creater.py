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


class ClassRegister(Creater):
    """课题内容生成"""

    def __init__(self):
        super().__init__("课题内容")

    def create(self):
        # 短句
        return f"课题内容{faker.Faker().sentence()}"


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


if __name__ == '__main__':
    print(Word().create())
