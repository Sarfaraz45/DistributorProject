<%@ Page Title="" Language="C#" MasterPageFile="~/HR/MasterPage.master" AutoEventWireup="true" CodeFile="TaskCycle.aspx.cs" Inherits="HR_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="jquery-1.8.2.js" type="text/javascript"></script>
         <link rel="stylesheet" media="screen, print" href="../css/notifications/toastr/toastr.css">
         <script src="../js/notifications/toastr/toastr.js"></script>
   <title>WasteEnable | Task Cycle</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <main id="js-page-content" role="main" class="page-content">
                        
                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class='subheader-icon fal fa-edit'></i> Add Task Cycle
                            </h1>
                        </div>
                     
                          <label  id="lblID" style="display:none;"></label>
     
                         <div class="row">
                            <div class="col-xl-12">
                                <div id="panel-1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Task Cycle Information 
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
                                                  <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Task Order</label>
                                                     <select class="custom-select is-invalid" id="ddlOrder" onchange="CheckDataLength();" >
                                                     <option value="0">Select Order</option>
                                                     <option value="1">1</option>
                                                     <option value="2">2</option>
                                                     <option value="3">3</option>
                                                     <option value="4">4</option>
                                                     <option value="5">5</option>
                                                     <option value="6">6</option>
                                                     <option value="7">7</option>
                                                     <option value="8">8</option>
                                                     <option value="9">9</option>
                                                     <option value="10">10</option>

                                                      
                                                    </select>
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                         <div class="invalid-feedback">
                                                          Please provide a valid Vehicle Type Title.
                                                        </div>
                                                </div>
                                                </div>
                                               
                                                <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Designation </label>
                                                     <select class="custom-select is-invalid" id="ddlHead" onchange="CheckDataLength();" >
                                                      
                                                    </select>
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                         <div class="invalid-feedback">
                                                          Please provide a valid Vehicle Type Title.
                                                        </div>
                                                </div>
                                                </div>
                                                 
                                                  <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Approval Duration (Minutes)</label>
                                                    <input type="number" class="form-control is-invalid" placeholder="Type Approval Duration"  onkeyup="CheckDataLength();"  id="txtDuration" autocomplete="off">
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                         <div class="invalid-feedback">
                                                          Please provide a valid Vehicle Type Title.
                                                        </div>
                                                </div>
                                                </div>
                                                 </div>
                                                  
                                                <div class="row" style="height:20px;"></div>

                                                  <div class="row">
                                                  
                                                <div class="col-md-12">
                                               <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="defaultUnchecked">
                                                        <label class="custom-control-label" for="defaultUnchecked">Task Cycle Type ( Check for Board )</label>
                                                    </div>
                                                </div>
                                                </div>
                                                  
                                                <div class="row" style="height:20px;"></div>

                                                                    
                                                 <div class="form-group" style="text-align:right;">
                                             <button type="button" id="btnSave" class="btn btn-success waves-effect waves-themed" onclick="SaveData();">Submit</button>
                                        <%--     <button type="button" class="btn btn-danger waves-effect waves-themed">Delete</button>--%>
                                             <button type="button" id="btnClear" class="btn btn-warning waves-effect waves-themed" onclick="Cancel();">Cancel</button>
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
                                            Task Cycle List
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
    <script src="TaskCycle.js" type="text/javascript"></script> 
         
</asp:Content>


