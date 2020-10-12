<%@ Page Title="" Language="C#" MasterPageFile="~/HR/MasterPage.master" AutoEventWireup="true" CodeFile="SaleOrder.aspx.cs" Inherits="Sales_SaleOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="../js/jquery-1.8.2.js" type="text/javascript"></script>
    <script src="../js/jquery.min.js" type="text/javascript"></script>
<%--     <link rel="stylesheet" media="screen, print" href="../css/notifications/toastr/toastr.css">
         <script src="../js/notifications/toastr/toastr.js"></script>--%>
            
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
     <asp:HiddenField ID="hdnCust" runat="server" Value="0" />
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

 <main id="js-page-content" role="main" class="page-content">
                        
                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class='subheader-icon fal fa-edit'></i> Sale Order
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
                                <div class="col-lg-12">
                                    <asp:Label ID="lblMsg" runat="server" CssClass="parsley-errors-list" Visible="False"></asp:Label>
                                    <asp:TextBox ID="txtid" runat="server" Visible="False" CssClass="form_inputfeild" placeholder="Enter Name"></asp:TextBox>                
                                </div>
                            </div>
                            <div class="row"><div class="col-lg-12" style="height:10px"></div></div>

                            <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">SO Date</label>
                                    
                                    <div class="col-md-12">
                                    <div class="input-group">
                                       <input type="date" class="form-control is-valid" id="datepicker-autoClose" placeholder="Select Date" />
                                      <%-- <span class="input-group-addon" id="datepicker-icon-trigger-PV" data-datepicker="#datepicker-autoClose"><i class="fa fa-calendar"></i></span>--%>
                                    </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">SO No.</label>
                                    
                                    <div class="col-md-12">
                                        <input type="text" id="txtVoucherNo" class="form-control is-valid" disabled="disabled" />
                                    </div>
                                </div>
                            </div>

                            
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">Customer</label>
                                    
                                    <div class="col-md-12">
                                <input type="text" class="span6 typeahead form-control is-valid"   id="txtCustomer"  data-provide="typeahead"   data-items="20" >


                                    </div>
                                </div>
                            </div>


                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="col-md-12 control-label is-valid">Delivery Date</label>
                                    
                                    <div class="col-md-12">
                                    <div class="input-group">
                                       <input type="date" class="form-control is-valid" id="datepicker-autoClose_DEL" placeholder="Select Date" />
                                     
                                    </div>
                                    </div>
                                </div>
                            </div>

                            
                        </div>

                         <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="col-md-12 control-label is-valid">Party PO#</label>
                                    
                                    <div class="col-md-12">
                                    <div class="input-group">
                                      <input type="text" id="txtPartyPO" class="form-control is-valid"  />
                                    </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="col-md-12 control-label ">LC#</label>
                                    
                                    <div class="col-md-12">
                                    <div class="input-group">
                                      <input type="text" id="txtLC" class="form-control is-valid"  />
                                    </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">Insurance</label>
                                    
                                    <div class="col-md-12">
                                    <div class="input-group">
                                      <input type="text" id="txtInsurance" class="form-control is-valid"  />
                                    </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">Incoterm</label>
                                    
                                    <div class="col-md-12">
                                    <div class="input-group">
                                      <input type="text" id="txtIncoTerm" class="form-control is-valid"  />
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                         <div class="row"><div class="col-lg-12" style="height:10px"></div></div>

                            <div class="row">
                                <div class="col-lg-12 table-responsive">
                                    <table id="tblItems" class="table table-striped table-bordered dataTable">
                                        <tr>
                                            <th style="width:5%">Sr#.</th>
                                            <th style="width:45%">Item</th>                                            
                                            <th style="width:8%">Unit</th>
                                            <th style="width:7%">Qty.</th>
                                            <th style="width:7%">Total Weight.</th>
                                            <th style="width:10%">Unit Price</th>
                                            <th style="width:10%">Total Price</th>
                                            <th style="width:10%">Line No.</th>
                                            <th style="width:5%"></th>
                                        </tr>
                                        <tr>
                                            <td><input type="text" id="txtSr1" value="1" disabled="disabled" class="form-control"  style="width:100%; border:0px none;"/></td>
                                            <td>
                                       
                                             <input type="text" class="span6 typeahead form-control" onblur="javascript:fillUNITS(this);" style="border:0px none;" id="txtAccCode1"  data-provide="typeahead" style="width:100%" 
                                             data-items="4" >
                                            </td>                   
                                            <td>
                                            <select id="ddlUnit1" class="form-control" onchange="ddlChange(this);"  style="width:100%; border:0px none;">
                                                  
                                                </select>
                                            </td>
                                            <td><input type="text" id="txtQty1" class="form-control " value="1" style="width:100%; border:0px none;" onkeyup="tot(this);"/></td>
                                            <td><input type="text" id="txtWt1" class="form-control " value="1" title="1000" disabled="disabled" style="width:100%; border:0px none;" /></td>
                                            <td><input type="text" id="txtPrice1" class="form-control " value="0"  style="width:100%; border:0px none;" onkeyup="tot(this);"/></td>
                                            <td><input type="text" id="txtTotalPrice1" class="form-control " value="0" disabled="disabled"  style="width:100%; border:0px none;" /></td>
                                              <td><input type="text" id="txtLineNo1" class="form-control " value=""   style="width:100%; border:0px none;" /></td>
                                                <td></td>                      
                                        </tr>

                                    </table>

                                    <%--<input type="button" value="" class="fa-plus-square" onclick="addRow();SumDbCr();"/>--%>
                                </div>
                            </div>
                            <div class="col-lg-12"><a class="btn btn-info waves-effect waves-themed" onclick="addRow();SumDbCr();">Add</a></div>

                            <div class="row" id="dvButton" >
                            <div class="col-md-9">
                                       &nbsp;
                                    </div>

                                    <div class="col-md-3" style="text-align:right">
                                    <a class="btn btn-warning waves-effect waves-themed" style="color:White" href="javascript:Get_Price();"> Get Price</a>
                                    </div>
                           </div>

                            <div class="row">
                                <label class="col-md-10 control-label" style="text-align:right">Total Amount</label>
                                <div class="col-lg-2"><input type="text" id="txtTotAmount" class="form-control" disabled="disabled" style="width:100%;" /></div>
                            </div>

                            <div class="row">
                                <label class="col-md-10 control-label" style="text-align:right">Discount</label>
                                <div class="col-lg-2"><input type="text" id="txtDiscount" onkeyup="totPaste();" value="0" class="form-control is-valid" style="width:100%;"/></div>
                            </div>

                            <div class="row">
                                <label class="col-md-10 control-label" style="text-align:right">Tax Rate</label>
                                <div class="col-lg-2"><input type="text" id="txtTaxRate" value="0" onkeyup="totPaste();" class="form-control is-valid" style="width:100%;"/></div>
                            </div>

                            <div class="row">
                                <label class="col-md-10 control-label" style="text-align:right">Total Tax</label>
                                <div class="col-lg-2"><input type="text" id="txtTotTax" disabled="disabled" class="form-control is-valid" style="width:100%;"/></div>
                            </div>

                            <div class="row">
                                <label class="col-md-10 control-label" style="text-align:right">Grand Total</label>
                                <div class="col-lg-2"><input type="text" id="txtGrandTotal" disabled="disabled" class="form-control is-valid" style="width:100%;"/></div>
                            </div>

                            <div class="row"><div class="col-lg-12" style="height:10px"></div></div>
                         
                            <div class="row"> 
                                <label class="col-md-2 control-label" style="text-align:right">Remarks</label>
                                
                                
                                <div class="col-lg-10"><input type="text" id="txtRemarks"  class="form-control is-valid" style="width:100%;"/></div>
                            </div>
                             <div class="row"><div class="col-lg-12" style="text-align:right">
                            <%-- <input type="button" id="btnClear" class="btn btn-danger btn-sm" value="Clear Form" onclick="ClearForm();" />--%>
                             <div class="row"><div class="col-lg-12" style="height:10px"></div></div>
                             
                                 <button type="button"   style=" width:10%;" id="btnSave" class="btn btn-success waves-effect waves-themed" onclick="SaveTransaction();">P R O C E S S</button>
                             </div></div>
                             <%--<div class="col-lg-3" style="text-align:right;"><h2><b id="lblTotalPasteQty">Total Paste Qty : 0</b></h2>--%>
                        
                                            </form>
                                            </div></div>
                                            </div></div>
                                            </div></main>
 
<%--<script type="text/javascript" src="json2.js"></script>
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="jstorage.js"></script>

--%>

      <%-- <script type="text/javascript" src="prototype.js"></script>
        <script type="text/javascript" src="jstorage.min.js"></script>--%>
       <%-- <script src="../js/jquery-1.9.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>--%>


          <script src="../js/jquery-1.9.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
    <script src="SaleOrder.js" type="text/javascript"></script>
     <script type="text/javascript" src='../AAUI/plugins/jquery-ui/jquery-ui.custom.min.js'></script>
   
    
   
   

   <%-- <script type="text/javascript">

        $("#datepicker-autoClose").datepicker({ dateFormat: 'm/dd/yy' });
        $('[data-datepicker]').click(function (e) {
            var data = $(this).data('datepicker');
            $(data).focus();
        });

        $("#datepicker-autoClose_DEL").datepicker({ dateFormat: 'm/dd/yy' });
        $('[data-datepicker]').click(function (e) {
            var data = $(this).data('datepicker');
            $(data).focus();
        });
    </script>--%>
</asp:Content>

