<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>用户管理</title>
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


<form name="form1" method="post">
    <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">

        <tr>
            <td height="20" bgcolor="#FFCF60">
                <div align="center" class="style1">用户管理</div>
            </td>
        </tr>
        <tr>
            <td bgcolor="#666666">
                <table width="600" border="0" align="center" cellpadding="0" cellspacing="1">
                    <tr>
                        <td width="224" height="20" bgcolor="#FFFFFF">
                            <div align="center">用户昵称</div>
                        </td>
                        <td width="93" bgcolor="#FFFFFF">
                            <div align="center">用户状态</div>
                        </td>
                        <td width="79" bgcolor="#FFFFFF">
                            <div align="center">删除</div>
                        </td>
                        <td width="75" bgcolor="#FFFFFF">
                            <div align="center">查看信息</div>
                        </td>
                        <c:forEach items="${list}" var="user">
                    <tr>
                        <td height="20" bgcolor="#FFFFFF">
                            <div align="center" id="nc">${user.name}</div>
                        </td>
                        <td height="20" bgcolor="#FFFFFF">
                            <div align="center">
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
                        <td height="20" bgcolor="#FFFFFF">
                            <div align="center">

                                <input type="checkbox" name="39" value=39></div>
                        </td>
                        <td height="20" bgcolor="#FFFFFF">
                            <div align="center"><a id="bt" target="main" href="/userServlet?action=name&name=${user.name}">
                                <img src="images/button_select.png" width="14" height="13" border="0"></a>
                            </div>
                        </td>

                    </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
    </table>
    <table width="600" height="25" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="508">
                <div align="left">
                    &nbsp;本站共有注册用户&nbsp;3&nbsp;位&nbsp;每页显示&nbsp;20&nbsp;位&nbsp;第&nbsp;1&nbsp;页/共&nbsp;1&nbsp;页
                </div>
            </td>
            <td width="92">
                <div align="center"><input type="submit" value="删除选项" class="buttoncss">
                </div>
            </td>
        </tr>
        <tr>
            <td width="600" colspan="2">
                <div align="left">


                    &nbsp;<a href="#">首页</a> | <a href="#">上一页</a> | <a href="#">下一页</a> | <a href="#">末页</a>

                </div>
            </td>

        </tr>
    </table>

</form>
</body>
</html>
