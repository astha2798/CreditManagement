<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "credit";
String userid = "root";
String password = "12345678";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>
<h1>
Select user:
</h1>
<table border="1">
<tr>
<td>name</td>
<td>email</td>
<td>credit</td>
<td>choose</td>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from user";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<form action="TransferCredit.jsp">
<tr>
<td><input type="text" name="name" value="<%=resultSet.getString("name") %>"></td>
<td><input type="text" name="email" value="<%=resultSet.getString("email") %>"></td>
<td><input type="number" name="credit" value="<%=resultSet.getFloat("credit") %>"></td>
<td><input type="submit" value="Choose"></td>
<% request.setAttribute("name",resultSet.getString("name"));%>
</tr>
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>