<%@ Page Title="" Language="C#" MasterPageFile="~/MASTERPAGE/MasterPage.master" AutoEventWireup="true" CodeFile="ReqEdit.aspx.cs" Inherits="Transaction_ReqEdit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../jquery-1.8.2.js"></script>
    <script src="../jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:HiddenField ID="hdnItems" runat="server" Value='["Karachi","Hyderabad","USA","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky"]' />
    <asp:HiddenField ID="hdnAmount" runat="server" Value="0" />
    <asp:HiddenField ID="hdnRemVal" runat="server" Value="0" />
    <asp:HiddenField ID="hdnNarration" runat="server" Value="0" />
     <asp:HiddenField ID="hdnDate" runat="server" Value="0" />
     <asp:HiddenField ID="hdnTotDb" runat="server" Value="0" />
     <asp:HiddenField ID="hdnTotCr" runat="server" Value="0" />
     <asp:HiddenField ID="hdnUnits" runat="server" Value="kg^1~gm^2~ton^3~m^4~cm^5~mm^6" />
     <asp:HiddenField ID="hdnQtyTotal" runat="server" Value="0" />
     <asp:HiddenField ID="hdnQtyTotalPaste" runat="server" Value="0" />
     <div id="dvUnits" style="display:none"></div>
 <!-- #modal-message -->
<!-- #modal-message -->
<!-- #modal-message -->
<!-- #STYLE 1 -->
<div class="modal fade" id="modal-dialog">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
											<h4 class="modal-title">Modal Dialog</h4>
										</div>
										<div class="modal-body">
											Modal body content here...
										</div>
										<div class="modal-footer">
											<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
											<a href="javascript:;" class="btn btn-sm btn-success">Action</a>
										</div>
									</div>
								</div>
							</div>


<!-- #STYLE 2 -->
<div class="modal modal-message fade" id="modal-message">
	<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
											<h4 class="modal-title">Modal Message Header</h4>
										</div>
										<div class="modal-body">
											<p>Text in a modal</p>
											<p>Do you want to turn on location services so GPS can use your location ?</p>
										</div>
										<div class="modal-footer">
											<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
											<a href="javascript:;" class="btn btn-sm btn-primary">Save Changes</a>
										</div>
									</div>
								</div>
</div>
<!-- #modal-message -->
<!-- #modal-message -->
<!-- #modal-message -->



 <div class="row">
                <!-- begin col-12 -->
			    <div class="col-md-12">
			        <!-- begin panel -->
                   <div class="panel widget light-widget panel-bd-top">
                        <div class="panel-heading bordered">
                    <h3 class="panel-title"> <span class="menu-icon"> <i class="icon-pie"></i> </span> Requisition Detail! </h3>
                    <div class="vd_panel-menu">
  <div data-action="minimize" data-original-title="Minimize" data-toggle="tooltip" data-placement="bottom" class=" menu entypo-icon"> <i class="icon-minus3"></i> </div>
  <div data-action="refresh"  data-original-title="Refresh" data-toggle="tooltip" data-placement="bottom" class=" menu entypo-icon smaller-font"> <i class="icon-cycle"></i> </div>
  
  <div data-action="close" data-original-title="Close" data-toggle="tooltip" data-placement="bottom" class=" menu entypo-icon"> <i class="icon-cross"></i> </div>
</div>
<!-- vd_panel-menu --> 
                  </div>
                        <div class=" panel-body-list" style="padding:10px">

                             <div class="row">
                                <div class="col-lg-12">
                                    <asp:Label ID="lblMsg" runat="server" CssClass="parsley-errors-list" Visible="False"></asp:Label>
                                    <asp:TextBox ID="txtid" runat="server" Visible="False" CssClass="form_inputfeild" placeholder="Enter Name"></asp:TextBox>                
                                </div>
                            </div>
                            <div class="row"><div class="col-lg-12" style="height:10px"></div></div>

                            <div class="row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="col-md-5 control-label">Req. Date</label>
                                    
                                    <div class="col-md-7" id="dvSODATE">
                                      
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="col-md-5 control-label">Req. No.</label>
                                    
                                    <div class="col-md-7" id="dvSOID">
                                        
                                    </div>
                                </div>
                            </div>


                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="col-md-5 control-label">Generate By</label>
                                    
                                    <div class="col-md-7" id="dvCustomer">
                               


                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="col-md-5 control-label">Forward By</label>
                                    
                                    <div class="col-md-7" id="dvFwdBy">
                               


                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="col-md-5 control-label">Forward Date</label>
                                    
                                    <div class="col-md-7" id="dvFwdDate">
                               


                                    </div>
                                </div>
                            </div>

                            
                        </div>

                         <div class="row"><div class="col-lg-12" style="height:10px"></div></div>

                            <div class="row">
                                <div class="col-lg-12 table-responsive" id="dvList">
                                   

                                    <%--<input type="button" value="" class="fa-plus-square" onclick="addRow();SumDbCr();"/>--%>
                                </div>
                            </div>
                            

                             <div class="row"><div class="col-lg-12" style="text-align:right">
                            <%-- <input type="button" id="btnClear" class="btn btn-danger btn-sm" value="Clear Form" onclick="ClearForm();" />--%>
                             
                              <a class="btn vd_btn vd_bg-green finish" href="javascript:SaveTransaction();" style="display: inline-block;">
                             <span class="menu-icon"><i class="fa fa-fw fa-check"></i></span> Process Requisition</a>
                             </div></div>
                             <%--<div class="col-lg-3" style="text-align:right;"><h2><b id="lblTotalPasteQty">Total Paste Qty : 0</b></h2>--%>
                        </div>
                   </div>
     <input id="Checkbox1" type="checkbox" />
                </div>

              
</div>

     <script src="../js/jquery-1.9.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>

<script type="text/javascript">
    LoadLIST();
    function LoadLIST() {
        var tblRows = "";
        var UserID = localStorage.getItem("UserID");
        var reqID = getParameterByName('ID');
        $.ajax({
            type: 'POST',
            url: 'ReqEdit.aspx/LoadLIST',
            data: '{ "UserID" : "' + UserID + '","reqID" : "' + reqID + '" }',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                var s = msg.d;
                var str = s.split('`');
                document.getElementById('dvList').innerHTML = str[0];
                document.getElementById('dvSOID').innerHTML = str[1];
                document.getElementById('dvSODATE').innerHTML = str[2];
                document.getElementById('dvCustomer').innerHTML = str[3];
                document.getElementById('dvFwdBy').innerHTML = str[4];
                document.getElementById('dvFwdDate').innerHTML = str[5];

            }

        });
    }

    function getParameterByName(name, url) {
        if (!url) {
            url = window.location.href;
        }
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }



    function SaveTransaction() {


        var UserID = localStorage.getItem("UserID");
        var txtVoucherNo = document.getElementById('dvSOID').innerHTML;

        var elm = {}; var tMarks = 0;
        var elms = document.getElementById('tblItems').getElementsByTagName("input");
        var str = ""; var cc = 0;
        for (var i = 0; i < elms.length; i++) {
            if (elms[i].id.indexOf('chk') != -1) {

                elm = elms[i];
                var iD = elm.id;
                var chk = iD;
                var spnID   = iD.replace('chk', 'spn');
                var txtQtyID = iD.replace('chk', 'txtAprvdQty');

                var spnHtm = document.getElementById(spnID).innerHTML;
                var splt = spnHtm.split('^');
                var txtAccID = splt[0];


                var txtAccTitle = "";
                var ddlUnit = splt[1];
                var txtQty = document.getElementById(txtQtyID).value;
                var txtPrice = splt[2];
                var txtTotalPrice = splt[3];

                if (txtQty == "" || txtQty == null) { txtQty = 0; }


                if (txtQty != 0 && document.getElementById(chk).checked==true) {
                    if (cc == 0) {
                        str = txtAccID + "^" + txtAccTitle + "^" + ddlUnit + "^" + txtQty + "^" + txtPrice + "^" + txtTotalPrice;
                    }
                    else {
                        str = str + "`" + txtAccID + "^" + txtAccTitle + "^" + ddlUnit + "^" + txtQty + "^" + txtPrice + "^" + txtTotalPrice;
                    }
                }

                cc = 1;


            }
            else {

            }
        }

        if (cc > 0) {
            $.ajax({
                type: 'POST',
                url: 'ReqEdit.aspx/SaveTransaction',
                //data: {},
                data: '{ "UserID" : "' + UserID + '", "str" : "' + str + '", "txtVoucherNo" : "' + txtVoucherNo + '" }',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (msg) {
                    tblRows = msg.d;
                    alert('Requisition has been Processed Successfully!');
                    window.location = 'PendingRequisitionList.aspx';
                }

            });
        }

    }

</script>


</asp:Content>
