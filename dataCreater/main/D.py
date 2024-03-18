import main
import creater
import random

d_tables = {
    "d1_conversion": "d1_conversion",
    "d2_certificate": "d2_certificate",
    "d2_resource": "d2_resource",
}

d_tables_key = {
    d_tables["d1_conversion"]: ["con_t_score", "T分"],
    d_tables["d2_certificate"]: ["certificate_id", "证书ID"],
    d_tables["d2_resource"]: ["resource_id", "资源ID"],

}


def d1_conversion(table_name):
    """进步分换算表"""
    print("进步分换算表")
    data = creater.Conversion().create()
    for x, y in data:
        sql = (f"INSERT INTO {table_name} (con_t_score, con_pro_score)"
               f" VALUES ({x}, {y})")
        print(sql)
        main.execute(sql)


def d2_certificate(table_name):
    """证书表"""
    print("证书表")
    stu_id_list = main.query("select stu_id from student")
    stu_id_list = random.choices(stu_id_list, k=int(stu_id_list.__len__() / 3))
    for i in stu_id_list:
        stu_id = i[0]
        tea_id = main.query(f"select tea_id from stu_to_tea where stu_id = {stu_id}")
        if tea_id is None:
            continue
        tea_id = tea_id[0][0]
        certificate_name = creater.Certificate().create()
        audit = random.randint(0, 1)
        sql = (f"INSERT INTO {table_name} (stu_id, tea_id, certificate_name, audit)"
               f" VALUES ({stu_id}, {tea_id}, '{certificate_name}', {audit})")
        print(sql)
        main.execute(sql)


def d2_resource(table_name):
    """资源表"""
    print("资源表")
    certificate_id_list = main.query("select certificate_id from d2_certificate")
    for i in certificate_id_list:
        certificate_id = i[0]
        resource_url = "https://cdn1.d5v.cc/CDN/Image/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20240318162459.png"
        sql = (f"INSERT INTO {table_name} (certificate_id, resource_url)"
               f" VALUES ({certificate_id}, '{resource_url}')")
        print(sql)
        main.execute(sql)


# 清空表数据
# for i in d_tables:
#     main.clear_primary_key(i)

# 主键自增
# main.add_incident(d_tables_key)

if __name__ == '__main__':
    # d1_conversion(d_tables["d1_conversion"])
    # d2_certificate(d_tables["d2_certificate"])
    # d2_resource(d_tables["d2_resource"])
    ...
