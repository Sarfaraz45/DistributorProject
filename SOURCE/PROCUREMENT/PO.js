
    LOAD_ITEMS();

    function ValidateRow() {
        var accList = document.getElementById('ContentPlaceHolder1_hdnItems').value;
        accList = accList.replace("[", "");
        accList = accList.replace("]", "");
        accList = accList.replace(/"/g, '');

        var accArray = accList.split(',');

        var cc = 0; var ccDbCR = 0; var ccDate = 0;

        var spList = document.getElementById('ContentPlaceHolder1_hdnSupplier').value; //hdnParty hdnDebit
        spList = spList.replace("[", "");
        spList = spList.replace("]", "");
        spList = spList.replace(/"/g, '');

        var spArray = spList.split(',');
        var txtSupplierV = document.getElementById('txtSupplier').value;
        if (spArray.indexOf(txtSupplierV) == -1) {

            document.getElementById('txtSupplier').style.background = 'red';
            ccDbCR = 1;
        }
        else {
            document.getElementById('txtSupplier').style.background = 'white';
        }



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

        var msg = cc + '|' + ccDbCR;//  + '|' + ccDate; //1+2+3
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
        txtTotalPrice.onkeyup = function () { // Note this is a function
            tot(this)
        };
        cell7.appendChild(txtTotalPrice);
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
        //alert(pp);
        var pList = pp.split('~');
        for (var i = 0; i < pList.length; i++) {
            var pItems = pList[i].split('^');
            ddlUnit.appendChild(new Option(pItems[1], pItems[0] + '`' + pItems[2]));
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


                var cust = s[4];
                var bb = cust.replace(/'/g, '"');
                document.getElementById('ContentPlaceHolder1_hdnSupplier').value = bb;
                txtSupplier = document.getElementById('txtSupplier');
                txtSupplier.dataset.source = document.getElementById('ContentPlaceHolder1_hdnSupplier').value;

            }

        });
    }

    function tot(a) {
        var QtyID = ''; //txtQty1
        var PriceID = ''; //txtPrice1
        var totPriceID = ''; //txtTotalPrice1
        //var wtID = '';
        var ddlUnitID = '';
        var txtAccCodeID = '';


       


        var thisID = a.id;
        if (thisID.indexOf('txtQty') != -1) {
            QtyID = thisID;
            PriceID = thisID.replace('txtQty', 'txtPrice');
            totPriceID = thisID.replace('txtQty', 'txtTotalPrice');
            ddlUnitID = thisID.replace('txtQty', 'ddlUnit');
            wtID = thisID.replace('txtQty', 'txtWt');
            txtAccCodeID = thisID.replace('txtQty', 'txtAccCode');
        }
        else if (thisID.indexOf('txtPrice') != -1) {
            QtyID = thisID.replace('txtPrice', 'txtQty');
            PriceID = thisID;
            totPriceID = thisID.replace('txtPrice', 'txtTotalPrice');
            ddlUnitID = thisID.replace('txtPrice', 'ddlUnit');
            wtID = thisID.replace('txtPrice', 'txtWt');
            txtAccCodeID = thisID.replace('txtPrice', 'txtAccCode');
        }
        else if (thisID.indexOf('txtTotalPrice') != -1) {
            QtyID = thisID.replace('txtTotalPrice', 'txtQty');
            PriceID = thisID.replace('txtTotalPrice', 'txtPrice');
            ddlUnitID = thisID.replace('txtTotalPrice', 'ddlUnit');
            wtID = thisID.replace('txtTotalPrice', 'txtWt');
            txtAccCodeID = thisID.replace('txtTotalPrice', 'txtAccCode');
            totPriceID = thisID;
        }

        var Qty = document.getElementById(QtyID).value; //txtQty1
        var Price = document.getElementById(PriceID).value; //txtPrice1
        var totPrice = document.getElementById(totPriceID).value;

        var txtAccCode = document.getElementById(txtAccCodeID).value;
        var splt = txtAccCode.split('^');
        var wtStr = splt[2];
        var wt = wtStr.replace(/\s/g, '');
        //alert(wtID+' -- '+wt);

        var ddlUnit = document.getElementById(ddlUnitID).value;
        var mul = ddlUnit.split('`');
        var basMul = mul[1];

        if (Qty == "" || Qty == null) { Qty = 0; }
        if (Price == "" || Price == null) { Price = 0; }
        if (totPrice == "" || totPrice == null) { totPrice = 0; }

        document.getElementById(wtID).value = parseFloat(Qty) * parseFloat(wt);
        document.getElementById(totPriceID).value = parseFloat(Qty) * parseFloat(Price);

        //spnQtySummary
        totPaste();

    }

    function totPaste() {

        var tot = 0; var totWt = 0;
        var elm = {};
        var elms = document.getElementById('tblItems').getElementsByTagName("input");
        for (var i = 0; i < elms.length; i++) {
            if (elms[i].id.indexOf('txtTotalPrice') != -1) {

                elm = elms[i];
                var iD = elm.id;
                var txtTotalPrice = iD;
                var totp = document.getElementById(txtTotalPrice).value;

                var wtID = iD.replace('txtTotalPrice', 'txtWt');
                var wt = document.getElementById(wtID).value;

                tot = parseFloat(tot) + parseFloat(totp); //500 200-500=300
                totWt = parseFloat(totWt) + parseFloat(wt);
            }
        }

        var ltr = parseFloat(totWt) * 0.9;
        document.getElementById('spnQtySummary').innerHTML = 'Total KG: <b>' + totWt + '</b>&nbsp;&nbsp;&nbsp;Total Ltrs:<b>' + ltr + '</b>';

        document.getElementById("txtTotAmount").value = tot;





    }

    function SaveTransaction() {
        
        /////////////////////// VALIDATION START
        /////////////////////// VALIDATION START
       
        var cc = ValidateRow();
        if (cc == '0|1') {
            alert("Suplier does not exist! ");
            return false;
        }
        else if (cc == '1|1') {
            alert("Supplier & Item Does not exist in Highlighted Rows! ");
            return false;
        }
        else if (cc == '1|0') {
            alert("Item Does not exist in Highlighted Rows! ");
            return false;
        }

        /////////////////////// VALIDATION END

        var UserID = localStorage.getItem("UserID");
        var brnchID = '1';
        var txtVDate = document.getElementById('datepicker-autoClose').value;
        var txtVoucherNo = document.getElementById('txtVoucherNo').value;
        var txtTotAmount=document.getElementById("txtTotAmount").value;

        var txtSupplier = document.getElementById('txtSupplier').value;
        var spltA1 = txtSupplier.split('^');
        var supID = spltA1[1];
        var ddlSupplier = supID.replace(/\s/g, '');

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
                var ddlUnit_1 = document.getElementById(ddlUnitID).value;
                var mul = ddlUnit_1.split('`');
                var ddlUnit = mul[0];
                var bMul_s = mul[1];

                var txtQty = document.getElementById(txtQtyID).value;
                var txtPrice = parseFloat(document.getElementById(txtPriceID).value) * parseFloat(bMul_s);
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
            //alert(str);
            $.ajax({
                type: 'POST',
                url: 'PO.aspx/SaveTransaction',
                //data: {},
                data: '{ "UserID" : "' + UserID + '", "str" : "' + str + '", "txtVDate" : "' + txtVDate + '", "txtVoucherNo" : "' + txtVoucherNo + '", "ddlSupplier" : "' + ddlSupplier + '", "txtTotAmount" : "' + txtTotAmount + '", "brnchID" : "' + brnchID + '" }',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (msg) {
                    tblRows = msg.d;
                    alert('Requisition has been Processed Successfully!');
                    window.location='PO_LIST.aspx';
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
        //        var elmtTable = document.getElementById('tblItems');
        //        var tableRows = elmtTable.getElementsByTagName('tr');
        //        var rowCount = tableRows.length;
        //       
        //        for (var x = 0; x < rowCount; x++) {
        //            if (x == 1 || x == 0) { }
        //            else {
        //                document.getElementById("tblItems").deleteRow(x);
        //            }
        //        }

    }
