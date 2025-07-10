<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Base64"%>
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
	
	String encpwd=Base64.getEncoder().encodeToString(pwd.getBytes());
	
	
	PreparedStatement ps=con.prepareStatement("select * from customer where cemail=? and cpwd=?");
	ps.setString(1,email);
	ps.setString(2,encpwd);
	 rs=ps.executeQuery();
	if(rs.next()){
		String status=rs.getString(10);
		if(status.equalsIgnoreCase("Accepted")){
		session.setAttribute("email", email);
		%>
		<script >alert("Successfully Logged-In")</script>
		<jsp:include page="customerhomepage.jsp"/>
		<%
		}else if(status.equalsIgnoreCase("Rejected")){
			
			%>
			<script >alert("Your Profile Is Rejected!!")</script>
			<jsp:include page="customer.jsp"/>
			<%
			}else{
				%>
				<script >alert("Your Profile Is On Pending!!Please Wait For Admin Response..")</script>
				<jsp:include page="customer.jsp"/>
				<%
			}
	}else{
	%>
		<script>alert("Invalid Login Credentials!!")</script>
		<jsp:include page="customer.jsp"/>
	<%
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>