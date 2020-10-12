<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="PO_OLD_2.aspx.cs" Inherits="PROCUREMENT_PO_OLD_2" %>

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
     <asp:HiddenField ID="hdnDebit" runat="server" Value="0" />
 <!-- #modal-message -->
<!-- #modal-message -->
<!-- #modal-message -->
<!-- #STYLE 1 -->
<style type="text/css">
.vd_content-section .row {
    margin-bottom: 5px;
}



.col-xs-1, .col-sm-1, .col-md-1, .col-lg-1, .col-xs-2, .col-sm-2, .col-md-2, .col-lg-2, .col-xs-3, .col-sm-3, .col-md-3, .col-lg-3, .col-xs-4, .col-sm-4, .col-md-4, .col-lg-4, .col-xs-5, .col-sm-5, .col-md-5, .col-lg-5, .col-xs-6, .col-sm-6, .col-md-6, .col-lg-6, .col-xs-7, .col-sm-7, .col-md-7, .col-lg-7, .col-xs-8, .col-sm-8, .col-md-8, .col-lg-8, .col-xs-9, .col-sm-9, .col-md-9, .col-lg-9, .col-xs-10, .col-sm-10, .col-md-10, .col-lg-10, .col-xs-11, .col-sm-11, .col-md-11, .col-lg-11, .col-xs-12, .col-sm-12, .col-md-12, .col-lg-12 {
  
    padding-right: 5px;
     padding-left: 5px; 
}

/*.table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td, .table>tbody>tr>td, .table>tfoot>tr>td {
    padding: 0px 0px;
}*/
.table>tbody>tr>td
{
    padding: 0px 0px;
    }
</style>
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
                    <h3 class="panel-title"> <span class="menu-icon"> <i class="icon-pie"></i> </span> Purchase! </h3>
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
                            <div class="col-lg-3">
                            <div class="form-group">
                                    <label class="col-md-12 control-label">PO Date</label>
                                    
                                    <div class="col-md-12">
                                       <input type="text" class=" width-100" id="datepicker-autoClose" placeholder="Select Date" />
                                    </div>
                                    </div>
                            </div>

                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">PO No.</label>
                                    
                                    <div class="col-md-12">
                                        <input type="text" id="txtVoucherNo" class=" width-100" disabled="disabled" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">Stock In</label>
                                    
                                    <div class="col-md-12">
                                <asp:DropDownList ID="ddlWH" CssClass="width-100" runat="server" DataSourceID="SqlDataSource2" 
                                            DataTextField="WHTitle" DataValueField="WHID">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:Con %>" 
                                            SelectCommand="SELECT '0' as [WHID],'Select Warehouse' as [WHTitle] FROM [WAREHOUSE] union SELECT [WHID], [WHTitle] FROM [WAREHOUSE]">
                                           
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>


                            <div class="col-lg-5">
                                <div class="form-group">
                                    <label class="col-md-12 control-label">Supplier</label>
                                    
                                    <div class="col-md-12">
                                <asp:DropDownList ID="ddlSupplier" runat="server" DataSourceID="SqlDataSource1" 
                                            DataTextField="SupplierTitle" CssClass="width-100" DataValueField="SupplierID">
                                </asp:DropDownList>


                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:Con %>" 
                                            SelectCommand="SELECT '0' as [SupplierID],'Select Supplier' as [SupplierTitle] FROM [Supplier] union SELECT [SupplierID], [SupplierTitle] FROM [Supplier] WHERE ([ISDELETE] = @ISDELETE)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="0" Name="ISDELETE" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>


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
                                            <th style="width:46%">Item</th>                                            
                                            <th style="width:12%">Unit</th>
                                            <th style="width:7%">Qty.</th>
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
                                            <td><input type="text" id="txtPrice1" class="form-control" value="0"  style="width:100%; border:0px none;" onkeyup="tot(this);"/></td>
                                            <td><input type="text" id="txtTotalPrice1" class="form-control" value="0" disabled="disabled"  style="width:100%; border:0px none;" /></td>
                                                                    
                                        </tr>

                                    </table>

                                    <%--<input type="button" value="" class="fa-plus-square" onclick="addRow();SumDbCr();"/>--%>
                                </div>
                            </div>
                            <div class="col-lg-12" style="text-align:right"><i class="fa fa-2x fa-plus-square" onclick="addRow();SumDbCr();"></i></div>


                            <div class="row">
                                <label class="col-md-10 control-label" style="text-align:right">Total Amount</label>
                                <div class="col-lg-2"><input type="text" id="txtTotAmount" class="width-100" disabled="disabled" style="width:100%;" /></div>
                            </div>

                            <div class="row">
                                <label class="col-md-10 control-label" style="text-align:right">Discount</label>
                                <div class="col-lg-2"><input type="text" id="txtDiscount" onkeyup="totPaste();" value="0" class="width-100" style="width:100%;"/></div>
                            </div>

                            <div class="row">
                                <label class="col-md-10 control-label" style="text-align:right">Tax Rate</label>
                                <div class="col-lg-2"><input type="text" id="txtTaxRate" value="0" onkeyup="totPaste();" class="width-100" style="width:100%;"/></div>
                            </div>

                            <div class="row">
                                <label class="col-md-10 control-label" style="text-align:right">Total Tax</label>
                                <div class="col-lg-2"><input type="text" id="txtTotTax" disabled="disabled" class="width-100" style="width:100%;"/></div>
                            </div>

                            <div class="row">
                                <label class="col-md-10 control-label" style="text-align:right">Grand Total</label>
                                <div class="col-lg-2"><input type="text" id="txtGrandTotal" disabled="disabled" class="width-100" style="width:100%;"/></div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-10 control-label" style="text-align:right">Payment Amount</label>
                                    
                                    <div class="col-md-2">
                                        <input type="text" id="txtDepositAmount" class="width-100" style="width:100%;" value="0" />
                                    </div>
                                </div>
                            </div>

                             <div class="row">
                                <div class="form-group">
                                    <label class="col-md-6 control-label" style="text-align:right"">Payment From</label>
                                    
                                    <div class="col-md-6">
                                        <input type="text" id="txtDebit" class="span6 typeahead width-100" data-provide="typeahead" data-items="4" />
                                    </div>
                                </div>
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

                          

                             <div class="row"><div class="col-lg-12" style="text-align:right" >
                            
                             <a class="btn vd_btn vd_bg-green finish" href="javascript:SaveTransaction();" style="display: inline-block;">
                             <span class="menu-icon"><i class="fa fa-fw fa-check"></i></span> Submit</a>
                             </div></div>
                             <%--<div class="col-lg-3" style="text-align:right;"><h2><b id="lblTotalPasteQty">Total Paste Qty : 0</b></h2>--%>
                        </div>
                   </div>
                </div>

              
</div>

<%--<script type="text/javascript" src="json2.js"></script>
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="jstorage.js"></script>

--%>

      <%-- <script type="text/javascript" src="prototype.js"></script>
        <script type="text/javascript" src="jstorage.min.js"></script>--%>
        <script src="../js/jquery-1.9.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">

    LOAD_ITEMS();
    LOAD_DEBIT();


    function totPaste() {
        var tot = 0;
        var elm = {};
        var elms = document.getElementById('tblItems').getElementsByTagName("input");
        for (var i = 0; i < elms.length; i++) {
            if (elms[i].id.indexOf('txtTotalPrice') != -1) {

                elm = elms[i];
                var iD = elm.id;
                var txtTotalPrice = iD;
                var totp = document.getElementById(txtTotalPrice).value;

                tot = parseFloat(tot) + parseFloat(totp); //500 200-500=300
            }
        }


        document.getElementById("txtTotAmount").value = tot;
        //document.getElementById('lblTotalPasteQty').innerHTML = "Total Paste Qty : " + p;
        var txtDiscount = document.getElementById("txtDiscount").value;
        var txtTaxRate = document.getElementById("txtTaxRate").value;
        if (txtDiscount == "" || txtDiscount == null) { txtDiscount = 0; }
        if (txtTaxRate == "" || txtTaxRate == null) { txtTaxRate = 0; }

        var totAmount = parseFloat(tot) - parseFloat(txtDiscount);
        var totTax = parseFloat(totAmount) * parseFloat(txtTaxRate) / 100;
        document.getElementById("txtTotTax").value = totTax;
        document.getElementById("txtGrandTotal").value = parseFloat(totAmount) + parseFloat(totTax);

    }



    function LOAD_DEBIT() {
        var tblRows = "";
        var UserID = "1";
        $.ajax({
            type: 'POST',
            url: 'PO.aspx/LOAD_DEBIT',
            //data: {},
            data: '{ "UserID" : "' + UserID + '" }',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                var s = msg.d; //.split('`');
                tblRows = s;// [0];

                var c = tblRows.replace(/'/g, '"');
                document.getElementById('ContentPlaceHolder1_hdnDebit').value = c;
                txtDebit = document.getElementById('txtDebit');
                txtDebit.dataset.source = document.getElementById('ContentPlaceHolder1_hdnDebit').value;




            }

        });
        // alert(tblRows);

    }

    function ValidateRow() {
        var accList = document.getElementById('ContentPlaceHolder1_hdnItems').value;
        accList = accList.replace("[", "");
        accList = accList.replace("]", "");
        accList = accList.replace(/"/g, '');

        var accArray = accList.split(',');

        var cc = 0; var ccDbCR = 0; var ccDate = 0;
        var elm = {};
        var elms = document.getElementById('tblItems').getElementsByTagName("input");
        for (var i = 0; i < elms.length; i++) {
            if (elms[i].id.indexOf('txtAccCode') != -1) {

                elm = elms[i];
                var iD = elm.id;
                var txtAccCodeID = iD;
                var txtAccCode = document.getElementById(txtAccCodeID).value;

                

                ////////////////////////////ACCOUNT LIST Checking
                if (accArray.indexOf(txtAccCode) == -1) {

                    document.getElementById(txtAccCodeID).style.background = 'red';
                    // txtAccCodeID.style.background = 'red';background:red
                    cc = 1;
                }
                else {
                    document.getElementById(txtAccCodeID).style.background = 'white';
                }


            }
        }

        var msg = cc;//  + '|' + ccDbCR + '|' + ccDate; //1+2+3
        return msg;

    }

    function addRow() {

        /////////////////////// VALIDATION START
        var cc = ValidateRow();
        if (cc == '1') {
            alert("Item Does not exist in Highlighted Rows! ");
            return false;
        }


        //SumDbCr();
        var table = document.getElementById('tblItems');

        var rowCount = table.rows.length;
        var row = table.insertRow(rowCount);
        var newID = parseFloat(rowCount);

        var cell1 = row.insertCell(0);
        var txtSr = document.createElement("input");
        txtSr.type = "text";
        txtSr.id = "txtSr" + newID;
        txtSr.value = newID;
        txtSr.className = 'form-control';
        txtSr.style.width = '100%';
        txtSr.style.border = '0px none';
        txtSr.disabled = true;
        cell1.appendChild(txtSr);

        var cell2 = row.insertCell(1);
        var txtAccCode = document.createElement("input");
        txtAccCode.type = "text";
        txtAccCode.id = "txtAccCode" + newID;
        txtAccCode.className = 'span6 typeahead form-control'; //data-source
        txtAccCode.style.width = '100%';
        txtAccCode.style.border = '0px none';
        txtAccCode.dataset.provide = "typeahead";
        txtAccCode.dataset.source = document.getElementById('ContentPlaceHolder1_hdnItems').value;

        txtAccCode.onblur = function () { // Note this is a function
            fillUNITS(this)
        };
        cell2.appendChild(txtAccCode);




        //var newList = document.createElement("select");
        var cell3 = row.insertCell(2); //txtDesc
        var ddlUnit = document.createElement("select");
        ddlUnit.id = "ddlUnit" + newID;
        ddlUnit.className = 'form-control';
        ddlUnit.style.width = '100%';
        ddlUnit.style.border = '0px none';
        
//        var pp = document.getElementById('ContentPlaceHolder1_hdnUnits').value;
//        var pList = pp.split('~');
//        for (var i = 0; i < pList.length; i++) {
//            var pItems = pList[i].split('^');
//            ddlUnit.appendChild(new Option(pItems[0], [1]));
//        }
        cell3.appendChild(ddlUnit);







        var cell4 = row.insertCell(3); //txtQty
        var txtQty = document.createElement("input");
        txtQty.type = "text";
        txtQty.id = "txtQty" + newID;
        txtQty.className = 'form-control';
        txtQty.style.width = '100%';
        txtQty.style.border = '0px none';
        txtQty.value = '1';
        txtQty.onkeyup = function () { // Note this is a function
            tot(this)
        };
        cell4.appendChild(txtQty); //SumDbCr();


        var cell5 = row.insertCell(4); //txtPrice
        var txtPrice = document.createElement("input");
        txtPrice.type = "text";
        txtPrice.id = "txtPrice" + newID;
        txtPrice.className = 'form-control';
        txtPrice.style.width = '100%';
        txtPrice.style.border = '0px none';

        txtPrice.value = '0';
        txtPrice.onkeyup = function () { // Note this is a function
            tot(this)
        };
        cell5.appendChild(txtPrice); //SumDbCr();


        var cell6 = row.insertCell(5); //txtTotalPrice
        var txtTotalPrice = document.createElement("input");
        txtTotalPrice.type = "text";
        txtTotalPrice.id = "txtTotalPrice" + newID;
        txtTotalPrice.className = 'form-control';
        txtTotalPrice.style.width = '100%';
        txtTotalPrice.style.border = '0px none';
        txtTotalPrice.value = '0';
        txtTotalPrice.disabled = "disabled";
//        txtTotalPrice.onkeyup = function () { // Note this is a function
//            totPaste(this)
//        };
        cell6.appendChild(txtTotalPrice);
        //lineTOTAL(a)




        

    }

    function fillUNITS(a){
        var txtAccCodeID = a.id;
        var ddlUnitID = txtAccCodeID.replace('txtAccCode', 'ddlUnit');

        var txtAccCode = document.getElementById(txtAccCodeID).value;
        var splt = txtAccCode.split('^');
        var accID = splt[0];
        var itmID = accID.replace(/\s/g, '');

        var spnID = 'spnUNT' + itmID;


        var ddlUnit = document.getElementById(ddlUnitID);

        var pp = document.getElementById(spnID).innerHTML;

        var select = ddlUnit;
        var length = select.options.length;
        for (i = length - 1; i >= 0; i--) {
            select.options[i] = null;
        }

        var pList = pp.split('~');
        for (var i = 0; i < pList.length; i++) {
            var pItems = pList[i].split('^');
            ddlUnit.appendChild(new Option(pItems[1], pItems[0]));
        }

    }

    function LOAD_ITEMS() {

        var tblRows = "";
        var UserID = "1";
        $.ajax({
            type: 'POST',
            url: 'PO.aspx/LOAD_ITEMS',
            data: '{ "UserID" : "' + UserID + '" }',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                var s = msg.d.split('`');
                tblRows = s[0];
                document.getElementById('txtVoucherNo').value = s[1];
                var b = tblRows.replace(/'/g, '"');
                document.getElementById('ContentPlaceHolder1_hdnItems').value = b;
                txtAccCode = document.getElementById('txtAccCode1');
                txtAccCode.dataset.source = document.getElementById('ContentPlaceHolder1_hdnItems').value;
                document.getElementById('ContentPlaceHolder1_hdnDate').value = s[2];
                document.getElementById('datepicker-autoClose').value = s[2];
                document.getElementById('dvUnits').innerHTML = s[3];

            }

        });
    }

    function tot(a) {
        var QtyID = ''; //txtQty1
        var PriceID = ''; //txtPrice1
        var totPriceID = ''; //txtTotalPrice1

        var thisID = a.id;
        if (thisID.indexOf('txtQty') != -1) {
            QtyID = thisID;
            PriceID = thisID.replace('txtQty', 'txtPrice');
            totPriceID = thisID.replace('txtQty', 'txtTotalPrice');
        }
        else if (thisID.indexOf('txtPrice') != -1) {
            QtyID = thisID.replace('txtPrice', 'txtQty');
            PriceID = thisID;
            totPriceID = thisID.replace('txtPrice', 'txtTotalPrice');
        }
        else if (thisID.indexOf('txtTotalPrice') != -1) {
            QtyID = thisID.replace('txtTotalPrice', 'txtQty');
            PriceID = thisID.replace('txtTotalPrice', 'txtPrice');
            totPriceID = thisID;
        }

        var Qty = document.getElementById(QtyID).value; //txtQty1
        var Price = document.getElementById(PriceID).value; //txtPrice1
        var totPrice = document.getElementById(totPriceID).value;

        if (Qty == "" || Qty == null) { Qty = 0; }
        if (Price == "" || Price == null) { Price = 0; }
        if (totPrice == "" || totPrice == null) { totPrice = 0; }
        document.getElementById(totPriceID).value = parseFloat(Qty) * parseFloat(Price);

        totPaste();
    }

    function SaveTransaction() {
        
        /////////////////////// VALIDATION START
        /////////////////////// VALIDATION START
        var cc = ValidateRow();
        if (cc == '1') {
            alert("Item Does not exist in Highlighted Rows! ");
            return false;
        }
        

        /////////////////////// VALIDATION END

        var UserID = localStorage.getItem("UserID");
        var txtVDate = document.getElementById('datepicker-autoClose').value;
        var txtVoucherNo = document.getElementById('txtVoucherNo').value;  
        var txtTotAmount = document.getElementById('txtTotAmount').value;
        var txtDiscount = document.getElementById('txtDiscount').value;
        var txtTaxRate = document.getElementById('txtTaxRate').value;
        var txtTotTax = document.getElementById('txtTotTax').value;
        var txtGrandTotal = document.getElementById('txtGrandTotal').value;
        var ddlSupplier = document.getElementById('ContentPlaceHolder1_ddlSupplier').value;
        var ddlWH = document.getElementById('ContentPlaceHolder1_ddlWH').value;

        var txtDebit = document.getElementById('txtDebit').value;
        var splt = txtDebit.split('^');
        var debitID = splt[1];
        var txtDebitID = debitID.replace(/\s/g, '');
        var txtDepositAmount = document.getElementById('txtDepositAmount').value;

        var elm = {}; var tMarks = 0;
        var elms = document.getElementById('tblItems').getElementsByTagName("input");
        var str = ""; var cc = 0;
        for (var i = 0; i < elms.length; i++) {
            if (elms[i].id.indexOf('txtAccCode') != -1) {

                elm = elms[i];
                var iD = elm.id;
                var txtAccCodeID = iD;
                var ddlUnitID = iD.replace('txtAccCode', 'ddlUnit');
                var txtQtyID = iD.replace('txtAccCode', 'txtQty');
                var txtPriceID = iD.replace('txtAccCode', 'txtPrice');
                var txtTotalPriceID = iD.replace('txtAccCode', 'txtTotalPrice');

                var txtAccCode = document.getElementById(txtAccCodeID).value;
                var splt = txtAccCode.split('^');
                var accID = splt[0];
                var txtAccID = accID.replace(/\s/g, '');

                var txtAccTitle = splt[1];
                var ddlUnit = document.getElementById(ddlUnitID).value;
                var txtQty = document.getElementById(txtQtyID).value;
                var txtPrice = document.getElementById(txtPriceID).value;
                var txtTotalPrice = document.getElementById(txtTotalPriceID).value;

                if (txtQty == "" || txtQty == null) { txtQty = 0; }
                if (txtPrice == "" || txtPrice == null) { txtPrice = 0; }

                if (txtQty != 0) {
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
                url: 'PO.aspx/SaveTransaction',
                //data: {},
                data: '{ "UserID" : "' + UserID + '", "str" : "' + str + '", "txtVDate" : "' + txtVDate + '", "txtVoucherNo" : "' + txtVoucherNo +
                '", "txtTotAmount" : "' + txtTotAmount + '", "txtDiscount" : "' + txtDiscount + '", "txtTaxRate" : "' + txtTaxRate + '", "txtTotTax" : "' + txtTotTax
                + '", "txtGrandTotal" : "' + txtGrandTotal + '", "ddlSupplier" : "' + ddlSupplier + '", "txtDebitID" : "' + txtDebitID +
                '", "txtDepositAmount" : "' + txtDepositAmount + '", "ddlWH" : "' + ddlWH + '" }',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (msg) {
                    tblRows = msg.d;
                    alert('Purchase has been Generated Successfully!');
                    window.location = 'PO_LIST.aspx';
                }

            });
        }

    }

    function ClearForm() {
        // LOAD_ACCOUNTS();
        // LOAD_PROJECTS();
        var tblItems = document.getElementById('tblItems');
        var rowCount = tblItems.rows.length;
        for (var i = rowCount - 2; i > 0; i--) {
            tblItems.deleteRow(i);
        }
       

    }
    
</script>

</asp:Content>

