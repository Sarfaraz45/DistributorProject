

LoadRegion();
LoadHead();
LoadDesignation();
LoadShift();
LoadArea();

LoadEmployeeType();
LoadUserType();


function LoadSaveToastr() {
    Command: toastr["success"]("Employee has been saved Successfully.")

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
    Command: toastr["info"]("Employee has been updated Successfully.")

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
    Command: toastr["error"]("Employee has been deleted Successfully.")

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
    var field = document.getElementById("txtTitle").value;
    if (field == "" || field == null) {
        var text = document.getElementById('txtTitle');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('txtTitle');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    } 

    var field = document.getElementById("DOB").value;
    if (field == "" || field == null) {
        var text = document.getElementById('DOB');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('DOB');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }

    var field = document.getElementById("ddlGender").value;
    if (field == "" || field == null || field == "0") {
        var text = document.getElementById('ddlGender');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('ddlGender');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }

    var field = document.getElementById("ddlDesignation").value;
    if (field == "" || field == null || field == "0") {
        var text = document.getElementById('ddlDesignation');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('ddlDesignation');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');
    }

    var field = document.getElementById("ddlShift").value;
    if (field == "" || field == null || field == "0") {
        var text = document.getElementById('ddlShift');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('ddlShift');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');
    }

    var field = document.getElementById("ddlArea").value;
    if (field == "" || field == null || field == "0") {
        var text = document.getElementById('ddlArea');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('ddlArea');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');
    }

    var field = document.getElementById("ddlEmployeeType").value;
    if (field == "" || field == null || field == "0") {
        var text = document.getElementById('ddlEmployeeType');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('ddlEmployeeType');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');
    }

    var field = document.getElementById("ddlUserType").value;
    if (field == "" || field == null || field == "0") {
        var text = document.getElementById('ddlUserType');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('ddlUserType');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');
    }

    var field = document.getElementById("txtCNIC").value;
    if (field == "" || field == null) {
        var text = document.getElementById('txtCNIC');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('txtCNIC');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }


    var field = document.getElementById("txtContact").value;
    if (field == "" || field == null) {
        var text = document.getElementById('txtContact');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('txtContact');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');
    }

    var field = document.getElementById("DOJ").value;
    if (field == "" || field == null) {
        var text = document.getElementById('DOJ');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('DOJ');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');
    }

    var field = document.getElementById("txtAddress").value;
    if (field == "" || field == null) {
        var text = document.getElementById('txtAddress');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('txtAddress');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');
    }



   
}



function LoadDetail(id) {
   
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Employee.aspx/LoadDetail",
        dataType: "json",
        //  data: "{}",
        data: '{ "id" : "' + id + '"}', //advAmnt strINV tax1 tax2
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var ro = "";


            $.each(jsdata, function (key, value) {
                document.getElementById("lblID").innerHTML = id;
                document.getElementById("btnSave").innerHTML = "Update";

                document.getElementById("txtTitle").value = value.Name;
                document.getElementById("DOB").value = value.DOB;
                document.getElementById("ddlGender").value = value.Gender;
                document.getElementById("ddlEmployeeType").value = value.EmpTypeID;
                document.getElementById("ddlDesignation").value = value.DesID;
                document.getElementById("ddlShift").value = value.ShiftID;
                document.getElementById("ddlArea").value = value.AreaID;
                document.getElementById("DOJ").value = value.JoiningDate;
                document.getElementById("txtCNIC").value = value.CNIC;
                document.getElementById("txtAddress").value = value.PermAddress;
                document.getElementById("txtContact").value = value.Mobile;
                document.getElementById("txtLoginID").value = value.LoginID;
                document.getElementById("ddlUserType").value = value.UTID;
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
        url: "Employee.aspx/LoadHead",
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


function LoadDesignation() {
    $.ajax({
        type: "POST",
        url: "Employee.aspx/LoadDesignation",
        data: {},
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var rows = "";
            if ($('#ddlDesignation').select.length != 0) {

                $('#ddlDesignation').empty();
            }

            $.each(jsdata, function (key, value) {
                rows += "<option  value=" + value.ID + ">" + value.Name + "</option>";
            });

            $("#ddlDesignation").append(rows);
        },
        error: function (data) {
            alert("error found");
        }
    });

}


function LoadShift() {
    $.ajax({
        type: "POST",
        url: "Employee.aspx/LoadShift",
        data: {},
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var rows = "";
            if ($('#ddlShift').select.length != 0) {

                $('#ddlShift').empty();
            }

            $.each(jsdata, function (key, value) {
                rows += "<option  value=" + value.ID + ">" + value.Name + "</option>";
            });

            $("#ddlShift").append(rows);
        },
        error: function (data) {
            alert("error found");
        }
    });

}


function LoadArea() {
    $.ajax({
        type: "POST",
        url: "Employee.aspx/LoadArea",
        data: {},
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var rows = "";
            if ($('#ddlArea').select.length != 0) {

                $('#ddlArea').empty();
            }

            $.each(jsdata, function (key, value) {
                rows += "<option  value=" + value.ID + ">" + value.Name + "</option>";
            });

            $("#ddlArea").append(rows);
        },
        error: function (data) {
            alert("error found");
        }
    });

}
function LoadEmployeeType() {
    $.ajax({
        type: "POST",
        url: "Employee.aspx/LoadEmployeeType",
        data: {},
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var rows = "";
            if ($('#ddlEmployeeType').select.length != 0) {

                $('#ddlEmployeeType').empty();
            }

            $.each(jsdata, function (key, value) {
                rows += "<option  value=" + value.ID + ">" + value.Name + "</option>";
            });

            $("#ddlEmployeeType").append(rows);
        },
        error: function (data) {
            alert("error found");
        }
    });

}

function LoadUserType() {
    $.ajax({
        type: "POST",
        url: "Employee.aspx/LoadUserType",
        data: {},
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var rows = "";
            if ($('#ddlUserType').select.length != 0) {

                $('#ddlUserType').empty();
            }

            $.each(jsdata, function (key, value) {
                rows += "<option  value=" + value.ID + ">" + value.Name + "</option>";
            });

            $("#ddlUserType").append(rows);
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
        url: "Employee.aspx/LoadRegion",
        dataType: "json",
        data: "{}",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var ro = "";

            if ($('#dt-basic-example').length != 0) {

                $('#dt-basic-example').remove();
            }

            ro = "<table id='dt-basic-example'class='table table-sm  dataTable dtr-inline table-hover' ><thead class='thead-themed'> <th>Name</th><th>Designation</th><th>Area</th><th>Login ID</th><th style='text-align:center;'>Action</th></thead><tbody>";
            $.each(jsdata, function (key, value) {

                ro += "<tr><td   class='two' >" + value.Name + "</td><td   class='three' >" + value.VDESC + "</td><td   class='three' >" + value.VTID + "</td><td   class='three' >" + value.REGNO + "</td><td style='text-align:center; '><button class='btn buttons-selected btn-primary btn-sm mr-1' tabindex='0' aria-controls='dt-basic-example' type='button'  onclick='LoadDetail(\"" + value.ID + "\");'><span><i class='fal fa-edit mr-1'></i> Select</span></button><button class='btn buttons-selected btn-danger btn-sm mr-1' tabindex='0' aria-controls='dt-basic-example' type='button'  onclick='DeleteData(\"" + value.ID + "\");'><span><i class='fal fa-times mr-1'></i> Delete</span></button></td></tr>";

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
    document.getElementById("txtCNIC").value = "";
    document.getElementById("lblID").innerHTML = "";
    document.getElementById("btnSave").innerHTML = "Submit";

    document.getElementById("txtContact").value = "";
    document.getElementById("txtAddress").value = "";
    document.getElementById("txtLoginID").value = "";
    document.getElementById("txtPassword").value = "";


    document.getElementById("ddlGender").value = "0";
    document.getElementById("ddlDesignation").value = "0";
    document.getElementById("ddlShift").value = "0";
    document.getElementById("ddlEmployeeType").value = "0";
    document.getElementById("ddlUserType").value = "0";
    document.getElementById("DOB").value = "";
    document.getElementById("DOJ").value = "";
    

    CheckDataLength();
     
}

function InsertData() {
    
    var Title = document.getElementById('txtTitle').value;
    var DOB = document.getElementById('DOB').value;
    var UserID = localStorage.getItem("UserID");
    var ddlGender = document.getElementById('ddlGender').value;
    var ddlDesignation = document.getElementById('ddlDesignation').value;
    var ddlShift = document.getElementById('ddlShift').value;
    var ddlArea = document.getElementById('ddlArea').value;
    var ddlEmployeeType = document.getElementById('ddlEmployeeType').value;
    var ddlUserType = document.getElementById('ddlUserType').value;
    var txtCNIC = document.getElementById('txtCNIC').value;
    var txtContact = document.getElementById('txtContact').value;
    var DOJ = document.getElementById('DOJ').value;
    var txtAddress = document.getElementById('txtAddress').value;
    var txtLoginID = document.getElementById('txtLoginID').value;
    var txtPassword = document.getElementById('txtPassword').value;
   
        $.ajax({
            type: 'POST',
            url: 'Employee.aspx/SaveTransaction',
            //data: {},
            data: '{ "Title" : "' + Title + '","DOB" : "' + DOB + '","UserID" : "' + UserID + '","ddlGender" : "' + ddlGender + '","ddlDesignation" : "' + ddlDesignation + '","ddlShift" : "' + ddlShift + '","ddlArea" : "' + ddlArea + '" ,"ddlEmployeeType" : "' + ddlEmployeeType + '" ,"ddlUserType" : "' + ddlUserType + '" ,"txtCNIC" : "' + txtCNIC + '" ,"txtContact" : "' + txtContact + '" ,"DOJ" : "' + DOJ + '" ,"txtAddress" : "' + txtAddress + '" ,"txtLoginID" : "' + txtLoginID + '" ,"txtPassword" : "' + txtPassword + '" }', //advAmnt strINV tax1 tax2
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                vN = msg.d;
              //  alert(vN);
                LoadRegion();
            }

        });
       

}

function UpdateData() {
    var id = document.getElementById("lblID").innerHTML;
    var Title = document.getElementById('txtTitle').value;
    var DOB = document.getElementById('DOB').value;
    var UserID = localStorage.getItem("UserID");
    var ddlGender = document.getElementById('ddlGender').value;
    var ddlDesignation = document.getElementById('ddlDesignation').value;
    var ddlShift = document.getElementById('ddlShift').value;
    var ddlArea = document.getElementById('ddlArea').value;
    var ddlEmployeeType = document.getElementById('ddlEmployeeType').value;
    var ddlUserType = document.getElementById('ddlUserType').value;
    var txtCNIC = document.getElementById('txtCNIC').value;
    var txtContact = document.getElementById('txtContact').value;
    var DOJ = document.getElementById('DOJ').value;
    var txtAddress = document.getElementById('txtAddress').value;
    var txtLoginID = document.getElementById('txtLoginID').value;
    var txtPassword = document.getElementById('txtPassword').value;
   
    $.ajax({
        type: 'POST',
        url: 'Employee.aspx/UpdateTransaction',
        //data: {},
        data: '{ "Title" : "' + Title + '","DOB" : "' + DOB + '","UserID" : "' + UserID + '","ddlGender" : "' + ddlGender + '","ddlDesignation" : "' + ddlDesignation + '","ddlShift" : "' + ddlShift + '","ddlArea" : "' + ddlArea + '" ,"ddlEmployeeType" : "' + ddlEmployeeType + '" ,"ddlUserType" : "' + ddlUserType + '" ,"txtCNIC" : "' + txtCNIC + '" ,"txtContact" : "' + txtContact + '" ,"DOJ" : "' + DOJ + '" ,"txtAddress" : "' + txtAddress + '" ,"txtLoginID" : "' + txtLoginID + '" ,"txtPassword" : "' + txtPassword + '","id" : "' + id + '"  }', //advAmnt strINV tax1 tax2
        
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            vN = msg.d;
          //  alert(vN);
            LoadRegion();
        }

    });


}


function DeleteData(id) {
    var UserID = localStorage.getItem("UserID");
    $.ajax({
        type: 'POST',
        url: 'Employee.aspx/DeleteTransaction',
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
       return false;
    }

   var field = document.getElementById("DOB").value;
    if (field == "" || field == null) {
        return false;
    }
    var field = document.getElementById("ddlGender").value;
    if (field == "" || field == null || field == "0") {
        return false;
    }
    var field = document.getElementById("ddlDesignation").value;
    if (field == "" || field == null || field == "0") {
        return false;
    }
    var field = document.getElementById("ddlShift").value;
    if (field == "" || field == null || field == "0") {
        return false;
    }
    var field = document.getElementById("ddlArea").value;
    if (field == "" || field == null || field == "0") {
        return false;
    }
    var field = document.getElementById("ddlEmployeeType").value;
    if (field == "" || field == null || field == "0") {
        return false;
    }
    var field = document.getElementById("ddlUserType").value;
    if (field == "" || field == null || field == "0") {
        return false;
    }
    var field = document.getElementById("txtCNIC").value;
    if (field == "" || field == null) {
        return false;
    }
    var field = document.getElementById("txtContact").value;
    if (field == "" || field == null || field == "0") {
        return false;
    }
    var field = document.getElementById("DOJ").value;
    if (field == "" || field == null || field == "0") {
        return false;
    }
    var field = document.getElementById("txtAddress").value;
    if (field == "" || field == null || field == "0") {
        return false;
    }


    var field = document.getElementById("txtLoginID").value;
    if (field != "" || field != null ) {

        var pass = document.getElementById("txtPassword").value;
        if (pass == "" || pass == null) {
            var text = document.getElementById('txtPassword');
            text.classList.remove('is-valid');
            text.classList.add('is-invalid');
            return false;
        }
        else {
            var text = document.getElementById('txtPassword');
            text.classList.remove('is-invalid');
            text.classList.add('is-valid');
        } 
     
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
