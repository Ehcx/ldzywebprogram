<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/10/9
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <LINK
            href="css/content.css" type=text/css rel=stylesheet>
</head>

<body>
<table width="834" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td height="30" background="images/title01.jpg" class="title">&gt;&gt;流程步骤定义</td>
        <td width="27" height="30"><img src="images/title02.jpg" width="27" height="30"/></td>
        <td height="30" bgcolor="#029AC5" class="txt"><span class="titletxt">您的位置：系统管理 &gt; 流程步骤定义</span></td>
    </tr>
</table>
<br/>
<table width="800" border="0" align="center">
    <tr>
        <td width="40%" rowspan="2" valign="top">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="100%" height="30" bgcolor="#029AC5" class="titletxt">&#8226;流程步骤列表</td>
                </tr>
                <tr>
                    <td height="30" align="center">
                        <form id="form2" name="form1" method="post" action="">
                            <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"
                                   bgcolor="#E7E7E7">
                                <tr>
                                    <td width="23%" height="30" align="right" bgcolor="#80C6FF" class="txt">流程ID：</td>
                                    <td width="77%" height="30" align="center" bgcolor="#80C6FF"><label for="textfield2"
                                                                                                        class="txt">流程名称</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="23%" height="30" align="center" class="txt">1</td>
                                    <td height="30" align="left" class="txt">建设工程项目施工报建申请</td>
                                </tr>
                                <tr>
                                    <td height="30" align="center" class="txt">2</td>
                                    <td height="30" align="left" class="txt">入场交易登记</td>
                                </tr>

                                <tr>
                                    <td height="30" align="center" class="txt">3</td>
                                    <td height="30" align="left" class="txt">发布招标公告</td>
                                </tr>


                                <tr>
                                    <td height="30" align="center" class="txt">&nbsp;</td>
                                    <td height="30" align="left" class="txt">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td height="30" align="center" class="txt">&nbsp;</td>
                                    <td height="30" align="left" class="txt">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td height="30" align="center" class="txt">&nbsp;</td>
                                    <td height="30" align="left" class="txt">&nbsp;</td>
                                </tr>
                            </table>
                        </form>
                    </td>
                </tr>
            </table>
        </td>
        <td width="60%" valign="top">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="100%" height="30" bgcolor="#029AC5" class="titletxt">&#8226;流程步骤增加</td>
                </tr>
                <tr>
                    <td height="30" align="center" valign="top">
                        <form id="form1" name="form1" method="post" action="">
                            <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"
                                   bgcolor="#E7E7E7">
                                <c:forEach items="${list}" var="s">
                                    <tr>
                                        <td width="24%" height="30" align="right" class="txt" >${s.Step.name}</td>
                                        <td height="30" align="left"><input height="20" width="200" type="text"
                                                                            name="textfield2" id="textfield2"/>
                                            <span class="txtred">*</span></td>
                                    </tr>
                                    <tr>
                                        <td height="30" align="right" class="txt">时限（天）：</td>
                                        <td height="30" align="left"><input height="20" width="50" type="text"
                                                                            name="textfield3" id="textfield5"/> <span
                                                class="txtred">*</span></td>
                                    </tr>
                                    <tr>
                                        <td height="30" align="right" class="txt">描述：</td>
                                        <td height="30" align="left"><input height="20" width="200" type="text"
                                                                            name="textfield4" id="textfield4"/></td>
                                    </tr>
                                    <tr>
                                        <td height="30" align="right" class="txt">链接地址：</td>
                                        <td height="30" align="left"><input height="20" width="200" type="text"
                                                                            name="textfield4" id="textfield4"/></td>
                                    </tr>

                                    <tr>
                                        <td height="30" align="right" class="txt">&nbsp;</td>
                                        <td height="30" align="left">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
                                                type="submit" name="button" id="button" value="  确  定  "/></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </form>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td width="60%" height="1" valign="top">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="100%" height="30" bgcolor="#029AC5" class="titletxt">&#8226;流程步骤删除</td>
                </tr>
                <tr>
                    <td height="30" align="center">
                        <form id="form3" name="form1" method="post" action="">
                            <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"
                                   bgcolor="#E7E7E7">
                                <tr>
                                    <td width="24%" height="30" align="right" class="txt">ID号：</td>
                                    <td height="30" align="left"><label for="textfield3"></label>
                                        <input height="20" width="50" type="text" name="textfield5" id="textfield3"/>&nbsp;<span
                                                class="txtred">*</span></td>
                                    <td align="left"><span class="txtred">
              <input type="submit" name="button3" id="button3" value="  删  除  "/>
              </span></td>
                                </tr>
                            </table>
                        </form>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
