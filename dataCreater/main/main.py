import os
import random

import pymysql
import creater

tables = {
    "stu_to_tea": "stu_to_tea",
    "a_ball_exam": "a_ball_exam",
    "enumerate": "enumerate",
    "student": "student",
    "teacher": "teacher",
    "grade": "grade",
    "stu_group": "stu_group",
    "class_register": "class_register",
    "semester": "semester",
    "total_score": "total_score",
    "c1_bonus_point": "c1_bonus_point",
    "c1_total_points": "c1_total_points",
    "c2_competition_record": "c2_competition_record",
    "c2_personnel_sheet": "c2_personnel_sheet",
    "c2_proof": "c2_proof",
    "d2_resource": "d2_resource",
    "d2_certificate": "d2_certificate",
    "a_classroom_score": "a_classroom_score",
    "b_training_score": "b_training_score",
    "a2_student_evaluate": "a2_student_evaluate",
    "d_add_value_score": "d_add_value_score",
    "c_event_score": "c_event_score",
    "a_exercise_resource": "a_exercise_resource",
    "a2_teaching_assistant_evaluation": "a2_teaching_assistant_evaluation",
    "a2_teaching_assistant": "a2_teaching_assistant",
    "a_mark_sheet": "a_mark_sheet",
    "a2_ideological_performance": "a2_ideological_performance",
    "a_exercise_task": "a_exercise_task",
    "a2_attendance": "a2_attendance",
    "a2_a3_physical_test": "a2_a3_physical_test",
    "a2_a3_physica_score": "a2_a3_physica_score",
    "a1_viewed": "a1_viewed",
    "b1_franchise_club": "b1_franchise_club",
    "b1_mass_source": "b1_mass_source",
    "a1_result": "a1_result",
    "teaching_table": "teaching_table",
    "a1_teaching_source": "a1_teaching_source",
    "a1_question": "a1_question",
    "a1_answer": "a1_answer",
    "a1_communication": "a1_communication",
}


def connect_db():
    _conn = pymysql.connect(
        host=os.environ.get("MYSQL_HOST"),
        user=os.environ.get("MYSQL_USER"),
        password=os.environ.get("MYSQL_PASSWORD"),
        port=int(os.environ.get("MYSQL_PORT")),
        database=os.environ.get("MYSQL_DATABASE"),
    )
    return _conn


connect = connect_db()


def execute(sql):
    cursor = connect.cursor()
    cursor.execute(sql)
    connect.commit()


def query(sql):
    cursor = connect.cursor()
    cursor.execute(sql)
    return cursor.fetchall()


# grade
def grade(table_name):
    """班级生成"""
    with open("eRock/grade.sql", "r", encoding="utf-8") as f:
        sql = f.read()
    sql = sql.replace("$table", table_name)
    for i in sql.split("\n"):
        if i.strip():
            execute(i)


# semester
def semester(table_name):
    """学期生成"""
    with open("eRock/semester.sql", "r", encoding="utf-8") as f:
        sql = f.read()
    sql = sql.replace("$table", table_name)
    for i in sql.split("\n"):
        if i.strip():
            execute(i)


# class_register
def class_register(table_name, length):
    """班级注册"""
    all_semester_id = query(f"select semester_id from {tables['semester']}")
    all_semester_id = [i[0] for i in all_semester_id]
    for i in range(1, length + 1):
        while True:
            # cr_id = i
            semester_id = random.choice(all_semester_id)
            cr_date = creater.RandomDateTime().create()  # 8. ~ 17. 40分钟一次课
            cr_main = creater.ClassRegister().create()
            cr_duration = random.randint(10, 300)
            sql = (f"INSERT INTO {table_name} (semester_id, cr_date, cr_main, cr_duration) "
                   f"VALUES ({semester_id}, '{cr_date}', '{cr_main}', {cr_duration}) "
                   f"ON DUPLICATE KEY UPDATE semester_id = VALUES(semester_id),"
                   f" cr_date = VALUES(cr_date), cr_main = VALUES(cr_main), cr_duration = VALUES(cr_duration);")
            try:
                execute(sql)
                break
            except pymysql.err.DataError:
                print(sql)
                print("E")


# student
def student(table_name, length, start):
    """学生注册"""

    all_class_id = query(f"select class_id from {tables['grade']}")
    all_class_id = [i[0] for i in all_class_id]

    for i in range(start, start + length + 1):
        while True:
            # stu_id = i
            class_id = random.choice(all_class_id)
            stu_name = creater.Name().create()
            stu_password = "123456"
            sql = (f"INSERT INTO {table_name} (class_id, stu_name, stu_password) "
                   f"VALUES ({class_id}, '{stu_name}', '{stu_password}') "
                   f"ON DUPLICATE KEY UPDATE  class_id = VALUES(class_id),"
                   f" stu_name = VALUES(stu_name), stu_password = VALUES(stu_password);")
            try:
                execute(sql)
                break
            except pymysql.err.DataError:
                print(sql)
                print("E")


# stu_group
def stu_group(table_name, length):
    """学生分组"""
    all_student_id = query(f"select stu_id from {tables['student']}")
    all_student_id = [str(i[0]) for i in all_student_id]
    for i in range(1, length + 1):
        while True:
            gg_name = creater.Word().create() + "组"
            stu_group_leader = random.choice(all_student_id)[0]
            sql = (f"INSERT INTO {table_name} (gg_name, stu_group_leader) "
                   f"VALUES ('{gg_name}', {stu_group_leader}) "
                   f"ON DUPLICATE KEY UPDATE gg_name = VALUES(gg_name), stu_group_leader = VALUES(stu_group_leader);")
            try:
                execute(sql)
                break
            except pymysql.err.DataError:
                print(sql)
                print("E")


def add_student_to_group(stu_group_table, student_table):
    all_student_id = query(f"select stu_id from {student_table}")
    all_student_id = [str(i[0]) for i in all_student_id]
    all_group_id = query(f"select gg_id from {stu_group_table}")
    all_group_id = [str(i[0]) for i in all_group_id]
    for i in all_student_id:
        group_id = random.choice(all_group_id)
        sql = f"UPDATE {student_table} SET gg_id = {group_id} WHERE stu_id = {i};"
        execute(sql)


# teacher

def teacher(table_name, length):
    """老师注册"""
    for i in range(1, length + 1):
        while True:
            # tea_id = i
            tea_name = creater.Name().create()
            tea_password = "123456"
            sql = (f"INSERT INTO {table_name} (tea_name, tea_password) "
                   f"VALUES ('{tea_name}', '{tea_password}') "
                   f"ON DUPLICATE KEY UPDATE tea_name = VALUES(tea_name), tea_password = VALUES(tea_password);")
            try:
                execute(sql)
                break
            except pymysql.err.DataError:
                print(sql)
                print("E")


# stu_to_tea

def stu_to_teacher(table_name):
    """学生老师关系"""
    all_student_id = query(f"select stu_id from {tables['student']}")
    all_student_id = [str(i[0]) for i in all_student_id]
    all_teacher_id = query(f"select tea_id from {tables['teacher']}")
    all_teacher_id = [str(i[0]) for i in all_teacher_id]
    for i in all_student_id:
        teacher_id = random.choice(all_teacher_id)
        sql = f"INSERT INTO {table_name} (stu_id, tea_id) VALUES ({i}, {teacher_id});"
        execute(sql)


# a_mark_sheet

def a_mark_sheet(table_name, length):
    """评分表"""
    all_student_id = query(f"select stu_id from {tables['student']}")
    all_student_id = [str(i[0]) for i in all_student_id]
    all_teacher_id = query(f"select tea_id from {tables['teacher']}")
    all_teacher_id = [str(i[0]) for i in all_teacher_id]

    for i in range(length):
        # ms_id = i
        et_id = random.randint(1, 100)  # 任务id
        stu_id = random.choice(all_student_id)  # 学生id
        tea_id = random.choice(all_teacher_id)  # 老师id
        ms_score = random.randint(0, 100)  # eRock评分
        ms_time = creater.RandomDateTime().create()  # 评分时间
        ms_dribble = random.randint(0, 100)  # 运球分
        ms_shooting = random.randint(0, 100)  # 投篮分

        sql = (f"INSERT INTO {table_name} (et_id, stu_id, tea_id, ms_score, ms_time, ms_dribble, ms_shooting) "
               f"VALUES ({et_id}, {stu_id}, {tea_id}, {ms_score}, '{ms_time}', {ms_dribble}, {ms_shooting}) "
               f"ON DUPLICATE KEY UPDATE et_id = VALUES(et_id), stu_id = VALUES(stu_id), tea_id = VALUES(tea_id),"
               f" ms_score = VALUES(ms_score), ms_time = VALUES(ms_time), ms_dribble = VALUES(ms_dribble),"
               f" ms_shooting = VALUES(ms_shooting);")
        execute(sql)


def a_ball_exam(table_name, length):
    all_mark_sheet_id = query(f"select ms_id from {tables['a_mark_sheet']}")
    all_mark_sheet_id = [str(i[0]) for i in all_mark_sheet_id]
    for i in range(length):
        # be_id = i
        ms_id = random.choice(all_mark_sheet_id)
        dri_stability = random.randint(0, 100)
        dri_power = random.randint(0, 100)
        dri_speed = random.randint(0, 100)
        dri_analysis = creater.Word().create()
        sho_arc = random.randint(0, 100)
        sho_spinner = random.randint(0, 100)
        sho_angle = random.randint(0, 100)
        sho_analysis = "评价: " + creater.Word().create()
        sql = (
            f"INSERT INTO {table_name} (ms_id, dri_stability, dri_power, dri_speed, dri_analysis, sho_arc, sho_spinner, sho_angle, sho_analysis) "
            f"VALUES ({ms_id}, {dri_stability}, {dri_power}, {dri_speed}, '{dri_analysis}', {sho_arc}, {sho_spinner}, {sho_angle}, '{sho_analysis}') "
            f"ON DUPLICATE KEY UPDATE ms_id = VALUES(ms_id), dri_stability = VALUES(dri_stability), dri_power = VALUES(dri_power), dri_speed = VALUES(dri_speed),"
            f" dri_analysis = VALUES(dri_analysis), sho_arc = VALUES(sho_arc), sho_spinner = VALUES(sho_spinner), sho_angle = VALUES(sho_angle), sho_analysis = VALUES(sho_analysis);")
        execute(sql)


def add_incident(tables: dict):
    for table_name in list(tables.keys()):
        key = tables[table_name]
        # 保持类型
        sql = f"alter table {table_name} modify {key} int auto_increment;"
        print(sql)
        execute(sql)


def _enumerate(table_name):
    """模块枚举"""
    data = {
        "课前": "A1",
        "课中": "A2",
        "课后": "A3",
    }
    num = 1
    for k, v in data.items():
        enum_id = num
        enum_name = k
        enum_code = v
        num += 1
        sql = f"INSERT INTO {table_name} (enum_id, enum_name, enum_code) VALUES ({enum_id}, '{enum_name}', '{enum_code}');"
        execute(sql)


if __name__ == '__main__':
    # grade(tables["grade"])
    # semester(tables["semester"])
    # class_register(tables["class_register"], 10)
    # student(tables["student"], 100, 202253210250)
    # stu_group(tables["stu_group"], 8)
    # add_student_to_group(tables["stu_group"], tables["student"])
    # teacher(tables["teacher"], 3)
    # stu_to_teacher(tables["stu_to_tea"])

    # a_mark_sheet(tables["a_mark_sheet"], 100)  # 评分表
    # a_ball_exam(tables["a_ball_exam"], 100)  # 投篮运球表
    # _enumerate(tables["enumerate"])

    # 增加自动增长
    # add_incident({
    # tables["student"]: "stu_id",
    # tables["teacher"]: "tea_id",
    # tables["grade"]: "class_id",
    # tables["stu_group"]: "gg_id",
    # tables["class_register"]: "cr_id",
    # tables["semester"]: "semester_id",
    # tables["total_score"]: "ts_id",
    # tables["c1_bonus_point"]: "bp_id",
    # tables["c1_total_points"]: "tp_id",
    # tables["c2_competition_record"]: "cc_r_id",
    # tables["c2_personnel_sheet"]: "ps_id",
    # tables["c2_proof"]: "proof_id",
    # tables["d2_resource"]: "resource_id",
    # tables["d2_certificate"]: "certificate_id",
    # tables["a_classroom_score"]: "crs_id",
    # tables["b_training_score"]: "trs_id",
    # tables["a2_student_evaluate"]: "se_id",
    # tables["d_add_value_score"]: "avs_id",
    # tables["c_event_score"]: "evs_id",
    # tables["a_exercise_resource"]: "er_id",
    # tables["a2_teaching_assistant_evaluation"]: "tae_id",
    # tables["a2_teaching_assistant"]: "ta_id",
    # tables["a_mark_sheet"]: "ms_id",
    # tables["a2_ideological_performance"]: "ip_id",
    # tables["a_exercise_task"]: "et_id",
    # tables["a2_attendance"]: "aa_id",
    # tables["a_ball_exam"]: "be_id",
    # tables["a2_a3_physical_test"]: "phy_id",
    # tables["a2_a3_physica_score"]: "phys_id",
    # tables["enumerate"]: "enum_id",
    # tables["a1_viewed"]: "view_id",
    # tables["b1_franchise_club"]: "tc_id",
    # tables["b1_mass_source"]: "mas_id",
    # tables["a1_result"]: "oo_id",
    # tables["teaching_table"]: "teaching_id",
    # tables["a1_teaching_source"]: "teas_id",
    # tables["a1_question"]: "qq_id",
    # tables["a1_communication"]: "comm_id",
    # tables["a1_answer"]: "ans_id",
    # })
    ...
    pass
