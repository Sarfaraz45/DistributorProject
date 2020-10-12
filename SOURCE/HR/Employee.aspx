<%@ Page Title="" Language="C#" MasterPageFile="~/HR/MasterPage.master" AutoEventWireup="true" CodeFile="Employee.aspx.cs" Inherits="HR_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="jquery-1.8.2.js" type="text/javascript"></script>
         <link rel="stylesheet" media="screen, print" href="../css/notifications/toastr/toastr.css">
         <script src="../js/notifications/toastr/toastr.js"></script>
   <title>WasteEnable | Employee</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <main id="js-page-content" role="main" class="page-content">
                        
                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class='subheader-icon fal fa-edit'></i> Add Employee
                            </h1>
                        </div>
                     
                          <label  id="lblID" style="display:none;"></label>
     
                         <div class="row">
                            <div class="col-xl-12">
                                <div id="panel-1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Employee Information 
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
                                                    <label class="form-label" for="example-palaceholder">Employee Name</label>
                                                    <input type="text" class="form-control is-invalid" placeholder="Type Employee Name" id="txtTitle" autocomplete="off" onkeyup="CheckDataLength();" >
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Employee Name.
                                                        </div>
                                                </div>
                                                </div>
                                                <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Date Of Birth</label>
                                                    <input class="form-control is-invalid" type="date" value="2023-07-23T11:25:00" id="DOB" onchange="CheckDataLength();" >
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a Date of Birth.
                                                        </div>
                                                </div>
                                                </div>
                                                </div>
                                                  
                                                <div class="row" style="height:20px;"></div>

                                                 <div class="row">
                                                  <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Gender</label>
                                                    <select class="custom-select is-invalid" id="ddlGender" onchange="CheckDataLength();" >
                                                    <option value="0">Select</option>
                                                    <option value="Male">Male</option>
                                                    <option value="FeMale">FeMale</option> 
                                                    </select>
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Gender.
                                                        </div>
                                                </div>
                                                </div>
                                                <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Designation</label>
                                                     <select class="custom-select is-invalid" id="ddlDesignation" onchange="CheckDataLength();" >
                                                      
                                                    </select>
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Designation.
                                                        </div>
                                                </div>
                                                </div>
                                                </div>
                                                  
                                                <div class="row" style="height:20px;"></div>

                                                  <div class="row">
                                                  <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Shift</label>
                                                   <select class="custom-select is-invalid" id="ddlShift" onchange="CheckDataLength();" >
                                                      
                                                    </select>
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Shift.
                                                        </div>
                                                </div>
                                                </div>
                                                <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Area </label>
                                                     <select class="custom-select is-invalid" id="ddlArea" onchange="CheckDataLength();" >
                                                      
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

                                                  <div class="row">
                                                  <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Employee Type</label>
                                                   <select class="custom-select is-invalid" id="ddlEmployeeType" onchange="CheckDataLength();" >
                                                      
                                                    </select>
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div><div class="invalid-feedback">
                                                          Please provide a valid Employee Type.
                                                        </div>
                                                </div>
                                                </div>
                                                <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">User Type </label>
                                                     <select class="custom-select is-invalid" id="ddlUserType" onchange="CheckDataLength();" >
                                                      
                                                    </select>
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid User Type.
                                                        </div>
                                                </div>
                                                </div>
                                                </div>
                                                  <div class="row" style="height:20px;"></div>

                                                  <div class="row">
                                                  <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">CNIC</label>
                                                    <input type="number" class="form-control is-invalid" placeholder="Type CNIC Number" id="txtCNIC" autocomplete="off" min="0"onkeyup="CheckDataLength();" >
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid CNIC No.
                                                        </div>
                                                </div>
                                                </div>
                                                <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Contact #</label>
                                                    <input type="text" class="form-control is-invalid" placeholder="Type Contact Number" id="txtContact" autocomplete="off" onkeyup="CheckDataLength();" >
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Contact No.
                                                        </div>
                                                </div>
                                                </div>
                                                </div>

                                                 <div class="row" style="height:20px;"></div>

                                                  <div class="row">
                                                  <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Date Of Joining</label>
                                                    
                                                    <input class="form-control is-invalid" type="date" value="2023-07-23T11:25:00" id="DOJ" onchange="CheckDataLength();" >
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Date Of Joining.
                                                        </div>
                                                </div>
                                                </div>
                                                <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Address</label>
                                                    <input type="text" class="form-control is-invalid" placeholder="Type Address" id="txtAddress" autocomplete="off" onkeyup="CheckDataLength();" >
                                                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Address.
                                                        </div>
                                                </div>
                                                </div>
                                                </div>

                                                 <div class="row" style="height:20px;"></div>

                                                  <div class="row">
                                                  <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Login ID (If Any)</label>
                                                    <input type="text" class="form-control" placeholder="Type Address" id="txtLoginID" autocomplete="off">
                                                    
                                                </div>
                                                </div>
                                                <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">Password</label>
                                                    <input type="password" class="form-control" placeholder="Type Address" id="txtPassword" autocomplete="off">
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
                                            Employee List
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
    <script src="Employee.js" type="text/javascript"></script> 
         
</asp:Content>


