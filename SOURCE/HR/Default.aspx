<%@ Page Title="" Language="C#" MasterPageFile="~/HR/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="HR_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link id="myskin" rel="stylesheet" media="screen, print" href="../css/skins/skin-master.css">
        
        <link rel="apple-touch-icon" sizes="180x180" href="../img/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="../img/favicon/favicon-32x32.png">
        <link rel="mask-icon" href="../img/favicon/safari-pinned-tab.svg" color="#5bbad5">
        <link rel="stylesheet" media="screen, print" href="../css/miscellaneous/reactions/reactions.css">
        <link rel="stylesheet" media="screen, print" href="../css/miscellaneous/fullcalendar/fullcalendar.bundle.css">
        <link rel="stylesheet" media="screen, print" href="../css/miscellaneous/jqvmap/jqvmap.bundle.css">
        <link rel="stylesheet" media="screen, print" href="../css/fa-solid.css">
        <link rel="stylesheet" media="screen, print" href="../css/statistics/chartjs/chartjs.css">
        <link rel="stylesheet" media="screen, print" href="../css/statistics/c3/c3.css">
    
 
           <title>WasteEnable | Dashboard</title>
         
               <!-- The order of scripts is irrelevant. Please check out the plugin pages for more details about these plugins below: -->
              
            
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
         <main id="js-page-content " role="main" class="page-content p-2">
                        <!-- <ol class="breadcrumb page-breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">SmartAdmin</a></li>
                            <li class="breadcrumb-item">Application Intel</li>
                            <li class="breadcrumb-item active">Analytics Dashboard</li>
                            <li class="position-absolute pos-top pos-right d-none d-sm-block"><span class="js-get-date"></span></li>
                        </ol> -->
                        <div class="subheader mb-2">
                            <h1 class="subheader-title">
                                <i class='subheader-icon fal fa-chart-area'></i> Analytics <span class='fw-300'>Dashboard</span>
                            </h1>
                            <!-- <div class="subheader-block d-lg-flex align-items-center">
                                <div class="d-inline-flex flex-column justify-content-center mr-3">
                                    <span class="fw-300 fs-xs d-block opacity-50">
                                        <small>EXPENSES</small>
                                    </span>
                                    <span class="fw-500 fs-xl d-block color-primary-500">
                                        $47,000
                                    </span>
                                </div>
                                <span class="sparklines hidden-lg-down" sparkType="bar" sparkBarColor="#886ab5" sparkHeight="32px" sparkBarWidth="5px" values="3,4,3,6,7,3,3,6,2,6,4"></span>
                            </div> -->
                            <!-- <div class="subheader-block d-lg-flex align-items-center border-faded border-right-0 border-top-0 border-bottom-0 ml-3 pl-3">
                                <div class="d-inline-flex flex-column justify-content-center mr-3">
                                    <span class="fw-300 fs-xs d-block opacity-50">
                                        <small>MY PROFITS</small>
                                    </span>
                                    <span class="fw-500 fs-xl d-block color-danger-500">
                                        $38,500
                                    </span>
                                </div>
                                <span class="sparklines hidden-lg-down" sparkType="bar" sparkBarColor="#fe6bb0" sparkHeight="32px" sparkBarWidth="5px" values="1,4,3,6,5,3,9,6,5,9,7"></span>
                            </div> -->
                        </div>
                        <div class="row">
                            <div class="col-lg-4 pr-0">
                                <div id="panel-1" class="panel " data-panel-lock="false" data-panel-close="false" data-panel-fullscreen="false" data-panel-collapsed="false" data-panel-color="false" data-panel-locked="false" data-panel-refresh="false" data-panel-reset="false">
                                    <div class="panel-hdr">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#tab_direction-1" role="tab">Hangzhou Workforce</a></li>
                                            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab_direction-2" role="tab">DMC Workforce</a></li>
                                           
                                        </ul>
                                        <!-- <h2>
                                            Workforce
                                        </h2> -->
                                        <div class="panel-toolbar pr-3 align-self-end">
                                            <!-- <ul id="demo_panel-tabs" class="nav nav-tabs border-bottom-0 nav-tabs-clean" role="tablist">
                                                <li class="nav-item">
                                                    <a class="nav-link active" data-toggle="tab" href="#tab_default-1" role="tab">Live Stats</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" data-toggle="tab" href="#tab_default-2" role="tab">Revenue</a>
                                                </li>
                                            </ul> -->
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content border-faded border-left-0 border-right-0 border-top-0 mb-0">
                                            <div class="row no-gutters">
                                                <div class="col-lg-12 col-xl-12">
                                                   
                                                    <div class="tab-content p-3">
                                                        <div class="tab-pane fade show active" id="tab_direction-1" role="tabpanel">
                                                            <div class="position-relative">
                                                                <div id="donutChart" style="z-index:1;width:100%; height:270px;"></div>
                                                              </div>
                                                        </div>
                                                        <div class="tab-pane fade" id="tab_direction-2" role="tabpanel">
                                                            <div class="position-relative">
                                                                <div id="donutChart2" style="z-index:1;width:100%; height:270px;"></div>
                                                              </div>
                                                        </div>
                                                       
                                                    </div>
                                                   
                                                </div>
                                                <!-- <div class="col-lg-4 col-xl-12">
                                                    <div class="px-0 py-0 d-flex align-items-center p-2 mb-4 " style="background-color:#dcffdb;">
                                                        <div class="js-easy-pie-chart position-relative d-inline-flex align-items-center justify-content-center" data-percent="75" data-piesize="40" data-linewidth="5" data-linecap="butt" data-scalelength="0" style="color:#0eda0b;">
                                                            <div class="d-flex flex-column align-items-center justify-content-center position-absolute pos-left pos-right pos-top pos-bottom fw-300 fs-lg">
                                                                <span class="js-percent d-block text-dark"></span>
                                                            </div>
                                                        </div>
                                                        <span class="d-inline-block ml-2 text-muted">
                                                           
                                                            <i class="fas fa-badge" style="color:#0eda0b"></i>
                                                            Moving
                                                           
                                                        </span>
                                                       
                                                    </div>
                                                    <div class="px-0 py-0 d-flex align-items-center p-2 mb-4" style="background-color:#fff8d9;">
                                                        <div class="js-easy-pie-chart  position-relative d-inline-flex align-items-center justify-content-center" data-percent="75" data-piesize="40" data-linewidth="5" data-linecap="butt" data-scalelength="0" style="color:#faf328;">
                                                            <div class="d-flex flex-column align-items-center justify-content-center position-absolute pos-left pos-right pos-top pos-bottom fw-300 fs-lg">
                                                                <span class="js-percent d-block text-dark"></span>
                                                            </div>
                                                        </div>
                                                        <span class="d-inline-block ml-2 text-muted">
                                                            
                                                            <i class="fas fa-badge" style="color:#faf328;"></i>
                                                            Idle
                                                           
                                                        </span>
                                                       
                                                    </div>
                                                    <div class="px-0 py-0 d-flex align-items-center p-2 mb-4" style="background-color:#ffdaca;">
                                                        <div class="js-easy-pie-chart  position-relative d-inline-flex align-items-center justify-content-center" data-percent="25" data-piesize="40" data-linewidth="5" data-linecap="butt" data-scalelength="0" style="color:#ff4f00;">
                                                            <div class="d-flex flex-column align-items-center justify-content-center position-absolute pos-left pos-right pos-top pos-bottom fw-300 fs-lg">
                                                                <span class="js-percent d-block text-dark"></span>
                                                            </div>
                                                        </div>
                                                        <span class="d-inline-block ml-2 text-muted">
                                                            <i class="fas fa-badge" style="color:#ff4f00"></i>
                                                            Parked
                                                           
                                                        </span>
                                                       
                                                    </div>
                                                    <div class="px-0 py-0 d-flex align-items-center p-2 " style="background-color:#d8edff;">
                                                        <div class="js-easy-pie-chart  position-relative d-inline-flex align-items-center justify-content-center" data-percent="75" data-piesize="40" data-linewidth="5" data-linecap="butt" data-scalelength="0" style="color:#c5c5c5;">
                                                            <div class="d-flex flex-column align-items-center justify-content-center position-absolute pos-left pos-right pos-top pos-bottom fw-300 fs-lg">
                                                                <span class="js-percent d-block text-dark"></span>
                                                            </div>
                                                        </div>
                                                        <span class="d-inline-block ml-2 text-muted">
                                                            <i class="fas fa-badge" style="color:#c5c5c5"></i>
                                                            NR
                                                           
                                                        </span>
                                                       
                                                    </div>
                                                </div> -->
                                               
                                            </div>
                                        </div>
                                       
                                        <!-- <div class="panel-content p-0">
                                            <div class="row row-grid no-gutters">
                                                <div class="col-sm-4  col-lg-5 col-xl-6">
                                                    <div class="px-3 py-2 d-flex align-items-center">
                                                        <div class="js-easy-pie-chart color-primary-300 position-relative d-inline-flex align-items-center justify-content-center" data-percent="75" data-piesize="50" data-linewidth="5" data-linecap="butt" data-scalelength="0">
                                                            <div class="d-flex flex-column align-items-center justify-content-center position-absolute pos-left pos-right pos-top pos-bottom fw-300 fs-lg">
                                                                <span class="js-percent d-block text-dark"></span>
                                                            </div>
                                                        </div>
                                                        <span class="d-inline-block ml-2 text-muted">
                                                            <i class="fal fa-caret-up color-success-500 ml-1"></i>
                                                            Running
                                                           
                                                        </span>
                                                        
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
                                                    <div class="px-3 py-2 d-flex align-items-center">
                                                        <div class="js-easy-pie-chart color-success-500 position-relative d-inline-flex align-items-center justify-content-center" data-percent="79" data-piesize="50" data-linewidth="5" data-linecap="butt">
                                                            <div class="d-flex flex-column align-items-center justify-content-center position-absolute pos-left pos-right pos-top pos-bottom fw-300 fs-lg">
                                                                <span class="js-percent d-block text-dark"></span>
                                                            </div>
                                                        </div>
                                                        <span class="d-inline-block ml-2 text-muted">
                                                            DISK SPACE
                                                            <i class="fal fa-caret-down color-success-500 ml-1"></i>
                                                        </span>
                                                        <div class="ml-auto d-inline-flex align-items-center">
                                                            <div class="sparklines d-inline-flex" sparktype="line" sparkheight="30" sparkwidth="70" sparklinecolor="#1dc9b7" sparkfillcolor="false" sparklinewidth="1" values="5,9,7,3,5,2,5,3,9,6"></div>
                                                            <div class="d-inline-flex flex-column small ml-2">
                                                                <span class="d-inline-block badge badge-info opacity-50 text-center p-1 width-6">76%</span>
                                                                <span class="d-inline-block badge bg-warning-300 opacity-50 text-center p-1 width-6 mt-1">3%</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
                                                    <div class="px-3 py-2 d-flex align-items-center">
                                                        <div class="js-easy-pie-chart color-info-500 position-relative d-inline-flex align-items-center justify-content-center" data-percent="23" data-piesize="50" data-linewidth="5" data-linecap="butt">
                                                            <div class="d-flex flex-column align-items-center justify-content-center position-absolute pos-left pos-right pos-top pos-bottom fw-300 fs-lg">
                                                                <span class="js-percent d-block text-dark"></span>
                                                            </div>
                                                        </div>
                                                        <span class="d-inline-block ml-2 text-muted">
                                                            DATA TTF
                                                            <i class="fal fa-caret-up color-success-500 ml-1"></i>
                                                        </span>
                                                        <div class="ml-auto d-inline-flex align-items-center">
                                                            <div class="sparklines d-inline-flex" sparktype="line" sparkheight="30" sparkwidth="70" sparklinecolor="#51adf6" sparkfillcolor="false" sparklinewidth="1" values="3,5,2,5,3,9,6,5,9,7"></div>
                                                            <div class="d-inline-flex flex-column small ml-2">
                                                                <span class="d-inline-block badge bg-fusion-500 opacity-50 text-center p-1 width-6">10GB</span>
                                                                <span class="d-inline-block badge bg-fusion-300 opacity-50 text-center p-1 width-6 mt-1">10%</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
                                                    <div class="px-3 py-2 d-flex align-items-center">
                                                        <div class="js-easy-pie-chart color-fusion-500 position-relative d-inline-flex align-items-center justify-content-center" data-percent="36" data-piesize="50" data-linewidth="5" data-linecap="butt">
                                                            <div class="d-flex flex-column align-items-center justify-content-center position-absolute pos-left pos-right pos-top pos-bottom fw-300 fs-lg">
                                                                <span class="js-percent d-block text-dark"></span>
                                                            </div>
                                                        </div>
                                                        <span class="d-inline-block ml-2 text-muted">
                                                            TEMP.
                                                            <i class="fal fa-caret-down color-success-500 ml-1"></i>
                                                        </span>
                                                        <div class="ml-auto d-inline-flex align-items-center">
                                                            <div class="sparklines d-inline-flex" sparktype="line" sparkheight="30" sparkwidth="70" sparklinecolor="#fd3995" sparkfillcolor="false" sparklinewidth="1" values="5,3,9,6,5,9,7,3,5,2"></div>
                                                            <div class="d-inline-flex flex-column small ml-2">
                                                                <span class="d-inline-block badge badge-danger opacity-50 text-center p-1 width-6">124</span>
                                                                <span class="d-inline-block badge bg-info-300 opacity-50 text-center p-1 width-6 mt-1">40F</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> -->
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div id="panel-1" class="panel " data-panel-lock="false" data-panel-close="false" data-panel-fullscreen="false" data-panel-collapsed="false" data-panel-color="false" data-panel-locked="false" data-panel-refresh="false" data-panel-reset="false">
                                    <div class="panel-hdr">
                                        <h2>
                                            Complains <small style="font-size:11px;">Analysis based on total complains</small>
                                        </h2>
                                       
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content border-faded border-left-0 border-right-0 border-top-0">
                                            <div class="row no-gutters">
                                                <div class="col-lg-12 col-xl-12">
                                                    <div id="barHorizontalStacked">
                                                        <canvas style="width:100%; height:300px;"></canvas>
                                                    </div>
                                                    <!-- <div class="position-relative"> -->
                                                        <!-- <div class="custom-control custom-switch position-absolute pos-top pos-left ml-5 mt-3 z-index-cloud">
                                                            <input type="checkbox" class="custom-control-input" id="start_interval">
                                                            <label class="custom-control-label" for="start_interval">Live Update</label>
                                                        </div> -->
                                                        <!-- <div id="updating-chart" style="height:248px"></div>
                                                    </div> -->
                                                </div>
                                               
                                            </div>
                                        </div>
                                      
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div id="panel-1" class="panel row mb-2" data-panel-lock="false" data-panel-close="false" data-panel-fullscreen="false" data-panel-collapsed="false" data-panel-color="false" data-panel-locked="false" data-panel-refresh="false" data-panel-reset="false">
                                    <div class="panel-hdr">
                                        <h2>
                                            Task/Activites <small style="font-size:11px;">Analysis based on current date</small>
                                        </h2>
                                       
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content border-faded border-left-0 border-right-0 border-top-0">
                                            <div class="row no-gutters">
                                                <div class="col-lg-12 col-xl-12">
                                                    <div id="pieChart" style="width:100%; height:300px;"></div>
                                                </div>
                                                <!-- <div class="col-lg-12 col-xl-12 ">
                                                    <div class="d-flex mt-2">
                                                        Total Fleet Idle
                                                        <span class="d-inline-block ml-auto">Aprox. Fuel Waste</span>
                                                    </div>
                                                    <div class="d-flex mt-2">
                                                        <div class="d-flex">
                                                        <i class="fal fa-truck-container color-success-500 ml-1 fa-3x"></i>
                                                        <span class="fs-xxl text-info pl-2 ">32 hrs</span>
                                                       
                                                    </div>
                                                    <i class=" text-center fal fa-chevron-double-right color-success-500 ml-1 fa-2x mx-auto"></i>
                                                    <i class="fal fa-gas-pump color-success-500 ml-1 fa-3x"></i>
                                                    <span class="text-info fs-xxl pl-2 ">84 ltrs</span> 
                                                   
                                                    </div>
                                                   <p class="mt-2 pt-2 mb-0"><strong>Note:</strong> Generally, an idling car uses somewhere between 1.89 to 2.64 liter of fuel per hour.</p>
                                                 
                                                </div> -->
                                               
                                            </div>
                                        </div>
                                      
                                    </div>
                                </div>

                                <!-- <div id="panel-2" class="panel row" data-panel-lock="false" data-panel-close="false" data-panel-fullscreen="false" data-panel-collapsed="false" data-panel-color="false" data-panel-locked="false" data-panel-refresh="false" data-panel-reset="false">
                                    <div class="panel-hdr">
                                        <h2>
                                            Job Information
                                        </h2>
                                       
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content border-faded border-left-0 border-right-0 border-top-0 border-bottom-0">
                                            <div class="row no-gutters">
                                                <div class="col-lg-4 col-4">
                                                    <div class="d-flex ">
                                                        Completed
                                                    </div>
                                                    <div class="d-flex">
                                                        Running
                                                    </div>
                                                    <div class="d-flex">
                                                        Not Started
                                                    </div>
                                                </div>
                                                <div class="col-lg-8 col-8 mt-1">
                                                   
                                                    <div class="progress  mb-2">
                                                        <div class="progress-bar bg-fusion-400" role="progressbar" style="width: 65%;" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100">65%</div>
                                                    </div>
                                                    
                                                    <div class="progress  mb-2">
                                                        <div class="progress-bar bg-success-500" role="progressbar" style="width: 34%;" aria-valuenow="34" aria-valuemin="0" aria-valuemax="100">34%</div>
                                                    </div>
                                                   
                                                    <div class="progress  mb-1">
                                                        <div class="progress-bar bg-info-400" role="progressbar" style="width: 77%;" aria-valuenow="77" aria-valuemin="0" aria-valuemax="100">77%</div>
                                                    </div>
                                                   
                                                   
                                                </div>
                                               
                                            </div>
                                        </div>
                                      
                                    </div>
                                </div> -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 col-xl-3 col-lg-2">
                                <div class="p-1  rounded overflow-hidden position-relative text-white mb-g" style="background-color:#ffb2b2;">
                                    <div class="">
                                        <div class="text-dark fw-500 p-1">Supervisor</div>
                                        <!-- <h5 class="pt-3 display-5 d-block l-h-n m-0 fw-400 text-right color-danger-800">
                                            Max Speed
                                            <small class="m-0 l-h-n">108 km/h</small>
                                        </h5> -->
                                        <h3 class="text-right p-2 color-danger-800 fw-500" >
                                            13 / 13
                                        <small class="m-0 l-h-n" style="color: #000000;font-weight: 600;">In Action</small></h3>
                                    </div>
                                    <img src="../icons/supervisor.png" class="position-absolute pos-left pos-bottom opacity-40 mb-n1 mr-n1" height="80" width="80" alt="">
                                    <!-- <i class="fal fa-tachometer-alt position-absolute pos-left pos-bottom opacity-40 mb-n1 mr-n1" style="font-size:4rem"></i> -->
                             
                                </div>
                            </div>
                            <div class="col-sm-6 col-xl-3 col-lg-2">
                                <div class="p-1  rounded overflow-hidden position-relative text-white mb-g" style="background-color:#b4c6ff;">
                                    <div class="">
                                        <div class="text-dark fw-500 p-1">Driver</div>
                                        <!-- <h5 class="pt-3 display-5 d-block l-h-n m-0 fw-400 text-right color-danger-800">
                                            Max Overstay
                                            <small class="m-0 l-h-n">22 hrs</small>
                                        </h5> -->
                                        <h3 class="text-right p-2 color-danger-800 fw-500" >
                                            98 / 101
                                        <small class="m-0 l-h-n" style="color: #000000;font-weight: 600;">At Duty</small></h3>
                                    </div>
                                    <!-- <i class="fal fa-location-circle position-absolute pos-left pos-bottom opacity-40 mb-n1 mr-n1" style="font-size:4rem"></i> -->
                                    <img src="../icons/driver.png" class="position-absolute pos-left pos-bottom opacity-40 mb-n1 mr-n1" height="80" width="80" alt="">
                             
                                </div>
                            </div>
                            <div class="col-sm-6 col-xl-3 col-lg-2">
                                <div class="p-1  rounded overflow-hidden position-relative text-white mb-g" style="background-color:#6adede;">
                                    <div class="">
                                        <div class="text-dark fw-500 p-1">Within 12 Hours</div>
                                        <!-- <h5 class="pt-3 display-5 d-block l-h-n m-0 fw-400 text-right color-danger-800">
                                            Aprox Fuel Waste
                                            <small class="m-0 l-h-n">22 lts</small>
                                        </h5> -->
                                        <h3 class="text-right p-2 color-danger-800 fw-500" >
                                            14
                                        <small class="m-0 l-h-n" style="color: #000000;font-weight: 600;">Resolved</small></h3>
                                    </div>
                                    <i class="fal fa-map position-absolute pos-left pos-bottom opacity-40 mb-n1 mr-n1" style="font-size:4rem"></i>
                             
                                </div>
                            </div>
                            <div class="col-sm-6 col-xl-3 col-lg-2">
                                <div class="p-1  rounded overflow-hidden position-relative text-white mb-g" style="background-color:#ffd465;">
                                    <div class="">
                                        <div class="text-dark fw-500 p-1">Within 24 Hours</div>
                                        <!-- <h5 class="pt-3 display-5 d-block l-h-n m-0 fw-400 text-right color-danger-800">
                                            Aprox Fuel Waste
                                            <small class="m-0 l-h-n">22 lts</small>
                                        </h5> -->
                                        <h3 class="text-right p-2 color-danger-800 fw-500" >
                                            12
                                        <small class="m-0 l-h-n" style="color: #000000;font-weight: 600;">Resolved</small></h3>
                                    </div>
                                    <i class="fal fa-map position-absolute pos-left pos-bottom opacity-40 mb-n1 mr-n1" style="font-size:4rem"></i>
                             
                                </div>
                            </div>
                            <div class="col-sm-6 col-xl-3 col-lg-2">
                                <div class="p-1  rounded overflow-hidden position-relative text-white mb-g" style="background-color:#c5e1a5;">
                                    <div class="">
                                        <div class="text-dark fw-500 p-1">D2D Collection</div>
                                        <!-- <h5 class="pt-3 display-5 d-block l-h-n m-0 fw-400 text-right color-danger-800">
                                            Aprox Fuel Waste
                                            <small class="m-0 l-h-n">22 lts</small>
                                        </h5> -->
                                        <h3 class="text-right p-2 color-danger-800 fw-500" >
                                            13 / 18
                                        <small class="m-0 l-h-n" style="color: #000000;font-weight: 600;">Completed</small></h3>
                                    </div>
                                    <i class="fal fa-map-marked position-absolute pos-left pos-bottom opacity-40 mb-n1 mr-n1" style="font-size:4rem"></i>
                             
                                </div>
                            </div>
                            <div class="col-sm-6 col-xl-3 col-lg-2">
                                <div class="p-1  rounded overflow-hidden position-relative text-white mb-g" style="background-color:#7be2ff;">
                                    <div class="">
                                        <div class="text-dark fw-500 p-1">Manual Sweeping</div>
                                        <!-- <h5 class="pt-3 display-5 d-block l-h-n m-0 fw-400 text-right color-danger-800">
                                            Aprox Fuel Waste
                                            <small class="m-0 l-h-n">22 lts</small>
                                        </h5> -->
                                        <h3 class="text-right p-2 color-danger-800 fw-500" >
                                           16 / 18
                                        <small class="m-0 l-h-n" style="color: #000000;font-weight: 600;">Completed</small></h3>
                                    </div>
                                    <i class="fal fa-map-marked position-absolute pos-left pos-bottom opacity-40 mb-n1 mr-n1" style="font-size:4rem"></i>
                             
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 col-xl-3 col-lg-2">
                                <div class="p-1  rounded overflow-hidden position-relative text-white mb-g" style="background-color:#f78686;">
                                    <div class="">
                                        <div class="text-dark fw-500 p-1">Sanitary Worker</div>
                                        <!-- <h5 class="pt-3 display-5 d-block l-h-n m-0 fw-400 text-right color-danger-800">
                                            Max Speed
                                            <small class="m-0 l-h-n">108 km/h</small>
                                        </h5> -->
                                        <h3 class="text-right p-2 color-danger-800 fw-500" >
                                            68 / 75
                                        <small class="m-0 l-h-n" style="color: #000000;font-weight: 600;">In Action</small></h3>
                                    </div>
                                    <!-- <i class="fal fa-tachometer-alt position-absolute pos-left pos-bottom opacity-40 mb-n1 mr-n1" style="font-size:4rem"></i> -->
                                    <img src="../icons/sworker.png" class="position-absolute pos-left pos-bottom opacity-40 mb-n1 mr-n1" height="80" width="80" alt="">
                             
                                </div>
                            </div>
                            <div class="col-sm-6 col-xl-3 col-lg-2">
                                <div class="p-1  rounded overflow-hidden position-relative text-white mb-g" style="background-color:#8da6fa;">
                                    <div class="">
                                        <div class="text-dark fw-500 p-1">Helper</div>
                                        <!-- <h5 class="pt-3 display-5 d-block l-h-n m-0 fw-400 text-right color-danger-800">
                                            Max Overstay
                                            <small class="m-0 l-h-n">22 hrs</small>
                                        </h5> -->
                                        <h3 class="text-right p-2 color-danger-800 fw-500" >
                                            41 / 52
                                        <small class="m-0 l-h-n" style="color: #000000;font-weight: 600;">In Action</small></h3>
                                    </div>
                                    <!-- <i class="fal fa-location-circle position-absolute pos-left pos-bottom opacity-40 mb-n1 mr-n1" style="font-size:4rem"></i> -->
                                    <img src="../icons/helper.png" class="position-absolute pos-left pos-bottom opacity-40 mb-n1 mr-n1" height="80" width="80" alt="">
                             
                                </div>
                            </div>
                            <div class="col-sm-6 col-xl-3 col-lg-2">
                                <div class="p-1  rounded overflow-hidden position-relative text-white mb-g" style="background-color:#17cccc;">
                                    <div class="">
                                        <div class="text-dark fw-500 p-1">Within 36 Hours</div>
                                        <!-- <h5 class="pt-3 display-5 d-block l-h-n m-0 fw-400 text-right color-danger-800">
                                            Aprox Fuel Waste
                                            <small class="m-0 l-h-n">22 lts</small>
                                        </h5> -->
                                        <h3 class="text-right p-2 color-danger-800 fw-500" >
                                            8
                                        <small class="m-0 l-h-n" style="color: #000000;font-weight: 600;">Pending</small></h3>
                                    </div>
                                    <i class="fal fa-map position-absolute pos-left pos-bottom opacity-40 mb-n1 mr-n1" style="font-size:4rem"></i>
                             
                                </div>
                            </div>
                            <div class="col-sm-6 col-xl-3 col-lg-2">
                                <div class="p-1  rounded overflow-hidden position-relative text-white mb-g" style="background-color:#f7c037;">
                                    <div class="">
                                        <div class="text-dark fw-500 p-1">Within 48 Hours</div>
                                        <!-- <h5 class="pt-3 display-5 d-block l-h-n m-0 fw-400 text-right color-danger-800">
                                            Aprox Fuel Waste
                                            <small class="m-0 l-h-n">22 lts</small>
                                        </h5> -->
                                        <h3 class="text-right p-2 color-danger-800 fw-500" >
                                            7
                                        <small class="m-0 l-h-n" style="color: #000000;font-weight: 600;">Resolved</small></h3>
                                    </div>
                                    <i class="fal fa-map position-absolute pos-left pos-bottom opacity-40 mb-n1 mr-n1" style="font-size:4rem"></i>
                             
                                </div>
                            </div>
                           
                            <div class="col-sm-6 col-xl-3 col-lg-2">
                                <div class="p-1  rounded overflow-hidden position-relative text-white mb-g" style="background-color:#92dd3b;">
                                    <div class="">
                                        <div class="text-dark fw-500 p-1">Mechanical Sweeping</div>
                                        <!-- <h5 class="pt-3 display-5 d-block l-h-n m-0 fw-400 text-right color-danger-800">
                                            Aprox Fuel Waste
                                            <small class="m-0 l-h-n">22 lts</small>
                                        </h5> -->
                                        <h3 class="text-right p-2 color-danger-800 fw-500" >
                                            5 / 6
                                        <small class="m-0 l-h-n" style="color: #000000;font-weight: 600;">Completed</small></h3>
                                    </div>
                                    <i class="fal fa-map-marked position-absolute pos-left pos-bottom opacity-40 mb-n1 mr-n1" style="font-size:4rem"></i>
                             
                                </div>
                            </div>

                            <div class="col-sm-6 col-xl-3 col-lg-2">
                                <div class="p-1  rounded overflow-hidden position-relative text-white mb-g" style="background-color:#30cdf8;">
                                    <div class="">
                                        <div class="text-dark fw-500 p-1">Garbage Collection</div>
                                        <!-- <h5 class="pt-3 display-5 d-block l-h-n m-0 fw-400 text-right color-danger-800">
                                            Aprox Fuel Waste
                                            <small class="m-0 l-h-n">22 lts</small>
                                        </h5> -->
                                        <h3 class="text-right p-2 color-danger-800 fw-500" >
                                            2 / 48
                                        <small class="m-0 l-h-n" style="color: #000000;font-weight: 600;">Completed</small></h3>
                                    </div>
                                    <i class="fal fa-map-marked position-absolute pos-left pos-bottom opacity-40 mb-n1 mr-n1" style="font-size:4rem"></i>
                             
                                </div>
                            </div>
                           
                        </div>
                     
                    </main>
               <script src="../js/vendors.bundle.js" type="text/javascript"></script>
        <script src="../js/app.bundle.js" type="text/javascript"></script>   
          
         <script type="text/javascript">
             /* Activate smart panels */
             $('#js-page-content').smartPanel();

        </script>
        <script type="text/javascript" >
             /* bar horizontal stacked */
             var barHorizontalStacked = function()
            {
                var barHorizontalStackedData = {
                    labels: ["UC-1", "UC-2", "UC-3", "UC-4", "UC-5", "UC-6", "UC-7","UC-8","UC-9","UC-10","UC-11","UC-12","UC-13"],
                    datasets: [
                    {
                        label: "Resolved",
                        backgroundColor: color.primary._300,
                        borderColor: color.primary._500,
                        borderWidth: 1,
                        data: [
                            5,
                            8,
                            0,
                            3,
                            7, 0, 0,0,0,0,0,8,2
                        ]
                    },
                    {
                        label: "Complains",
                        backgroundColor: color.success._300,
                        borderColor: color.success._500,
                        borderWidth: 1,
                        data: [
                            2,
                            4,
                            0,
                            2,
                            0, 0, 0,0,0,0,0,0,0
                        ]
                    }]

                };
                var config = {
                    type: 'horizontalBar',
                    data: barHorizontalStackedData,
                    options:
                    {
                        legend:
                        {
                            display: false,
                            labels:
                            {
                                display: false
                            }
                        },
                        scales:
                        {
                            yAxes: [
                            {
                                stacked: true,
                                gridLines:
                                {
                                    display: true,
                                    color: "#f2f2f2"
                                },
                                ticks:
                                {
                                    beginAtZero: true,
                                    fontSize: 11
                                }
                            }],
                            xAxes: [
                            {
                                stacked: true,
                                gridLines:
                                {
                                    display: true,
                                    color: "#f2f2f2"
                                },
                                ticks:
                                {
                                    beginAtZero: true,
                                    fontSize: 11
                                }
                            }]
                        }
                    }
                }
                new Chart($("#barHorizontalStacked > canvas").get(0).getContext("2d"), config);
            }
            /* bar horizontal stacked -- end */
           

            $(document).ready(function()
            {
                barHorizontalStacked();
                
                //$('#js-page-content').smartPanel(); 

                //
                //
               // var colors = [color.success._600, color.danger._500, color.info._500, color.primary._500, color.warning._500];
               var colors = ['#0eda0b','#ff4f00','#faf328','c5c5c5'];
               var colorspie = ['#7D8AF9','#64F850','#EFFC1D'];

               var pieChart = c3.generate(
            {
                bindto: "#pieChart",
                data:
                {
                    // iris data from R
                    columns: [
                        ['Completed',36 ],
                        ['Running', 48],
                        ['Not Started', 16]
                        //["setosa", 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2, 0.2, 0.4, 0.2, 0.2, 0.2, 0.2, 0.4, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.3, 0.3, 0.2, 0.6, 0.4, 0.3, 0.2, 0.2, 0.2, 0.2],
                        //["versicolor", 1.4, 1.5, 1.5, 1.3, 1.5, 1.3, 1.6, 1.0, 1.3, 1.4, 1.0, 1.5, 1.0, 1.4, 1.3, 1.4, 1.5, 1.0, 1.5, 1.1, 1.8, 1.3, 1.5, 1.2, 1.3, 1.4, 1.4, 1.7, 1.5, 1.0, 1.1, 1.0, 1.2, 1.6, 1.5, 1.6, 1.5, 1.3, 1.3, 1.3, 1.2, 1.4, 1.2, 1.0, 1.3, 1.2, 1.3, 1.3, 1.1, 1.3],
                        //["virginica", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
                    ],
                    type: 'pie' //,
                    /*onclick: function (d, i) { console.log("onclick", d, i); },
                    onmouseover: function (d, i) { console.log("onmouseover", d, i); },
                    onmouseout: function (d, i) { console.log("onmouseout", d, i); }*/
                },
                color:
                {
                    pattern: colorspie
                }
            });

                var donutChart = c3.generate(
            {
                bindto: "#donutChart",
                data:
                {
                    // iris data from R
                    columns: [
                        //['IE', 30],
                        ['Present', 85],
                        ["Absent", 10],
                        ["Leave", 5]
                       // ["NR", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
                    ],
                    type: 'donut' //,
                    /*onclick: function (d, i) { console.log("onclick", d, i); },
                    onmouseover: function (d, i) { console.log("onmouseover", d, i); },
                    onmouseout: function (d, i) { console.log("onmouseout", d, i); }*/
                },
                donut:
                {
                    title: "Attendance"
                },
                color:
                {
                    pattern: colors
                },
                legend:{
                    show:true
                }
                
            });
            var donutChart2 = c3.generate(
            {
                bindto: "#donutChart2",
                data:
                {
                    // iris data from R
                    columns: [
                        //['IE', 30],
                        ['Present', 0],
                        ["Absent", 0],
                        ["Leave", 0]
                       // ["NR", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
                    ],
                    type: 'donut' //,
                    /*onclick: function (d, i) { console.log("onclick", d, i); },
                    onmouseover: function (d, i) { console.log("onmouseover", d, i); },
                    onmouseout: function (d, i) { console.log("onmouseout", d, i); }*/
                },
                donut:
                {
                    title: "Attendance"
                },
                color:
                {
                    pattern: colors
                },
                legend:{
                    show:true
                }
                
            });


                var dataSetPie = [
                {
                    label: "Asia",
                    data: 4119630000,
                    color: color.primary._500
                },
                {
                    label: "Latin America",
                    data: 590950000,
                    color: color.info._500
                },
                {
                    label: "Africa",
                    data: 1012960000,
                    color: color.warning._500
                },
                {
                    label: "Oceania",
                    data: 95100000,
                    color: color.danger._500
                },
                {
                    label: "Europe",
                    data: 727080000,
                    color: color.success._500
                },
                {
                    label: "North America",
                    data: 344120000,
                    color: color.fusion._400
                }];


                $.plot($("#flotPie"), dataSetPie,
                {
                    series:
                    {
                        pie:
                        {
                            innerRadius: 0.5,
                            show: true,
                            radius: 1,
                            label:
                            {
                                show: true,
                                radius: 2 / 3,
                                threshold: 0.1
                            }
                        }
                    },
                    legend:
                    {
                        show: false
                    }
                });


                $.plot('#flotBar1', [
                {
                    data: [
                        [1, 0],
                        [2, 0],
                        [3, 0],
                        [4, 1],
                        [5, 3],
                        [6, 3],
                        [7, 10],
                        [8, 11],
                        [9, 10],
                        [10, 9],
                        [11, 12],
                        [12, 8],
                        [13, 10],
                        [14, 6],
                        [15, 3]
                    ],
                    bars:
                    {
                        show: true,
                        lineWidth: 0,
                        fillColor: color.fusion._50,
                        barWidth: .3,
                        order: 'left'
                    }
                },
                {
                    data: [
                        [1, 0],
                        [2, 0],
                        [3, 1],
                        [4, 2],
                        [5, 2],
                        [6, 5],
                        [7, 8],
                        [8, 12],
                        [9, 10],
                        [10, 11],
                        [11, 3]
                    ],
                    bars:
                    {
                        show: true,
                        lineWidth: 0,
                        fillColor: color.success._500,
                        barWidth: .3,
                        align: 'right'
                    }
                }],
                {
                    grid:
                    {
                        borderWidth: 0,
                    },
                    yaxis:
                    {
                        min: 0,
                        max: 15,
                        tickColor: 'rgba(0,0,0,0.05)',
                        ticks: [
                            [0, ''],
                            [5, '$5000'],
                            [10, '$25000'],
                            [15, '$45000']
                        ],
                        font:
                        {
                            color: '#444',
                            size: 10
                        }
                    },
                    xaxis:
                    {
                        mode: 'categories',
                        tickColor: 'rgba(0,0,0,0.05)',
                        ticks: [
                            [0, '3am'],
                            [1, '4am'],
                            [2, '5am'],
                            [3, '6am'],
                            [4, '7am'],
                            [5, '8am'],
                            [6, '9am'],
                            [7, '10am'],
                            [8, '11am'],
                            [9, '12nn'],
                            [10, '1pm'],
                            [11, '2pm'],
                            [12, '3pm'],
                            [13, '4pm'],
                            [14, '5pm']
                        ],
                        font:
                        {
                            color: '#999',
                            size: 9
                        }
                    }
                });


                /*
                 * VECTOR MAP
                 */

                var data_array = {
                    "af": "16.63",
                    "al": "0",
                    "dz": "158.97",
                    "ao": "85.81",
                    "ag": "1.1",
                    "ar": "351.02",
                    "am": "8.83",
                    "au": "1219.72",
                    "at": "366.26",
                    "az": "52.17",
                    "bs": "7.54",
                    "bh": "21.73",
                    "bd": "105.4",
                    "bb": "3.96",
                    "by": "52.89",
                    "be": "461.33",
                    "bz": "1.43",
                    "bj": "6.49",
                    "bt": "1.4",
                    "bo": "19.18",
                    "ba": "16.2",
                    "bw": "12.5",
                    "br": "2023.53",
                    "bn": "11.96",
                    "bg": "44.84",
                    "bf": "8.67",
                    "bi": "1.47",
                    "kh": "11.36",
                    "cm": "21.88",
                    "ca": "1563.66",
                    "cv": "1.57",
                    "cf": "2.11",
                    "td": "7.59",
                    "cl": "199.18",
                    "cn": "5745.13",
                    "co": "283.11",
                    "km": "0.56",
                    "cd": "12.6",
                    "cg": "11.88",
                    "cr": "35.02",
                    "ci": "22.38",
                    "hr": "59.92",
                    "cy": "22.75",
                    "cz": "195.23",
                    "dk": "304.56",
                    "dj": "1.14",
                    "dm": "0.38",
                    "do": "50.87",
                    "ec": "61.49",
                    "eg": "216.83",
                    "sv": "21.8",
                    "gq": "14.55",
                    "er": "2.25",
                    "ee": "19.22",
                    "et": "30.94",
                    "fj": "3.15",
                    "fi": "231.98",
                    "fr": "2555.44",
                    "ga": "12.56",
                    "gm": "1.04",
                    "ge": "11.23",
                    "de": "3305.9",
                    "gh": "18.06",
                    "gr": "305.01",
                    "gd": "0.65",
                    "gt": "40.77",
                    "gn": "4.34",
                    "gw": "0.83",
                    "gy": "2.2",
                    "ht": "6.5",
                    "hn": "15.34",
                    "hk": "226.49",
                    "hu": "132.28",
                    "is": "0",
                    "in": "1430.02",
                    "id": "695.06",
                    "ir": "337.9",
                    "iq": "84.14",
                    "ie": "204.14",
                    "il": "201.25",
                    "it": "2036.69",
                    "jm": "13.74",
                    "jp": "5390.9",
                    "jo": "27.13",
                    "kz": "129.76",
                    "ke": "32.42",
                    "ki": "0.15",
                    "kw": "117.32",
                    "kg": "4.44",
                    "la": "6.34",
                    "lv": "23.39",
                    "lb": "39.15",
                    "ls": "1.8",
                    "lr": "0.98",
                    "lt": "35.73",
                    "lu": "52.43",
                    "mk": "9.58",
                    "mg": "8.33",
                    "mw": "5.04",
                    "my": "218.95",
                    "mv": "1.43",
                    "ml": "9.08",
                    "mt": "7.8",
                    "mr": "3.49",
                    "mu": "9.43",
                    "mx": "1004.04",
                    "md": "5.36",
                    "rw": "5.69",
                    "ws": "0.55",
                    "st": "0.19",
                    "sa": "434.44",
                    "sn": "12.66",
                    "rs": "38.92",
                    "sc": "0.92",
                    "sl": "1.9",
                    "sg": "217.38",
                    "sk": "86.26",
                    "si": "46.44",
                    "sb": "0.67",
                    "za": "354.41",
                    "es": "1374.78",
                    "lk": "48.24",
                    "kn": "0.56",
                    "lc": "1",
                    "vc": "0.58",
                    "sd": "65.93",
                    "sr": "3.3",
                    "sz": "3.17",
                    "se": "444.59",
                    "ch": "522.44",
                    "sy": "59.63",
                    "tw": "426.98",
                    "tj": "5.58",
                    "tz": "22.43",
                    "th": "312.61",
                    "tl": "0.62",
                    "tg": "3.07",
                    "to": "0.3",
                    "tt": "21.2",
                    "tn": "43.86",
                    "tr": "729.05",
                    "tm": "0",
                    "ug": "17.12",
                    "ua": "136.56",
                    "ae": "239.65",
                    "gb": "2258.57",
                    "us": "14624.18",
                    "uy": "40.71",
                    "uz": "37.72",
                    "vu": "0.72",
                    "ve": "285.21",
                    "vn": "101.99",
                    "ye": "30.02",
                    "zm": "15.69",
                    "zw": "0"
                };

                $('#vector-map').vectorMap(
                {
                    map: 'world_en',
                    backgroundColor: 'transparent',
                    color: color.warning._50,
                    borderOpacity: 0.5,
                    borderWidth: 1,
                    hoverColor: color.success._300,
                    hoverOpacity: null,
                    selectedColor: color.success._500,
                    selectedRegions: ['US'],
                    enableZoom: true,
                    showTooltip: true,
                    scaleColors: [color.primary._400, color.primary._50],
                    values: data_array,
                    normalizeFunction: 'polynomial',
                    onRegionClick: function(element, code, region)
                    {
                        /*var message = 'You clicked "'
						+ region
						+ '" which has the code: '
						+ code.toLowerCase();
			 
					console.log(message);*/

                        var randomNumber = Math.floor(Math.random() * 10000000);
                        var arrow;

                        if (Math.random() >= 0.5 == true)
                        {
                            arrow = '<div class="ml-2 d-inline-flex"><i class="fal fa-caret-up text-success fs-xs"></i></div>'
                        }
                        else
                        {
                            arrow = '<div class="ml-2 d-inline-flex"><i class="fal fa-caret-down text-danger fs-xs"></i></div>'
                        }

                        $('.js-jqvmap-flag').attr('src', 'https://lipis.github.io/flag-icon-css/flags/4x3/' + code.toLowerCase() + '.svg');
                        $('.js-jqvmap-country').html(region + ' - ' + '$' + randomNumber.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + arrow);
                    }
                });


                /* TAB 1: UPDATING CHART */
                var data = [],
                    totalPoints = 200;
                var getRandomData = function()
                {
                    if (data.length > 0)
                        data = data.slice(1);

                    // do a random walk
                    while (data.length < totalPoints)
                    {
                        var prev = data.length > 0 ? data[data.length - 1] : 50;
                        var y = prev + Math.random() * 10 - 5;
                        if (y < 0)
                            y = 0;
                        if (y > 100)
                            y = 100;
                        data.push(y);
                    }

                    // zip the generated y values with the x values
                    var res = [];
                    for (var i = 0; i < data.length; ++i)
                        res.push([i, data[i]])
                    return res;
                }
                // setup control widget
                var updateInterval = 1500;
                $("#updating-chart").val(updateInterval).change(function()
                {

                    var v = $(this).val();
                    if (v && !isNaN(+v))
                    {
                        updateInterval = +v;
                        $(this).val("" + updateInterval);
                    }

                });
                // setup plot
                var options = {
                    colors: [color.primary._700],
                    series:
                    {
                        lines:
                        {
                            show: true,
                            lineWidth: 0.5,
                            fill: 0.9,
                            fillColor:
                            {
                                colors: [
                                {
                                    opacity: 0.6
                                },
                                {
                                    opacity: 0
                                }]
                            },
                        },

                        shadowSize: 0 // Drawing is faster without shadows
                    },
                    grid:
                    {
                        borderColor: 'rgba(0,0,0,0.05)',
                        borderWidth: 1,
                        labelMargin: 5
                    },
                    xaxis:
                    {
                        color: '#F0F0F0',
                        tickColor: 'rgba(0,0,0,0.05)',
                        font:
                        {
                            size: 10,
                            color: '#999'
                        }
                    },
                    yaxis:
                    {
                        min: 0,
                        max: 100,
                        color: '#F0F0F0',
                        tickColor: 'rgba(0,0,0,0.05)',
                        font:
                        {
                            size: 10,
                            color: '#999'
                        }
                    }
                };
                var plot = $.plot($("#updating-chart"), [getRandomData()], options);
                /* live switch */
                $('input[type="checkbox"]#start_interval').click(function()
                {
                    if ($(this).prop('checked'))
                    {
                        $on = true;
                        updateInterval = 1500;
                        update();
                    }
                    else
                    {
                        clearInterval(updateInterval);
                        $on = false;
                    }
                });
                var update = function()
                {
                    if ($on == true)
                    {
                        plot.setData([getRandomData()]);
                        plot.draw();
                        setTimeout(update, updateInterval);

                    }
                    else
                    {
                        clearInterval(updateInterval)
                    }

                }



                /*calendar */
                var todayDate = moment().startOf('day');
                var YM = todayDate.format('YYYY-MM');
                var YESTERDAY = todayDate.clone().subtract(1, 'day').format('YYYY-MM-DD');
                var TODAY = todayDate.format('YYYY-MM-DD');
                var TOMORROW = todayDate.clone().add(1, 'day').format('YYYY-MM-DD');


                var calendarEl = document.getElementById('calendar');

                var calendar = new FullCalendar.Calendar(calendarEl,
                {
                    plugins: ['dayGrid', 'list', 'timeGrid', 'interaction', 'bootstrap'],
                    themeSystem: 'bootstrap',
                    timeZone: 'UTC',
                    //dateAlignment: "month", //week, month
                    buttonText:
                    {
                        today: 'today',
                        month: 'month',
                        week: 'week',
                        day: 'day',
                        list: 'list'
                    },
                    eventTimeFormat:
                    {
                        hour: 'numeric',
                        minute: '2-digit',
                        meridiem: 'short'
                    },
                    navLinks: true,
                    header:
                    {
                        left: 'title',
                        center: '',
                        right: 'today prev,next'
                    },
                    footer:
                    {
                        left: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek',
                        center: '',
                        right: ''
                    },
                    editable: true,
                    eventLimit: true, // allow "more" link when too many events
                    events: [
                    {
                        title: 'All Day Event',
                        start: YM + '-01',
                        description: 'This is a test description', //this is currently bugged: https://github.com/fullcalendar/fullcalendar/issues/1795
                        className: "border-warning bg-warning text-dark"
                    },
                    {
                        title: 'Reporting',
                        start: YM + '-14T13:30:00',
                        end: YM + '-14',
                        className: "bg-white border-primary text-primary"
                    },
                    {
                        title: 'Surgery oncall',
                        start: YM + '-02',
                        end: YM + '-03',
                        className: "bg-primary border-primary text-white"
                    },
                    {
                        title: 'NextGen Expo 2019 - Product Release',
                        start: YM + '-03',
                        end: YM + '-05',
                        className: "bg-info border-info text-white"
                    },
                    {
                        title: 'Dinner',
                        start: YM + '-12',
                        end: YM + '-10'
                    },
                    {
                        id: 999,
                        title: 'Repeating Event',
                        start: YM + '-09T16:00:00',
                        className: "bg-danger border-danger text-white"
                    },
                    {
                        id: 1000,
                        title: 'Repeating Event',
                        start: YM + '-16T16:00:00'
                    },
                    {
                        title: 'Conference',
                        start: YESTERDAY,
                        end: TOMORROW,
                        className: "bg-success border-success text-white"
                    },
                    {
                        title: 'Meeting',
                        start: TODAY + 'T10:30:00',
                        end: TODAY + 'T12:30:00',
                        className: "bg-primary text-white border-primary"
                    },
                    {
                        title: 'Lunch',
                        start: TODAY + 'T12:00:00',
                        className: "bg-info border-info"
                    },
                    {
                        title: 'Meeting',
                        start: TODAY + 'T14:30:00',
                        className: "bg-warning text-dark border-warning"
                    },
                    {
                        title: 'Happy Hour',
                        start: TODAY + 'T17:30:00',
                        className: "bg-success border-success text-white"
                    },
                    {
                        title: 'Dinner',
                        start: TODAY + 'T20:00:00',
                        className: "bg-danger border-danger text-white"
                    },
                    {
                        title: 'Birthday Party',
                        start: TOMORROW + 'T07:00:00',
                        className: "bg-primary text-white border-primary text-white"
                    },
                    {
                        title: 'Gotbootstrap Meeting',
                        url: 'http://gotbootstrap.com/',
                        start: YM + '-28',
                        className: "bg-info border-info text-white"
                    }],
                    viewSkeletonRender: function()
                    {
                        $('.fc-toolbar .btn-default').addClass('btn-sm');
                        $('.fc-header-toolbar h2').addClass('fs-md');
                        $('#calendar').addClass('fc-reset-order')
                    },

                });

                calendar.render();
            });

        </script>
        <script src="../js/dependency/moment/moment.js" type="text/javascript"></script>
        <script src="../js/miscellaneous/fullcalendar/fullcalendar.bundle.js" type="text/javascript"></script>
        <script src="../js/statistics/sparkline/sparkline.bundle.js" type="text/javascript"></script>
        <script src="../js/statistics/easypiechart/easypiechart.bundle.js" type="text/javascript"></script>
        <script src="../js/statistics/flot/flot.bundle.js" type="text/javascript"></script>
        <script src="../js/miscellaneous/jqvmap/jqvmap.bundle.js" type="text/javascript"></script>
        <script src="../js/statistics/d3/d3.js" type="text/javascript"></script>
        <!-- c3 charts : MIT license -->
        <script src="../js/statistics/c3/c3.js" type="text/javascript"></script>
        <script src="../js/statistics/demo-data/demo-c3.js" type="text/javascript"></script>
        <script src="../js/statistics/chartjs/chartjs.bundle.js" type="text/javascript"></script>
      
          <script src="../js/vendors.bundle.js" type="text/javascript"></script>
        <script src="../js/app.bundle.js" type="text/javascript"></script>
</asp:Content>

