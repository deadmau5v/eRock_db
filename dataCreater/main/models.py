from texttable import Texttable
from colorama import Fore
import pymysql


class Fields:
    """字段"""

    def __init__(self):
        self.name: str = ""  # 名称
        self.type: str = ""  # 类型
        self.comment: str = ""  # 注释

        self.length: int = 0  # 长度
        self.decimal: int = 0  # 小数位数

        self.is_primary_key: bool = False  # 是否主键
        self.is_auto_increment: bool = False  # 是否自增
        self.is_nullable: bool = False  # 是否允许为null
        self.is_unique: bool = False  # 是否唯一

        self.default: str = ""  # 默认值


class Table:
    """表"""

    def __init__(self, database: str, table_name: str):
        self.database: str = database
        self.table_name: str = table_name
        self.comment: str = ""  # 注释

        # 字段
        self.fields: list[Fields] = []

    def info(self, creater: dict = None):
        print(f"{'  ' + self.table_name + '  ':=^100}")
        cli_table = Texttable()
        cli_table.add_row(
            ["序号", "字段名", "类型", "注释", "长度", "小数位数", "是否主键", "是否自增", "是否允许为null", "是否唯一",
             "默认值", Fore.RED + "生成器" + Fore.RESET])
        for idx, j in enumerate(self.fields):
            cli_table.add_row(
                [idx, j.name, j.type, j.comment, j.length, j.decimal, j.is_primary_key, j.is_auto_increment,
                 j.is_nullable,
                 j.is_unique, j.default,
                 Fore.GREEN + creater[j.name] + Fore.RED if creater else Fore.RED + "无" + Fore.RESET])
        cli_table.set_deco(Texttable.HEADER)
        cli_table.set_max_width(0)
        print(cli_table.draw())

    def get_fields(self, connect: pymysql.Connection):
        """获取字段"""
        cursor = connect.cursor()
        cursor.execute(f"show full fields from {self.table_name}")
        all_fields = cursor.fetchall()
        for i in all_fields:
            field = Fields()
            field.name = i[0]
            field.type = i[1]
            field.comment = i[8]
            field.length = i[2]
            field.decimal = i[3]
            field.is_primary_key = i[4] == "PRI"
            field.is_auto_increment = i[5] == "auto_increment"
            field.is_nullable = i[6] == "YES"
            field.is_unique = i[3] == "UNI"
            field.default = i[5]
            self.fields.append(field)


class Creater:
    def __init__(self):
        pass
