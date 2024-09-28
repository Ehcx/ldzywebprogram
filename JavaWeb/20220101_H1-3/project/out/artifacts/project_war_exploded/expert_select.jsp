<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/10/8
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <LINK
            href="css/content.css" type=text/css rel=stylesheet>
</head>

<body>
<table width="834" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td height="30" background="images/title01.jpg" class="title"><span class="title">&gt;&gt;评委抽取</span></td>
        <td width="27" height="30"><img src="images/title02.jpg" width="27" height="30" /></td>
        <td height="30" bgcolor="#029AC5" class="txt"><span class="title"><span class="titletxt">您的位置：交易流程 &gt; 评委抽取</span></span></td>
    </tr>
</table>
<br />
<table width="790" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td width="91" height="38" valign="middle" bgcolor="#80C6FF" class="titletxt" align="center">工程名称：</td>
        <td width="703" valign="middle" bgcolor="#80C6FF" class="titletxt">住宅小区一期工程</td>
    </tr>
</table>

<table width="800" border="0" align="center">
    <tr>
        <td width="40%" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td width="100%" height="30" bgcolor="#029AC5" class="titletxt"> &nbsp;&#8226; 已选评委列表</td>
            </tr>
            <tr>
                <td height="30" align="center"><form id="form2" name="form1" method="post" action="project_expert_list.html">
                    <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bgcolor="#E7E7E7">
                        <tr>
                            <td width="16%" height="30" align="center" bgcolor="#80C6FF" class="txt"><span class="title">评委姓名</span></td>
                            <td width="50%" align="center" bgcolor="#80C6FF" class="title"><span class="txt"><span class="title"> 所 属 单 位</span></span></td>

                        </tr>
                        <c:forEach items="${list}" var="expert">
                        <tr>
                            <td width="16%" height="30" align="center" class="txt">${expert.expert_name}</td>
                            <td align="left" class="txt">${expert.dept}</td>

                        </tr>
                        </c:forEach>
                    </table>
                </form>
                    <p>&nbsp;</p></td>
            </tr>
        </table></td>
    </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
