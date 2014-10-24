<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>在线考试系统首页</title>
</head>

<body>
<center>
<h1><strong>考生信息</strong></h1><br>
<table width="580">
<tr>
<td width="77">姓名：</td>
<td width="189"><%=session.getAttribute("name")%></td>
<td width="49">性别：</td>
<td width="239"></td>
</tr>
<tr>
<td>学号：</td>
<td></td>
<td>专业：</td>
<td></td>
</tr>
<tr>
<td>准考证号：</td>
<td colspan="2"></td>
<td></td>
</tr>
<tr>
<td valign="top">注意事项：</td>
<td colspan="3">答题模式1：学生登录到系统，能够逐题往下做，也可以倒回去修改答案，做完后可以点击提交，提交后系统自动对 选择，填空，判断进行评分；简答，分析由教师阅卷后给分。教师给完分数后，学生可以登录查看<br>
答题模式2：学生登录到系统，能够逐题往下做，也可以倒回去修改答案，做完后可以点击提交，提交后系统自动对 选择，填空，判断进行评分，并马上给出成绩。<br>
答题模式3：学生登录到系统，只能逐题往下做，不能倒回去修改答案，做的过程中系统自动根据学生的答题情况（正确率），自动改变后面题目的难度（正确率较低则后面的题目较简单，反之亦然），提交后系统自动对 选择，填空，判断进行评分，并马上给出成绩。
</td>
</tr>
</table>
</center>
</body>
</html>