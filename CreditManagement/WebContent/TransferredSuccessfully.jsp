<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/credit";%>
<%!String user = "root";%>
<%!String psw = "12345678";%>
<%
String tuser = (String)session.getAttribute("tname");
Float tcredit=(Float)session.getAttribute("tcredit");
Float rcredit=(Float)session.getAttribute("rcredit");
Float scredit=tcredit+rcredit;
String ruser=(String)session.getAttribute("ruser");
try
{
	PreparedStatement ps=null;
Class.forName(driverName);
Connection con = DriverManager.getConnection(url,user,psw);
String sql1="Update user set credit=? where name=?";
ps = con.prepareStatement(sql1);
ps.setFloat(1,0.0f);
ps.setString(2, tuser);
ps.executeUpdate();
String sql2="Update user set credit=? where name=?";
ps = con.prepareStatement(sql2);
ps.setFloat(1,scredit);
ps.setString(2,ruser);
ps.executeUpdate();
String sql3="insert into transfer(tuser,ruser,tcredit) values(?,?,?)";
ps = con.prepareStatement(sql3);
ps.setString(1,tuser);
ps.setString(2,ruser);
ps.setFloat(3,rcredit);
ps.executeUpdate();
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
%>
<h1>Transfer Successful</h1>