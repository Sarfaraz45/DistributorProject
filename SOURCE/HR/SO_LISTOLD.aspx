<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="SO_LISTOLD.aspx.cs" Inherits="SALES_SO_LIST" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../jquery-1.8.2.js"></script>
    <script src="../jquery.min.js"></script>
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
    <div class="row">
                <!-- begin col-6 -->
			    <div class="col-md-12">
			        <!-- begin panel -->
                    <div class="panel widget light-widget panel-bd-top">
                        <div class="panel-heading bordered">
                    <h3 class="panel-title"> <span class="menu-icon"> <i class="icon-pie"></i> </span> Sale Order! </h3>
                    <div class="vd_panel-menu">
  <div data-action="minimize" data-original-title="Minimize" data-toggle="tooltip" data-placement="bottom" class=" menu entypo-icon"> <i class="icon-minus3"></i> </div>
  <div data-action="refresh"  data-original-title="Refresh" data-toggle="tooltip" data-placement="bottom" class=" menu entypo-icon smaller-font"> <i class="icon-cycle"></i> </div>
  
  <div data-action="close" data-original-title="Close" data-toggle="tooltip" data-placement="bottom" class=" menu entypo-icon"> <i class="icon-cross"></i> </div>
</div>
<!-- vd_panel-menu --> 
                  </div>
                        <div class=" panel-body-list" style="padding:10px">

                <div class="row">
                                <div class="col-md-12" style=" text-align:right">
                                <asp:HyperLink ID="HyperLink2" NavigateUrl="~/SALES/SaleOrder.aspx" runat="server">Add New Sale Order</asp:HyperLink>
                                </div>
                             </div>

                             <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">Date From</label>
                                    
                                    <div class="col-md-12">
                                    <div class="input-group">
                                       <input type="text" class="width-100" id="dtFROM" placeholder="Select Date" />
                                       <span class="input-group-addon" id="datepicker-icon-trigger-PV" data-datepicker="#dtFROM"><i class="fa fa-calendar"></i></span>
                                    </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">Date To.</label>
                                    
                                    <div class="col-md-12">
                                        <div class="input-group">
                                       <input type="text" class="width-100" id="dtTO" placeholder="Select Date" />
                                       <span class="input-group-addon" id="datepicker-icon-trigger-PVTO" data-datepicker="#dtTO"><i class="fa fa-calendar"></i></span>
                                    </div>
                                    </div>
                                </div>
                            </div>


                         <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">Customer</label>
                                    
                                    <div class="col-md-12">
                                <asp:DropDownList ID="ddlCustomer" CssClass="width-100" runat="server" DataSourceID="SqlDataSource1" 
                                            DataTextField="CustomerTitle" DataValueField="CustomerID">
                                </asp:DropDownList>


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
                            <div class="col-lg-12" style="vertical-align:bottom">
                            <input type="button" id="btnSave"  class="btn btn-success btn-sm" value="GO" onclick="LoadLIST();" />
                            </div>
                            </div>
                         </div>

                <div class="row col-lg-12">
                                                
                                                 <div class="table-responsive" id="dvList" >
                                <table id="data-table" class="table table-striped table-bordered" >
                                
                                </table>
                            </div>

                                            </div>
</div>
                    </div>
                    <!-- end panel -->
                </div>
                </div>

                      <script src="../js/jquery-1.9.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
         <script type="text/javascript" src='../AAUI/plugins/jquery-ui/jquery-ui.custom.min.js'></script>
   

    <script type="text/javascript">

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
    </script>

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
</script>

</asp:Content>

