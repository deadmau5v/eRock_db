import main
import creater
import random

c_tables = {
    "c_competition_record": "c_competition_record",
    "c_ballteam": "c_ballteam",
    "c_job": "c_job",
    "c_personnel_sheet": "c_personnel_sheet",
    "c_proof": "c_proof",
}

c_tables_key = {
    c_tables["c_competition_record"]: ["cc_r_id", "记录ID"],
    c_tables["c_ballteam"]: ["bal_id", "球队ID"],
    c_tables["c_job"]: ["job_id", "职位ID"],
    c_tables["c_personnel_sheet"]: ["ps_id", "人员ID"],
    c_tables["c_proof"]: ["proof_id", "佐证ID"],

}


def c_competition_record(table_name):
    """比赛记录表"""
    print("比赛记录表")
    c1 = ["课内赛"]
    c2 = ["友谊赛", "班赛", "校赛", "校际赛"]
    recording = []
    for i in range(3):
        enum_id = 6
        cc_r_time = creater.RandomDateTime(start="2024-01-01 00:00:00", end="2024-12-31 23:59:59").create()
        cc_r_speci = c1[0]
        cc_r_name = creater.Race_Name(sub_start=i).create()
        recording.append([enum_id, cc_r_time, cc_r_speci, cc_r_name])
    for i in range(4):
        enum_id = 7
        cc_r_time = creater.RandomDateTime(start="2024-01-01 00:00:00", end="2024-12-31 23:59:59").create()
        cc_r_speci = c2[i]
        cc_r_name = creater.Race_Name(sub_start=i + 3).create()
        recording.append([enum_id, cc_r_time, cc_r_speci, cc_r_name])
    for i in recording:
        sql = (f"INSERT INTO {table_name} (enum_id, cc_r_time, cc_r_speci, cc_r_name)"
               f" VALUES ({i[0]}, '{i[1]}', '{i[2]}', '{i[3]}');")
        main.execute(sql)
        print(sql)


def c_ballteam(table_name):
    """球队参赛表"""
    print("球队参赛表")
    sql_cc_r_id = main.query("select cc_r_id from c_competition_record")
    sql_gg_id = main.query("select gg_id from stu_group")
    for i in sql_cc_r_id:
        def get_gg_id():
            while True:
                x1 = random.choices(sql_gg_id)[0][0]
                x2 = random.choices(sql_gg_id)[0][0]
                if x1 != x2:
                    return x1, x2

        gg_id = get_gg_id()
        bal_num1 = random.randint(80, 120)
        bal_num2 = random.randint(80, 120)

        sql = (f"INSERT INTO {table_name} (cc_r_id, gg_id, bal_num)"
               f" VALUES ({i[0]}, {gg_id[0]}, '{bal_num1}')")
        main.execute(sql)

        print(sql)
        sql = (f"INSERT INTO {table_name} (cc_r_id, gg_id, bal_num)"
               f" VALUES ({i[0]}, {gg_id[1]}, '{bal_num2}')")
        main.execute(sql)
        print(sql)


def c_job(table_name):
    """职位表"""
    print("职位表")
    job_list = ["比赛队员", "工作人员", "啦啦队员"]
    for i in job_list:
        sql = f"INSERT INTO {table_name} (job_name) VALUES ('{i}')"
        print(sql)
        main.execute(sql)


def c_personnel_sheet(table_name):
    """球队内人员表"""
    print("球队内人员表")
    bal_id_list = main.query("select bal_id,gg_id,cc_r_id from c_ballteam")
    job_id_list = main.query("select job_id from c_job")
    for i in range(len(bal_id_list)):
        bal_id = bal_id_list[i][0]
        stu_id_list = main.query(f"select stu_id from student where gg_id = {bal_id_list[i][1]}")
        enum_id = main.query(f"select enum_id from c_competition_record where cc_r_id = {bal_id_list[i][2]}")[0][0]
        for x in range(8):
            stu_id = stu_id_list[x][0]
            ps_num = random.randint(35, 50)
            if enum_id == 6:
                sql = (f"INSERT INTO {table_name} (bal_id, stu_id, ps_num)"
                       f" VALUES ({bal_id}, {stu_id}, {ps_num})")
                print(sql)
                main.execute(sql)
            else:
                job_id = random.choices(job_id_list)[0][0]
                sql = (f"INSERT INTO {table_name} (job_id, bal_id, stu_id, ps_num)"
                       f" VALUES ({job_id}, {bal_id}, {stu_id}, {ps_num})")
                print(sql)
                main.execute(sql)


def c_proof(table_name):
    """佐证表"""
    print("佐证表")
    ps_id_list = main.query("select ps_id, job_id from c_personnel_sheet")
    proof_url = "https://cdn1.d5v.cc/CDN/Project/eRock/test/test.xlsx"
    for i in ps_id_list:
        if i[1] is None:
            continue
        sql = (f"INSERT INTO {table_name} (ps_id, proof_url)"
               f" VALUES ({i[0]}, '{proof_url}')")
        print(sql)
        main.execute(sql)


# 清空表数据
# for i in c_tables:
#     main.clear_primary_key(i)

# 主键自增
# main.add_incident(c_tables_key)
if __name__ == '__main__':
    c_competition_record(c_tables["c_competition_record"])
    c_ballteam(c_tables["c_ballteam"])
    c_job(c_tables["c_job"])
    c_personnel_sheet(c_tables["c_personnel_sheet"])
    c_proof(c_tables["c_proof"])
    ...
