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
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String subject=request.getParameter("subject");
	String message=request.getParameter("message");
	
	PreparedStatement ps=con.prepareStatement("insert into contacts(name,email,subject,message)values(?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,email);
	ps.setString(3,subject);
	ps.setString(4,message);
	
	int rows=ps.executeUpdate();
	if(rows>0){
		%>
		<script>alert("Message Sent Successfully!!")</script>
		<jsp:include page="contact.jsp"/>
		<%
	}else{
		%>
		<script>alert("Failed To Message Sent!!Please Try Again..")</script>
		<jsp:include page="contact.jsp"/>
		<%
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>