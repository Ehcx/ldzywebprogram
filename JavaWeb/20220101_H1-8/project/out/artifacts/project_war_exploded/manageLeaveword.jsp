<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/10/11
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>用户留言管理</title>
    <link  rel="stylesheet" type="text/css" href="css/font.css">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body topmargin="0" leftmargin="0" bottommargin="0">
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
    <form action="/message?action=del"  method="post">
        <tr bgcolor="#FFCF60">
            <td height="20" colspan="2"><div align="center"><font color="#FFFFFF">用户留言管理</font></div></td>
        </tr>
        <tr>
            <td height="40" colspan="2" bgcolor="#333333"><table width="750"  border="0" align="center" cellpadding="0" cellspacing="1">
                <tr>
                    <td width="357" height="20" bgcolor="#FFFFFF"><div align="center">留言主题</div></td>
                    <td width="80" bgcolor="#FFFFFF"><div align="center">留言者</div></td>
                    <td width="156" bgcolor="#FFFFFF"><div align="center">留言时间</div></td>
                    <td width="93" bgcolor="#FFFFFF"><div align="center">操作</div></td>
                    <td width="58" bgcolor="#FFFFFF"><div align="center">删除</div></td>
                </tr>
                <c:forEach items="${poList}" var="po">
                <tr>
                    <td height="20" bgcolor="#FFFFFF"><div align="left">${po.message.title}</div></td>
                    <td height="20" bgcolor="#FFFFFF"><div align="center">${po.user.trueName}
                    </div></td>
                    <td height="20" bgcolor="#FFFFFF"><div align="center">${po.message.time}</div></td>
                    <td height="20" bgcolor="#FFFFFF"><div align="center"><a href="/message?action=answer&id=${po.message.id}" target="main">查看</a></div></td>
                    <td height="20" bgcolor="#FFFFFF"><div align="center">
                        <input type="checkbox" name="ids" value=${po.message.id}>
                    </div></td>
                </tr>
                </c:forEach>
            </table></td>
        </tr>
        <tr>
            <td width="652" height="20" bgcolor="#FFFFFF"><div align="left">
                &nbsp;本站共有用户留言&nbsp;1&nbsp;条&nbsp;每页显示&nbsp;20&nbsp;条&nbsp;第&nbsp;1&nbsp;页/共&nbsp;1&nbsp;页
            </div></td>
            <td width="98" bgcolor="#FFFFFF"><div align="center">
                <input type="submit" value="删除选项" class="buttoncss"></div></td>
        </tr>
    </form>
</table>
</body>
</html>
