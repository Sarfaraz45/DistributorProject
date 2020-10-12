<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="PO.aspx.cs" Inherits="PROCUREMENT_PO" %>

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
     <div id="dvUnits" style="display:none"></div>
     <asp:HiddenField ID="hdnSupplier" runat="server" Value="0" />
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
                                <i class='subheader-icon fal fa-edit'></i> Purchase Order
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
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">PO Date</label>
                                    
                                    <div class="col-md-12">
                                    <div class="input-group">
                                       <input type="date" class="form-control is-valid" id="datepicker-autoClose" placeholder="Select Date" />
                                       <%--<span class="input-group-addon" id="datepicker-icon-trigger-PV" data-datepicker="#datepicker-autoClose"><i class="fa fa-calendar"></i></span>--%>
                                       </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">PO No.</label>
                                    
                                    <div class="col-md-12">
                                        <input type="text" id="txtVoucherNo" class="form-control is-valid" disabled="disabled" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">Supplier</label>
                                    
                                    <div class="col-md-12">
                                <input type="text" class="span6 typeahead form-control is-valid"   id="txtSupplier"  data-provide="typeahead" style="width:100%"  data-items="4" >


                                    </div>
                                </div>
                            </div>

                            
                        </div>

                         <div class="row"><div class="col-lg-12" style="height:10px"></div></div>

                            <div class="row">
                                <div class="col-lg-12 table-responsive">
                                    <table id="tblItems" class="table table-striped table-bordered dataTable no-footer">
                                        <tr>
                                            <th style="width:5%">S.No.</th>
                                            <th style="width:39%">Item</th>                                            
                                            <th style="width:12%">Unit</th>
                                            <th style="width:7%">Qty.</th>
                                            <th style="width:7%">Weight.</th>
                                            <th style="width:15%">Unit Price</th>
                                            <th style="width:15%">Total Price</th>
                                        </tr>
                                        <tr>
                                            <td><input type="text" id="txtSr1" value="1" disabled="disabled" class="form-control"  style="width:100%; border:0px none;"/></td>
                                            <td>
                                             <%--<input type="text" class="span6 typeahead" id="txtAccCode1"  data-provide="typeahead" style="width:100%" 
                                             data-items="4" data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>--%>
                                             <input type="text" class="span6 typeahead form-control" onblur="javascript:fillUNITS(this);" style="border:0px none;" id="txtAccCode1"  data-provide="typeahead" style="width:100%" 
                                             data-items="4" >
                                            </td>                   
                                            <td>
                                            <select id="ddlUnit1" class="form-control"  style="width:100%; border:0px none;">
                                                   <%-- <option value="1">Project One</option>
                                                    <option value="2">Project Two</option>
                                                    <option value="3">Project Three</option>
                                                    <option value="4">Project Four</option>--%>
                                                </select>
                                            </td>
                                            <td><input type="text" id="txtQty1" class="form-control" value="1" style="width:100%; border:0px none;" onkeyup="tot(this);"/></td>
                                            <td><input type="text" id="txtWt1" class="form-control" value="1" title="1000" disabled="disabled" style="width:100%; border:0px none;" /></td>
                                            <td><input type="text" id="txtPrice1" class="form-control" value="0"  style="width:100%; border:0px none;" onkeyup="tot(this);"/></td>
                                            <td><input type="text" id="txtTotalPrice1" class="form-control" value="0"  style="width:100%; border:0px none;" onkeyup="tot(this);"/></td>
                                                                    
                                        </tr>

                                    </table>

                                    <%--<input type="button" value="" class="fa-plus-square" onclick="addRow();SumDbCr();"/>--%>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-6" ></div>
                                <div class="col-lg-3" style="text-align:right">
                                    <span id="spnQtySummary"></span>
                                </div>

                            <div class="col-lg-3" style="text-align:right">
                           
                            <i class="btn btn-info waves-effect waves-themed" onclick="addRow();SumDbCr();">Add More</i></div>
                            </div>

                                                  <div class="row">
                                <label class="col-md-10 control-label" style="text-align:right">Total Amount</label>
                                <div class="col-lg-2"><input type="text" id="txtTotAmount" class="form-control" disabled="disabled" style="width:100%;" /></div>
                            </div>



                            <div class="row" style="display:none" >
                                <div class="col-lg-12 table-responsive">
                                    <table id="Table1" style="width:100%">
                                        <tr>
                                            <td style="width:5%"></td>
                                            <td style="width:25%"></td>                                            
                                            <td style="width:8%"><span id="spnTotDb" style="font-weight:bold">0</span></td>
                                            <td style="width:8%"><span id="spnTotCr" style="font-weight:bold">0</span></td>
                                            <td style="width:8%"></td>
                                            <td style="width:10%"></td>
                                            <td style="width:25%"></td>
                                            <td style="width:11%"></td>
                                        </tr>
                                        </table>
                                </div>

                                
                            </div>

                          

                            <div class="row"><div class="col-lg-12" style="height:10px"></div></div>

                             <div class="row"><div class="col-lg-12" style="text-align:right" >
                            <%-- <input type="button" id="btnClear" class="btn btn-danger btn-sm" value="Clear Form" onclick="ClearForm();" />--%>
                             <a class="btn btn-block btn-success" href="javascript:SaveTransaction();" style="display: inline-block;">
                              Submit</a>
                             
                             </div></div>

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
        <script src="../js/jquery-1.9.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
                 <script type="text/javascript" src='../AAUI/plugins/jquery-ui/jquery-ui.custom.min.js'></script>
    <script src="PO.js" type="text/javascript"></script>


<%--    <script type="text/javascript">

        $("#datepicker-autoClose").datepicker({ dateFormat: 'm/dd/yy' });
        $('[data-datepicker]').click(function (e) {
            var data = $(this).data('datepicker');
            $(data).focus();
        });
    </script>--%>


</asp:Content>

