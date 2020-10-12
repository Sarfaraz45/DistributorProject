<%@ Page Title="" Language="C#" MasterPageFile="~/HR/MasterPage.master" AutoEventWireup="true" CodeFile="TaskProcessOps.aspx.cs" Inherits="HR_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="jquery-1.8.2.js" type="text/javascript"></script>
   <link rel="stylesheet" media="screen, print" href="../css/datagrid/datatables/datatables.bundle.css">
   <script src="../js/datagrid/datatables/datatables.bundle.js"></script>
        <link rel="stylesheet" media="screen, print" href="../css/notifications/toastr/toastr.css">
         <script src="../js/notifications/toastr/toastr.js"></script>
<%--
   <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
           <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>--%>
    <title>WasteEnable | Task Approval</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <main id="js-page-content" role="main" class="page-content">
                       
                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class='subheader-icon fal fa-edit'></i> Task List
                            </h1>
                        </div>
                     
                        
     
                       <label id="lbltaskid" style="display:none;"></label>

                          <div class="row">
                            <div class="col-xl-12">
                                <div id="Div1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Pending Task List
                                        </h2>

                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>

                                    <div class="panel-container show">
                                        <div class="panel-content">                                          
                                            <form>
                                                
                                                <div class="form-group" id="DivRegion">
                                                    
                                                </div>
                                                </form></div></div>
                                    </div>
                                    </div></div>
                    </main>
    <%--<script src="Team.js" type="text/javascript"></script> --%>
    
   

    <div class="modal fade" id="default-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
                                                <div class="modal-dialog modal-lg" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">TASK DETAIL</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true"><i class="fal fa-times"></i></span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                                                    
                         
                                        <div class="panel-content">      
                                      
                                            <form>
                                                   <div class="row">
                                                  <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Title</label>
                                                    <input type="text" class="form-control" id="txtTitle" disabled="disabled">
                                                </div>
                                                </div>
                                                <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Activity</label>
                                                    <input type="text" class="form-control"  id="txtActivity" disabled="disabled">
                                                      
                                                    </select>
                                                </div>
                                                </div>
                                                </div>
                                                  <div class="row" style="height:20px;"></div>
                                                  <div class="row">
                                                  <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Task Date</label>
                                                    <input type="text" class="form-control" id="txtStartDate" disabled="disabled">
                                                </div>
                                                </div>
                                                <div class="col-md-6" style="display:none;">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">End Date</label>
                                                    <input type="text" class="form-control"  id="txtEndDate" disabled="disabled">
                                                      
                                                    </select>
                                                </div>
                                                </div>

                                                 <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Shift</label>
                                                    <input type="text" class="form-control"  id="txtShift" disabled="disabled">
                                                      
                                                    </select>
                                                </div>
                                                </div>
                                                </div>

                                                <div class="row" style="height:20px;"></div>
                                                  <div class="row">
                                                  <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Area </label>
                                                    <input type="text" class="form-control" id="txtArea" disabled="disabled">
                                                </div>
                                                </div>
                                               
                                                </div>
                                                
                                                <%--<div class="row" style="height:20px;"></div>
                                                <div class="form-group" id="DivRegionType">
                                                    
                                                </div>--%>
                                               
                                                  <div class="row" style="display:none;">
                                                 
                                               <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Vehicle</label>
                                                    <select class="form-control" id="ddlVehicle">
                                                      
                                                    </select>
                                                </div>
                                                </div>
                                                 <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Driver</label>
                                                    <select class="form-control" id="ddlDriver">
                                                      
                                                    </select>
                                                </div>
                                                </div>
                                                 

                                                 <%--<div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Vehicle Qty</label>
                                                         <input type="number" class="form-control" id="txtVehicleQty" >
                                                </div>
                                                </div>--%>
                                                </div>
                                                <div class="row" style="height:20px;display:none;"></div> 
                                                <div class="row" style="display:none;">
                                                <div class="col-md-8" >
                                                </div>
                                                 <div class="col-md-4">
                                                <div class="form-group">
                                                       <button type="button" class="btn btn-info btn-pills waves-effect waves-themed" style="width:100%;" onclick="SaveVehicle();">A D D</button>
                                                </div>
                                                </div>
                                                </div>
                                                 <div class="row" style="height:20px;"></div>
                                                <div class="form-group" id="DivRegionVehDetail">
                                                    
                                                </div>


                                                
                                                <%--<div class="row" style="height:20px;"></div>

                                                                       <div class="form-group">

                                                 <div class="row" id="dvForm" style="display:none;">
                            

                            <div class="col-lg-12">
                                 <div id="dvDetail"  ></div>  
                          </div>
                          </div>
                          </div>--%>

                                     
                                               
                                            
                                            </form>
                                                                         
                                            
                                        </div>
                         
                          
                                                        </div>
                                                       <%-- <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            <button type="button" class="btn btn-primary">Save changes</button>
                                                        </div>--%>
                                                    </div>
                                                </div>
                                            </div>

                                              
 

          <script src="TaskProcessOps.js" type="text/javascript"></script>
           
       
</asp:Content>


