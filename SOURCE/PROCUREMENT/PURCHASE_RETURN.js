LOAD_ACCOUNTS();



function ValidateRow() {
    var cc = 0; var dd = 0; var ccDate = 0;
    document.getElementById('txtParty').style.background = 'white';


    if (document.getElementById('txtParty').value != null && document.getElementById('txtParty').value != "") {
        var ptyList = document.getElementById('ContentPlaceHolder1_hdnParty').value; //hdnParty hdnDebit
        ptyList = ptyList.replace("[", "");
        ptyList = ptyList.replace("]", "");
        ptyList = ptyList.replace(/"/g, '');

        var ptyArray = ptyList.split(',');
        var txtAccCode = document.getElementById('txtParty').value;
        if (ptyArray.indexOf(txtAccCode) == -1) {

            document.getElementById('txtParty').style.background = 'red';
            cc = 1;
        }
        else {
            document.getElementById('txtParty').style.background = 'white';
        }
    }


    var msg = cc + '|' + dd + '|' + ccDate; //1+2+3
    return msg;

}


function LOAD_ACCOUNTS() {

    var tblRows = "";
    var UserID = "1";
    $.ajax({
        type: 'POST',
        url: 'PURCHASE_RETURN.aspx/LOAD_ACCOUNTS',
        //data: {},
        data: '{ "UserID" : "' + UserID + '" }',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            var s = msg.d.split('`');
            var sDT = s[0];
            var eDT = s[1];
            var ar = s[2];


            var cc = ar.replace(/'/g, '"');
            //txtAccCode.dataset.source = document.getElementById('ContentPlaceHolder1_hdnAccounts').value;
            document.getElementById('ContentPlaceHolder1_hdnParty').value = cc;
            txtParty = document.getElementById('txtParty');
            txtParty.dataset.source = document.getElementById('ContentPlaceHolder1_hdnParty').value;



            document.getElementById('datepicker-autoClose').value = sDT;
            document.getElementById('datepicker-autoCloseTO').value = eDT;
            document.getElementById('txtEntryDate').value = sDT;

        }

    });
    // alert(tblRows);
    LoadLIST();

}


function LoadLIST() {
    var cc = ValidateRow();
    if (cc == '1|0|0') {
        alert("Supplier Does not exist! ");
        return false;
    }


    var dtFROM = document.getElementById('datepicker-autoClose').value;
    var dtTO = document.getElementById('datepicker-autoCloseTO').value;
    var cusID = "0";
    if (document.getElementById('txtParty').value == null || document.getElementById('txtParty').value == "") {
        cusID = "0";
    }
    else {
        var txtParty = document.getElementById('txtParty').value;
        var prt = txtParty.split('^');
        var pD = prt[1];
        cusID = pD.replace(/\s/g, '');

    }

    var tblRows = "";
    var UserID = localStorage.getItem("UserID");
    // alert('ddddddddd');
    $.ajax({
        type: 'POST',
        url: 'PURCHASE_RETURN.aspx/LoadLIST',
        data: '{ "cusID" : "' + cusID + '","dtFROM" : "' + dtFROM + '","dtTO" : "' + dtTO + '" }',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            var s = msg.d;
            // alert(s);
            document.getElementById('dvList').innerHTML = "";
            document.getElementById('dvList').innerHTML = s;

        }

    });
}


function ShowPO(oid) {
    

    var tblRows = "";
    var UserID = localStorage.getItem("UserID");
    var PONO = oid;
    $.ajax({
        type: 'POST',
        url: 'PURCHASE_RETURN.aspx/ShowPO',
        data: '{ "UserID" : "' + UserID + '","PONO" : "' + PONO + '" }',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            var s = msg.d;
            //alert(s);
            //var str = s.split('`');
            document.getElementById('dvListStock').innerHTML = s;
            document.getElementById('dvPONo').innerHTML = PONO;

        }

    });
    LoadGoods_List(PONO);
    $('#modalRcvdStock').modal('show');
}

function LoadGoods_List(a) {
    var tblRows = "";
    var UserID = localStorage.getItem("UserID");
    var POID = a;
    $.ajax({
        type: 'POST',
        url: 'PURCHASE_RETURN.aspx/LoadGoods_List',
        data: '{ "POID" : "' + POID + '" }',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            var s = msg.d;
            document.getElementById('dvGoodsLST').innerHTML = s;

        }

    });
}

function SaveGoods() {

    /////////////////////// DATE VALIDATION //////////////
    /////////////////////// DATE VALIDATION ////////////// 
    var vDate = document.getElementById('txtEntryDate').value;
    T_date = new Date(vDate);
    var chkDT = chkDATE_RANGE(T_date);
    if (chkDT == "OK") {
    }
    else {
        document.getElementById('msgDT_RANGE').innerHTML = chkDT;
        $('#modalDT_RANGE').modal('show');
        return false;
    }
    /////////////////////// DATE VALIDATION //////////////
    /////////////////////// DATE VALIDATION //////////////
    var UserID = localStorage.getItem("UserID");
    var txtVoucherNo = document.getElementById('dvPONo').innerHTML;
    var ddlSupplier = "";var whid = "";
   


    var elm = {}; var tMarks = 0;
    var elms = document.getElementById('tblPO_ItemsRequisition').getElementsByTagName("input");
    var str = ""; var cc = 0;
    for (var i = 0; i < elms.length; i++) {
        if (elms[i].id.indexOf('txtPO_QtyBal') != -1) {

            elm = elms[i];
            var iD = elm.id;
            var txtUnitPriceID = iD;
            var spnID = iD.replace('txtPO_QtyBal', 'spnPO_ALL');
            var txtQtyID = iD.replace('txtPO_QtyBal', 'txtPO_QtyBal');

            var spnHtm = document.getElementById(spnID).innerHTML;
            var splt = spnHtm.split('^');
            var txtAccID = splt[0];
            var rowID = splt[5];
            ddlSupplier = splt[6];
            whid = splt[7];
            var txtAccTitle = "";
            var ddlUnit = splt[1];
            var txtQty = document.getElementById(txtQtyID).value;
            var txtPrice = splt[2];
            var txtTotalPrice = splt[3];

            if (txtQty == "" || txtQty == null) { txtQty = 0; }
            if (txtPrice == "" || txtPrice == null) { txtPrice = 0; }
            if (txtTotalPrice == "" || txtTotalPrice == null) { txtTotalPrice = 0; }
            txtTotalPrice = parseFloat(txtQty) * parseFloat(txtPrice);

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
            url: 'PURCHASE_RETURN.aspx/SaveGoods',
            //data: {},
            data: '{ "UserID" : "' + UserID + '", "str" : "' + str + '", "txtVoucherNo" : "' + txtVoucherNo + '", "ddlSupplier" : "' + ddlSupplier + '", "whid" : "' + whid + '", "vDate" : "' + vDate + '" }',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                tblRows = msg.d;
                alert('Purchase Return has been Received Successfully!');
                ShowPO();
                LoadGoods_List(txtVoucherNo);
                //window.location = 'PendingRequisitionList.aspx';
            }

        });
    }

}