<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QuotationAP.aspx.cs" Inherits="PROCUREMENT_QuotationAP" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Online Quotation | AQM Solutions</title>
    <meta name="keywords" content="HTML5 Template, CSS3, All Purpose Admin Template, Vendroid" />
    <meta name="description" content="Layout Middle - Responsive Admin HTML Template">
    <meta name="author" content="Venmond">
    
    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    
    
    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../AAUI/img/ico/apple-touch-icon-144-precomposed.html">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../AAUI/img/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../AAUI/img/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../AAUI/img/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="../AAUI/img/ico/favicon.png">
    
    
    <!-- CSS -->
       
    <!-- Bootstrap & FontAwesome & Entypo CSS -->
    <link href="../AAUI/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../AAUI/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]><link type="text/css" rel="stylesheet" href="css/font-awesome-ie7.min.css"><![endif]-->
    <link href="../AAUI/css/font-entypo.css" rel="stylesheet" type="text/css">    

    <!-- Fonts CSS -->
    <link href="../AAUI/css/fonts.css"  rel="stylesheet" type="text/css">
               
    <!-- Plugin CSS -->
    <link href="../AAUI/plugins/jquery-ui/jquery-ui.custom.min.css" rel="stylesheet" type="text/css">    
    <link href="../AAUI/plugins/prettyPhoto-plugin/css/prettyPhoto.css" rel="stylesheet" type="text/css">
    <link href="../AAUI/plugins/isotope/css/isotope.css" rel="stylesheet" type="text/css">
    <link href="../AAUI/plugins/pnotify/css/jquery.pnotify.css" media="screen" rel="stylesheet" type="text/css">    
	<link href="../AAUI/plugins/google-code-prettify/prettify.css" rel="stylesheet" type="text/css"> 
   
         
    <link href="../AAUI/plugins/mCustomScrollbar/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css">
    <link href="../AAUI/plugins/tagsInput/jquery.tagsinput.css" rel="stylesheet" type="text/css">
    <link href="../AAUI/plugins/bootstrap-switch/bootstrap-switch.css" rel="stylesheet" type="text/css">    
    <link href="../AAUI/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css">    
    <link href="../AAUI/plugins/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css">
    <link href="../AAUI/plugins/colorpicker/css/colorpicker.css" rel="stylesheet" type="text/css">            

	<!-- Specific CSS -->
	    
     
    <!-- Theme CSS -->
    <link href="../AAUI/css/theme.min.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="css/ie.css" rel="stylesheet" > <![endif]-->
    <link href="../AAUI/css/chrome.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->    


        
    <!-- Responsive CSS -->
        	<link href="../AAUI/css/theme-responsive.min.css" rel="stylesheet" type="text/css"> 

	  
 
 
    <!-- for specific page in style css -->
        
    <!-- for specific page responsive in style css -->
        
    
    <!-- Custom CSS -->
    <link href="../AAUI/custom/custom.css" rel="stylesheet" type="text/css">



    <!-- Head SCRIPTS -->
    <script type="text/javascript" src="../AAUI/js/modernizr.js"></script> 
    <script type="text/javascript" src="../AAUI/js/mobile-detect.min.js"></script> 
    <script type="text/javascript" src="../AAUI/js/mobile-detect-modernizr.js"></script> 
 
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/html5shiv.js"></script>
      <script type="text/javascript" src="js/respond.min.js"></script>     
    <![endif]-->
    
</head>    

<body id="layouts" class="middle-layout  no-nav-right  nav-top-fixed vd_bg-grey     responsive    clearfix" data-active="layouts "  data-smooth-scrolling="1">
    <form id="form1" runat="server">
<asp:HiddenField ID="ddlSupplier" runat="server" Value="0" />

    <div class="vd_body">
        
<!-- Header Start -->
  <header class="header-4" id="header">
      <div class="vd_top-menu-wrapper">
        <div class="container ">
          <div class="vd_top-nav vd_nav-width  ">
          <div class="vd_panel-header">
          	<div class="logo">
            	<a href="index.html"><img alt="logo" src="../AAUI/img/logo.png"></a>
            </div>
            <!-- logo -->
            <div class="vd_panel-menu  hidden-sm hidden-xs">
            		            		                   
            </div>
            <div class="vd_panel-menu left-pos visible-sm visible-xs">
            		 
                        <span class="menu" data-action="toggle-navbar-left">
                            <i class="fa fa-ellipsis-v"></i>
                        </span> 
                                        
            </div>
            <div class="vd_panel-menu visible-sm visible-xs">
                	<span class="menu visible-xs" data-action="submenu">
	                    <i class="fa fa-bars"></i>
                    </span>              
                                       
            </div>                                     
            <!-- vd_panel-menu -->
          </div>
          <!-- vd_panel-header -->
            
          </div>    
          <div class="vd_container">
          	<div class="row">
                <div class="col-xs-12">
              		<div class="vd_mega-menu-wrapper">
                    	
                    </div>
                </div>

            </div>
          </div>
        </div>
        <!-- container --> 
      </div>
      <!-- vd_primary-menu-wrapper --> 

  </header>
  <!-- Header Ends --> 
<div class="content">
  <div class="container">
    
    

    <div class="panel widget light-widget panel-bd-top">
                  <div class="panel-heading bordered">
                    <h3 class="panel-title">Online Quotation</h3>
                    <div class="vd_panel-menu">
  <div data-action="minimize" data-original-title="Minimize" data-toggle="tooltip" data-placement="bottom" class=" menu entypo-icon"> <i class="icon-minus3"></i> </div>
  <div data-action="refresh" data-original-title="Refresh" data-toggle="tooltip" data-placement="bottom" class=" menu entypo-icon smaller-font"> <i class="icon-cycle"></i> </div>
  <div data-original-title="Config" data-toggle="tooltip" data-placement="bottom" class=" menu entypo-icon smaller-font">
    <div class="menu-trigger" data-action="click-trigger"> <i class="icon-cog"></i> </div>
   
  </div>
  <div data-action="close" data-original-title="Close" data-toggle="tooltip" data-placement="bottom" class=" menu entypo-icon"> <i class="icon-cross"></i> </div>
</div>
<!-- vd_panel-menu --> 
                  </div>
                  <div class="panel-body">
                   
                   <div class="row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">Req. No.</label>
                                    
                                    <div class="col-md-12" id="dvSOID">
                                        
                                    </div>
                                </div>
                            </div>

                          
                            
                        </div>


                            <div class="row">
                                <div class="col-lg-12 table-responsive" id="dvListRequisition">
                                   

                                    <%--<input type="button" value="" class="fa-plus-square" onclick="addRow();SumDbCr();"/>--%>
                                </div>
                            </div>
                            
                            
                             <div class="row"><div class="col-lg-12" style="text-align:right">
                             <div class="col-lg-9">
                             &nbsp;
                             </div>
                             
                            <%-- <input type="button" id="btnClear" class="btn btn-danger btn-sm" value="Clear Form" onclick="ClearForm();" />--%>
                             <div class="col-lg-3">
                             <input type="button" id="btnSave" class="btn btn-success btn-block" value="Add Quotation" onclick="SaveQuotation();" />
                             </div>
                             </div></div>

                             <div class="table-responsive" id="dvQuotation" >
                                
                            </div>

                  </div>
                </div>
    <!-- Middle Content Start -->
   
    <!-- .vd_content-wrapper --> 
    
    <!-- Middle Content End --> 
   
   
    
  </div>
  <!-- .container --> 
</div>
<!-- .content -->

<!-- Footer Start -->
  <footer class="footer-2"  id="footer">      
    <div class="vd_bottom ">
        <div class="container">
            <div class="row">
              <div class=" col-xs-12">
                <div class="copyright text-center">
                  	Copyright &copy;2017 AQM Solutions All Rights Reserved 
                </div>
              </div>
            </div><!-- row -->
        </div><!-- container -->
    </div>
  </footer>
<!-- Footer END -->

</div>

<!-- .vd_body END  -->
<a id="back-top" href="#" data-action="backtop" class="vd_back-top visible"> <i class="fa  fa-angle-up"> </i> </a>
<!--
<a class="back-top" href="#" id="back-top"> <i class="icon-chevron-up icon-white"> </i> </a> -->

<!-- Javascript =============================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<script type="text/javascript" src="../AAUI/js/jquery.js"></script> 
<!--[if lt IE 9]>
  <script type="text/javascript" src="js/excanvas.js"></script>      
<![endif]-->
<script type="text/javascript" src="../AAUI/js/bootstrap.min.js"></script> 
<script type="text/javascript" src='../AAUI/plugins/jquery-ui/jquery-ui.custom.min.js'></script>
<script type="text/javascript" src="../AAUI/plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

<script type="text/javascript" src="../AAUI/js/caroufredsel.js"></script> 
<script type="text/javascript" src="../AAUI/js/plugins.js"></script>

<script type="text/javascript" src="../AAUI/plugins/breakpoints/breakpoints.js"></script>
<script type="text/javascript" src="../AAUI/plugins/dataTables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../AAUI/plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js"></script> 

<script type="text/javascript" src="../AAUI/plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="../AAUI/plugins/tagsInput/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="../AAUI/plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="../AAUI/plugins/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="../AAUI/plugins/pnotify/js/jquery.pnotify.min.js"></script>

<script type="text/javascript" src="../AAUI/js/theme.js"></script>
<script type="text/javascript" src="../AAUI/custom/custom.js"></script>
 
 <script src="../js/jquery-1.9.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
    <script src="QuotationAP.js" type="text/javascript"></script>
    </form>
</body>
</html>
