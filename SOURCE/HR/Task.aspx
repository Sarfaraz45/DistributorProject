<%@ Page Title="" Language="C#" MasterPageFile="~/HR/MasterPage.master" AutoEventWireup="true" CodeFile="Task.aspx.cs" Inherits="HR_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="jquery-1.8.2.js" type="text/javascript"></script>
        <link rel="stylesheet" media="screen, print" href="../css/notifications/toastr/toastr.css">
         <script src="../js/notifications/toastr/toastr.js"></script>
   <title>WasteEnable | Task</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <main id="js-page-content" role="main" class="page-content">

                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class='subheader-icon fal fa-edit'></i> Generate Task
                            </h1>
                        </div>
                     
                        
     
                         <div class="row">
                            <div class="col-xl-12">
                                <div id="panel-1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Task Information 
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
                                                  <div class="row">
                                                  <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Task Title</label>
                                                    <input type="text" class="form-control is-invalid" placeholder="Type Task Title" id="txtTitle" autocomplete="off" onkeyup="CheckDataLength();" >
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Task Title.
                                                        </div>
                                                </div>
                                                </div>
                                                <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Task Type</label>
                                                    <select class="custom-select is-invalid" id="ddlHead" onchange="CheckDataLength();">
                                                      
                                                    </select>
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Task Type.
                                                        </div>
                                                </div>
                                                </div>
                                                </div>
                                                  <div class="row" style="height:20px;"></div>
                                               <div class="row">
                                                  <div class="col-md-6">
                                                 <div class="form-group">
                                                    <label class="form-label" for="StartDate">Task Date</label>
                                                    <input class="form-control is-invalid" type="date" value="2023-07-23T11:25:00" id="StartDate" onchange="CheckDataLength();" >
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Task Date.
                                                        </div>
                                                    </div>
                                                   </div>
                                                  <div class="col-md-6" style="display:none;">  
                                                    <div class="form-group">
                                                    <label class="form-label" for="EndDate">End Date</label>
                                                    <input class="form-control" type="date" value="2023-07-23T11:25:00" id="EndDate">

                                                    </div>
                                             </div>
                                                <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Shift</label>
                                                    <select class="custom-select is-invalid" id="ddlShift"  onchange="CheckDataLength();" >
                                                      
                                                    </select>
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Shift.
                                                        </div>
                                                </div>
                                                </div>
                                             </div>
                                                <div class="row" style="height:20px;"></div>

                                                  <div class="row">
                                                 
                                                <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Area</label>
                                                    <select class="custom-select is-invalid" id="ddlArea" onchange="LoadLIST();CheckDataLength();">
                                                      
                                                    </select>
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Area.
                                                        </div>
                                                </div>
                                                </div>

                                                     
                                                </div>
                                                <div class="row" style="height:20px;"></div>
                                                                       <div class="form-group">
                                                                         <label class="form-label" for="example-select">Team List</label>
                                                 <div class="row" id="dvForm" style="display:none;">
                            

                            <div class="col-lg-12">
                                 <div id="dvDetail"  ></div>  
                          </div>
                          </div>
                          </div>
                            <div class="panel-hdr" style="min-height:0px;">
                                        
                                    </div>
                             <div class="row" style="height:20px;"></div>
                                                                       <div class="form-group">
                                                                         <label class="form-label" for="example-select">Vehicle Type List</label>
                                                 <div class="row" id="dvFormVehicle" style="display:none;">
                            

                            <div class="col-lg-12">
                                 <div id="dvDetailVehicle"  ></div>  
                          </div>
                          </div>
                          </div>
                              
                           <div class="panel-hdr" style="min-height:0px;">
                                        
                                    </div>
                                    
                                  
                                              <div class="row" style="height:20px;"></div>
                                     <div class="row">
                                                  <div class="col-md-12">
                                                 <div class="form-group">
                                                   <label class="form-label" for="StartDate">Remarks</label>
                                                 <input type="text" class="form-control is-invalid" placeholder="Type Remarks" id="txtRemarks" autocomplete="off" onkeyup="CheckDataLength();" >
                                                 <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                 <div class="invalid-feedback">
                                                          Please provide a valid Task Type Title.
                                                        </div>
                                                 </div>
                                                 </div>
                                                 </div>
                                    <div class="row" style="height:20px;"></div>
                                                 <div class="form-group" style="text-align:right;">
                                             <button type="button" class="btn btn-success waves-effect waves-themed" onclick="SaveTransaction();">Submit</button>
                                           <%--  <button type="button" class="btn btn-danger waves-effect waves-themed">Delete</button>
                                             <button type="button" class="btn btn-warning waves-effect waves-themed">Cancel</button>--%>
                                             </div>
                                               
                                            
                                            </form>
                                                                         
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>

                            
                          
                        </div>

                          <div class="row">
                            <div class="col-xl-12">
                                <div id="Div1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Task List
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
    <script src="Task.js" type="text/javascript"></script> 
         
</asp:Content>


