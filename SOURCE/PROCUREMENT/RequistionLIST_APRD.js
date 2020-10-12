LoadLIST();
// xeon 8core 64gb supported, ssd ya saaas compatible, RAID supported
function LoadLIST() {
    var tblRows = "";
    var UserID = localStorage.getItem("UserID");
    // alert('ddddddddd');
    $.ajax({
        type: 'POST',
        url: 'RequistionLIST_APRD.aspx/LoadLIST',
        data: '{ "UserID" : "' + UserID + '" }',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            var s = msg.d;
            // alert(s);
            document.getElementById('dvList').innerHTML = s;
            LoadDATE();
        }

    });
}


function LoadDATE() {
    var tblRows = "";
    var UserID = localStorage.getItem("UserID");
    // alert('ddddddddd');
    $.ajax({
        type: 'POST',
        url: 'RequistionLIST_APRD.aspx/LoadDATE',
        data: '{ "UserID" : "' + UserID + '" }',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            var s = msg.d;
            // alert(s);
            document.getElementById('datepicker-autoClose').value = s;

        }

    });
}



function ShowQuotation(a, b, c) {
    document.getElementById('dvSOID').innerHTML = a;
    document.getElementById('dvGeneratedByQT').innerHTML = b;
    document.getElementById('dvApprovedByQT').innerHTML = c;

    var tblRows = "";
    var UserID = localStorage.getItem("UserID");
    var reqID = a;
    $.ajax({
        type: 'POST',
        url: 'RequistionLIST_APRD.aspx/LoadREQUISTION',
        data: '{ "UserID" : "' + UserID + '","reqID" : "' + reqID + '" }',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {

            var s = msg.d;
           // alert(s);
            var str = s.split('`');
            document.getElementById('dvListRequisition').innerHTML = str[0];
           // alert(str[6]);
           

        }

    });
    LoadQUOTATION(a);
    $('#modalQuotation').modal('show');
}


function LoadQUOTATION(a) {
    var tblRows = "";
    var UserID = localStorage.getItem("UserID");
    var reqID = a;
    $.ajax({
        type: 'POST',
        url: 'RequistionLIST_APRD.aspx/LoadQUOTATION',
        data: '{ "reqID" : "' + reqID + '" }',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            var s = msg.d;
            // alert(s);
            document.getElementById('dvQuotation').innerHTML = s;

        }

    });
}

function tot(a) {
    var QtyID = ''; //txtQty1
    var PriceID = ''; //txtPrice1
    var totPriceID = ''; //txtTotalPrice1

    var thisID = a.id;
    // alert(thisID);
    QtyID = thisID.replace('txtUnitPrice', 'txtWt');
    PriceID = thisID;
    totPriceID = thisID.replace('txtUnitPrice', 'txtTotalPrice');


    var Qty = document.getElementById(QtyID).value; //txtQty1
    var Price = document.getElementById(PriceID).value; //txtPrice1
    var totPrice = document.getElementById(totPriceID).value;

    if (Qty == "" || Qty == null) { Qty = 0; }
    if (Price == "" || Price == null) { Price = 0; }
    if (totPrice == "" || totPrice == null) { totPrice = 0; }
    document.getElementById(totPriceID).value = parseFloat(Qty) * parseFloat(Price);

}

function SaveQuotation() {


    var UserID = localStorage.getItem("UserID");
    var txtVoucherNo = document.getElementById('dvSOID').innerHTML;
    var ddlSupplier = document.getElementById('ContentPlaceHolder1_ddlSupplier').value;

    if (ddlSupplier == "0") {
        alert("Please select Supplier!");
        return false;
    }





    var elm = {}; var tMarks = 0;
    var elms = document.getElementById('tblItemsRequisition').getElementsByTagName("input");
    var str = ""; var cc = 0;
    for (var i = 0; i < elms.length; i++) {
        if (elms[i].id.indexOf('txtUnitPrice') != -1) {

            elm = elms[i];
            var iD = elm.id;
            var txtUnitPriceID = iD;
            var spnID = iD.replace('txtUnitPrice', 'spn');
            var txtTotalPrice = iD.replace('txtUnitPrice', 'txtTotalPrice');

            var spnHtm = document.getElementById(spnID).innerHTML;
            var splt = spnHtm.split('^');
            var txtAccID = splt[0];


            var txtAccTitle = "";
            var ddlUnit = splt[1];
            var txtQty = splt[4];
            var bMul = splt[6];
            var txtPrice = parseFloat(document.getElementById(txtUnitPriceID).value) * parseFloat(bMul);
            var txtTotalPrice = document.getElementById(txtTotalPrice).value;

            if (txtQty == "" || txtQty == null) { txtQty = 0; }
            if (txtPrice == "" || txtPrice == null) { txtPrice = 0; }
            if (txtTotalPrice == "" || txtTotalPrice == null) { txtTotalPrice = 0; }


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
            url: 'RequistionLIST_APRD.aspx/SaveQuotation',
            //data: {},
            data: '{ "UserID" : "' + UserID + '", "str" : "' + str + '", "txtVoucherNo" : "' + txtVoucherNo + '", "ddlSupplier" : "' + ddlSupplier + '" }',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                tblRows = msg.d;
                alert('Quotation has been added Successfully!');
                LoadQUOTATION(txtVoucherNo);
                //window.location = 'PendingRequisitionList.aspx';
            }

        });
    }

}

function SupplierEmail() {
    var UserID = localStorage.getItem("UserID");
    var txtVoucherNo = document.getElementById('dvSOID').innerHTML;
    
    $.ajax({
        type: 'POST',
        url: 'RequistionLIST_APRD.aspx/SupplierEmail',
        //data: {},
        data: '{ "UserID" : "' + UserID + '","txtVoucherNo" : "' + txtVoucherNo + '" }',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            tblRows = msg.d;
            alert('Email has been Sent to Suppliers!');
            //LoadQUOTATION(txtVoucherNo);
            //window.location = 'PendingRequisitionList.aspx';
        }

    });
}
/////////////////////////////////////////////////
//////////////////////////////////////////////////
////////////////////////////////////////////////////
function ShowPO(a, b, c) {
    document.getElementById('dvReqNoPO').innerHTML = a;
    document.getElementById('dvGeneratedByPO').innerHTML = b;
    document.getElementById('dvApprovedByPO').innerHTML = c;

    var tblRows = "";
    var UserID = localStorage.getItem("UserID");
    var reqID = a;
    $.ajax({
        type: 'POST',
        url: 'RequistionLIST_APRD.aspx/LoadREQUISTION_PO',
        data: '{ "UserID" : "' + UserID + '","reqID" : "' + reqID + '" }',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            var s = msg.d;
            var str = s.split('`');
            document.getElementById('dvListPO').innerHTML = str[0];
            document.getElementById('ContentPlaceHolder1_ddlSupplierPO').value = str[6];
            document.getElementById('ContentPlaceHolder1_ddlSupplierPO').disabled = 'disabled';
        }

    });
    LoadPO(a);
    $('#modalPO').modal('show');
}


function SavePO() {


    var UserID = localStorage.getItem("UserID");
    var txtVoucherNo = document.getElementById('dvReqNoPO').innerHTML;
    var ddlSupplier = document.getElementById('ContentPlaceHolder1_ddlSupplierPO').value;
    var txtVDate = document.getElementById('datepicker-autoClose').value;
    if (ddlSupplier == "0") {
        alert("Please select Supplier!");
        return false;
    }





    var elm = {}; var tMarks = 0;
    var elms = document.getElementById('tblPO_ItemsRequisition').getElementsByTagName("input");
    var str = ""; var cc = 0;
    for (var i = 0; i < elms.length; i++) {
        if (elms[i].id.indexOf('txtPO_UnitPrice') != -1) {

            elm = elms[i];
            var iD = elm.id;
            var txtUnitPriceID = iD;
            var spnID = iD.replace('txtPO_UnitPrice', 'spnPO_ALL');
            var txtQtyID = iD.replace('txtPO_UnitPrice', 'txtPO_QtyBal');
            var txtTotalPriceID = iD.replace('txtPO_UnitPrice', 'txtPO_TotalPrice');

            var spnHtm = document.getElementById(spnID).innerHTML;
            var splt = spnHtm.split('^');
            var txtAccID = splt[0];
            var rowID = splt[5];

            var txtAccTitle = "";
            var ddlUnit = splt[1];
            var txtQty = document.getElementById(txtQtyID).value;
            var txtPrice = document.getElementById(txtUnitPriceID).value;
            var txtTotalPrice = document.getElementById(txtTotalPriceID).value;

            if (txtQty == "" || txtQty == null) { txtQty = 0; }
            if (txtPrice == "" || txtPrice == null) { txtPrice = 0; }
            if (txtTotalPrice == "" || txtTotalPrice == null) { txtTotalPrice = 0; }


            if (txtQty != 0) {
                if (cc == 0) {
                    str = txtAccID + "^" + txtAccTitle + "^" + ddlUnit + "^" + txtQty + "^" + txtPrice + "^" + txtTotalPrice + "^" + rowID;
                }
                else {
                    str = str + "`" + txtAccID + "^" + txtAccTitle + "^" + ddlUnit + "^" + txtQty + "^" + txtPrice + "^" + txtTotalPrice + "^" + rowID;
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
            url: 'RequistionLIST_APRD.aspx/SavePO',
            //data: {},
            data: '{ "UserID" : "' + UserID + '", "str" : "' + str + '", "txtVoucherNo" : "' + txtVoucherNo + '", "ddlSupplier" : "' + ddlSupplier + '", "txtVDate" : "' + txtVDate + '" }', 
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                tblRows = msg.d;
                alert('Purchase Order has been added Successfully!');
                LoadPO(txtVoucherNo);
                //window.location = 'PendingRequisitionList.aspx';
            }

        });
    }

}
function LoadPO(a) {
    var tblRows = "";
    var UserID = localStorage.getItem("UserID");
    var reqID = a;
    $.ajax({
        type: 'POST',
        url: 'RequistionLIST_APRD.aspx/LoadPO',
        data: '{ "reqID" : "' + reqID + '" }',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            var s = msg.d;
            // alert(s);
            document.getElementById('dvPOList').innerHTML = s;

        }

    });
}
function totPO(a) {
    var QtyID = ''; //txtQty1
    var PriceID = ''; //txtPrice1
    var totPriceID = ''; //txtTotalPrice1

    var thisID = a.id;
    // alert(thisID);
    if (thisID.indexOf('txtPO_UnitPrice') != -1) {
        QtyID = thisID.replace('txtPO_UnitPrice', 'txtPO_QtyBal');
        PriceID = thisID;
        totPriceID = thisID.replace('txtPO_UnitPrice', 'txtPO_TotalPrice');
    }
    else if (thisID.indexOf('txtPO_QtyBal') != -1) {
        QtyID = thisID;
        PriceID = thisID.replace('txtPO_QtyBal', 'txtPO_UnitPrice');
        totPriceID = thisID.replace('txtPO_QtyBal', 'txtPO_TotalPrice');
    }



    var Qty = document.getElementById(QtyID).value; //txtQty1
    var Price = document.getElementById(PriceID).value; //txtPrice1
    var totPrice = document.getElementById(totPriceID).value;

    if (Qty == "" || Qty == null) { Qty = 0; }
    if (Price == "" || Price == null) { Price = 0; }
    if (totPrice == "" || totPrice == null) { totPrice = 0; }
    document.getElementById(totPriceID).value = parseFloat(Qty) * parseFloat(Price);

}


