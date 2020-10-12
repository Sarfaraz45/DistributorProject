<%@ Page Title="" Language="C#" MasterPageFile="~/HR/MasterPage.master" AutoEventWireup="true" CodeFile="SO_LIST.aspx.cs" Inherits="HR_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%--<script src="../js/vendors.bundle.js" type="text/javascript"></script>
        <script src="../js/app.bundle.js" type="text/javascript"></script>--%>
    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="jquery-1.8.2.js" type="text/javascript"></script>
         <link rel="stylesheet" media="screen, print" href="../css/notifications/toastr/toastr.css">
         <script src="../js/notifications/toastr/toastr.js"></script>
   <title> SO List | Sale Order</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <main id="js-page-content" role="main" class="page-content">
                        
                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class='subheader-icon fal fa-edit'></i> Sale Order
                            </h1>
                        </div>
                     
                          <label  id="lblID" style="display:none;"></label>
     
                         <div class="row">
                            <div class="col-xl-12">
                                <div id="panel-1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                           
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
                                                  <div class="col-lg-4">
                                                <div class="form-group">
                                                     <label class="col-md-12 control-label">Date From</label>
                                                     <div class="col-md-12">
                                    <div class="input-group">
                                                    <input type="text" class="form-control is-valid" placeholder="Select Date" id="dtFROM" autocomplete="off"/ >
                                                    <span class="input-group-addon" id="Span1" data-datepicker="datepicker-icon-trigger-PV" data-datepicker="#dtFROM"><i class="fa fa-calendar"></i></span>
                                    
                                                </div>
                                                </div>
                                                </div>
                                                </div>


                                                             <div class="col-lg-4">
                                                <div class="form-group">
                                                     <label class="col-md-12 control-label">Date TO</label>
                                                     <div class="col-md-12">
                                    <div class="input-group">
                                                    <input type="text" class="form-control is-valid" placeholder="Select Date" id="dtTO" autocomplete="off"/ >
                                                    <span class="input-group-addon" id="datepicker-icon-trigger-PVTO" data-datepicker="#dtTO"><i class="fa fa-calendar"></i></span>
                                    
                                                </div>
                                                </div>
                                                </div>
                                                </div>
                                                      
                                                 <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Customer </label>
                                                     <select class="custom-select is-invalid" id="ddlHead" onchange="CheckDataLength();" >
                                                      
                                                    </select>
                                              <%--       <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Customer.
                                                        </div>--%>

                                                </div>
                                                </div>
                                                </div>
                                                <div class="row" style="height:20px;"></div>
                                      <div class="form-group" style="text-align:right;">
                                                <button type="button" id="Button1" class="btn btn-success waves-effect waves-themed" onclick="SaveData();">Go</button>

                                                </div>
                                                  
                                                



                        
                   
            


                                                </div>
                                                </div>
                                               

                                                </div>


                         
<%--
                                                                    
                                                 <div class="form-group" style="text-align:right;">
                                             <button type="button" id="btnSave" class="btn btn-success waves-effect waves-themed" onclick="SaveData();">Process</button>
                                        <%--     <button type="button" class="btn btn-danger waves-effect waves-themed">Delete</button>--%>
                                           <%--  <button type="button" id="btnClear" class="btn btn-warning waves-effect waves-themed" onclick="Cancel();">Cancel</button>--%>
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
                                            Task Type List
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
    <script src="Activity.js" type="text/javascript"></script> 
         
</asp:Content>


