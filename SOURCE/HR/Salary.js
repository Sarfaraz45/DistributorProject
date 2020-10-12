

LoadRegion();
LoadHead();


function CheckDataLength() {

    var field = document.getElementById("ddlHead").value;
    if (field == "" || field == null || field == "0") {
        var text = document.getElementById('ddlHead');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('ddlHead');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }

    var field = document.getElementById("txtBasicSalary").value;
    if (field == "" || field == null) {
        var text = document.getElementById('txtBasicSalary');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('txtBasicSalary');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }

    var field = document.getElementById("txtTaxPercentage").value;
    if (field == "" || field == null) {
        var text = document.getElementById('txtTaxPercentage');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('txtTaxPercentage');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }

    var field = document.getElementById("txtTaxAmount").value;
    if (field == "" || field == null  ) {
        var text = document.getElementById('txtTaxAmount');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('txtTaxAmount');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }

    var field = document.getElementById("txtEstimatedSalary").value;
    if (field == "" || field == null) {
        var text = document.getElementById('txtEstimatedSalary');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('txtEstimatedSalary');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }

  

   

   
}

function LoadSaveToastr() {
    Command: toastr["success"]("Salary has been saved Successfully.")

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
    Command: toastr["info"]("Salary has been updated Successfully.")

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
    Command: toastr["error"]("Salary has been deleted Successfully.")

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

function LoadDetail(id) {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Salary.aspx/LoadDetail",
        dataType: "json",
        //  data: "{}",
        data: '{ "id" : "' + id + '"}', //advAmnt strINV tax1 tax2
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var ro = "";


            $.each(jsdata, function (key, value) {
                document.getElementById("txtTitle").value = value.Name;
                document.getElementById("txtDescription").value = value.VDESC;
                document.getElementById("lblID").innerHTML = id;
                document.getElementById("btnSave").innerHTML = "Update";


                document.getElementById("txtRegNo").value = value.REGNO;
                document.getElementById("txtChasisNo").value = value.CHASISNO;
                document.getElementById("txtModel").value = value.MODEL;
                document.getElementById("ddlHead").value = value.LvID;
                
                CheckDataLength();


            });

        },
        error: function (result) {
            alert(result);
        }


    });
}


LoadAllowance();
LoadDeduction();
function LoadAllowance() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Salary.aspx/LoadAllowance",
        dataType: "json",
        data: "{}",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var ro = "";

            if ($('#tblAllowance tbody').length != 0) {

                $('#tblAllowance tbody').remove();
            }


            $.each(jsdata, function (key, value) {
                ro += "<tr><td><input type='checkbox' class=" + value.ID + " onclick='CalculateTax(" + value.Amount + ");' id=chk" + value.ID + " ></td><td   class='one'>" + value.Name + "</td> <td   class='two'>" + value.Amount + "</td>   <td  class='zero' style='display:none;'>" + value.ID + "</td></tr>";

            });
            ro = ro + "</tbody></table>";

            $("#tblAllowance").append(ro);
          



        },
        error: function (result) {
            alert(result);
        }


    });


}


function LoadDeduction() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Salary.aspx/LoadDeduction",
        dataType: "json",
        data: "{}",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var ro = "";

            if ($('#tblDeduction tbody').length != 0) {

                $('#tblDeduction tbody').remove();
            }


            $.each(jsdata, function (key, value) {
                ro += "<tr><td><input type='checkbox' class=" + value.ID + " onclick='CalculateTax(" + value.Amount + ");' id=chk" + value.ID + " ></td><td   class='one'>" + value.Name + "</td> <td   class='two'>" + value.Amount + "</td>   <td  class='zero' style='display:none;'>" + value.ID + "</td></tr>";

            });
            ro = ro + "</tbody></table>";

            $("#tblDeduction").append(ro);
            


        },
        error: function (result) {
            alert(result);
        }


    });


}


function LoadHead() {
    $.ajax({
        type: "POST",
        url: "Salary.aspx/LoadHead",
        data: {},
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var rows = "";
            if ($('#ddlHead').select.length != 0) {

                $('#ddlHead').empty();
            }

            $.each(jsdata, function (key, value) {
                rows += "<option  value=" + value.ID + ">" + value.Name + "</option>";
            });

            $("#ddlHead").append(rows);
        },
        error: function (data) {
            alert("error found");
        }
    });

}
function CalculateMonthlySalary() {
    var amount = 0;
    $('#tblAllowance').find('input[type="checkbox"]:checked').each(function () {
        var num1 = $(this).closest('tr').children('td:eq(2)').text();
        amount += +num1;
    });

    var dedcutamount = 0;
    $('#tblDeduction').find('input[type="checkbox"]:checked').each(function () {
        var num2 = $(this).closest('tr').children('td:eq(2)').text();

        dedcutamount += +num2;
    });

    var dEstimatedMonthlSalary = amount - dedcutamount;
    dEstimatedMonthlSalary += document.getElementById("txtBasicSalary").value - document.getElementById("txtTaxAmount").value;
    $("#txtEstimatedSalary").val(dEstimatedMonthlSalary);
    // CalculateMonthlyTax();
}

function CalculateMonthlyTax() {

    var dEstimatedMonthlTax = 0;
    var basicsalary = document.getElementById("txtBasicSalary").value;
    dEstimatedMonthlTax = basicsalary / 100 * document.getElementById("txtTaxPercentage").value;
    $("#txtTaxAmount").val(dEstimatedMonthlTax);
    CalculateMonthlySalary();
}
function CalculateTax() {
    var amount = 0;
    $('#tblAllowance').find('input[type="checkbox"]:checked').each(function () {
        var num1 = $(this).closest('tr').children('td:eq(2)').text();

        amount += +num1;
        //alert($(this).closest('tr').children('td:eq(2)').text());
    });

    var dedcutamount = 0;
    $('#tblDeduction').find('input[type="checkbox"]:checked').each(function () {
        var num2 = $(this).closest('tr').children('td:eq(2)').text();

        dedcutamount += +num2;
        //alert($(this).closest('tr').children('td:eq(2)').text());
    });

    var dEstimatedMonthlSalary = 0;
    dEstimatedMonthlSalary = document.getElementById("txtBasicSalary").value - document.getElementById("txtTaxAmount").value;
    dEstimatedMonthlSalary = dEstimatedMonthlSalary + amount - dedcutamount;
    $("#txtEstimatedSalary").val(dEstimatedMonthlSalary);

}


function LoadRegion() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Salary.aspx/LoadRegion",
        dataType: "json",
        data: "{}",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var ro = "";

            if ($('#dt-basic-example').length != 0) {

                $('#dt-basic-example').remove();
            }

            ro = "<table id='dt-basic-example'class='table table-sm  dataTable dtr-inline table-hover' ><thead class='thead-themed'> <th>Employee</th><th>Basic Salary</th><th>Tax Amount</th><th>Gross Salary</th> <th style='text-align:center;'>Action</th></thead><tbody>";
            $.each(jsdata, function (key, value) {

                ro += "<tr><td   class='two' style='width:20%;'>" + value.Name + "</td><td   class='three'   style='width:20%;'>" + value.LvID + "</td><td   class='three' style='width:20%;' >" + value.VDESC + "</td><td   class='three'  style='width:20%;'>" + value.REGNO + "</td> <td style='text-align:center;width:20%;'><button class='btn buttons-selected btn-primary btn-sm mr-1' tabindex='0' aria-controls='dt-basic-example' type='button'  onclick='LoadDetail(\"" + value.ID + "\");'><span><i class='fal fa-edit mr-1'></i> Select</span></button><button class='btn buttons-selected btn-danger btn-sm mr-1' tabindex='0' aria-controls='dt-basic-example' type='button'  onclick='DeleteData(\"" + value.ID + "\");'><span><i class='fal fa-times mr-1'></i> Delete</span></button></td></tr>";

            });
            ro = ro + "</tbody></table>";

            $("#DivRegion").append(ro);

        },
        error: function (result) {
            alert(result);
        }


    });
}

function Cancel() {
    document.getElementById("txtTitle").value = "";
    document.getElementById("txtDescription").value = "0";
    document.getElementById("lblID").innerHTML = "";
    document.getElementById("btnSave").innerHTML = "Submit";

    document.getElementById("txtRegNo").value = "";
    document.getElementById("txtChasisNo").value = "";
    document.getElementById("txtModel").value = "";
    document.getElementById("ddlHead").value = "0";
    CheckDataLength();
     
}

function InsertData() {
    
    var Title = document.getElementById('txtTitle').value;
    var txtDescription = document.getElementById('txtDescription').value;
    var UserID = localStorage.getItem("UserID");
    var txtRegNo = document.getElementById('txtRegNo').value;
    var txtChasisNo = document.getElementById('txtChasisNo').value;
    var txtModel = document.getElementById('txtModel').value;
    var ddlHead = document.getElementById('ddlHead').value;
   
        $.ajax({
            type: 'POST',
            url: 'Salary.aspx/SaveTransaction',
            //data: {},
            data: '{ "Title" : "' + Title + '","txtDescription" : "' + txtDescription + '","UserID" : "' + UserID + '","txtRegNo" : "' + txtRegNo + '","txtChasisNo" : "' + txtChasisNo + '","txtModel" : "' + txtModel + '","ddlHead" : "' + ddlHead + '" }', //advAmnt strINV tax1 tax2
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                vN = msg.d;
            //    alert(vN);
                LoadRegion();
            }

        });
       

}

function UpdateData() {

    var Title = document.getElementById('txtTitle').value;
    var txtDescription = document.getElementById('txtDescription').value;
    var id = document.getElementById("lblID").innerHTML;
    var UserID = localStorage.getItem("UserID");
    var txtRegNo = document.getElementById('txtRegNo').value;
    var txtChasisNo = document.getElementById('txtChasisNo').value;
    var txtModel = document.getElementById('txtModel').value;
    var ddlHead = document.getElementById('ddlHead').value;
    $.ajax({
        type: 'POST',
        url: 'Salary.aspx/UpdateTransaction',
        //data: {},
        data: '{ "Title" : "' + Title + '","txtDescription" : "' + txtDescription + '" ,"id" : "' + id + '" ,"UserID" : "' + UserID + '","txtRegNo" : "' + txtRegNo + '","txtChasisNo" : "' + txtChasisNo + '","txtModel" : "' + txtModel + '","ddlHead" : "' + ddlHead + '" }', //advAmnt strINV tax1 tax2
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            vN = msg.d;
           // alert(vN);
            LoadRegion();
        }

    });


}


function DeleteData(id) {
    var UserID = localStorage.getItem("UserID");
    $.ajax({
        type: 'POST',
        url: 'Salary.aspx/DeleteTransaction',
        //data: {},
        data: '{  "id" : "' + id + '","UserID" : "' + UserID + '" }', //advAmnt strINV tax1 tax2
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            vN = msg.d;
          // alert(vN);
            LoadRegion();
            LoadDeleteToastr();
            CheckDataLength();
            Cancel();
        }

    });


}

function SaveData() {
    var field = document.getElementById("txtTitle").value;
    if (field == "" || field == null) {
      //  alert("Please type Title");
        return false;
    }

    var field = document.getElementById("txtRegNo").value;
    if (field == "" || field == null) {
        //alert("Please type VRN");
        return false;
    }

    var field = document.getElementById("txtDescription").value;
    if (field == "" || field == null|| field == "0") {
        //alert("Please type VRN");
        return false;
    }

    var field = document.getElementById("txtChasisNo").value;
    if (field == "" || field == null) {
        //alert("Please type VRN");
        return false;
    }

    var field = document.getElementById("txtModel").value;
    if (field == "" || field == null) {
        //alert("Please type VRN");
        return false;
    }

    var field = document.getElementById("ddlHead").value;
    if (field == "" || field == null || field == "0") {
        //alert("Please type VRN");
        return false;
    }

    if ($("#btnSave").text() == "Submit") {

        InsertData();
        LoadSaveToastr();
    }
    else if ($("#btnSave").text() == "Update") {
        UpdateData();
        LoadUpdateToastr();
    }
    Cancel();
    CheckDataLength();
 

}
$(document).ready(function () {
    $('#dt-basic-example').dataTable(
                {
                    responsive: true
                });

    $('.js-thead-colors a').on('click', function () {
        var theadColor = $(this).attr("data-bg");
        console.log(theadColor);
        $('#dt-basic-example thead').removeClassPrefix('bg-').addClass(theadColor);
    });

    $('.js-tbody-colors a').on('click', function () {
        var theadColor = $(this).attr("data-bg");
        console.log(theadColor);
        $('#dt-basic-example').removeClassPrefix('bg-').addClass(theadColor);
    });

});
