<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="SO_LIST.aspx.cs" Inherits="SALES_SO_LIST" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <script src="../js/jquery-1.8.2.js" type="text/javascript"></script>
    <script src="../js/jquery.min.js" type="text/javascript"></script>
      <link rel="stylesheet" media="screen, print" href="../css/notifications/toastr/toastr.css">
         <script src="../js/notifications/toastr/toastr.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
	<link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
	<!-- ================== END PAGE LEVEL STYLE ================== -->
    <asp:HiddenField ID="hdnUID" Value="0" runat="server" />


    
 <main id="js-page-content" role="main" class="page-content">
                        
                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class='subheader-icon fal fa-edit'></i> SO LIST
                            </h1>
                        </div>
                     
                          <label  id="lblID" style="display:none;"></label>
        <asp:HiddenField ID="hdnid" runat="server" />
                         <div class="row">
                            <div class="col-xl-12">
                                <div id="panel-1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Form Information 
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
                                <div class="col-md-12" style=" text-align:right">
                                <asp:HyperLink ID="HyperLink2" NavigateUrl="~/SALES/SaleOrder.aspx"  style="font-weight: bold;" runat="server">Add New Sale Order</asp:HyperLink>
                                </div>
                             </div>

                             <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">Date From</label>
                                    
                                    <div class="col-md-12">
                                    <div class="input-group">
                                       <input type="date" class="form-control is-invalid" id="dtFROM" placeholder="Select Date"  onchange="CheckDataLength();" />
                                     
                                    </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">Date To.</label>
                                    
                                    <div class="col-md-12">
                                        <div class="input-group">
                                       <input type="date" class="form-control is-invalid" id="dtTO" placeholder="Select Date" onchange="CheckDataLength();"/>
                                      
                                    </div>
                                    </div>
                                </div>
                            </div>


                         <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">Customer</label>
                                    
                                    <div class="col-md-12">
                                <asp:DropDownList ID="ddlCustomer" CssClass="custom-select is-invalid" runat="server" DataSourceID="SqlDataSource1" 
                                            DataTextField="CustomerTitle" DataValueField="CustomerID" onchange="CheckDataLength();">
                                </asp:DropDownList>
                                <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Please provide a valid Customer.
                                                        </div>

                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:Con %>" 
                                            SelectCommand="SELECT '0' as [CustomerID],'Select Customer' as [CustomerTitle] FROM [Customer] union SELECT [CustomerID], [CustomerTitle] FROM [Customer] WHERE ([ISDELETE] = @ISDELETE)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="0" Name="ISDELETE" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-2">
                            <div class="col-lg-12">&nbsp;</div>
                            <div class="col-lg-12" style="vertical-align:bottom;width:100%;">
                             <button type="button"   style=" width:100%;" id="btnSave" class="btn btn-success waves-effect waves-themed" onclick="LoadLIST();">G O</button>
                           
                            </div>
                            </div>
                         </div>
                                     <div class="row col-lg-12" style="height:20px;"></div>

                <div class="row col-lg-12">
                                                
                                                 <div class="table-responsive" id="dvList" >
                                <table id="data-table" class="table table-sm  dataTable dtr-inline table-hover" >
                                
                                </table>
                            </div>

                                            </div>
                                            </form></div></div></div></div></div></main>
    

                      <script src="../js/jquery-1.9.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
         <script type="text/javascript" src='../AAUI/plugins/jquery-ui/jquery-ui.custom.min.js'></script>
   

   <%-- <script type="text/javascript">

        $("#dtFROM").datepicker({ dateFormat: 'm/dd/yy' });
        $('[data-datepicker]').click(function (e) {
            var data = $(this).data('datepicker');
            $(data).focus();
        });

        $("#dtTO").datepicker({ dateFormat: 'm/dd/yy' });
        $('[data-datepicker]').click(function (e) {
            var data = $(this).data('datepicker');
            $(data).focus();
        });
    </script>--%>

<script type="text/javascript">

    SET_DATE()

    function SET_DATE() {
        var dtFROM = document.getElementById('dtFROM').value;
        var dtTO = document.getElementById('dtTO').value;
        var tPROFIT = 0;
        var tblRows = "";
        $.ajax({
            type: 'POST',
            url: 'SO_LIST.aspx/SET_DATE',
            data: '{ "dtFROM" : "' + dtFROM + '","dtTO" : "' + dtTO + '"}',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                var strng = msg.d;
                var str = strng.split("`");

                //  alert(msg.d);
                for (i = 0; i < str.length; i++) {

                    var chkStr = str[i].split("^");
                    var sDate, eDate;
                    sDate = chkStr[0];


                    eDate = chkStr[1];
                }

                document.getElementById('dtFROM').value = sDate;
                document.getElementById('dtTO').value = eDate;

                LoadLIST();
            }



        });
    }
    // xeon 8core 64gb supported, ssd ya saaas compatible, RAID supported
    function LoadLIST() {
        var dtFROM = document.getElementById('dtFROM').value;
        var dtTO = document.getElementById('dtTO').value;
        var cusID = document.getElementById('ContentPlaceHolder1_ddlCustomer').value;
        var tblRows = "";
        var UserID = localStorage.getItem("UserID");
       // alert('ddddddddd');
        $.ajax({
            type: 'POST',
            url: 'SO_LIST.aspx/LoadLIST',
            data: '{ "cusID" : "' + cusID + '","dtFROM" : "' + dtFROM + '","dtTO" : "' + dtTO + '" }',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                var s = msg.d;
                // alert(s);
                document.getElementById('dvList').innerHTML = "";
                document.getElementById('dvList').innerHTML = s;

            }

        });
    }


    function CheckDataLength() {
        var field = document.getElementById("dtFROM").value;
        if (field == "" || field == null) {
            var text = document.getElementById('dtFROM');
            text.classList.remove('is-valid');
            text.classList.add('is-invalid');
        }
        else {

            var text = document.getElementById('dtFROM');
            text.classList.remove('is-invalid');
            text.classList.add('is-valid');

        }

        var field = document.getElementById("ContentPlaceHolder1_ddlCustomer").value;
        if (field == "" || field == null || field == 0) {
            var text = document.getElementById('ContentPlaceHolder1_ddlCustomer');
            text.classList.remove('is-valid');
            text.classList.add('is-invalid');
        }
        else {

            var text = document.getElementById('ContentPlaceHolder1_ddlCustomer');
            text.classList.remove('is-invalid');
            text.classList.add('is-valid');

        }

        var field = document.getElementById("dtTO").value;
        if (field == "" || field == null) {
            var text = document.getElementById('dtTO');
            text.classList.remove('is-valid');
            text.classList.add('is-invalid');
        }
        else {

            var text = document.getElementById('dtTO');
            text.classList.remove('is-invalid');
            text.classList.add('is-valid');

        }
    }

</script>

</asp:Content>

