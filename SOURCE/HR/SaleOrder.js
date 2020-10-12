function CheckDataLength() {
    var field = document.getElementById("datepicker-autoClose").value;
    if (field == "" || field == null) {
        var text = document.getElementById('datepicker-autoClose');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('datepicker-autoClose');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }
    var field = document.getElementById("txtVoucherNo").value;
    if (field == "" || field == null) {
        var text = document.getElementById('txtVoucherNo');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('txtVoucherNo');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }
    var field = document.getElementById("txtCustomer").value;
    if (field == "" || field == null) {
        var text = document.getElementById('txtCustomer');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('txtCustomer');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }



    var field = document.getElementById("datepicker-autoClose_DEL").value;
    if (field == "" || field == null) {
        var text = document.getElementById('datepicker-autoClose_DEL');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('datepicker-autoClose_DEL');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }
    var field = document.getElementById("txtPartyPO").value;
    if (field == "" || field == null) {
        var text = document.getElementById('txtPartyPO');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('txtPartyPO');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }
    var field = document.getElementById("txtLC").value;
    if (field == "" || field == null) {
        var text = document.getElementById('txtLC');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('txtLC');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }
    var field = document.getElementById("txtIncoTerm").value;
    if (field == "" || field == null) {
        var text = document.getElementById('txtIncoTerm');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('txtIncoTerm');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }
    var field = document.getElementById("txtTotTax").value;
    if (field == "" || field == null) {
        var text = document.getElementById('txtTotTax');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('txtTotTax');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }
    var field = document.getElementById("txtGrandTotal").value;
    if (field == "" || field == null) {
        var text = document.getElementById('txtGrandTotal');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('txtGrandTotal');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }
    var field = document.getElementById("txtRemarks").value;
    if (field == "" || field == null) {
        var text = document.getElementById('txtRemarks');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('txtRemarks');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }
  

  function LoadSaveToastr() {
    Command: toastr["success"]("Supplier has been saved Successfully.")

    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": true,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "preventDuplicates": true,
        "onclick": null,
        "showDuration": 300,
        "hideDuration": 100,
        "timeOut": 5000,
        "extendedTimeOut": 1000,
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
}

function LoadUpdateToastr() {
    Command: toastr["info"]("Supplier has been updated Successfully.")

    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": true,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "preventDuplicates": true,
        "onclick": null,
        "showDuration": 300,
        "hideDuration": 100,
        "timeOut": 5000,
        "extendedTimeOut": 1000,
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
}

function LoadDeleteToastr() {
    Command: toastr["error"]("Supplier has been deleted Successfully.")

    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": true,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "preventDuplicates": true,
        "onclick": null,
        "showDuration": 300,
        "hideDuration": 100,
        "timeOut": 5000,
        "extendedTimeOut": 1000,
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
}
       
$(document).ready(function () {
    $('#tablepaging').dataTable(
                {
                    responsive: true
                });

    $('.js-thead-colors a').on('click', function () {
        var theadColor = $(this).attr("data-bg");
        console.log(theadColor);
        $('#tablepaging thead').removeClassPrefix('bg-').addClass(theadColor);
    });

    $('.js-tbody-colors a').on('click', function () {
        var theadColor = $(this).attr("data-bg");
        console.log(theadColor);
        $('#tablepaging').removeClassPrefix('bg-').addClass(theadColor);
    });

});





LOAD_ITEMS();
    function totPaste() {
//        document.getElementById('ContentPlaceHolder1_hdnQtyTotalPaste').value = "0";
//        var p = document.getElementById('ContentPlaceHolder1_hdnQtyTotalPaste').value;
//        $("#tblItems tr:gt(0)").each(function () {
//            var this_row = $(this);
//            var productId = $.trim(this_row.find('td:eq(5)').find('input').val()); 
//            p = parseFloat(productId) + parseFloat(p);

        //        });
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



    function ValidateRow() {
        var cc = 0; var ccDbCR = 0; var ccDate = 0;

        var cusList = document.getElementById('ContentPlaceHolder1_hdnCust').value; //hdnParty hdnDebit
        cusList = cusList.replace("[", "");
        cusList = cusList.replace("]", "");
        cusList = cusList.replace(/"/g, '');

        var cusArray = cusList.split(',');
        var txtCustomer = document.getElementById('txtCustomer').value;
        if (cusArray.indexOf(txtCustomer) == -1) {

            document.getElementById('txtCustomer').style.background = 'red';
            ccDbCR = 1;
        }
        else {
            document.getElementById('txtCustomer').style.background = 'white';
        }



        var accList = document.getElementById('ContentPlaceHolder1_hdnItems').value;
        accList = accList.replace("[", "");
        accList = accList.replace("]", "");
        accList = accList.replace(/"/g, '');

        var accArray = accList.split(',');

        
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
                    cc = 1;
                }
                else {
                    document.getElementById(txtAccCodeID).style.background = 'white';
                }


            }
        }

        var msg = cc + '|' + ccDbCR; //+ '|' + ccDate; //1+2+3
        return msg;

    }

    function addRow() {

        /////////////////////// VALIDATION START
        var cc = ValidateRow();
        if (cc == '1') {
            alert("Item Does not exist in Highlighted Rows! ");
            return false;
        }
//        else if (cc == '0|1|0') {
//            alert("Dr. Cr. Invalid in Highlighted Rows! ");
//            return false;
//        }
//        else if (cc == '1|1|0') {
//            alert("Account Does not exist & Dr. Cr. Invalid in Highlighted Rows! ");
//            return false;
//        }
//        else if (cc == '1|1|1') {
//            alert("Account Does not exist , Dr. Cr. & Date are Invalid in Highlighted Rows! ");
//            return false;
//        }
//        else if (cc == '0|0|1') {
//            alert("Date is Invalid in Highlighted Rows! ");
//            return false;
//        }
//        else if (cc == '0|1|1') {
//            alert("Dr. Cr. & Date are Invalid in Highlighted Rows! ");
//            return false;
//        }
//        else if (cc == '1|0|1') {
//            alert("Account Does not exist & Date are Invalid in Highlighted Rows! ");
//            return false;
//        }
        /////////////////////// VALIDATION END

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
        ddlUnit.onchange = function () { // Note this is a function
            ddlChange(this)
        };
        cell3.appendChild(ddlUnit); //ddlChange(this);







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
        cell4.appendChild(txtQty); //SumDbCr(); txtWt1



        var cell5 = row.insertCell(4); //txtQty
        var txtWt = document.createElement("input");
        txtWt.type = "text";
        txtWt.id = "txtWt" + newID;
        txtWt.className = 'form-control';
        txtWt.style.width = '100%';
        txtWt.style.border = '0px none';
        txtWt.value = '1';
        txtWt.disabled = "disabled";
        cell5.appendChild(txtWt);



        var cell6 = row.insertCell(5); //txtPrice
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
        cell6.appendChild(txtPrice); //SumDbCr();


        var cell7 = row.insertCell(6); //txtTotalPrice
        var txtTotalPrice = document.createElement("input");
        txtTotalPrice.type = "text";
        txtTotalPrice.id = "txtTotalPrice" + newID;
        txtTotalPrice.className = 'form-control';
        txtTotalPrice.style.width = '100%';
        txtTotalPrice.style.border = '0px none';
        txtTotalPrice.value = '0';
        txtTotalPrice.disabled = "disabled";
        cell7.appendChild(txtTotalPrice);


        var cell8 = row.insertCell(7); //txtTotalPrice
        var txtLineNo = document.createElement("input");
        txtLineNo.type = "text";
        txtLineNo.id = "txtLineNo" + newID;
        txtLineNo.className = 'form-control';
        txtLineNo.style.width = '100%';
        txtLineNo.style.border = '0px none';
        cell8.appendChild(txtLineNo);

        var cell9 = row.insertCell(8);
        var element9 = document.createElement("button");
        element9.type = "button";
        element9.name = "button[]";
        element9.innerHTML = "x";
        element9.className = 'btn btn-sm menu-icon vd_bd-red vd_red';
        //        element5.onclick = function () { // Note this is a function
        //            deleteRow(rowCount)
        //        };
        //element5.data-dismiss="alert";
        // element5.aria-hidden="true";
        $(element9).click(function (e) {
            $(this).closest('tr').remove()
        })
        cell9.appendChild(element9);


        

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
        //alert(pp);
        var pList = pp.split('~');
        for (var i = 0; i < pList.length; i++) {
            var pItems = pList[i].split('^');
            ddlUnit.appendChild(new Option(pItems[1], pItems[0]+'`'+pItems[2]));
        }

    }

    function LOAD_ITEMS() {
        //alert('dddd');
        var tblRows = "";
        var UserID = "1";
        $.ajax({
            type: 'POST',
            url: 'SaleOrder.aspx/LOAD_ITEMS',
            data: '{ "UserID" : "' + UserID + '" }',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
               // alert(msg.d);
                var s = msg.d.split('`');
                
                tblRows = s[0];
                document.getElementById('txtVoucherNo').value = s[1];
                var b = tblRows.replace(/'/g, '"');
                document.getElementById('ContentPlaceHolder1_hdnItems').value = b;
                txtAccCode = document.getElementById('txtAccCode1');
                txtAccCode.dataset.source = document.getElementById('ContentPlaceHolder1_hdnItems').value;
                document.getElementById('ContentPlaceHolder1_hdnDate').value = s[2];
                document.getElementById('datepicker-autoClose').value = s[2];
                document.getElementById('datepicker-autoClose_DEL').value = s[2];
                document.getElementById('dvUnits').innerHTML = s[3];

                var cust = s[4];
                var bb = cust.replace(/'/g, '"');
                document.getElementById('ContentPlaceHolder1_hdnCust').value = bb;
                txtCustomer = document.getElementById('txtCustomer');
                txtCustomer.dataset.source = document.getElementById('ContentPlaceHolder1_hdnCust').value;
               // hdnCust

            }

        });
    }

    function ddlChange(a) {
        var QtyID = ''; //txtQty1
        var wtID = '';
        var ddlUnitID = '';

        ddlUnitID = thisID;
        QtyID = thisID.replace('ddlUnit', 'txtQty');
        wtID = thisID.replace('ddlUnit', 'txtWt');

        var ddlUnit = document.getElementById(ddlUnitID).value;
        var mul = ddlUnit.split('`');
        var basMul = mul[1];
        document.getElementById(wtID).value = parseFloat(Qty) * parseFloat(basMul);
    }

    function tot(a) {
        var QtyID = ''; //txtQty1
        var PriceID = ''; //txtPrice1
        var totPriceID = ''; //txtTotalPrice1
        var wtID = '';
        var ddlUnitID = '';
       // alert('aaa');
        var thisID = a.id;
        if (thisID.indexOf('txtQty') != -1) {
            QtyID = thisID;
            PriceID = thisID.replace('txtQty', 'txtPrice');
            totPriceID = thisID.replace('txtQty', 'txtTotalPrice');
            ddlUnitID = thisID.replace('txtQty', 'ddlUnit');
            wtID = thisID.replace('txtQty', 'txtWt');
        }
        else if (thisID.indexOf('txtPrice') != -1) {
            QtyID = thisID.replace('txtPrice', 'txtQty');
            PriceID = thisID;
            totPriceID = thisID.replace('txtPrice', 'txtTotalPrice');
            ddlUnitID = thisID.replace('txtPrice', 'ddlUnit');
            wtID = thisID.replace('txtPrice', 'txtWt');
        }
        else if (thisID.indexOf('txtTotalPrice') != -1) {
            QtyID = thisID.replace('txtTotalPrice', 'txtQty');
            PriceID = thisID.replace('txtTotalPrice', 'txtPrice');
            ddlUnitID = thisID.replace('txtTotalPrice', 'ddlUnit');
            wtID = thisID.replace('txtTotalPrice', 'txtWt');
            totPriceID = thisID;
        }

        var Qty = document.getElementById(QtyID).value; //txtQty1
        var Price = document.getElementById(PriceID).value; //txtPrice1
        var totPrice = document.getElementById(totPriceID).value;

        var ddlUnit = document.getElementById(ddlUnitID).value;
        var mul = ddlUnit.split('`');         
        var basMul = mul[1];

        if (Qty == "" || Qty == null) { Qty = 0; }
        if (Price == "" || Price == null) { Price = 0; }
        if (totPrice == "" || totPrice == null) { totPrice = 0; }
        document.getElementById(wtID).value = parseFloat(Qty) * parseFloat(basMul);
        document.getElementById(totPriceID).value = parseFloat(document.getElementById(wtID).value) * parseFloat(Price);
        
        totPaste();
    }

    function SaveTransaction() {
        
        /////////////////////// VALIDATION START
        /////////////////////// VALIDATION START
        var cc = ValidateRow();
        if (cc == '0|1') {
            alert("Customer does not exist! ");
            return false;
        }
        else if (cc == '1|1') {
            alert("Customer & Item Does not exist in Highlighted Rows! ");
            return false;
        }
        else if (cc == '1|0') {
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
        
        var txtCustomer = document.getElementById('txtCustomer').value;
        var spltA = txtCustomer.split('^');
        var cusID = spltA[1];
        var ddlCustomer = cusID.replace(/\s/g, '');


        var delDate = document.getElementById('datepicker-autoClose_DEL').value;
        var txtPartyPO = document.getElementById('txtPartyPO').value;
        var txtRemarks = document.getElementById('txtRemarks').value;

        var txtLC = document.getElementById('txtLC').value;
        var txtInsurance = document.getElementById('txtInsurance').value;
        var txtIncoTerm = document.getElementById('txtIncoTerm').value;

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
                var txtLineNoID = iD.replace('txtAccCode', 'txtLineNo');
                var txtAccCode = document.getElementById(txtAccCodeID).value;
                var splt = txtAccCode.split('^');
                var accID = splt[0];
                var txtAccID = accID.replace(/\s/g, '');

                var txtAccTitle = splt[1];
                var ddlUnit_1 = document.getElementById(ddlUnitID).value;
                var mul = ddlUnit_1.split('`');
                var ddlUnit = mul[0];
                var bMul_s = mul[1];
                


                var txtQty = document.getElementById(txtQtyID).value;
                //var txtPrice = document.getElementById(txtPriceID).value;
                var txtPrice = parseFloat(document.getElementById(txtPriceID).value) * parseFloat(bMul_s);
                var txtTotalPrice = document.getElementById(txtTotalPriceID).value;
                var txtLineNo = document.getElementById(txtLineNoID).value;

                if (txtQty == "" || txtQty == null) { txtQty = 0; }
                if (txtPrice == "" || txtPrice == null) { txtPrice = 0; }

                if (txtQty != 0) {
                    if (cc == 0) {
                        str = txtAccID + "^" + txtAccTitle + "^" + ddlUnit + "^" + txtQty + "^" + txtPrice + "^" + txtTotalPrice + "^" + txtLineNo;
                    }
                    else {
                        str = str + "`" + txtAccID + "^" + txtAccTitle + "^" + ddlUnit + "^" + txtQty + "^" + txtPrice + "^" + txtTotalPrice + "^" + txtLineNo;
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
                url: 'SaleOrder.aspx/SaveTransaction',
                //data: {},
                data: '{ "UserID" : "' + UserID + '", "str" : "' + str + '", "txtVDate" : "' + txtVDate + '", "txtVoucherNo" : "' + txtVoucherNo +
                '", "txtTotAmount" : "' + txtTotAmount + '", "txtDiscount" : "' + txtDiscount + '", "txtTaxRate" : "' + txtTaxRate +
                '", "txtTotTax" : "' + txtTotTax + '", "txtGrandTotal" : "' + txtGrandTotal + '", "ddlCustomer" : "' + ddlCustomer +
                '", "delDate" : "' + delDate + '", "txtPartyPO" : "' + txtPartyPO + '","txtRemarks" : "' + txtRemarks +
                '","txtLC" : "' + txtLC + '","txtInsurance" : "' + txtInsurance + '","txtIncoTerm" : "' + txtIncoTerm + '" }',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (msg) {
                    tblRows = msg.d;
                    alert('Sale Order has been Generated Successfully!');
                    window.location = 'SO_LIST.aspx';
                }

            });
        }

    }

    function Get_Price() {
       var txtCustomer = document.getElementById('txtCustomer').value;
        var spltA = txtCustomer.split('^');
        var cusID = spltA[1];
        var CusID = cusID.replace(/\s/g, '');

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
                var wtID = iD.replace('txtAccCode', 'txtWt');

                var txtAccCode = document.getElementById(txtAccCodeID).value;
                var splt = txtAccCode.split('^');
                var accID = splt[0];
                var txtAccID = accID.replace(/\s/g, '');

                var txtAccTitle = splt[1];
                var ddlUnit_1 = document.getElementById(ddlUnitID).value;
                var mul = ddlUnit_1.split('`');
                var ddlUnit = mul[0];
                var bMul_s = mul[1];



                var txtQty = document.getElementById(txtQtyID).value;
                //var txtPrice = document.getElementById(txtPriceID).value;



                PriceFromDB(CusID, txtAccID, txtPriceID, wtID, txtTotalPriceID);



            }
            else {

            }
        }
        
    }

    function PriceFromDB(CusID, txtAccID, txtPriceID, wtID, txtTotalPriceID) {
        $.ajax({
            type: 'POST',
            url: 'SaleOrder.aspx/Get_Price',
            //data: {},
            data: '{ "CusID" : "' + CusID + '", "ItemID" : "' + txtAccID + '" }',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                tblRows = msg.d;
                //alert(txtPriceID + '----' + tblRows);
                document.getElementById(txtPriceID).value = tblRows;
                document.getElementById(txtTotalPriceID).value = parseFloat(document.getElementById(txtPriceID).value) * parseFloat(document.getElementById(wtID).value);
                totPaste();
            }

        });
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
    