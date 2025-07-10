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


	String cname=multi.getParameter("cname");
	String email=multi.getParameter("email");
	String vname=multi.getParameter("vname");
	String vnumber=multi.getParameter("vnumber");
	String rdate=multi.getParameter("rdate");
	String vtype=multi.getParameter("vtype");

Date DOB=Date.valueOf(rdate);

PreparedStatement pss=con.prepareStatement("select * from vehicles where vcemail=? and vnumber=? and vtype=? ");
pss.setString(1,email);
pss.setString(2,vnumber);
pss.setString(3,vtype);

rs=pss.executeQuery();
if(rs.next()){
	%>
	<script>alert("This Vechile Is Already Added!!Please Update Here..")</script>
	<jsp:include page="customerviewvehicles.jsp"/>
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
		PreparedStatement ps=con.prepareStatement("insert into vehicles(cname,vcemail,vname,vnumber,rdate,vtype,image)values(?,?,?,?,?,?,?)");
		
		ps.setString(1,cname);
		ps.setString(2,email);
		ps.setString(3,vname);
		ps.setString(4,vnumber);
		ps.setDate(5,DOB);
		ps.setString(6,vtype);
	
		
		ps.setBinaryStream(7,(InputStream)fin,(int)(ff.length()));
		
		int rows=ps.executeUpdate();
		
		if(rows>0){
			%>
			<script type="text/javascript">alert("Vehicle Added Successfully!!")</script>
			<jsp:include page="customerviewvehicles.jsp"/>
			<%
		}else{
			%>
			<script type="text/javascript">alert("Failed To Add!!Please Try Again")</script>
			<jsp:include page="customeraddvechile.jsp"/>
			<% 
		}
	}else{
		%>
		<script type="text/javascript">alert("Please Select Correct File Type...")</script>
			<jsp:include page="customeraddvechile.jsp"/>
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