<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="PO_LIST.aspx.cs" Inherits="PROCUREMENT_PO_LIST" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <script src="../js/jquery-1.8.2.js" type="text/javascript"></script>
    <script src="../js/jquery.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<!-- ================== BEGIN PAGE LEVEL STYLE ================== 
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
                                <i class='subheader-icon fal fa-edit'></i> Purchase Order List
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
                                <asp:HyperLink ID="HyperLink2" NavigateUrl="~/PROCUREMENT/PO.aspx" runat="server">Add New Purchase Order</asp:HyperLink>
                                </div>
                             </div>
                <div class="row col-lg-12">
                                                
                                                 <div class="table-responsive" id="dvList" >
                                <table id="data-table" class="table table-striped table-bordered" >
                                
                                </table>
                            </div>

                                            </div>

    </form>
                                            </div></div>
                                            </div></div>
                                            </div></main>


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
            url: 'PO_LIST.aspx/LoadLIST',
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

