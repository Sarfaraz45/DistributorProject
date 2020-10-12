

LoadRegion();
LoadHead();


function LoadSaveToastr() {
    Command: toastr["success"]("Task Cycle has been saved Successfully.")

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
    Command: toastr["info"]("Task Cycle has been updated Successfully.")

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
    Command: toastr["error"]("Task Cycle has been deleted Successfully.")

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

function CheckDataLength() {
    var field = document.getElementById("txtDuration").value;
    if (field == "" || field == null) {
        var text = document.getElementById('txtDuration');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('txtDuration');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }

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

    var field = document.getElementById("ddlOrder").value;
    if (field == "" || field == null || field == "0") {
        var text = document.getElementById('ddlOrder');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('ddlOrder');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }
}
function LoadDetail(id) {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "TaskCycle.aspx/LoadDetail",
        dataType: "json",
        //  data: "{}",
        data: '{ "id" : "' + id + '"}', //advAmnt strINV tax1 tax2
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var ro = "";


            $.each(jsdata, function (key, value) {
                document.getElementById("ddlOrder").value = value.Name;
                document.getElementById("ddlHead").value = value.VDESC;
                document.getElementById("lblID").innerHTML = id;
                document.getElementById("btnSave").innerHTML = "Update";


                document.getElementById("txtDuration").value = value.VTID;
                if (value.REGNO == "1")
                { document.getElementById("defaultUnchecked").checked = true; }
                else {
                    document.getElementById("defaultUnchecked").checked = false;
                }
                CheckDataLength();
                


            });

        },
        error: function (result) {
            alert(result);
        }


    });
}


function LoadHead() {
    $.ajax({
        type: "POST",
        url: "TaskCycle.aspx/LoadHead",
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

function LoadRegion() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "TaskCycle.aspx/LoadRegion",
        dataType: "json",
        data: "{}",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var ro = "";

            if ($('#dt-basic-example').length != 0) {

                $('#dt-basic-example').remove();
            }

            ro = "<table id='dt-basic-example'class='table table-sm  dataTable dtr-inline table-hover' ><thead class='thead-themed'> <th>Task Order</th><th>Designation</th><th>Approval Duration</th><th>Cycle Type</th><th style='text-align:center;'>Action</th></thead><tbody>";
            $.each(jsdata, function (key, value) {

                ro += "<tr><td   class='two' style='width:20%;'>" + value.Name + "</td><td   class='three' style='width:30%;'>" + value.VDESC + "</td><td   class='three' style='width:15%;'>" + value.VTID + "</td><td   class='three' style='width:15%;'>" + value.REGNO + "</td><td style='text-align:center;width:20%;'><button class='btn buttons-selected btn-primary btn-sm mr-1' tabindex='0' aria-controls='dt-basic-example' type='button'  onclick='LoadDetail(\"" + value.ID + "\");'><span><i class='fal fa-edit mr-1'></i> Select</span></button><button class='btn buttons-selected btn-danger btn-sm mr-1' tabindex='0' aria-controls='dt-basic-example' type='button'  onclick='DeleteData(\"" + value.ID + "\");'><span><i class='fal fa-times mr-1'></i> Delete</span></button></td></tr>";

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
    document.getElementById("txtDuration").value = "";    
    document.getElementById("defaultUnchecked").checked = false;
    document.getElementById("lblID").innerHTML = "";
    document.getElementById("btnSave").innerHTML = "Submit";

    CheckDataLength();
     
}

function InsertData() {

    var ddlOrder = document.getElementById('ddlOrder').value;
    var ddlHead = document.getElementById('ddlHead').value;
    var txtDuration = document.getElementById('txtDuration').value;
    var UserID = localStorage.getItem("UserID");
    var checkBox = document.getElementById("defaultUnchecked");
    var IsAdministrator = "0";
    if (checkBox.checked == true) {
        IsAdministrator = "1";
    } else {
        IsAdministrator = "0";
    }
   
        $.ajax({
            type: 'POST',
            url: 'TaskCycle.aspx/SaveTransaction',
            //data: {},
            data: '{ "ddlOrder" : "' + ddlOrder + '","ddlHead" : "' + ddlHead + '","txtDuration" : "' + txtDuration + '","UserID" : "' + UserID + '","IsAdministrator" : "' + IsAdministrator + '" }', //advAmnt strINV tax1 tax2
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                vN = msg.d;
             //   alert(vN);
                LoadRegion();
            }

        });
       

}

function UpdateData() {
    var id = document.getElementById("lblID").innerHTML;
    var ddlOrder = document.getElementById('ddlOrder').value;
    var ddlHead = document.getElementById('ddlHead').value;
    var txtDuration = document.getElementById('txtDuration').value;
    var UserID = localStorage.getItem("UserID");
    var checkBox = document.getElementById("defaultUnchecked");
    var IsAdministrator = "0";
    if (checkBox.checked == true) {
        IsAdministrator = "1";
    } else {
        IsAdministrator = "0";
    }
    $.ajax({
        type: 'POST',
        url: 'TaskCycle.aspx/UpdateTransaction',
        //data: {},
        data: '{  "id" : "' + id + '" ,"ddlOrder" : "' + ddlOrder + '","ddlHead" : "' + ddlHead + '","txtDuration" : "' + txtDuration + '","UserID" : "' + UserID + '","IsAdministrator" : "' + IsAdministrator + '"  }', //advAmnt strINV tax1 tax2
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
        url: 'TaskCycle.aspx/DeleteTransaction',
        //data: {},
        data: '{  "id" : "' + id + '","UserID" : "' + UserID + '" }', //advAmnt strINV tax1 tax2
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            vN = msg.d;
        //    alert(vN);
            LoadRegion();
            LoadDeleteToastr();
            CheckDataLength();
            Cancel();
        }

    });


}

function CheckDuplication() {


    var ddlHead = document.getElementById('ddlHead').value;

    $.ajax({
        type: 'POST',
        url: 'TaskCycle.aspx/CheckDuplication',
        //data: {},
        data: '{ "ddlHead" : "' + ddlHead + '" }', //advAmnt strINV tax1 tax2
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
           var  vN = msg.d;
            if (vN == "true") {
                alert("Designation already exist..!");

            }
            else {
                SaveData();
            }

        }

    });

}

function SaveData() {
    var field = document.getElementById("txtDuration").value;
    if (field == "" || field == null) {
        //alert("Please type Approval Duration");
        return false;
    }

    var field = document.getElementById("ddlHead").value;
    if (field == "0") {
        //alert("Please Select Designation");
        return false;
    }

    var field = document.getElementById("ddlOrder").value;
    if (field == "0") {
        //alert("Please Select Order");
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
                    responsive: true,
                     "aaSorting": []
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
