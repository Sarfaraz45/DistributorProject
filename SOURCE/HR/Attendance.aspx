<%@ Page Title="" Language="C#" MasterPageFile="~/HR/MasterPage.master" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="HR_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="jquery-1.8.2.js" type="text/javascript"></script>
         <link rel="stylesheet" media="screen, print" href="../css/notifications/toastr/toastr.css">
         <script src="../js/notifications/toastr/toastr.js"></script>
   <title>WasteEnable | Manual Attendance</title>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <main id="js-page-content" role="main" class="page-content">
                        
                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class='subheader-icon fal fa-edit'></i> Employee Attendance
                            </h1>
                        </div>
                     
                          <label  id="lblID" style="display:none;"></label>
     
                         <div class="row">
                            <div class="col-xl-12">
                                <div id="panel-1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Attendance Information 
                                        </h2>

                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">      
                                      
                                            <form>    <asp:Label ID="lblMsg" runat="server" CssClass="parsley-errors-list" Visible="False"></asp:Label>
                                    <asp:TextBox ID="txtid" runat="server" Visible="False" CssClass="form_inputfeild" placeholder="Enter Name"></asp:TextBox>      
                                                   <div class="row">
                                                  <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Select User</label>
                                                 <%--<asp:DropDownList ID="ddlUser" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                                                 <input class="form-control" type="date" value="2023-07-23T11:25:00" id="datetimepicker1">
                                                </div>
                                                </div>
                                                
                                                </div>
                                                  
                                                <div class="row" style="height:20px;"></div>

                                                                    
                                                 <div class="form-group" style="text-align:right;">
                                             <button type="button" id="btnSave" class="btn btn-success waves-effect waves-themed" onclick="InsertAttendance();">Save Attendance</button>
                                        <%--     <button type="button" class="btn btn-danger waves-effect waves-themed">Delete</button>--%>
                                             <%--<button type="button" id="btnClear" class="btn btn-warning waves-effect waves-themed" onclick="Cancel();">Cancel</button>--%>
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

                                     
                                <asp:HiddenField ID="hdnid" runat="server" />
                                                </form></div></div>
                                    </div>
                                    </div></div>
                    </main>
    
<script type="text/javascript">

    function LoadEmployee() {

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "Attendance.aspx/LoadRegion",
            dataType: "json",
            data: "{}",
            success: function (data) {
                var jsdata = JSON.parse(data.d);
                var ro = "";

                if ($('#dt-basic-example').length != 0) {

                    $('#dt-basic-example').remove();
                }

                ro = "<table id='dt-basic-example' class='table table-sm  dataTable dtr-inline table-hover' ><thead class='thead-themed'><th></th><th>NAME</th><th>TIME IN</th><th>TIME OUT</th></thead><tbody>";
                $.each(jsdata, function (key, value) {


                    ro += "<tr><td><input type='checkbox' class=" + value.EmpID + " id=chk" + value.EmpID + " ></td><td class='one'>" + value.Name + "</td><td class='one'><input class='form-control' id='tmIn" + value.EmpID + "' type='time' name='time'></td><td class='one'><input class='form-control' id='tmOut" + value.EmpID + "' type='time' name='time'></td> <td   style='display:none;' class='zero'>" + value.EmpID + "</td></tr>";

                });
                ro = ro + "</tbody></table>";

                $("#DivRegion").append(ro);



            },
            error: function (result) {
                alert(result);
            }


        });


    }

    LoadEmployee();





    function InsertAttendance() {
        var UserID = localStorage.getItem("UserID");
        $('#dt-basic-example').find('input[type="checkbox"]:checked').each(function () {

            var EmployeeID = $(this).closest('tr').children('td:eq(4)').text();
            // alert(EmployeeID);
            var timein = $('#tmIn' + EmployeeID).val();
            var timeOut = $('#tmOut' + EmployeeID).val();
            //            var TimeInHour = $('#ddlInhour' + EmployeeID).val();
            //            var TimeInMint = $('#ddlInMin' + EmployeeID).val();
            //            var TimeInAMPM = $('#ddlFMIN' + EmployeeID).val();
            //            var TimeOutHour = $('#ddlOuthour' + EmployeeID).val();
            //            var TimeOutMint = $('#ddlOutMin' + EmployeeID).val();
            //            var TimeOutAMPM = $('#ddlFMOUT' + EmployeeID).val();

            //var dataToSend = JSON.stringify({ 'EmployeeID': EmployeeID, 'TimeInHour': TimeInHour, 'TimeInMint': TimeInMint, 'TimeInAMPM': TimeInAMPM, 'TimeOutHour': TimeOutHour, 'TimeOutMint': TimeOutMint, 'TimeOutAMPM': TimeOutAMPM, 'MonthYear': $('#datetimepicker1').val(), 'UserID': UserID });
            var dataToSend = JSON.stringify({ 'EmployeeID': EmployeeID, 'timein': timein, 'timeOut': timeOut, 'MonthYear': $('#datetimepicker1').val(), 'UserID': UserID });            
            var results = $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Attendance.aspx/InsertAttendance",
                dataType: "json",
                data: dataToSend,
                async: false,
                success: function (data) {
                    var obj = data.d;
                    if (obj == 'true') {
                         //alert("Attendance has been saved successfully.");
                         //LoadRegion();
                         //location.reload();
                    }

                },
                error: function (result) {
                    alert(result);
                }
            });

            return results;
        });
        alert("Attendance has been saved successfully.");
        //LoadRegion();
        location.reload();
    }


   
</script>
     
</asp:Content>


