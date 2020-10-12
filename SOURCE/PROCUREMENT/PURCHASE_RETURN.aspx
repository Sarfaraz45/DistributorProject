<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/MasterPage.master" AutoEventWireup="true" CodeFile="PURCHASE_RETURN.aspx.cs" Inherits="PURCHASE_PURCHASE_RETURN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../jquery-1.8.2.js"></script>
    <script src="../jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
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
 
    <div class="modal fade" id="modal-dialog">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
											<h4 class="modal-title">Confirmation Required</h4>
										</div>
										<div class="modal-body" id="msgbody">
											Are you sure about this?
										</div>
										<div class="modal-footer">
											<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal" onclick="msgrevert();">Close</a>
											<a href="javascript:;" class="btn btn-sm btn-success" onclick="SaveData();" id="confirm">Confirm</a>
										</div>
									</div>
								</div>
							</div>

    <div class="modal fade" id="modal-dialog_delete">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
											<h4 class="modal-title">Confirmation Required</h4>
										</div>
										<div class="modal-body" id="msgbody_delete">
											Are you sure about this?
										</div>
										<div class="modal-footer">
											<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal" onclick="msgrevert_delete();">Close</a>
											<a href="javascript:;" class="btn btn-sm btn-danger" onclick="DeleteRegion();" id="confirm_delete">Confirm</a>
										</div>
									</div>
								</div>
							</div>

   
               <div class="panel widget light-widget panel-bd-top hidden-print">
                        <div class="panel-heading bordered">
                    <h3 class="panel-title"> <span class="menu-icon"> <i class="icon-pie"></i> </span> Purchase Return! </h3>
                    <div class="vd_panel-menu">
  <div data-action="minimize" data-original-title="Minimize" data-toggle="tooltip" data-placement="bottom" class=" menu entypo-icon"> <i class="icon-minus3"></i> </div>
  <div data-action="refresh"  data-original-title="Refresh" data-toggle="tooltip" data-placement="bottom" class=" menu entypo-icon smaller-font"> <i class="icon-cycle"></i> </div>
  
  <div data-action="close" data-original-title="Close" data-toggle="tooltip" data-placement="bottom" class=" menu entypo-icon"> <i class="icon-cross"></i> </div>
</div>
<!-- vd_panel-menu --> 
                  </div>
                        <div class=" panel-body-list" style="padding:10px">
                     <div class="form-group">
                           <asp:HiddenField ID="hdnAccounts" runat="server" Value='["Karachi","Hyderabad","USA","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky"]' />
    <asp:HiddenField ID="hdnAmount" runat="server" Value="0" />
    <asp:HiddenField ID="hdnRemVal" runat="server" Value="0" />
    <asp:HiddenField ID="hdnNarration" runat="server" Value="0" />
     <asp:HiddenField ID="hdnDate" runat="server" Value="0" />
     <asp:HiddenField ID="hdnTotDb" runat="server" Value="0" />
     <asp:HiddenField ID="hdnTotCr" runat="server" Value="0" />
     <asp:HiddenField ID="hdnProjects" runat="server" Value="0" />
     <asp:HiddenField ID="hdnParty" runat="server" Value="0" />
     <asp:HiddenField ID="hdnDebit" runat="server" Value="0" />
                         <div class="row">
                <!-- begin col-12 -->
			    <div class="col-md-12">
			        <!-- begin panel -->
                   <div class="panel panel-inverse">
                        
                        <div class="panel-body">

                            
                                    <asp:Label ID="lblMsg" runat="server" CssClass="parsley-errors-list" Visible="False"></asp:Label>
                                    <asp:TextBox ID="txtid" runat="server" Visible="False" CssClass="form_inputfeild" placeholder="Enter Name"></asp:TextBox>                
                              
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">Date From</label>
                                    
                                    <div class="col-md-12">
                                     <div class="input-group">
                                       <input type="text"  id="datepicker-autoClose" placeholder="Date From" />
                                       <span class="input-group-addon" id="datepicker-icon-trigger-PV" data-datepicker="#datepicker-autoClose"><i class="fa fa-calendar"></i></span>
                                       </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">Date To</label>
                                    
                                    <div class="col-md-12">
                                        <div class="input-group">
                                        <input type="text"  id="datepicker-autoCloseTO" placeholder="Date From" />
                                        <span class="input-group-addon" id="datepicker-icon-trigger-PVTO" data-datepicker="#datepicker-autoCloseTO"><i class="fa fa-calendar"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                             <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">Supplier</label>
                                    
                                    <div class="col-md-12">
                                        <input type="text" id="txtParty" class="span6 typeahead width-100" data-provide="typeahead" data-items="4"  />
                                    </div>

                                </div>
                            </div>

                          


                            <div class="col-lg-2" style="text-align:center">
                            <div class="col-md-12">
                            &nbsp;
                            </div>
                            <div class="col-md-12">
                            
                            <a class="btn  btn-block btn-success" href="javascript:LoadLIST();"><span class="menu-icon"><i class="fa fa-fw fa-search"></i></span> Search</a>
                            
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
                </div>

              
</div>
                      </div>


                      
                     
                     
                     
                    
                                                                                <asp:HiddenField ID="hdnid" runat="server" />

          
                  </div>
                </div>
   

    
     <div class="modal fade" id="modalRcvdStock" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" >
                      <div class="modal-content" style="width:900px">
                        <div class="modal-header vd_bg-blue vd_white">
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                          <h4 class="modal-title" id="H1">Purchase Return</h4>
                        </div>
                        <div class="modal-body" > 
                        	
                           <div class="row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">PO No.</label>
                                    
                                    <div class="col-md-12" id="dvPONo">
                                        
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                &nbsp;
                            </div>

                            


                            <div class="col-lg-4">
                               &nbsp;
                            </div>

                           

                            
                        </div>


                            <div class="row">
                                <div class="col-lg-12 table-responsive" id="dvListStock">
                                   

                                    <%--<input type="button" value="" class="fa-plus-square" onclick="addRow();SumDbCr();"/>--%>
                                </div>
                            </div>
                            
                            
                             <div class="row"><div class="col-lg-12" style="text-align:right">
                             <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">Entry Date</label>
                                    
                                    <div class="col-md-12 input-group" >
                                       <input type="text" placeholder="Date" id="txtEntryDate" />
                                        <span class="input-group-addon" id="spnTrigerEntryDate" data-datepicker="#txtEntryDate"><i class="fa fa-calendar"></i></span>
                                    </div>
                                </div>
                            </div>
                           
                           <div class="col-lg-5">
                           &nbsp;
                           </div>
                             
                            <%-- <input type="button" id="btnClear" class="btn btn-danger btn-sm" value="Clear Form" onclick="ClearForm();" />--%>
                              <div class="col-lg-3">
                             <div class="col-lg-12">&nbsp;</div>

                             <div class="col-lg-12">
                             <input type="button" id="Button1" class="btn btn-success btn-block" value="Purchase Return" onclick="SaveGoods();" />
                             </div>
                             </div>
                             </div></div>

                             <div class="table-responsive" id="dvGoodsLST" >
                                
                            </div>
                          
                        </div>
                        <div class="modal-footer background-login">
                          <!--<button type="button" class="btn vd_btn vd_bg-grey" data-dismiss="modal">No</button>
                          <button type="button" class="btn vd_btn vd_bg-green" onclick="ProcessOrder();">Yes</button>-->
                        </div>
                      </div>
                      <!-- /.modal-content --> 
                    </div>
                    <!-- /.modal-dialog --> 
                  </div>
    
    
      

     <script src="../js/jquery-1.9.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
    
     <script type="text/javascript" src='../AAUI/plugins/jquery-ui/jquery-ui.custom.min.js'></script>
    <script src="PURCHASE_RETURN.js" type="text/javascript"></script>
    
    <script type="text/javascript">

        $("#datepicker-autoClose").datepicker({ dateFormat: 'm/dd/yy' });
        $('[data-datepicker]').click(function (e) {
            var data = $(this).data('datepicker');
            $(data).focus();
        });

        $("#datepicker-autoCloseTO").datepicker({ dateFormat: 'm/dd/yy' });
        $('[data-datepicker]').click(function (e) {
            var data = $(this).data('datepicker');
            $(data).focus();
        });

        $("#txtEntryDate").datepicker({ dateFormat: 'm/dd/yy' });
        $('[data-datepicker]').click(function (e) {
            var data = $(this).data('datepicker');
            $(data).focus();
        });
    </script>


</asp:Content>

