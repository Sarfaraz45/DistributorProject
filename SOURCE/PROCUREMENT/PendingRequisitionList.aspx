<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="PendingRequisitionList.aspx.cs" Inherits="PROCUREMENT_PendingRequisitionList" %>

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
                    <h3 class="panel-title"> <span class="menu-icon"> <i class="icon-pie"></i> </span> Pending Requisitions! </h3>
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
                                <asp:HyperLink ID="HyperLink2" NavigateUrl="~/PROCUREMENT/Requisition.aspx" runat="server">Add New Requisition</asp:HyperLink>
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

<script type="text/javascript">
    LoadLIST();
    // xeon 8core 64gb supported, ssd ya saaas compatible, RAID supported
    function LoadLIST() {
        var tblRows = "";
        var UserID = localStorage.getItem("UserID");
        // alert('ddddddddd');
        $.ajax({
            type: 'POST',
            url: 'PendingRequisitionList.aspx/LoadLIST',
            data: '{ "UserID" : "' + UserID + '" }',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                var s = msg.d;
                // alert(s);
                document.getElementById('dvList').innerHTML = s;

            }

        });
    }
</script>

</asp:Content>



