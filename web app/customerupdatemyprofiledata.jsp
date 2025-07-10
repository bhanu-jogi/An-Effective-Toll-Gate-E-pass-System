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

int id=Integer.parseInt(multi.getParameter("cid"));
String name=multi.getParameter("name");
String email=multi.getParameter("email");

String mobile=multi.getParameter("mobile");
String dob=multi.getParameter("dob");
String gender=multi.getParameter("gender");
String address=multi.getParameter("address");

Date DOB=Date.valueOf(dob);



String iname="";
String fileExtension="";
File ff=null;
FileInputStream fin=null;

while(files.hasMoreElements()){
	iname=(String)files.nextElement();
	ff=multi.getFile(iname);
	if(ff!=null){
	fileExtension=ff.getName().substring(ff.getName().lastIndexOf("."));
	
	boolean fileAllowed=fileExtension.equalsIgnoreCase(".jpg")||
			fileExtension.equalsIgnoreCase(".png")||
			fileExtension.equalsIgnoreCase(".jpeg");
	
	if(ff!=null && fileAllowed){
		fin=new FileInputStream(ff);
	}else{
		%>
		<script type="text/javascript">alert("Please Select Correct File Type...")</script>
			<jsp:include page="customerupdateprofile.jsp"/>
		<%
	}
}
}
StringBuilder query=new StringBuilder("update customer set name=? ,mobile=?,gender=?,dob=?,address=? ");
if(ff!=null){
	query.append(",image=? ");
}
query.append(" where cemail=? and cuid=?");

		PreparedStatement ps=con.prepareStatement(query.toString());
		ps.setString(1,name);
	
		
		ps.setString(2,mobile);
		ps.setString(3,gender);
		ps.setDate(4,DOB);
		ps.setString(5,address);
		int parin=6;
		if(ff!=null){
		ps.setBinaryStream(parin++,(InputStream)fin,(int)(ff.length()));
		}
		ps.setString(parin++,email);
		ps.setInt(parin++,id);
		int rows=ps.executeUpdate();
		
		if(rows>0){
			%>
			<script type="text/javascript">alert("Updated Successfully!!")</script>
			<jsp:include page="customermyprofile.jsp"/>
			<%
		}else{
			%>
			<script type="text/javascript">alert("Failed To Update!!Please Try Again")</script>
			<jsp:include page="customerupdateprofile.jsp"/>
			<% 
	
	}
			

}
catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>