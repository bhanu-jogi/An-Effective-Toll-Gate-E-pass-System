<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>

<body>
   
    <%@include file="adminheader.jsp" %>
    <!-- Hero Area Start-->
    <div class="slider-area ">
        <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>Add TollPlaza</h2>
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
                        <form class="form-contact contact_form" action="adminaddtollplazadata.jsp" method="post" >
                            <div class="row">
                               
                                
                                <div class="col-md-8">
                                    <div class="form-group">
                                    <label>Toll Plaza Name</label>
                                        <input class="form-control valid"  required name="tpname"  type="text" onfocus="this.placeholder = 'Enter Toll Plaza Name'" onblur="this.placeholder = 'Enter Toll Plaza Name'" placeholder="Enter Toll Plaza Name">
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                    <label>Highway Name</label>
                                        <input type="text" class="form-control" required  name="hwname"  onfocus="this.placeholder = 'Enter Highway Name'" onblur="this.placeholder = 'Enter Highway Name'" placeholder="Enter Highway Name"/>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                    <label>Toll Plaza Address</label>
                                        <textarea class="form-control" required  name="tpaddress"  onfocus="this.placeholder = 'Enter TollPlaza Address'" onblur="this.placeholder = 'Enter TollPlaza Address'" placeholder="Enter TollPlaza Address"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                    <label>High Vehicle Cost(Per Day)</label>
                                        <input type="number" onwheel="blur()" class="form-control" required  name="hvcost"  onfocus="this.placeholder = 'Enter Heavy Vehicle Cost'" onblur="this.placeholder = 'Enter Heavy Vehicle Cost'" placeholder="Enter Heavy Vehicle Cost"/>
                                    </div>
                                </div>
                                 <div class="col-md-8">
                                    <div class="form-group">
                                    <label>Medium Vehicle Cost(Per Day)</label>
                                        <input type="number" onwheel="blur()" class="form-control" required  name="mvcost"  onfocus="this.placeholder = 'Enter Medium Vehicle Cost'" onblur="this.placeholder = 'Enter Medium Vehicle Cost'" placeholder="Enter Medium Vehicle Cost"/>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                    <label>Low Vehicle Cost(Per Day)</label>
                                        <input type="number" onwheel="blur()" class="form-control" required  name="lvcost"  onfocus="this.placeholder = 'Enter Light Vehicle Cost'" onblur="this.placeholder = 'Enter Light Vehicle Cost'" placeholder="Enter Light Vehicle Cost"/>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="form-group mt-3">
                                <button type="submit" class="genric-btn danger e-large">ADD</button>
                              
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