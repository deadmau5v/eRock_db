import json
import random

import faker
import pandas


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
            elif 13 > start.hour > 11:  # 午休
                start = start.replace(hour=14, minute=0, second=0)
            elif start.hour > 17:
                start = start.replace(hour=8, minute=0, second=0) + datetime.timedelta(days=1)


            yield start.strftime("%Y-%m-%d %H:%M:%S")
            start += step

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


class URL_img(Creater):
    def __init__(self):
        super().__init__("图片URL")

    def create(self):
        urls = [
            'https://cdn1.d5v.cc/CDN/Project/eRock/test/test%20%288%29.jpg',
            'https://cdn1.d5v.cc/CDN/Project/eRock/test/test%20%287%29.jpg',
            'https://cdn1.d5v.cc/CDN/Project/eRock/test/test%20%286%29.jpg',
            'https://cdn1.d5v.cc/CDN/Project/eRock/test/test%20%285%29.jpg',
            'https://cdn1.d5v.cc/CDN/Project/eRock/test/test%20%284%29.jpg',
            'https://cdn1.d5v.cc/CDN/Project/eRock/test/test%20%283%29.jpg',
            'https://cdn1.d5v.cc/CDN/Project/eRock/test/test%20%282%29.jpg',
            'https://cdn1.d5v.cc/CDN/Project/eRock/test/test%20%281%29.jpg',
        ]
        return random.choice(urls)


class Race_Name(Creater):
    #
    def __init__(self, sub_start=0):
        super().__init__("比赛名称")
        self.sub_start = sub_start

    def create(self):
        competition_names = [
            "冠军杯",
            "精英赛",
            "挑战杯",
            "夺冠之战",
            "决胜之战",
            "巅峰对决",
            "终极竞技",
            "胜者为王",
            "荣耀之争",
            "传奇之路",
            "巅峰之战",
            "豪门对决",
            "风暴之战",
            "狂欢赛场",
            "赢得荣耀",
            "冠军之争",
            "巅峰盛会",
            "荣耀擂台",
            "拔得头筹",
            "至高荣耀"
        ]
        return competition_names[self.sub_start]


class Question(Creater):
    """知识问答生成"""

    def __init__(self):
        super().__init__("知识问答")

    def create(self):
        with open("eRock/questions.json", 'r', encoding='utf-8') as f:
            json_data = json.load(f)
            q = random.choice(json_data)
        return q['question'], q['result']


class Conversion(Creater):
    def __init__(self):
        super().__init__("T分转换")

    def create(self):
        df = pandas.read_excel("eRock/T分转换.xlsx", skiprows=1)
        data = []
        for i in range(0, 10, 2):
            con_t_score_list = df.iloc[:, i]
            con_pro_score_list = df.iloc[:, i + 1]
            for x in range(con_t_score_list.__len__()):
                if not pandas.isna(con_t_score_list[x]) and not pandas.isna(con_pro_score_list[x]):
                    data.append([int(con_t_score_list[x]), con_pro_score_list[x]])
        return data


class Certificate(Creater):
    def __init__(self):
        super().__init__("证书名称")

    def create(self):
        certificate_name = [
            "班赛优秀运动员",
            "校赛优秀运动员",
            "校级以上比赛优秀运动员",
            "三级裁判",
            "二级裁判",
            "一级裁判", ]
        return random.choices(certificate_name)[0]


class Physical(Creater):
    def __init__(self):
        super().__init__("体能测试")

    def create(self):
        fitness_test_dict = {
            "体能": "评估身体的基本素质和健康状况。",
            "速度": "衡量快速移动的能力。",
            "耐力": "衡量持续运动的能力。",
            "力量": "评估肌肉力量和爆发力。",
            "柔韧性": "衡量身体关节的活动范围。",
            "协调性": "评估动作的准确性和流畅性。",
            "技巧": "衡量特定运动技能的掌握程度。",
            "准确性": "衡量运动中精确执行动作的能力。",
            "心肺功能": "评估心脏和肺部的健康状况。",
            "团队协作": "衡量在团队环境中与他人合作的能力。",
            "灵活性": "评估快速改变方向或动作的能力。",
            "敏捷性": "衡量对刺激的反应速度和动作的灵活性。",
            "平衡性": "衡量保持身体稳定性的能力。",
            "反应时间": "衡量对刺激做出反应的时间。",
            "爆发力": "评估在最短时间内发挥最大力量的能力。",
            "持久力": "衡量在长时间内保持高效运动的能力。",
            "心理素质": "评估应对压力和挑战的心理能力。",
            "战术理解": "衡量对运动策略和比赛计划的理解。",
            "适应能力": "评估在面对新情况或变化时的快速适应能力。",
            "恢复能力": "衡量身体在运动后的恢复速度和能力。"
        }
        return random.choice(list(fitness_test_dict.items()))


class Tx_img(Creater):  # 头像
    def __init__(self):
        super().__init__("头像URL")

    def create(self):
        return "https://cdn1.d5v.cc/CDN/Project/eRock/tx/%d.jpg" % random.randint(1, 21)


class Communication(Creater):  # 评论
    def __init__(self):
        super().__init__("评论")

    def create(self):
        items = [
            "对于提高篮球技巧，我建议多多练习基本功，比如传球、运球和投篮。此外，观看一些专业球员的比赛录像也有助于学习他们的技巧和战术。记住，耐心和坚持是成功的关键！",
            "想要在篮球比赛中表现出色，除了技术要过硬外，团队合作也是至关重要的。要学会与队友配合，把握好进攻和防守的时机，积极参与比赛中的每一个环节。同时，保持良好的身体素质和心态也是不可或缺的。",
            "制定一个有效的体育训练计划对于提高运动表现至关重要。包括有针对性的力量训练、有氧训练和灵活性训练，以及适当的休息和营养补充。记得要根据个人的实际情况和目标进行调整，保持训练的多样性和规律性。",
            "在进行体育训练时，预防伤病同样重要于提高运动表现。要注意正确的热身和拉伸，避免过度训练和疲劳，保持良好的体姿和技术动作，及时休息和治疗可能出现的小伤。如果有严重的不适或伤痛，一定要及时咨询专业医生的建议。",
            "在篮球比赛中，合理的战术安排能够提高球队的竞争力。要根据对手的特点和自身球员的优劣势制定适合的战术，灵活调整比赛节奏和防守方式，充分发挥球员的特长，争取每一个进攻和防守的机会。团队的配合和沟通也是关键，要时刻保持交流和默契。",
            "多多练习基本功，提高篮球技巧。",
            "观看专业球员的比赛录像，学习技巧和战术。",
            "团队合作是篮球比赛中的关键。",
            "制定有效的体育训练计划，提高运动表现。",
            "注意正确的热身和拉伸，预防运动伤害。",
            "合理安排战术，提高球队竞争力。",
            "积极参与比赛中的每一个环节。",
            "保持良好的身体素质和心态。",
            "坚持训练的多样性和规律性。",
            "保持交流和默契，提高团队配合。",
            "技术要过硬，才能在比赛中表现出色。",
            "灵活调整比赛节奏和防守方式。",
            "发挥球员的特长，争取每一个进攻和防守的机会。",
            "综合运用传球、运球和投篮等技巧。",
            "适当休息和补充营养，保持身体健康。",
            "时刻保持专注和信心，不放弃任何机会。",
            "从失败中吸取经验教训，不断进步。",
            "尊重对手和裁判，遵守比赛规则。",
            "热爱篮球运动，享受比赛的乐趣。",
            "团队的胜利比个人的荣誉更重要。",
            "与队友共同努力，实现共同的目标。",
            "积极参加训练和比赛，提高自己的水平。",
            "挑战自我，超越自己的极限。",
            "激发潜力，勇攀高峰，成就非凡。",
            "关注健康，避免过度训练和伤害。",
            "保持对篮球的热情和执着，不断追求进步。",
            "乐观面对困难和挑战，勇往直前。",
            "努力克服弱点，发挥自己的优势。",
            "抓住每一个学习和成长的机会。",
            "展现自己的实力和潜力，赢得尊重和认可。",
            "保持对比赛的专注和投入，全力以赴。",
            "善于分析比赛和对手，制定应对策略。",
            "注重身体的柔韧性和爆发力，提高技术水平。",
            "时刻保持冷静和清醒的头脑，不被情绪左右。",
            "学会从失败中汲取经验教训，不气馁不放弃。",
            "养成良好的生活习惯，保持身心健康。",
            "保持对训练和比赛的热情和动力。",
            "与队友相互激励和支持，共同进步。",
            "保持良好的心态，克服困难和挑战。",
            "提高对比赛的洞察力和判断力。",
            "注重身体各项素质的全面发展。",
            "多参加比赛，积累比赛经验。",
            "注重技术细节的训练，打好基础。",
            "保持对篮球运动的热爱和执着。",
            "克服惰性，坚持不懈地努力。",
            "尊重对手，不轻视任何一个对手。",
            "保持良好的团队氛围和信任感。",
            "树立正确的比赛态度，积极面对挑战。",
            "抓住每一个学习和进步的机会。",
            "与优秀的球员切磋技艺，不断提高。",
            "注重身体和心理的平衡发展。",
            "坚持自己的训练计划，不受外界影响。",
            "关注体育营养和饮食健康，保持体力。",
            "学会从失败中吸取经验教训，不断进步。",
            "重视比赛前的准备和心理调整。",
            "保持对篮球的热情和信心，永不放弃。",
            "克服自己的恐惧和不安，挑战极限。",
            "保持对自己的要求和期望，不停追求进步。",
            "不断学习和积累经验，提高自己的水平。",
            "培养良好的比赛习惯和竞技精神。",
            "保持对训练和比赛的热情和动力。",
            "充分利用训练时间，不浪费每一分每一秒。",
            "坚持训练和比赛的规律性和连贯性。",
            "不畏惧困难和挑战，敢于挑战自我。",
            "学会与队友相互合作和信任，共同成长。",
            "保持对比赛的专注和投入，全力以赴。",
            "哇，看来我们的篮球队又在悄悄地练习输球了！下一场比赛的主题曲应该是《失望的节拍》。",
            "听说我们的训练计划更像是每天举重——举不动！不知道是不是教练打算让我们通过累趴下来达到强身健体的目标。",
            "篮球技巧？哦，那是一种传说中的东西，在我们这个队伍里只有在梦里才可能见到。",
            "我看我们队的战术更像是一群鸡头咕咕乱叫，而不是球场上的精准舞步。",
            "好消息是，我们的队伍终于摆脱了连败的压力；坏消息是，我们现在处于连平的状态。真是壮观的进步！",
            "为了伤病预防，我们队的新口号是：‘不要动，不会受伤！’",
            "听说我们的对手已经开始对我们队的表现笑得合不拢嘴了。也许他们觉得我们是开心果吧。",
            "如果篮球比赛是一场躲避球比赛，我们队的防守就是全场最佳！可惜，那不是。",
            "我们队的战术如此先进，以至于就连我们自己都不知道它是什么。这可能是一种无敌的战术吧。",
            "听说我们队的进攻如同沙滩上的海浪，来得快去得也快，只是，它们并没有淹没任何人。",
            "看来我们的篮球队又在用全新的战术：放弃比赛。下次他们可以考虑拿出更激进的战术，比如不参加比赛！",
            "听说我们的队员们在训练时尝试了一种全新的篮球技巧：在球场上迷路。也许下次他们会试图找到回家的路吧。",
            "听说我们队的最新目标是：每场比赛至少输一球，这样我们就能稳步前进，朝着梦想的深渊迈进一步。",
            "篮球技巧？那对我们队来说是什么？我猜想，那只是一个传说中的神话，只有神仙才能掌握。",
            "我们的训练计划就像是一部喜剧片的剧本，每天都有新的笑料，只是，我们不知道什么时候才能看到一个结局。",
            "听说我们队的防守像是一道摆设，比如说，如果我们的对手是世界上唯一的球，那我们肯定可以摆脱所有的失误。",
            "最新消息！我们队的战术被列入了篮球史上最搞笑的战术之一。不过，至少我们做到了让人印象深刻。",
            "听说我们的队员们都在积极地跟随教练的指示，只是，他们好像忘记了目标是赢球而不是收集输球的奖章。",
            "篮球比赛对我们来说就像是一场迷宫探险，只是，我们的队伍好像一直在走往死胡同的方向。",
            "我们的篮球队现在就像是一艘没有舵的船，漂浮在大海上，不知道自己要去哪里，也不知道该如何回到岸边。"
        ]
        return random.choice(items)


class QuestionTask(Creater):
    def __init__(self):
        super().__init__("知识测试 任务")

    def create(self):
        weekdays = ["星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"]
        basketball_contents = [
            "检验学生篮球基本知识",
            "测试学生篮球技能水平",
            "评估学生篮球战术理解能力",
            "考察学生篮球规则掌握情况",
            "审查学生篮球历史知识",
            "测验学生篮球战术执行能力",
            "评估学生篮球策略制定能力",
            "测试学生篮球运球技能",
            "评估学生篮球投篮准确性",
            "考察学生篮球盯人防守能力",
            "检验学生篮球盖帽技巧",
            "评估学生篮球传球技能",
            "考察学生篮球运动战略思维能力",
            "测试学生篮球战术变化应对能力",
            "审查学生篮球教练指导理解能力",
            "评估学生篮球比赛调整能力",
            "测试学生篮球团队合作意识",
            "检验学生篮球比赛气势",
            "考察学生篮球场上领导能力",
            "测验学生篮球训练计划制定能力",
            "评估学生篮球身体素质",
            "测试学生篮球防守技巧",
            "审查学生篮球进攻战术理解能力",
            "考察学生篮球比赛中心理素质",
            "检验学生篮球传接球技巧",
            "测试学生篮球篮板球能力",
            "评估学生篮球挑篮技能",
            "考察学生篮球比赛智慧运用",
            "审查学生篮球历史名人了解程度",
            "测验学生篮球比赛心理素质",
            "评估学生篮球比赛节奏掌控能力",
            "测试学生篮球比赛适应能力",
            "检验学生篮球赛场风采",
            "考察学生篮球比赛临场表现",
            "审查学生篮球比赛分析能力",
            "评估学生篮球战术训练效果",
            "测试学生篮球比赛战术执行能力",
            "检验学生篮球比赛规则理解程度",
            "考察学生篮球比赛团队配合",
            "测验学生篮球比赛状态调整能力",
            "评估学生篮球比赛适应性",
            "测试学生篮球比赛心态",
            "检验学生篮球比赛技术细节",
            "考察学生篮球比赛意识",
            "审查学生篮球比赛策略运用",
            "评估学生篮球比赛反应速度",
            "测试学生篮球比赛控球能力",
            "检验学生篮球比赛攻防转换速度",
            "考察学生篮球比赛战术指挥",
            "测验学生篮球比赛节奏感",
            "评估学生篮球比赛中断调整能力",
            "测试学生篮球比赛关键球表现",
            "检验学生篮球比赛拼抢意识",
            "考察学生篮球比赛临场决断",
            "审查学生篮球比赛规划能力",
            "评估学生篮球比赛精神状态",
            "测试学生篮球比赛技战术变化能力",
            "检验学生篮球比赛中的策略执行",
            "考察学生篮球比赛技术统治力",
            "审查学生篮球比赛中的团队配合",
            "测验学生篮球比赛战术布置",
            "评估学生篮球比赛意志品质",
            "测试学生篮球比赛集体荣誉感",
            "检验学生篮球比赛团队凝聚力",
            "考察学生篮球比赛紧张状态应对",
            "审查学生篮球比赛中的技术应变",
            "测验学生篮球比赛中的心理建设",
            "评估学生篮球比赛的团队协作",
            "测试学生篮球比赛的战术反应",
            "检验学生篮球比赛的意识觉醒",
            "考察学生篮球比赛的意志表现",
            "审查学生篮球比赛的合作默契",
            "测验学生篮球比赛的应变能力",
            "评估学生篮球比赛的心理素质",
            "测试学生篮球比赛的团队拼搏",
            "检验学生篮球比赛的技战术执行"]
        return random.choice(weekdays) + "伦理测试", random.choice(basketball_contents)


if __name__ == '__main__':
    dt = DateTime(start="2024-03-15 08:00:00", sep=120)
    for _ in range(5):
        print(dt.create())
