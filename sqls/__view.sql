CREATE VIEW student_performance AS
SELECT
    s.stu_id AS 学号,
    s.stu_name AS 学生姓名,
    cr.cr_date AS 上课时间,
    dri.dri_analysis AS 运球,
    sho.sho_analysis AS 投篮
FROM
    student s
INNER JOIN class_register cr ON s.class_id = cr.cr_id -- 假设class_id是student表的外键，指向class_register表的cr_id
INNER JOIN a_dribble dri ON s.stu_id = dri.dri_id -- 假设stu_id是student表的外键，指向a_dribble表的dri_id
INNER JOIN shoot sho ON s.stu_id = sho.sho_id -- 假设stu_id是student表的外键，指向shoot表的sho_id
;
