<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>用户信息管理</title>
    <link rel="stylesheet" type="text/css" href="css/font.css">
    <style type="text/css">
        <!--
        .style1 {
            color: #FFFFFF
        }

        -->
    </style>
</head>
<body topmargin="0" leftmargin="0" bottommargin="0">
<table width="650" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td height="20" bgcolor="#FFCF60">
            <div align="center" class="style1">用户信息查看</div>
        </td>
    </tr>

        <tr>
            <td height="98" bgcolor="#666666">
                <table width="650" border="0" align="center" cellpadding="0" cellspacing="1">
                    <!--DWLayoutTable-->
<%--                    <c:forEach items="${name}" var="Usersname">--%>
                    <tr>
                        <td width="99" height="20" bgcolor="#FFFFFF">
                            <div align="center">用户昵称：</div>
                        </td>
                        <td width="180" bgcolor="#FFFFFF">
                            <div align="left">${user.name}</div>
                        </td>
                        <td width="100" bgcolor="#FFFFFF">
                            <div align="center">用户状态：</div>
                        </td>
                        <td width="266" bgcolor="#FFFFFF">
                            <div align="left">
                                <c:choose>
                                    <c:when test="${user.state==1}">
                                        非冻结状态
                                    </c:when>
                                    <c:otherwise>
                                        冻结状态
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td height="20" bgcolor="#FFFFFF">
                            <div align="center">真实姓名：</div>
                        </td>
                        <td colspan="3" bgcolor="#FFFFFF">
                            <div align="left">${user.trueName}</div>
                        </td>
                    </tr>
                    <tr>
                        <td height="20" bgcolor="#FFFFFF">
                            <div align="center">身份证号：</div>
                        </td>
                        <td colspan="3" bgcolor="#FFFFFF">
                            <div align="left">${user.cardId}</div>
                        </td>
                    </tr>
                    <tr>
                        <td height="20" bgcolor="#FFFFFF">
                            <div align="center">E-mail：</div>
                        </td>
                        <td colspan="3" bgcolor="#FFFFFF">
                            <div align="left">${user.email}</div>
                        </td>
                    </tr>
                    <tr>
                        <td height="20" bgcolor="#FFFFFF">
                            <div align="center">联系电话：</div>
                        </td>
                        <td colspan="3" bgcolor="#FFFFFF">
                            <div align="left">${user.telephone}</div>
                        </td>
                    </tr>
                    <tr>
                        <td height="20" bgcolor="#FFFFFF">
                            <div align="center">QQ号码：</div>
                        </td>
                        <td colspan="3" bgcolor="#FFFFFF">
                            <div align="left">${user.qqId}</div>
                        </td>
                    </tr>
                    <tr>
                        <td height="20" bgcolor="#FFFFFF">
                            <div align="center">注册时间：</div>
                        </td>
                        <td colspan="3" bgcolor="#FFFFFF">
                            <div align="left">${user.regTime}</div>
                        </td>
                    </tr>
                    <tr>
                        <td height="20" bgcolor="#FFFFFF">
                            <div align="center">密码提示：</div>
                        </td>
                        <td colspan="3" bgcolor="#FFFFFF">
                            <div align="left">${user.question}</div>
                        </td>
                    </tr>
                    <tr>
                        <td height="20" bgcolor="#FFFFFF">
                            <div align="center">密码提示答案：</div>
                        </td>
                        <td colspan="3" bgcolor="#FFFFFF">
                            <div align="left">${user.answer}</div>
                        </td>
                    </tr>
<%--                    </c:forEach>--%>
                </table>
            </td>
        </tr>

    <tr>
        <td height="20">
            <div align="center"><a href="">
                冻结该用户</a></div>
        </td>
    </tr>
</table>
</body>
</html>
