<%@ Page Title="Plot Detail :: AQM Solutions" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeSalary.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript" src="html/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="html/assets/js/jquery-1.8.2.js"></script>
    
    
  
        <style type="text/css">
        .highlight{
            background:#cfd1d3;
        }
        .nonhighlight {
            background:white;
        }
        .pg-normal { 
cursor: pointer; 
background: #fff; 
padding: 8px 15px 8px 15px; 
margin: 20px 0;
border-radius: 10px;
display: inline-block;
box-sizing: border-box;
margin-bottom: 0!important;
margin-top: 0!important;
border-color: #e2e7eb;
border: 1px solid #ddd;
font-size: 10px;
font-family: 'Open Sans',"Helvetica Neue",Helvetica,Arial,sans-serif;
color: #707478;

        
}

.pg-selected { 
color: #fff; 
background: #000000; 
padding: 8px 15px 8px 15px; 
border-radius: 10px;
display: inline-block;
box-sizing: border-box;
margin-bottom: 0!important;
margin-top: 0!important;
border-color: #e2e7eb;
border: 1px solid #ddd;
font-size: 10px;
font-family: 'Open Sans',"Helvetica Neue",Helvetica,Arial,sans-serif;
    
}
.pg-normal:hover { 
color: #242a30;
background: #e2e7eb;
border-color: #d8dde1;
}
      



    </style>
        <script type="text/javascript">

            function Pager(tableName, itemsPerPage) {

                this.tableName = tableName;

                this.itemsPerPage = itemsPerPage;

                this.currentPage = 1;

                this.pages = 0;

                this.inited = false;

                this.showRecords = function (from, to) {

                    var rows = document.getElementById(tableName).rows;

                    // i starts from 1 to skip table header row

                    for (var i = 1; i < rows.length; i++) {

                        if (i < from || i > to)

                            rows[i].style.display = 'none';

                        else

                            rows[i].style.display = '';

                    }

                }

                this.showPage = function (pageNumber) {
                    if (!this.inited) {

                        alert("not inited");

                        return;

                    }

                    var oldPageAnchor = document.getElementById('pg' + this.currentPage);

                    oldPageAnchor.className = 'pg-normal';

                    this.currentPage = pageNumber;

                    var newPageAnchor = document.getElementById('pg' + this.currentPage);

                    newPageAnchor.className = 'pg-selected';

                    var from = (pageNumber - 1) * itemsPerPage + 1;

                    var to = from + itemsPerPage - 1;

                    this.showRecords(from, to);

                }

                this.prev = function () {

                    if (this.currentPage > 1)

                        this.showPage(this.currentPage - 1);


                }

                this.next = function () {
                    var rows = document.getElementById(tableName).rows;
                    var records = (rows.length - 1);
                    this.pages = Math.ceil(records / itemsPerPage);


                    if (this.currentPage < this.pages) {

                        this.showPage(this.currentPage + 1);

                    }

                }


                this.init = function () {

                    var rows = document.getElementById(tableName).rows;

                    var records = (rows.length - 1);

                    this.pages = Math.ceil(records / itemsPerPage);

                    this.inited = true;

                }


                this.showPageNav = function (pagerName, positionId) {

                    if (!this.inited) {

                        alert("not inited");

                        return;

                    }

                    var element = document.getElementById(positionId);

                    var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-normal"> ←&nbsp Previous </span> ';

                    for (var page = 1; page <= this.pages; page++)

                        pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="' + pagerName + '.showPage(' + page + ');">' + page + '</span> ';

                    pagerHtml += '<span onclick="' + pagerName + '.next();" class="pg-normal"> Next &nbsp→ </span>';

                    element.innerHTML = pagerHtml;

                }

            }
      
</script>
<script type="text/javascript">

    $(document).ready(function () {
        $.ajax({
            type: "POST",
            url: "EmployeeSalary.aspx/LoadEmployee",
            data: {},
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                var jsdata = JSON.parse(data.d);
                var rows = "";
                if ($('#ctl00_ContentPlaceHolder1_ddlEmployee').select.length != 0) {

                    $('#ctl00_ContentPlaceHolder1_ddlEmployee').empty();
                }

                $.each(jsdata, function (key, value) {
                    rows += "<option  value=" + value.ID + ">" + value.CompanyName + "</option>";
                });
                $("#ctl00_ContentPlaceHolder1_ddlEmployee").append(rows);
                LoadAllowance();
                //document.getElementById("ctl00_ContentPlaceHolder1_ddlEmployee").focus();


            },
            error: function (data) {
                alert("error found");
            }
        });
    });




    function LoadRegion()
    {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "EmployeeSalary.aspx/LoadRegion",
            dataType: "json",
            data: "{}",
            success: function (data) {
                var jsdata = JSON.parse(data.d);
                var ro = "";

                if ($('#tablepaging').length != 0) {

                    $('#tablepaging').remove();
                }

                ro = "<table id='tablepaging' class='table table-hover table-full table-full-small' style='font-size: smaller;' ><thead><th>Sr. No#</th><th>NAME</th><th>BASIC SALARY</th><th>TAX PERCENTAGE</th><th>ESTIMATED SALARY</th><th>ACTIVE DATE</th></thead><tbody>";
                $.each(jsdata, function (key, value) {
                    ro += "<tr><td   class='one'>" + value.SerialNo + "</td> <td   class='two'>" + value.Name + "</td>   <td   class='three'>" + value.BasicSalary + "</td> <td   class='four' >" + value.TaxPercentage + "&nbsp% </td>  <td   class='five' >" + value.EstimatedSalary + "</td> <td   class='six' >" + value.ActiveFrom + "</td>  <td   style='display:none;' class='seven'>" + value.EmpID + "</td>  <td   style='display:none;' class='eight'>" + value.HourlySalary + "</td><td  class='zero' style='display:none;'>" + value.ID + "</td></tr>";

                });
                ro = ro + "</tbody></table>";

                $("#DivRegion").append(ro);

                var pager = new Pager('tablepaging', 10);
                pager.init();
                pager.showPageNav('pager', 'pageNavPosition');
                pager.showPage(1);

            },
            error: function (result) {
                alert(result);
            }


        });


    }


    function LoadAllowance() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "EmployeeSalary.aspx/LoadAllowance",
            dataType: "json",
            data: "{}",
            success: function (data) {
                var jsdata = JSON.parse(data.d);
                var ro = "";

                if ($('#tblAllowance tbody').length != 0) {

                    $('#tblAllowance tbody').remove();
                }


                $.each(jsdata, function (key, value) {
                    ro += "<tr><td><input type='checkbox' class=" + value.ID + " onclick='CalculateTax(" + value.Amount + ");' id=chk" + value.ID + " ></td><td   class='one'>" + value.Name + "</td> <td   class='two'>" + value.Amount + "</td>   <td  class='zero' style='display:none;'>" + value.ID + "</td></tr>";

                });
                ro = ro + "</tbody></table>";

                $("#tblAllowance").append(ro);
                LoadDeduction();
                


            },
            error: function (result) {
                alert(result);
            }


        });


    }


    function LoadDeduction() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "EmployeeSalary.aspx/LoadDeduction",
            dataType: "json",
            data: "{}",
            success: function (data) {
                var jsdata = JSON.parse(data.d);
                var ro = "";

                if ($('#tblDeduction tbody').length != 0) {

                    $('#tblDeduction tbody').remove();
                }


                $.each(jsdata, function (key, value) {
                    ro += "<tr><td><input type='checkbox' class=" + value.ID + " onclick='CalculateTax(" + value.Amount + ");' id=chk" + value.ID + " ></td><td   class='one'>" + value.Name + "</td> <td   class='two'>" + value.Amount + "</td>   <td  class='zero' style='display:none;'>" + value.ID + "</td></tr>";

                });
                ro = ro + "</tbody></table>";

                $("#tblDeduction").append(ro);
                LoadRegion();


            },
            error: function (result) {
                alert(result);
            }


        });


    }


    $("#tablepaging tbody tr").live('click', function () {
        var selected = $(this).hasClass("highlight");

        /// For Getting Grid Value Start
        /// For Getting Grid Value Start


        document.getElementById("<%=hdnid.ClientID%>").value = $(this).closest('tr').children('td.zero').text();
        document.getElementById("<%=hdntitle.ClientID%>").value = $(this).closest('tr').children('td.twentyfive').text(); 


        $("#tablepaging tr").removeClass("highlight");
        if (!selected)
            $(this).addClass("highlight");
        else if (selected)
            $(this).addClass("highlight");
    });



    function AddNewSalary() {
        LoadAllowance();
        LoadDeduction();
        $("#txtBasicSalary").val('');
        $("#txtTaxPercentage").val('');
        $("#txtTaxAmount").val('');
        $("#txtEstimatedSalary").val('');
        $("#txtActiveFrom").val('');
        $("#txtHourlyRate").val('');

        document.getElementById("ctl00_ContentPlaceHolder1_ddlEmployee").focus();
        document.getElementById("txtBasicSalary").focus();
        document.getElementById("SalaryList").style.display = 'none';
        $("#SalaryDiv").fadeIn("slow");
        
    }


    function Salary(option) {
        
        if (option == 'View') {
            
        }
        else if (option == 'Edit') {
            
        }

        else if (option == 'Delete') {           
            localStorage.setItem("salaryid", $('#ctl00_ContentPlaceHolder1_hdnid').val());
            DeleteData();
        }
        else if (option == 'Print') {
            //localStorage.setItem("salaryid", $('#ctl00_ContentPlaceHolder1_hdnid').val());
            GeneratePaySlip();
        }

    }

    function GeneratePaySlip() {
        $("#modal-dialog_PaySlip").modal();
    }

    function DeleteData() {      
        $("#modal-dialog_delete").modal();
    }

    function DeleteRegion() {
        var UserID = localStorage.getItem("BookingID");
        var SalaryID = localStorage.getItem("salaryid");
        var dataToSend = JSON.stringify({ 'SalaryID': $('#ctl00_ContentPlaceHolder1_hdnid').val(), 'UserID': UserID });
       // alert(dataToSend);
        var results = $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "EmployeeSalary.aspx/DeleteRegion",
            dataType: "json",
            data: dataToSend,
            async: false,
            success: function (data) {
                var obj = data.d;
                if (obj == 'true') {                    
                    LoadRegion();
                }

            },
            error: function (result) {
                alert(result);
            }
        });

        return results;

    }


    function Cancel() {
        document.getElementById("SalaryDiv").style.display = 'none';
        $("#SalaryList").fadeIn("slow");
     }


     function CalculateMonthlySalary() {
         var amount = 0;
         $('#tblAllowance').find('input[type="checkbox"]:checked').each(function () {
             var num1 = $(this).closest('tr').children('td:eq(2)').text();
             amount +=  +num1;         
         });

         var dedcutamount = 0;
         $('#tblDeduction').find('input[type="checkbox"]:checked').each(function () {
             var num2 = $(this).closest('tr').children('td:eq(2)').text();

             dedcutamount += +num2;         
         });   

         var dEstimatedMonthlSalary = amount - dedcutamount;
         dEstimatedMonthlSalary += document.getElementById("txtBasicSalary").value - document.getElementById("txtTaxAmount").value;
         $("#txtEstimatedSalary").val(dEstimatedMonthlSalary);
        // CalculateMonthlyTax();
     }


     function CalculateMonthlyTax() {
         
         var dEstimatedMonthlTax = 0;
         var basicsalary = document.getElementById("txtBasicSalary").value;
         dEstimatedMonthlTax = basicsalary / 100 * document.getElementById("txtTaxPercentage").value;
         $("#txtTaxAmount").val(dEstimatedMonthlTax);
         CalculateMonthlySalary();
     }
     function CalculateTax() {
         var amount = 0;
         $('#tblAllowance').find('input[type="checkbox"]:checked').each(function () {
             var num1 = $(this).closest('tr').children('td:eq(2)').text();
             
             amount +=  +num1;
             //alert($(this).closest('tr').children('td:eq(2)').text());
         });

         var dedcutamount = 0;
         $('#tblDeduction').find('input[type="checkbox"]:checked').each(function () {
             var num2 = $(this).closest('tr').children('td:eq(2)').text();

             dedcutamount += +num2;
             //alert($(this).closest('tr').children('td:eq(2)').text());
         });   
              
         var dEstimatedMonthlSalary = 0;
         dEstimatedMonthlSalary = document.getElementById("txtBasicSalary").value - document.getElementById("txtTaxAmount").value;
         dEstimatedMonthlSalary = dEstimatedMonthlSalary + amount - dedcutamount;
         $("#txtEstimatedSalary").val(dEstimatedMonthlSalary);

     }



     function InsertRegion() {
         var UserID = localStorage.getItem("BookingID");
         var ddlEmployee = $('#ctl00_ContentPlaceHolder1_ddlEmployee').val();
         var dataToSend = JSON.stringify({ 'EmpID': ddlEmployee, 'BasicSalary': $('#txtBasicSalary').val(), 'TaxPercentage': $('#txtTaxPercentage').val(), 'TaxAmount': $('#txtTaxAmount').val(), 'EstimatedSalary': $('#txtEstimatedSalary').val(), 'HourlyRate' : $("#txtHourlyRate").val(), 'ActiveFrom': $('#txtActiveFrom').val(), 'UserID': UserID });
//         alert(dataToSend);
         var results = $.ajax({
             type: "POST",
             contentType: "application/json; charset=utf-8",
             url: "EmployeeSalary.aspx/InsertRegion",
             dataType: "json",
             data: dataToSend,
             async: false,
             success: function (data) {
                 var obj = data.d;
                 var str = obj;
                // var subStr = str.substring(str.length - 10, str.length);
                 var subStr = str.substring(0, 4) // 654 
                // alert(subStr);
                 if (subStr == 'true') {
                     var res = str.substring(str.length - 10, str.length);
                     //   alert(res);
                     InsertAllowance(res);
                     InsertDeduction(res);                                          
                     document.getElementById("SalaryDiv").style.display = 'none';
                     $("#SalaryList").fadeIn("slow");
                     LoadRegion();
                     

                 }

             },
             error: function (result) {
                 alert(result);
             }
         });

         return results;

     }

     function InsertAllowance(SalaryID) {
         $('#tblAllowance').find('input[type="checkbox"]:checked').each(function () {
             var ID = $(this).closest('tr').children('td:eq(3)').text();
             var num1 = $(this).closest('tr').children('td:eq(2)').text();
             var UserID = localStorage.getItem("BookingID");
             var dataToSend = JSON.stringify({ 'SalaryID': SalaryID, 'AllowanceID': ID, 'Amount': num1, 'UserID': UserID });
           //  alert(dataToSend);
             var results = $.ajax({
                 type: "POST",
                 contentType: "application/json; charset=utf-8",
                 url: "EmployeeSalary.aspx/InsertAllowance",
                 dataType: "json",
                 data: dataToSend,
                 async: false,
                 success: function (data) {
                     var obj = data.d;
                     if (obj == 'true') {

                         //LoadRegion();
                     }

                 },
                 error: function (result) {
                     alert(result);
                 }
             });

             return results;


         });        

     }

     function InsertDeduction(SalaryID) {
         $('#tblDeduction').find('input[type="checkbox"]:checked').each(function () {
             var ID = $(this).closest('tr').children('td:eq(3)').text();
             var num1 = $(this).closest('tr').children('td:eq(2)').text();
             var UserID = localStorage.getItem("BookingID");
             var dataToSend = JSON.stringify({ 'SalaryID': SalaryID, 'DeductionID': ID, 'Amount': num1, 'UserID': UserID });
             //  alert(dataToSend);
             var results = $.ajax({
                 type: "POST",
                 contentType: "application/json; charset=utf-8",
                 url: "EmployeeSalary.aspx/InsertDeduction",
                 dataType: "json",
                 data: dataToSend,
                 async: false,
                 success: function (data) {
                     var obj = data.d;
                     if (obj == 'true') {

                         //LoadRegion();
                     }

                 },
                 error: function (result) {
                     alert(result);
                 }
             });

             return results;


         });

     } 

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="modal fade" id="modal-dialog_delete">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
											
                                            <h3 class ="table-title" style="padding-left:0px;">Confirmation Required</h3> 

										</div>
                                          
                                         <div class="well white" style="padding-left:0px;">
                  <form class="form-floating placeholder-form">
                    <fieldset>
										<p class="lead">&nbsp&nbsp&nbsp&nbsp Are you sure you want to delete this record? </p>
										<%--<div class="modal-body" id="msgbody_delete">
											Are you sure you want to delete this record?
										</div>--%>
                                        </fieldset></form>
                                        </div>
                                        <div class="form-group" style="text-align:right;padding-right:10px;">
                                        <button type="button" class="btn btn-default"  data-dismiss="modal"  onclick="Clear();" >Close</button>
                                        <button type="button" class="btn btn-primary"  data-dismiss="modal" onclick="DeleteRegion();" >Confirm</button>
											<%--<a href="javascript:;"   class="btn btn-default"  data-dismiss="modal" >Close</a>
											<a href="javascript:;"  class="btn btn-primary" onclick="DeleteRegion();" id="confirm_delete">Confirm</a>--%>
										</div>
									</div>
								</div>
							</div>

                            <div class="modal fade" id="modal-dialog_PaySlip">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
											
                                            <h3 class ="table-title" style="padding-left:0px;">Confirmation Required</h3> 

										</div>
                                          
                                         <div class="well white" style="padding-left:0px;">
                  <form class="form-floating placeholder-form">
                    <fieldset>
										<p class="lead">&nbsp&nbsp&nbsp&nbsp Are you sure you want to delete this record? </p>
										
                                        </fieldset></form>
                                        </div>
                                        <div class="form-group" style="text-align:right;padding-right:10px;">
                                        <button type="button" class="btn btn-default"  data-dismiss="modal"  onclick="Clear();" >Close</button>
                                        <button type="button" class="btn btn-primary"  data-dismiss="modal" onclick="DeleteRegion();" >Confirm</button>
										</div>
									</div>
								</div>
							</div>
     <div class="main-content" autoscroll="true" bs-affix-target="" init-ripples="" style="padding-top:0px;">
<asp:HiddenField ID="hdnid" runat="server" />        
<asp:HiddenField ID="hdntitle" runat="server" />        
<asp:HiddenField ID="hdnStationTypeID" runat="server" />
           <%-- <section>          
            <div class="page-header">
              <h4 id="CustomerName" class="grey-text" > <i class="md md-list"></i>   Company  </h4>
              
            </div>
            </section>--%>
            <section class="forms-advanced">
            
            <div class="row m-b-10">
                    <div class="col-md-12" id="SalaryList">                  
                <div class="card no-margin">
                  <div class="table-responsive white">                
                    <h3 class ="table-title" style="padding-left:15px; margin-bottom:10px;">Salary List</h3> 
                    
                 <div class="col-md-2"  >
                <div class="form-group" style="text-align:left;">
                        <button type="button" class="btn btn-primary" id="btnAddNew" onclick="AddNewSalary();" >Add New Salary<div class="ripple-wrapper"></div></button>
                        </div>
                </div>
           <div class="col-md-7" >
                       <input type="text" id="search" placeholder="Type to search" class="search form-control" style="padding-left: 10px; font-size:90%;" />
                       </div>
                           <div class="col-md-3" > 
                          <div class="input-group-btn p-r-10"  style="text-align:right;">
                              <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Operation on Selected Row <span class="caret"></span><div class="ripple-wrapper"></div></button>
                              <ul class="dropdown-menu" role="menu">
                                <li><a href="#" onclick="Salary('View');">View Record</a></li>
                                <li><a href="#" onclick="Salary('Edit');">Edit Record</a></li>
                                <li><a href="#" onclick="Salary('Print');">Print Payslip</a></li>
                                <%--<li><a href="#" onclick="Employee('Additional');">Employee Additional Info</a></li>--%>
                                <li class="divider"></li>
                                <li><a href="#" onclick="Salary('Delete');">Delete Record</a></li>
                              </ul>
                            </div>
                 </div>
                    <div id="DivRegion">                
                       <table class="table table-hover table-full table-full-small" id="tablepaging">                     
                      <thead>
                        <tr>
                          <th>FIRST NAME</th>
                          <th>LAST NAME</th>                        
                          <th>DATE OF BIRTH</th>                        
                          
                        </tr>
                      </thead>
                      <tbody>
                        <tr>                          
                          <td id="Td6">Syed Sadiq</td>
                          <td id="Td8">Shah</td>                                                    
                          <td id="Td1">123456</td>                                                    
                                                 
                        </tr>                        
                      </tbody>
                      </table>
                      
                 </div>     
                   <div id="pageNavPosition"  align="center" style="padding-bottom:10px; padding-top:10px;" ></div>  
                        
                  </div>
                </div>
              </div>   
              
                
              <div class="col-md-12" id="SalaryDiv" style="display:none;">
                <div class="well white">
                  <form class="form-floating placeholder-form">
                    <fieldset>
                      <%--<legend>Company Information</legend>--%>
                    <h3 class ="table-title" style="padding-left:0px;">Add Salary</h3>                        
                        <div class="form-group">
                        <label for="inputEmail" class="control-label">Employee</label>                        
                        <asp:DropDownList ID="ddlEmployee" CssClass="form-control" runat="server"></asp:DropDownList>
                         </div>
                         <div class="form-group ">
                        <label for="inputEmail" class="control-label">Basic Salary</label>
                        <input type="text" class="form-control" id="txtBasicSalary" onkeypress="return EnterEvent(event)" onkeyup="CalculateMonthlyTax();" >
                        </div>

                           <div class="form-group">
                        <label for="inputEmail" class="control-label">Tax Percentage</label>
                        <input type="text" class="form-control" id="txtTaxPercentage" onkeypress="return EnterEvent(event)" onkeyup="CalculateMonthlyTax();"  value="0"> </div>
                        <div class="form-group">
                        <label for="inputEmail" class="control-label">Tax Amount</label>
                        <input type="text" class="form-control"  id="txtTaxAmount" onkeypress="return EnterEvent(event)"  disabled value="0"> </div>
                         <div class="form-group">
                        <label for="inputEmail" class="control-label">Estimated Monthly Salary</label>
                        <input type="text" class="form-control"  id="txtEstimatedSalary" onkeypress="return EnterEvent(event)" disabled   value="0"> </div>


                        <div class="form-group">
                        <label for="inputEmail" class="control-label">Hourly Rate</label>
                        <input type="text" class="form-control"  id="txtHourlyRate" onkeypress="return EnterEvent(event)" value="0"> </div>


                       
                        <div class="form-group">
                       <%-- <label for="inputEmail" class="control-label">Active From</label>
                        <input type="text" class="form-control"  id="txtActiveFrom" onkeypress="return EnterEvent(event)"> --%>
                         <div class='input-group date' id='datetimepicker'>
                    <input type='text' class="form-control" placeholder='ActiveFrom' id="txtActiveFrom" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
                  <script type="text/javascript">
                      $(function () {
                          $('#datetimepicker').datetimepicker();
                      });
        </script>    
                        </div>
                        <div class="col-md-6">
                       <table class="table table-hover table-full table-full-small" id="tblAllowance" style="font-size:smaller;">                     
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
                          <td id="Td2">Syed Sadiq</td>
                          
                          <td id="Td4">123456</td>                                                    
                                                 
                        </tr>                        
                      </tbody>
                      </table>
                      </div>

                      <div class="col-md-6">
                       <table class="table table-hover table-full table-full-small" id="tblDeduction" style="font-size:smaller;">                     
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
                          <td id="Td3">Syed Sadiq</td>
                          
                          <td id="Td5">123456</td>                                                    
                                                 
                        </tr>                        
                      </tbody>
                      </table>
                      </div>
                   <div class="col-md-12">
                      <div class="form-group" style="text-align:right;">
                      <%--<button type="button" class="btn btn-primary" id="btnDelete" onclick="DeleteRegion();">Delete</button>--%>
                        <button type="button" class="btn btn-info" id="btnSave" onclick="InsertRegion();">Submit</button>
                        <button type="button" class="btn btn-warning"  id="btnCancel" onclick="Cancel();" >Cancel</button>
                        
                      </div>
                      </div>
                    </fieldset>
                  </form>
                </div>
              </div> 
              </div>
               
                 
                 
          </section>
          
       

                
              
                  
           </div>

            <script type="text/javascript">
                var pager = new Pager('tablepaging', 10);
                pager.init();
                pager.showPageNav('pager', 'pageNavPosition');
                pager.showPage(1);
</script>

<script type="text/javascript">
    $("#search").keyup(function () {
        //split the current value of searchInput
        var data = this.value.split(" ");
        //create a jquery object of the rows
        var jo = $("#tablepaging").find("tr");
        if (this.value == "") {
            jo.show();
            var pager = new Pager('tablepaging', 10);
            pager.init();
            pager.showPageNav('pager', 'pageNavPosition');
            pager.showPage(1);
            $("#pageNavPosition").show();
            return;

        }
        //hide all the rows
        jo.hide();

        //Recusively filter the jquery object to get results.
        jo.filter(function (i, v) {
            var $t = $(this);
            for (var d = 0; d < data.length; ++d) {
                //if ($t.text().toLowerCase().indexOf(data[d]) > -1) {
                if ($t.text().toLowerCase().indexOf(data[d]) > -1) {
                    //if ($t.is(":contains('" + data[d] + "')")) {                    
                    $("#pageNavPosition").hide();
                    return true;

                }
                else if ($t.text().toUpperCase().indexOf(data[d]) > -1) {
                    //if ($t.is(":contains('" + data[d] + "')")) {                    
                    $("#pageNavPosition").hide();
                    return true;

                }
            }

            return false;
        })


        //show the rows that match.
.show();
    }).focus(function () {
        this.value = "";
        $(this).css({
            "color": "black"
        });
        $(this).unbind('focus');
    }).css({
        "color": "#FAFAFA"
    });
   
</script>


</asp:Content>

