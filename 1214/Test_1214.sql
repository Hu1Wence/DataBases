有一张员工表emp，字段：姓名name，性别sex，部门depart，工资salary。查询以下数据：
1、查询男女员工的平均工资
2、查询各部门的总薪水
3、查询总薪水排名第二的部门
4、查询姓名重复的员工信息
5、查询各部门薪水大于10000的男性员工的平均薪水
1.select sex, avg(salary) from emp group by sex;
2.select depart, sum(salary) from emp group by depart;
3.select depart, sum(salary) from emp group by depart limit 1,1;
4.select * from emp group by name having count(name) > 1;
5.select depart, avg(salary) from emp
where salary > 10000 and sex ='男' group by depart;
1、写出一下数据库的查询条件【交大思诺2020届校招笔试题】



有两个表分别如下：
表A(varchar(32) name， int grade)
数据：zhangshan 80， lisi 60， wangwu 84
表B(varchar(32) name， int age)
数据：zhangshan 26， lisi 24， wangwu 26， wutian 26
写SQL语句得到如下查询结果：
| NAME    | GRADE | AGE  |
| zhangshan | 80   | 26   |
| lisi    | 60   | 24   |
| wangwu   | 84   | 26   |
| wutian   | null  | 26   |
2、现在有员工表、部门表和薪资表。部门表depart的字段有depart_id， name；员工表 staff 的字段有 staff_id， name， age， depart_id；薪资表salary 的字段有 salary_id，staff_id，salary，month。【同程艺龙2020届校招笔试题】
2.1（问题a）：求每个部门'2016-09'月份的部门薪水总额
2.2 （问题b）：求每个部门的部门人数，要求输出部门名称和人数
2.3 （问题c）：求公司每个部门的月支出薪资数，要求输出月份和本月薪资总数
1.select A.name, A.grade, B.age from A, B from B left join A
where A.name = B.name;
2.1SELECT
dep.NAME,
sum( sal.salary ) FROM
salary sal
JOIN staff sta ON sal.staff_id = sta.staff_id JOIN depart dep ON sta.depart_id = dep.depart_id
WHERE
YEAR ( sal.MONTH ) = 2016 AND MONTH ( sal.MONTH ) = 9
GROUP BY dep.depart_id
2.2 SELECT
dep.NAME,
count( sta.staff_id ) FROM
staff sta
JOIN depart dep ON dep.depart_id = sta.depart_id GROUP BY
sta.depart_id
2.3SELECT dep.NAME, 
sal.MONTH, 
sum( sal.salary ) FROM 
depart dep
 JOIN staff sta ON dep.depart_id = sta.depart_id JOIN salary sal ON sta.staff_id = sal.staff_id 
GROUP BY dep.depart_id, 
sal.MONTH 