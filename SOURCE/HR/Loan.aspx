<%@ Page Title="" Language="C#" MasterPageFile="~/HR/MasterPage.master" AutoEventWireup="true" CodeFile="Loan.aspx.cs" Inherits="HR_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="jquery-1.8.2.js" type="text/javascript"></script>
         <link rel="stylesheet" media="screen, print" href="../css/notifications/toastr/toastr.css">
         <script src="../js/notifications/toastr/toastr.js"></script>
   
   <title>WasteEnable | Loan</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <main id="js-page-content" role="main" class="page-content">
                        
                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class='subheader-icon fal fa-edit'></i> Add Loan
                            </h1>
                        </div>
                     
                          <label  id="lblID" style="display:none;"></label>
     
                         <div class="row">
                            <div class="col-xl-12">
                                <div id="panel-1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Loan Information 
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
                                                    <label class="form-label" for="example-palaceholder">Loan Title</label>
                                                    <input type="text" class="form-control is-invalid" placeholder="Type Loan Title" id="txtTitle" autocomplete="off" onkeyup="CheckDataLength();" >
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div><div class="invalid-feedback">
                                                          Please provide a valid Loan Title.
                                                        </div>
                                                </div>
                                                </div>  
                                                  <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Employee </label>
                                                     <select class="custom-select is-invalid" id="ddlHead" onchange="CheckDataLength();" >
                                                      
                                                    </select>
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Employee.
                                                        </div>
                                                </div>
                                                </div>
                                                
                                                </div>
                                                  
                                                <div class="row" style="height:20px;"></div>

                                                 <div class="row">
                                               <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Loan Date</label>
                                                    <input type="date" class="form-control is-invalid" id="txtRegNo" autocomplete="off" onchange="CheckDataLength();" >
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Date.
                                                        </div>
                                                </div>
                                                </div> 
                                                <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Monthly Deduction</label>
                                                    <input type="number" class="form-control is-invalid"  id="txtChasisNo" autocomplete="off" onkeyup="CheckDataLength();" >
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Monthly Deduction.
                                                        </div>
                                                </div>
                                                </div>
                                                </div>
                                                  
                                                <div class="row" style="height:20px;"></div>

                                                  <div class="row">
                                                  <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Paid Amount</label>
                                                    <input type="text" class="form-control is-valid"  value="0" id="txtDescription" autocomplete="off" onkeyup="CheckDataLength();" disabled="disabled" >
                                                    
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Amount.
                                                        </div>
                                                </div>
                                                </div>

                                                  <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Balance</label>
                                                    <input type="text" class="form-control is-valid"value="0" id="txtModel" autocomplete="off" onkeyup="CheckDataLength();" disabled="disabled" >
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Amount.
                                                        </div>
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
                                            Loan List
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
    <script src="Loan.js" type="text/javascript"></script> 
         
</asp:Content>


