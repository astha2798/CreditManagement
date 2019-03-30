<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
The details of user who is going to send credit is as follows:
<br/>
Name:
<%= request.getParameter("name") %> <br/>
Email:
<%= request.getParameter("email") %><br/>
Credit in account:
<%= request.getParameter("credit") %>
<br/>
<% session.setAttribute("tname",request.getParameter("name"));%>
<% session.setAttribute("tcredit",Float.parseFloat(request.getParameter("credit")));%>
Select a user to transfer credit to:
<a href="Transfer.jsp">View All Users</a>

</body>
</html>