<%--
  Created by IntelliJ IDEA.
  User: guxiang
  Date: 2017/6/3
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'Hp.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
</head>

<body>
<%
    Connection con = null;
    Statement stm = null;

    String url = "jdbc:mysql://localhost:3306/数据名称";//数据库名称就是你的数据库名字
    String driver = "com.mysql.jdbc.Driver"; //驱动类位置
    String username = "root";  //数据库登录名称,此处写上你的用户名称
    String pwd = "abc";       //数据库登录密码,此处写上你的登录密码
    try
    {
        Class.forName(driver);
        con = DriverManager.getConnection(url, username, pwd); //创建Connection连接对象
        stm = con.createStatement();                           //创建Statement 命令执行对象
    }
    catch (ClassNotFoundException e)
    {
        // TODO Auto-generated catch block
        e.printStackTrace();
    } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }

    String name=request.getParameter("name");       //获取传过来的名称
    String password=request.getParameter("password");//获取传过来的密码

    String sql="insert into user(name,password) values("+name+","+password+")";//数据库添加一条记录sql语句

    int temp=stm.executeUpdate(sql);

    if(temp>0)
    {
        out.print("添加成功");
    }
    else
    {
        out.print("添加失败");
    }
    //关闭数据库连接
    stm.close();
    con.close();

%>
</body>
</html>