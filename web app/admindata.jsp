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
	String email=request.getParameter("email");
	String pwd=request.getParameter("pwd");
	
	PreparedStatement ps=con.prepareStatement("select * from admin where email=? and pwd=?");
	ps.setString(1,email);
	ps.setString(2,pwd);
	 rs=ps.executeQuery();
	if(rs.next()){
		session.setAttribute("email", email);
		%>
		<script >alert("Successfully Logged-In")</script>
		<jsp:include page="adminhomepage.jsp"/>
		<%
	}else{
		%>
		<script>alert("Invalid Login Credentials!!")</script>
		<jsp:include page="admin.jsp"/>
		
		<%
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>