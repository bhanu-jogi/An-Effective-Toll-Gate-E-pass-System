<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*,com.oreilly.servlet.*,java.util.*,java.util.Base64,java.sql.*,java.sql.Date"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>
<body>
<%@include file="connect.jsp" %>
<%
try{
	

	
String rtempfile=File.createTempFile("temp", "1").getParent();

MultipartRequest multi=new MultipartRequest(request,rtempfile,15*1024*1024);
Enumeration files=multi.getFileNames();


String name=multi.getParameter("name");
String email=multi.getParameter("email");
String pwd=multi.getParameter("pwd");
String mobile=multi.getParameter("mobile");
String dob=multi.getParameter("dob");
String gender=multi.getParameter("gender");
String address=multi.getParameter("address");

Date DOB=Date.valueOf(dob);
String encpwd=Base64.getEncoder().encodeToString(pwd.getBytes());

PreparedStatement pss=con.prepareStatement("select * from customer where cemail=?");
pss.setString(1,email);

rs=pss.executeQuery();
if(rs.next()){
	%>
	<script>alert("This Email Is Already Registered!!Please Login Here..")</script>
	<jsp:include page="customer.jsp"/>
	<%
}else{
String iname="";
String fileExtension="";
File ff=null;
FileInputStream fin=null;

while(files.hasMoreElements()){
	iname=(String)files.nextElement();
	ff=multi.getFile(iname);
	fileExtension=ff.getName().substring(ff.getName().lastIndexOf("."));
	
	boolean fileAllowed=fileExtension.equalsIgnoreCase(".jpg")||
			fileExtension.equalsIgnoreCase(".png")||
			fileExtension.equalsIgnoreCase(".jpeg");
	
	if(ff!=null && fileAllowed){
		fin=new FileInputStream(ff);
		PreparedStatement ps=con.prepareStatement("insert into customer(name,cemail,cpwd,mobile,gender,dob,address,image)values(?,?,?,?,?,?,?,?)");
		
		ps.setString(1,name);
		ps.setString(2,email);
		ps.setString(3,encpwd);
		ps.setString(4,mobile);
		ps.setString(5,gender);
		ps.setDate(6,DOB);
		ps.setString(7,address);
		
		ps.setBinaryStream(8,(InputStream)fin,(int)(ff.length()));
		
		int rows=ps.executeUpdate();
		
		if(rows>0){
			%>
			<script type="text/javascript">alert("Registered Successfully!!")</script>
			<jsp:include page="customer.jsp"/>
			<%
		}else{
			%>
			<script type="text/javascript">alert("Failed To Register!!Please Try Again")</script>
			<jsp:include page="customerregister.jsp"/>
			<% 
		}
	}else{
		%>
		<script type="text/javascript">alert("Please Select Correct File Type...")</script>
			<jsp:include page="customerregister.jsp"/>
		<%
	}
			
}
}
}
catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>