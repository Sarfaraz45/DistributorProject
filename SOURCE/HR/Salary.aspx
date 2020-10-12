<%@ Page Title="" Language="C#" MasterPageFile="~/HR/MasterPage.master" AutoEventWireup="true" CodeFile="Salary.aspx.cs" Inherits="HR_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="jquery-1.8.2.js" type="text/javascript"></script>
         <link rel="stylesheet" media="screen, print" href="../css/notifications/toastr/toastr.css">
         <script src="../js/notifications/toastr/toastr.js"></script>
   
   <title>WasteEnable | Employee Salary</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <main id="js-page-content" role="main" class="page-content">
                        
                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class='subheader-icon fal fa-edit'></i> Add Salary
                            </h1>
                        </div>
                     
                          <label  id="lblID" style="display:none;"></label>
     
                         <div class="row">
                            <div class="col-xl-12">
                                <div id="panel-1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Salary Information 
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
                                                  
                                                  <div class="col-md-12">
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
                                                    <label class="form-label" for="example-palaceholder">Basic Salary</label>
                                                    <input type="number" class="form-control is-invalid" id="txtBasicSalary" autocomplete="off"  onkeyup="CalculateMonthlyTax();CheckDataLength();"  >
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Basic Salary.
                                                        </div>
                                                </div>
                                                </div> 
                                                <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Tax Percentage (Numeric)</label>
                                                    <input type="number" class="form-control is-invalid"  id="txtTaxPercentage" autocomplete="off" onkeyup="CalculateMonthlyTax();CheckDataLength();">
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Tax Percentage.
                                                        </div>
                                                </div>
                                                </div>
                                                </div>
                                                  
                                                <div class="row" style="height:20px;"></div>

                                                  <div class="row">
                                                  <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Tax Amount</label>
                                                     
                                                     <input type="number" class="form-control is-invalid" id="txtTaxAmount" autocomplete="off" onchange="CheckDataLength();" disabled="disabled" >
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Tax Amount.
                                                        </div>
                                                </div>
                                                </div>

                                                  <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Estimated Monthly Salary</label>
                                                    <input type="number" class="form-control is-invalid"   id="txtEstimatedSalary" autocomplete="off" onkeyup="CheckDataLength();" disabled="disabled" >
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Estimated Monthly Salary.
                                                        </div>
                                                </div>
                                                </div>
                                                 
                                              
                                                </div>
                                                  
                                                <div class="row" style="height:20px;"></div>
                                                   <div class="row">


                       
                        
                        <div class="col-md-6">
                       <table class="table" id="tblAllowance"  >                     
                      <thead>
                        <tr>
                        <th></th>
                          <th>ALLOWANCE</th>
                          <th>AMOUNT</th>                        
                          
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                        <td><input type="checkbox" id="chk" value="on" ></td>                          
                                                                      
                                                 
                        </tr>                        
                      </tbody>
                      </table>
                      </div>

                      <div class="col-md-6">
                       <table class="table " id="tblDeduction" >                     
                      <thead>
                        <tr>
                        <th></th>
                          <th>DEDUCTION</th>
                          <th>AMOUNT</th>                        
                          
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                        <td><input type="checkbox" id="Checkbox1" value="on" ></td>                          
                                                                         
                                                 
                        </tr>                        
                      </tbody>
                      </table>
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
                                            Salary List
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
    <script src="Salary.js" type="text/javascript"></script> 
         
</asp:Content>


