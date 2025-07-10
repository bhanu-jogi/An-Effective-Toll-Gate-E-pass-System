<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
         .tollplaza-card {
            width: 550px; /* Fixed width */
            height: 400px; /* Fixed height */
            margin: 30px auto;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            background: #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            flex-direction: column;
            overflow: hidden; /* Hide overflow content */
        }
        .tollplaza-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
        }
        .card-header {
            text-align: center;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #007bff;
        }
        .card-header h3 {
            margin: 0;
            color: #007bff;
            font-weight: 600;
        }
        .tollplaza-details {
            font-size: 1rem;
            color: #333;
            flex-grow: 1; /* Allow details to take available space */
            overflow-y: auto; /* Scroll if content overflows */
        }
        .tollplaza-details .row {
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }
        .tollplaza-details strong {
            color: #007bff;
            font-weight: 500;
            flex: 0 0 150px; /* Fixed width for labels */
        }
        .tollplaza-details .col-8 {
            flex: 1;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis; /* Truncate long text */
        }
        .cost-section {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
        }
    </style>
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
                            <h2>View TollPlazas</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <section class="m-5">
    	<div class="container">
    	<div class="row">
    		<%try{
    			PreparedStatement ps=con.prepareStatement("select * from tollplaza");
    			rs=ps.executeQuery();
    			int count=0;
    			while(rs.next()){
    				count++;
    				%>
    				<div class="tollplaza-card">
                <div class="card-header">
                    <h3 style=""><%=rs.getString("tpname")%></h3>
                </div>
                <div class="tollplaza-details">
                    <div class="row">
                        <div class="col-4"><strong>Highway Name:</strong></div>
                        <div class="col-8" ><%=rs.getString("hwname")%></div>
                    </div>
                    <div class="row">
                        <div class="col-4"><strong>Address:</strong></div>
                        <div class="col-8" ><%=rs.getString("tpaddress")%></div>
                    </div>
                    <div class="cost-section">
                        <div class="row">
                            <div class="col-6"><strong>Heavy Vehicle Cost:</strong></div>
                            <div class="col-6"><i class="fa fa-inr"></i>&nbsp;<%=rs.getDouble("hvcost")%></div>
                        </div>
                        <div class="row">
                            <div class="col-6"><strong>Medium Vehicle Cost:</strong></div>
                            <div class="col-6"><i class="fa fa-inr"></i>&nbsp;<%=rs.getDouble("mvcost")%></div>
                        </div>
                        <div class="row">
                            <div class="col-6"><strong>Light Vehicle Cost:</strong></div>
                            <div class="col-6"><i class="fa fa-inr"></i>&nbsp;<%=rs.getDouble("lvcost")%></div>
                        </div>
                    </div>
                </div>
                <div class="justify-content-center ml-3">
                <a class="genric-btn info circle small m-3" href="admintollplazaupdate.jsp?id=<%=rs.getInt(1)%>">UPDATE</a><a href="admintollplazadelete.jsp?id=<%=rs.getInt(1)%>" onclick="return confirm('Do You Want To Delete?')"class="genric-btn danger circle small m-3">DELETE</a>
                </div>
            </div>
    				<%
    			}if(count==0){
    	        	%>
    	        	<div style="text-align:center; margin-top:30px;">
    	        <h3 style="color: #e74c3c; font-weight: 600;">No Data Found!!.</h3>
    	        </div>
    	        	<%
    	                }
    		}catch(Exception e){
    			e.printStackTrace();
    		} %>
    		</div>
    		</div>
    
    </section>

<%@include file="footer.jsp" %>
</body>
</html>s