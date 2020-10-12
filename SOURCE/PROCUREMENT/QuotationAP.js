ShowQuotation();
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



function ShowQuotation() {
    var reqID = getParameterByName('ReqID');
    document.getElementById('ddlSupplier').value = getParameterByName('SuppID');
    document.getElementById('dvSOID').innerHTML = reqID;
    

    var tblRows = "";
    var UserID = "0";
    $.ajax({
        type: 'POST',
        url: 'QuotationAP.aspx/LoadREQUISTION',
        data: '{ "UserID" : "' + UserID + '","reqID" : "' + reqID + '" }',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            var s = msg.d; 
            var str = s.split('`');
            document.getElementById('dvListRequisition').innerHTML = str[0];
            // document.getElementById('dvGeneratedByQT').innerHTML = str[0];
            // document.getElementById('dvApprovedByQT').innerHTML = str[0];

        }

    });
    LoadQUOTATION();
   // $('#modalQuotation').modal('show');
}


function LoadQUOTATION() {
    var tblRows = "";
    var reqID = getParameterByName('ReqID');
    var SuppID = document.getElementById('ddlSupplier').value;
   
    $.ajax({
        type: 'POST',
        url: 'QuotationAP.aspx/LoadQUOTATION',
        data: '{ "reqID" : "' + reqID + '","SuppID" : "' + SuppID + '" }',
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
    QtyID = thisID.replace('txtUnitPrice', 'spnQTY');
    PriceID = thisID;
    totPriceID = thisID.replace('txtUnitPrice', 'txtTotalPrice');


    var Qty = document.getElementById(QtyID).innerHTML; //txtQty1
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
    var ddlSupplier = document.getElementById('ddlSupplier').value;

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
            var txtPrice = document.getElementById(txtUnitPriceID).value;
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
            url: 'QuotationAP.aspx/SaveQuotation',
            //data: {},
            data: '{ "UserID" : "' + UserID + '", "str" : "' + str + '", "txtVoucherNo" : "' + txtVoucherNo + '", "ddlSupplier" : "' + ddlSupplier + '" }',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                tblRows = msg.d;
                alert('Quotation has been added Successfully!');
                ShowQuotation();
                //window.location = 'PendingRequisitionList.aspx';
            }

        });
    }

}
/////////////////////////////////////////////////
//////////////////////////////////////////////////
////////////////////////////////////////////////////