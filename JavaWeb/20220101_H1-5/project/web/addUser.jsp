<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>用户信息添加</title>
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
            <div align="center" class="style1">添加用户</div>
        </td>
    </tr>
    <tr>
        <td height="98" bgcolor="#666666">
            <form action="userServlet?action=add" method="post">
            <table width="650" border="0" align="center" cellpadding="0" cellspacing="1">
                <!--DWLayoutTable-->
                <tr>
                    <td width="99" height="20" bgcolor="#FFFFFF">
                        <div align="center">用户昵称：</div>
                    </td>
                    <td width="180" bgcolor="#FFFFFF">
                        <div align="left">
                            <input type="text" name="nicheng" class="inputcss" size="50"> <font color="red">*</font>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td height="20" bgcolor="#FFFFFF">
                        <div align="center">真实姓名：</div>
                    </td>
                    <td colspan="3" bgcolor="#FFFFFF">
                        <div align="left">
                            <input type="text" name="truename" class="inputcss" size="50"> <font color="red">*</font>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td height="20" bgcolor="#FFFFFF">
                        <div align="center">身份证号码：</div>
                    </td>
                    <td colspan="3" bgcolor="#FFFFFF">
                        <div align="left">
                            <input type="text" name="cardid" class="inputcss" size="50"> <font color="red">*</font>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td height="20" bgcolor="#FFFFFF">
                        <div align="center">电子邮箱：</div>
                    </td>
                    <td colspan="3" bgcolor="#FFFFFF">
                        <div align="left">
                            <input type="text" name="email" class="inputcss" size="50"> <font color="red">*</font>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td height="20" bgcolor="#FFFFFF">
                        <div align="center">联系电话：</div>
                    </td>
                    <td colspan="3" bgcolor="#FFFFFF">
                        <div align="left">
                            <input type="text" name="telephone" class="inputcss" size="50"> <font color="red">*</font>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td height="20" bgcolor="#FFFFFF">
                        <div align="center">QQ号码：</div>
                    </td>
                    <td colspan="3" bgcolor="#FFFFFF">
                        <div align="left">
                            <input type="text" name="qq" class="inputcss" size="50"> <font color="red">*</font>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td height="20" bgcolor="#FFFFFF" colspan="2">
                        <div align="center"><input name="submit" type="submit" class="buttoncss" id="submit" value="添加">
                            &nbsp;&nbsp;<input type="reset" value="重写" class="buttoncss"></div>

                    </td>
                </tr>
            </table>
            </form>
        </td>
    </tr>


</table>
</body>
</html>
