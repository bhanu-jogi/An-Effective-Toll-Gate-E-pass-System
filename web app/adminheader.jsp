 <%if(session.getAttribute("email")==null){
	 session.invalidate();
	 response.sendRedirect("admin.jsp");
	 return;
 } %>
  <header>
        <!-- Header Start -->
       <div class="header-area header-transparrent">
           <div class="headder-top header-sticky">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-6 col-md-2">
                            <!-- Logo -->
                            <div class="logo">
                                <h3>An Effective Toll Gate E-pass System</h3>
                            </div>  
                        </div>
                        <div class="col-lg-6">
                            <div class="menu-wrapper">
                                <!-- Main-menu -->
                                <div class="main-menu">
                                    <nav class="d-none d-lg-block">
                                        <ul id="navigation">
                                            <li><a href="adminhomepage.jsp">Home</a></li>
                                          
                                           
                                            <li><a href="#">Users</a>
                                                <ul class="submenu">
                                                    <li><a href="adminviewcontacts.jsp">View Contacts</a></li>
                                                    <li><a href="adminviewcustomers.jsp">View Customers</a></li>
                                                    
                                                </ul>
                                            </li>
                                            <li><a href="#">TollPlaza</a>
                                                <ul class="submenu">
                                                    <li><a href="adminaddtollplaza.jsp">Add TollPlaza</a></li>
                                                    <li><a href="adminviewtollplaza.jsp">View TollPlazas</a></li>
                                                    <li><a href="adminepass.jsp">E-pass Request</a></li>
                                                    
                                                </ul>
                                            </li>
                                            
										    <li><a href="#">Notification</a>
                                              <ul class="submenu">
                                                    <li><a href="adminaddnotification.jsp">Add Notification</a></li>
                                                    <li><a href="adminviewnotification.jsp">View Notification</a></li>
                                                    
                                              </ul>
                                             </li>
                                             <li><a href="#">My Account</a>
                                                <ul class="submenu">
                                                    <li><a href="adminchangepassword.jsp">Change Password</a></li>
                                                    <li><a href="adminlogout.jsp">Logout</a></li>
                                                    
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