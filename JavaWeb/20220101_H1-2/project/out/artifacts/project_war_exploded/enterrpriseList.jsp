<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/10/9
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
        <td height="30" background="images/title01.jpg" class="title">&gt;&gt;企业信息列表</td>
        <td width="27" height="30"><img src="images/title02.jpg" width="27" height="30" /></td>
        <td height="30" bgcolor="#029AC5" class="txt"><p>您的位置：业务管理 &gt; 企业信息管理</p>
        </td>
    </tr>
</table>
<br />
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td width="33%" height="37">&nbsp;</td>
        <td width="34%" height="37">&nbsp;</td>
        <td width="33%" height="37" align="right" valign="top">
            <a href="enterpriseAdd.html" target="_self"><img src="images/addEnter.jpg" border="0" /></a>&nbsp;</td>
    </tr>
    <tr>
        <td height="30" colspan="3" bgcolor="#029AC5" class="titletxt">&#8226;企业信息</td>
    </tr>
    <tr>
        <td height="30" colspan="3">
            <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td width="33%" height="30" align="center" bgcolor="#80C6FF"><span class="txt"><span class="titletxt">企业编号</span></span></td>
                <td width="34%" height="30" align="center" bgcolor="#80C6FF" class="titletxt">企业名称</td>
                <td width="33%" height="30" align="center" bgcolor="#80C6FF" class="titletxt">相关操作</td>
            </tr>
                <c:forEach items="${Enterprise}" var="ep">
            <tr>
                <td width="33%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${ep.ent_id}</span></td>
                <td width="34%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${ep.ent_name}</span></td>
                <td width="33%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">【修改】【删除】</span></td>
            </tr>
                </c:forEach>

        </table>
        </td>
    </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
