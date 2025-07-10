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
	String oldpwd=request.getParameter("oldpwd");
	String newpwd=request.getParameter("newpwd");
	PreparedStatement ps=con.prepareStatement("select * from admin where email=? and pwd=?");
	ps.setString(1,email);
	ps.setString(2,newpwd);
	rs=ps.executeQuery();
	if(rs.next()){
		%>
		<script>alert("You Have Entered Same Password As Old Password!!Please Try Again")</script>
		<jsp:include page="adminchangepassword.jsp"/>
		<%
	}else{
		PreparedStatement pss=con.prepareStatement("update admin set pwd=? where email=? and pwd=?");
		
		pss.setString(1,newpwd);
		pss.setString(2,email);
		pss.setString(3,oldpwd);
		int rows=pss.executeUpdate();
		if(rows>0){
			%>
			<script>alert("Password Updated Successfully!!")</script>
			<jsp:include page="admin.jsp"/>
			<%
		}else{
			%>
			<script>alert("Invalid  Credentials!!Please Try Again..")</script>
			<jsp:include page="adminchangepassword.jsp"/>
			<%
		}
	}
	
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>