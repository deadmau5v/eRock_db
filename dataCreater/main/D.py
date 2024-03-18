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
    ...


# 清空表数据
# for i in d_tables:
#     main.clear_primary_key(i)

# 主键自增
# main.add_incident(d_tables_key)

if __name__ == '__main__':
    d1_conversion(d_tables["d1_conversion"])
    ...
