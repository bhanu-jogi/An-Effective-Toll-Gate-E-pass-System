<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
<script>
function getBtn(){
	var sel=document.getElementById("sel").value;
	if(sel=="select"){
		document.getElementById("btn").style.display="None";
	}else{
		document.getElementById("btn").style.display="Block";
	}
}
</script>
</head>

<body onload="getBtn()">
   
    <%@include file="customerheader.jsp" %>
    <%@include file="connect.jsp" %>
    <!-- Hero Area Start-->
    <div class="slider-area ">
        <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>Add Vehicle</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <!-- Hero Area End -->
    <!-- ================ contact section start ================= -->
    <section class="contact-section">
            <div class="container">
               <div class="row">
                    <div class="col-lg-8">
                        <form class="form-contact contact_form" action="customeraddvehicledata.jsp" method="post" enctype="multipart/form-data">
                            <div class="row">
                            <%String email=(String)session.getAttribute("email");
                            try{
                            	PreparedStatement ps=con.prepareStatement("select * from customer where cemail=?");
                            	ps.setString(1,email);
                            	rs=ps.executeQuery();
                            	while(rs.next()){
                            		%>
                            		  <div class="col-md-8">
                                    <div class="form-group">
                                    <label>Customer Name</label>
                                        <input class="form-control valid"  required name="cname" readonly value="<%=rs.getString(2) %>" type="text" onfocus="this.placeholder = 'Enter Full Name'" onblur="this.placeholder = 'Enter Full Name'" placeholder="Enter Full Name">
                                    </div>
                                </div>
                                
                              
                                        <input class="form-control valid"  required name="email" value="<%=email %>"   type="hidden" onfocus="this.placeholder = 'Enter Email Address'" onblur="this.placeholder = 'Enter Email Address'" placeholder="Enter Email Address">
                                
                                
                                <div class="col-md-8">
                                    <div class="form-group">
                                     <label>Vehicle Name</label>
                                        <input class="form-control"  required name="vname" type="text" onfocus="this.placeholder = 'Enter Vehicle Name'" onblur="this.placeholder = 'Enter Vehicle Name'" placeholder="Enter Vehicle Name">
                                    </div>
                                </div>
                                
                                 <div class="col-md-8">
                                    <div class="form-group">
                                     <label>Register Date</label>
                                        <input class="form-control valid" required name="rdate"  type="date"/>
                                    </div>
                                </div>
                                 <div class="col-md-8">
                                    <div class="form-group">
                                     <label>Vehicle Number </label>
                                        <input class="form-control valid"  required name="vnumber"  type="text"onfocus="this.placeholder = 'Enter Vehicle Number'" onblur="this.placeholder = 'Enter Vehicle Number'" placeholder="Enter Vehicle Number"/>
                                    </div>
                                </div>
                                 <div class="col-md-8">
                                    <div class="form-group">
                                     <label>Vehicle Type</label>
                                        <select class="form-select mb-2" id="sel" onchange="getBtn()" required name="vtype" >
                                        <option value="select">Select The Type</option>
                                        	<option value="heavy">Heavy</option>
                                        	<option value="medium">Medium</option>
                                        	<option value="light">Light</option>
                                        </select>
                                    </div>
                                </div>
                                 <div class="col-md-8">
                                    <div class="form-group">
                                     <label>Vehicle Image</label>
                                        <input class="form-control valid" required  name="image"  type="file" accept=".png.jpeg,.jpg"required/>
                                    </div>
                                </div>
                                
                            		<%
                            	}
                            }catch(Exception e){
                            	e.printStackTrace();
                            }
                            %>
                              
                            </div>
                            <div class="form-group mt-3">
                                <button type="submit" id="btn" class="genric-btn primary e-large">ADD</button>
                               
                            </div>
                        </form>
                    </div>
                  
                </div>
            </div>
        </section>
    <!-- ================ contact section end ================= -->
    <%@include file="footer.jsp" %>
    </body>
    
    </html>