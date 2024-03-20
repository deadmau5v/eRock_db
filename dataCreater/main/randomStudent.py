import creater


students = ["靳晶",
            "孙丹",
            "王凯",
            "杨岩",
            "潘琴",
            "李畅",
            "王凯",
            "倪敏",
            "徐鑫",
            "舒兰英", ]

# 从每个学生最后一条数据的时间开始
creater.DateTime(start="", sep="").create()

for i in students:
    sql = f"select "
