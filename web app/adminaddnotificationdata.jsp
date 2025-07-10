<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>
<body>
<%@include file="connect.jsp" %>
<%
try{
String title=request.getParameter("title");
String desc=request.getParameter("desc");

PreparedStatement ps=con.prepareStatement("insert into notifications(title,description)values(?,?)");
ps.setString(1,title);
ps.setString(2,desc);

int rows=ps.executeUpdate();
if(rows>0){
	%>
	<script>alert("Notification Added Successfully!!")</script>
	<jsp:include page="adminviewnotification.jsp"/>
	<% 
}else{
	%>
	<script>alert("Failed To Added !! Please Try Again..")</script>
	<jsp:include page="adminaddnotification.jsp"/>
	<%
}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>