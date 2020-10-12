<%@ Page Title="" Language="C#" MasterPageFile="~/HR/MasterPage.master" AutoEventWireup="true" CodeFile="SaleOrder.aspx.cs" Inherits="HR_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%--<script src="../js/vendors.bundle.js" type="text/javascript"></script>
        <script src="../js/app.bundle.js" type="text/javascript"></script>--%>
    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="jquery-1.8.2.js" type="text/javascript"></script>
         <link rel="stylesheet" media="screen, print" href="../css/notifications/toastr/toastr.css">
         <script src="../js/notifications/toastr/toastr.js"></script>
   <title>Sale Order | Sale Order</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <main id="js-page-content" role="main" class="page-content">
                        
                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class='subheader-icon fal fa-edit'></i> Sale Order
                            </h1>
                        </div>
                     
                          <label  id="lblID" style="display:none;"></label>
     
                         <div class="row">
                            <div class="col-xl-12">
                                <div id="panel-1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                           
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
                                                  <div class="col-lg-2">
                                                <div class="form-group">
                                                    <label class="control-label col-md-12 " for="example-palaceholder">SO Date</label>
                                                    <input type="text" class="form-control is-valid" placeholder="Select Date" id="datepicker-autoClose" autocomplete="off"/ >
                                                    <span class="input-group-addon" id="datepicker-icon-trigger-PV" data-datepicker="#datepicker-autoClose"><i class="fa fa-calendar"></i></span>
                                                  
                                                </div>
                                                </div>
                                               
                                                        <div class="col-lg-2">
                                                <div class="form-group">
                                                    <label class="control-label col-md-12">SO No.</label>
                                                    <div class="col-md-12">
                                                    <input type="text" class="form-control is-valid" placeholder="" id="txtVoucherNo" disabled="disabled" / >
                                                     </div>
                      <%--                               <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                         <div class="invalid-feedback">
                                                          Please provide a valid Packing Type Title.
                                                        </div>--%>
                                                </div>
                                                </div>

                                                               <div class="col-lg-5">
                                                <div class="form-group">
                                                    <label class="col-md-12 control-label">Customer</label>
                                                    <div class="col-md-12">
                                                    <input type="text" class="span6 typeahead form-control is-invalid" placeholder="" id="txtCustomer" data-provide="typeahead" style="width:100%" data-items="4" />
                                                    </div>
                                      <%--       <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                         <div class="invalid-feedback">
                                                          Please provide a valid Packing Type Title.
                                                        </div>
                                                </div>
                                                </div>--%>

                                                               <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="col-md-12 control-label">Delivery Date</label>
                                                    <div class="col-md-12">
                                                    <div class="input-group">
                                                    <input type="text" class="form-control is-invalid" placeholder="Select Date" id="datepicker-autoClose_DEL"/ >
                                                    <span class="input-group-addon" id="datepicker-icon-trigger-DEL" data-datepicker="#datepicker-autoClose_DEL"><i class="fa fa-calendar"></i></span>
                     <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                         <div class="invalid-feedback">
                                                          
                                                        </div>
                                                </div>
                                                </div>

                                                </div>
                                                </div>
                                                 </div>
                                                </div>
                                                </div>

                                                  
                                                <div class="row" style="height:20px;"></div>

   <div class="row">
                                                  <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="col-md-12 control-label" for="example-palaceholder">Party PO #</label>
                                                    <div class="col-md-12">
                                                    <div class="input-group">
                                                    <input type="text" class="form-control is-valid"  id="txtPartyPO" >

                                        
                                                </div>
                                                </div>
                                                 </div>
                                                </div>
                                               
                                                        <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="col-md-12 control-label">LC #</label>
                                                    <div class="col-md-12">
                                                      <div class="input-group">
                                                    <input type="text" class="form-control is-valid"  id="txtLC"/>
                                       
                                                </div>
                                          
                                                  </div>
                                                </div>
                                                </div>

                                                               <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="col-md-12 control-label"> Insurance</label>
                                                    <div class="col-md-12">
                                                      <div class="input-group">
                                                    <input type="text" class="form-control is-valid"  id="txtInsurance"/ >
                                  
                                                </div>
                                                </div>
                                                 </div>
                                                </div>

                                                               <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Incoterm</label>
                                                    <input type="text" class="form-control is-valid" placeholder="" id="txtIncoTerm" autocomplete="off" onkeyup="CheckDataLength();" >
       <%--                                              <div class="valid-feedback">
                                                            Looks good!
                                                        </div>
                                                         <div class="invalid-feedback">
                                                          Please provide a valid Packing Type Title.
                                                        </div>--%>
                                                </div>
                                                </div>
                                                </div>

                        <div class="row" style="height:20px;"></div>    
                        
                        <div class="row"><div class="col-lg-12" style="height:10px"></div></div>
                        
                                  <div class="row">
                                <div class="col-lg-12 table-responsive">
                                    <table id="tblItems" class="table table-striped table-bordered dataTable  no-footer" >
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
                                             <%--<input type="text" class="span6 typeahead" id="txtAccCode1"  data-provide="typeahead" style="width:100%" 
                                             data-items="4" data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>--%>
                                             <input type="text" class="span6 typeahead form-control" onblur="javascript:fillUNITS(this);" style="border:0px none;" id="txtAccCode1"  data-provide="typeahead" style="width:100%" 
                                             data-items="4" >
                                            </td>                   
                                            <td>
                                            <select id="ddlUnit1" class="form-control" onchange="ddlChange(this);"  style="width:100%; border:0px none;">
                                                   <%-- <option value="1">Project One</option>
                                                    <option value="2">Project Two</option>
                                                    <option value="3">Project Three</option>
                                                    <option value="4">Project Four</option>--%>
                                                </select>
                                            </td>
                                            <td><input type="text" id="txtQty1" class="form-control" value="1" style="width:100%; border:0px none;" onkeyup="tot(this);"/></td>
                                            <td><input type="text" id="txtWt1" class="form-control" value="1" title="1000" disabled="disabled" style="width:100%; border:0px none;" /></td>
                                            <td><input type="text" id="txtPrice1" class="form-control" value="0"  style="width:100%; border:0px none;" onkeyup="tot(this);"/></td>
                                            <td><input type="text" id="txtTotalPrice1" class="form-control" value="0" disabled="disabled"  style="width:100%; border:0px none;" /></td>
                                              <td><input type="text" id="txtLineNo1" class="form-control" value=""   style="width:100%; border:0px none;" /></td>
                                                <td></td>                      
                                        </tr>

                                    </table>

                                    <%--<input type="button" value="" class="fa-plus-square" onclick="addRow();SumDbCr();"/>--%>
                                </div>
                            </div>   

                                <div class="form-group" style="text-align:right;">
                                             <button type="button" id="Button1" class="btn btn-success waves-effect waves-themed" onclick="SaveData();">Get Price</button>

                                             </div>
                            
                                                       <div class="row">
                                <label class="col-md-10 control-label" style="text-align:right">Total Amount</label>
                                <div class="col-lg-2"><input  type="text" id="txtTotAmount" class="form-control is-valid" disabled="disabled" style="width:100%;" /></div>
                            </div>                 
            

               <div class="row">
                                <label class="col-md-10 control-label" style="text-align:right">Discount</label>
                                <div class="col-lg-2 "><input type="text" id="txtDiscount" onkeyup="totPaste();" value="0" class="form-control is-valid" style="width:100%;"/></div>
                            </div>

                               <div class="row">
                                <label class="col-md-10 control-label" style="text-align:right">Tax Rate</label>
                                <div class="col-lg-2 "><input type="text" id="txtTaxRate" value="0" onkeyup="totPaste();" class="form-control is-valid" style="width:100%;"/></div>
                            </div>

                               <div class="row">
                                <label class="col-md-10 control-label" style="text-align:right">Total Tax</label>
                                <div class="col-lg-2"><input type="text" id="txtTotTax" disabled="disabled" class="form-control is-valid" style="width:100%;"/></div>
                            </div>

                            <div class="row">
                                <label class="col-md-10 control-label" style="text-align:right">Grand Total</label>
                                <div class="col-lg-2"><input type="text" id="txtGrandTotal" disabled="disabled" class="form-control is-valid" style="width:100%;"/></div>
                            </div>

                            <div class="row">
                                <label class="col-md-2 control-label" style="text-align:right">Remarks</label>
                                <div class="col-lg-10"><input type="text" id="txtRemarks"  class="form-control is-valid" style="width:100%;"/></div>
                            </div>
                                                </div>
                                                </div>
                                               

                                                </div>


                         

                                                                    
                                                 <div class="form-group" style="text-align:right;">
                                             <button type="button" id="btnSave" class="btn btn-success waves-effect waves-themed" onclick="SaveData();">Process</button>
                                        <%--     <button type="button" class="btn btn-danger waves-effect waves-themed">Delete</button>--%>
                                           <%--  <button type="button" id="btnClear" class="btn btn-warning waves-effect waves-themed" onclick="Cancel();">Cancel</button>--%>
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
                                            Task Type List
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
                                                </form></div></div>
                                    </div>
                                    </div></div>
                    </main>
    <script src="Activity.js" type="text/javascript"></script> 
         
</asp:Content>


