<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
<script>
function getBtn(){
	var sel = document.getElementById("sel").value;
	if(sel=="select"){
		document.getElementById("btn").style.display="None";
	}else{
		document.getElementById("btn").style.display="Block";
	}
}
function getCost(){
	var hvcost=parseFloat(document.getElementById("hvcost").value);
	var mvcost=parseFloat(document.getElementById("mvcost").value);
	var lvcost=parseFloat(document.getElementById("lvcost").value);
	var fdate=document.getElementById("fdate").value;
	var sel = document.getElementById("sel").value;
	var seldetails=sel.split(",");
		var vtype=seldetails[2];
	var startDate = new Date(fdate);
	var cost=0;
    startDate.setDate(startDate.getDate() + 30);
    var endDate = startDate.toISOString().split('T')[0];

    
    document.getElementById("tdate").value = endDate;
    document.getElementById("nod").value = 30;
    
	if(vtype=="heavy"){
	document.getElementById("epack").value="Heavy Vechile";
	cost=hvcost*30;
	}else if(vtype=="medium"){
		document.getElementById("epack").value="Medium Vechile";
		cost=mvcost*30;
	}else if(vtype=="light"){
		document.getElementById("epack").value="Light Vechile";
		cost=lvcost*30;
	}
	document.getElementById("epcost").value=cost.toFixed(2);	
}
</script>
</head>
<body>
 <%@include file="customerheader.jsp" %>
    <%@include file="connect.jsp" %>
    <!-- Hero Area Start-->
    <div class="slider-area ">
        <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>Apply E-pass </h2>
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
                        <form class="form-contact contact_form" action="customerapplyepassdata.jsp" method="post" >
                            <div class="row">
                            <%
                            try{
                            String email=(String)session.getAttribute("email");
                            int tpid=Integer.parseInt(request.getParameter("id"));
                            PreparedStatement ps=con.prepareStatement("select * from tollplaza where tpid=?");
                            ps.setInt(1,tpid);
                            rs=ps.executeQuery();
                            while(rs.next()){
                            	%>
                            	    <div class="col-md-8">
                                    <div class="form-group">
                                    <label>TollPlaza Id</label>
                                        <input class="form-control valid"  required name="tpid" readonly value="<%=rs.getInt(1) %>" type="number" onfocus="this.placeholder = 'Enter Full Name'" onblur="this.placeholder = 'Enter Full Name'" placeholder="Enter Full Name">
                                    </div>
                                </div>
                                
                              
                                        <input class="form-control valid"  required name="cemail" value="<%=email %>"   type="hidden" onfocus="this.placeholder = 'Enter Email Address'" onblur="this.placeholder = 'Enter Email Address'" placeholder="Enter Email Address">
                                <input class="form-control valid"  required id="hvcost"name="hvcost" value="<%=rs.getDouble(5) %>"   type="hidden" onfocus="this.placeholder = 'Enter Email Address'" onblur="this.placeholder = 'Enter Email Address'" placeholder="Enter Email Address">
                                 <input class="form-control valid"  required id="mvcost" name="mvcost" value="<%=rs.getDouble(6) %>"   type="hidden" onfocus="this.placeholder = 'Enter Email Address'" onblur="this.placeholder = 'Enter Email Address'" placeholder="Enter Email Address">
                                <input class="form-control valid"  required id="lvcost" name="lvcost" value="<%=rs.getDouble(7) %>"   type="hidden" onfocus="this.placeholder = 'Enter Email Address'" onblur="this.placeholder = 'Enter Email Address'" placeholder="Enter Email Address">
                               
                                
                                <div class="col-md-8">
                                    <div class="form-group">
                                     <label>TollPlaza Name</label>
                                        <input class="form-control"  required name="tpname" readonly type="text" value="<%=rs.getString(2) %>" onfocus="this.placeholder = 'Enter Vehicle Name'" onblur="this.placeholder = 'Enter Vehicle Name'" placeholder="Enter Vehicle Name">
                                    </div>
                                </div>
                                
                                 <div class="col-md-8">
                                    <div class="form-group">
                                     <label>Highway Name</label>
                                        <input class="form-control"  required name="hpname" readonly type="text" value="<%=rs.getString(3) %>" onfocus="this.placeholder = 'Enter Vehicle Name'" onblur="this.placeholder = 'Enter Vehicle Name'" placeholder="Enter Vehicle Name">
                                    </div>
                                </div>
                                
                                 <div class="col-md-8">
                                    <div class="form-group">
                                     <label>From Date</label>
                                        <input class="form-control valid" required min="<%=LocalDate.now() %>" name="fdate" id="fdate" oninput="getCost()" type="date"/>
                                    </div>
                                </div>
                                    <div class="col-md-8">
                                    <div class="form-group">
                                     <label>To Date</label>
                                        <input class="form-control valid" required name="tdate" id="tdate"  type="date" readonly/>
                                    </div>
                                </div>
                                 <div class="col-md-8">
                                    <div class="form-group">
                                     <label>NO Of Days </label>
                                        <input class="form-control valid"  required name="nod" id="nod"  readonly type="text"/>
                                    </div>
                                </div>
                                 <div class="col-md-8">
                                    <div class="form-group">
                                     <label>Vehicle</label>
                                        <select class="form-select mb-2" id="sel" onchange="getBtn();getCost()" required name="vtype" >
                                        <option value="select">Select The Vehicle</option>
                                        	<%PreparedStatement pss=con.prepareStatement("select * from vehicles where vcemail=?");
                                        	pss.setString(1,email);
                                        	ResultSet rss=pss.executeQuery();
                                        	int count=0;
                                        	while(rss.next()){
                                        		count++;
                                        		%>
                                        		<option value="<%=rss.getString(4) %>,<%=rss.getString(5) %>,<%=rss.getString(7) %>"><%=rss.getString(4) %>(<%=rss.getString(5) %>)</option>
                                        		<% 
                                        	}if(count==0){
                                        		%>
                                        		<option disabled style="color:red">No Vehicles Are Added !!</option>
                                        		<%
                                        	}
                                        	%>
                                        </select>
                                    </div>
                                </div>
                                 <div class="col-md-8">
                                    <div class="form-group">
                                     <label>E-pass Package</label>
                                        <input class="form-control valid" required  name="epackage" readonly id="epack"  type="text" required/>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                     <label>E-pass Cost</label>
                                        <input class="form-control valid" required  name="epcost" readonly id="epcost"  type="number" required/>
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
                                <button type="submit" id="btn" class="genric-btn primary e-large">APPLY</button>
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