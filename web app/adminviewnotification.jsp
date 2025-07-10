<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>
<body>
<%@include file="connect.jsp" %>
<%@include file="adminheader.jsp" %>

 <div class="slider-area ">
        <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>View Notifications</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section class="m-5">
  	<div class="container">
  		<table class="table table-bordered">
  				<thead style="background-color:orange;color:white">
  					<tr>
  						<th>Sno</th>
  						<th>Title</th>
  						<th>Description</th>
  						<th>Date Time</th>
  						<th>Action</th>
  					</tr>
  				</thead>
  				<tbody>
  				<%
  				
  				try{
  					PreparedStatement ps=con.prepareStatement("select * from notifications ");
  					rs=ps.executeQuery();
  					int count=0;
  				
  					while(rs.next()){
  						count++;
  						%>
  						<tr>
  							<td><%=count %></td>
  							<td><%=rs.getString(2) %></td>
  							<td><%=rs.getString(3) %></td>
  							<td><%=rs.getString(4) %></td>
  							<td><a class="genric-btn danger" href="adminnotificationdelete.jsp?id=<%=rs.getInt(1)%>" onclick="return confirm('Do You Want To Delete?')">Delete</a></td>
  						</tr>
  						<%
  					}if(count==0){
  						%>
  						<tr><td colspan="10" style="text-align:center;color:orange">No Data Found!!</tr>
  						<%
  					}
  				}catch(Exception e){
  					e.printStackTrace();
  				} %>
  				</tbody>
  			</table>
  	</div>
  
  </section>
    
    <%@include file="footer.jsp" %>
</body>
</html>