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
	String oldpwd=request.getParameter("oldpwd");
	String newpwd=request.getParameter("newpwd");
	
	String encoldpwd=Base64.getEncoder().encodeToString(oldpwd.getBytes());
	String encnewpwd=Base64.getEncoder().encodeToString(newpwd.getBytes());
	
	PreparedStatement ps=con.prepareStatement("select * from customer where cemail=? and cpwd=?");
	ps.setString(1,email);
	ps.setString(2,encnewpwd);
	rs=ps.executeQuery();
	if(rs.next()){
		%>
		<script>alert("You Have Entered Same Password As Old Password!!Please Try Again")</script>
		<jsp:include page="customerchangepassword.jsp"/>
		<%
	}else{
		PreparedStatement pss=con.prepareStatement("update customer set cpwd=? where cemail=? and cpwd=?");
		
		pss.setString(1,encnewpwd);
		pss.setString(2,email);
		pss.setString(3,encoldpwd);
		int rows=pss.executeUpdate();
		if(rows>0){
			%>
			<script>alert("Password Updated Successfully!!Please Login Again..")</script>
			<jsp:include page="customer.jsp"/>
			<%
		}else{
			%>
			<script>alert("Invalid  Credentials!!Please Try Again..")</script>
			<jsp:include page="customerchangepassword.jsp"/>
			<%
		}
	}
	
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>