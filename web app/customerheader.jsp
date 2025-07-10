 <%if(session.getAttribute("email")==null){
	 session.invalidate();
	 response.sendRedirect("customer.jsp");
	 return;
 } %>
  <header>
        <!-- Header Start -->
       <div class="header-area header-transparrent">
           <div class="headder-top header-sticky">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-6 ">
                            <!-- Logo -->
                            <div class="logo">
                                <h3>An Effective Toll Gate E-pass System</h3>
                            </div>  
                        </div>
                        <div class="col-lg-6 ">
                            <div class="menu-wrapper">
                                <!-- Main-menu -->
                                <div class="main-menu">
                                    <nav class="d-none d-lg-block">
                                        <ul id="navigation">
                                            <li><a href="customerhomepage.jsp">Home</a></li>
                                          
                                           
                                            <li><a href="#">Vehicle</a>
                                                <ul class="submenu">
                                                    <li><a href="customeraddvechile.jsp">Add Vehicle</a></li>
                                                    <li><a href="customerviewvehicles.jsp">View Vehicles</a></li>
                                                </ul>
                                            </li>
                                               <li><a href="customerviewtollplaza.jsp">TollPlazas</a></li>
                                                <li><a href="customerviewepass.jsp">E-Pass</a></li>
                                            
                                           
										 
                                             <li><a href="#">My Account</a>
                                                <ul class="submenu">
                                                <li><a href="customermyprofile.jsp">My Profile</a></li>
                                                <li><a href="customerviewnotification.jsp">Notification</a></li>
                                                    <li><a href="customerchangepassword.jsp">Change Password</a></li>
                                                    <li><a href="customerlogout.jsp">Logout</a></li>
                                                    
                                                </ul>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>          
                                <!-- Header-btn -->
                                <!-- <div class="header-btn d-none f-right d-lg-block">
                                    <a href="#" class="btn head-btn1">Register</a>
                                    <a href="#" class="btn head-btn2">Login</a>
                                </div> -->
                            </div>
                        </div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
           </div>
       </div>
        <!-- Header End -->
    </header>