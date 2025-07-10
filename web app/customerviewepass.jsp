<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>
<body>
<%@include file="customerheader.jsp" %>
<%@include file="connect.jsp" %>
 <div class="slider-area ">
        <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>My E-pass </h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section class="m-5">
    <div class="container-fluid">
    	<table class="table table-bordered">
    		<thead style="background-color:orange;color:white">
    			<tr>
    				<th>SNo</th>
    				<th>E-Pass Id</th>
    				<th>Email</th>
    				<th>TollPlaza Name</th>
    				<th>Highway Name</th>
    				<th>From Date</th>
    				<th>End Date</th>
    				<th>Vehicle Number</th>
    				<th>Vehicle</th>
    				<th>E-pass Name</th>
    				<th>E-pass Cost</th>
    				<th>Status</th>
    				
    			</tr>
    		</thead>
    		<tbody>
    		<% try{
    			String email=(String)session.getAttribute("email");
    			PreparedStatement ps=con.prepareStatement("select * from epass inner join tollplaza on epass.tolplid=tollplaza.tpid where epass.cpemail=? ");
    			ps.setString(1,email);
    			rs=ps.executeQuery();
    			int count=0;
    			while(rs.next()){
    				count++;
    				%>
    				<tr>
	    				<td><%=count %></td>
	    				<td><%=rs.getInt("epassid") %></td>
	    				<td><%=rs.getString("cpemail") %></td>
	    				<td><%=rs.getString("tpname") %></td>
	    				<td><%=rs.getString("hwname") %></td>
	    				<td><%=rs.getString("fdate") %></td>
	    				<td><%=rs.getString("tdate") %></td>
	    				<td><%=rs.getString("evnumber") %></td>
	    				<td><%=rs.getString("evname") %></td>
	    				<td><%=rs.getString("epack") %></td>
	    				<td><%=rs.getString("epcost") %></td>
	    				<%if(rs.getString("epassstatus").equalsIgnoreCase("Accepted")){
	    					%>
	    					<td><button disabled class="genric-btn info">Accepted</button></td>
	    					<%
	    					
	    				}else if(rs.getString("epassstatus").equalsIgnoreCase("Rejected")){
	    					%>
	    					<td><button disabled class="genric-btn danger">Rejected</button></td>
	    					<%
	    				}else {
	    					%>
	    					<td><a  class="genric-btn warning">Pending</a></td>
	    					<%
	    				}%>
	    				
    				</tr>
    				<%
    				
    			}if(count==0){
    				%>
    				<tr><td colspan="15" style="color:orange;text-align:center">No Data Found !!</td>
    				</tr>
    				<%
    			}
    		}catch(Exception e){
    			e.printStackTrace();
    		} %>
    		</tbody>
    	</table>
    </div>
    </section>
    
<%@include file="footer.jsp"%>
</body>
</html>