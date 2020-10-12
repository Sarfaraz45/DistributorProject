

LoadRegion();
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

    var field = document.getElementById("txtDescription").value;
    if (field == "" || field == null) {
        var text = document.getElementById('txtDescription');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('txtDescription');
        text.classList.remove('is-invalid');
        text.classList.add('is-valid');

    }

}

function LoadSaveToastr() {
    Command: toastr["success"]("Allowance has been saved Successfully.")

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
    Command: toastr["info"]("Allowance has been updated Successfully.")

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
    Command: toastr["error"]("Allowance has been deleted Successfully.")

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
        url: "Allowance.aspx/LoadDetail",
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
                CheckDataLength();
            });

        },
        error: function (result) {
            alert(result);
        }


    });
}

function LoadRegion() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Allowance.aspx/LoadRegion",
        dataType: "json",
        data: "{}",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var ro = "";

            if ($('#dt-basic-example').length != 0) {

                $('#dt-basic-example').remove();
            }

            ro = "<table id='dt-basic-example'class='table table-sm  dataTable dtr-inline table-hover' ><thead class='thead-themed'> <th>Title</th><th>Amount</th><th style='text-align:center;'>Action</th></thead><tbody>";
            $.each(jsdata, function (key, value) {

                ro += "<tr><td   class='two' style='width:30%;'>" + value.Name + "</td><td   class='three' style='width:50%;'>" + value.VDESC + "</td><td style='text-align:center;width:20%;'><button class='btn buttons-selected btn-primary btn-sm mr-1' tabindex='0' aria-controls='dt-basic-example' type='button'  onclick='LoadDetail(\"" + value.ID + "\");'><span><i class='fal fa-edit mr-1'></i> Select</span></button><button class='btn buttons-selected btn-danger btn-sm mr-1' tabindex='0' aria-controls='dt-basic-example' type='button'  onclick='DeleteData(\"" + value.ID + "\");'><span><i class='fal fa-times mr-1'></i> Delete</span></button></td></tr>";

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
    document.getElementById("txtDescription").value = "";
    document.getElementById("lblID").innerHTML = "";
    document.getElementById("btnSave").innerHTML = "Submit";
    CheckDataLength();
}

function InsertData() {
    
    var Title = document.getElementById('txtTitle').value;
    var txtDescription = document.getElementById('txtDescription').value;
    var UserID = localStorage.getItem("UserID");
        $.ajax({
            type: 'POST',
            url: 'Allowance.aspx/SaveTransaction',
            //data: {},
            data: '{ "Title" : "' + Title + '","txtDescription" : "' + txtDescription + '","UserID" : "' + UserID + '" }', //advAmnt strINV tax1 tax2
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
    $.ajax({
        type: 'POST',
        url: 'Allowance.aspx/UpdateTransaction',
        //data: {},
        data: '{ "Title" : "' + Title + '","txtDescription" : "' + txtDescription + '" ,"id" : "' + id + '" ,"UserID" : "' + UserID + '"}', //advAmnt strINV tax1 tax2
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            vN = msg.d;
         //   alert(vN);
            LoadRegion();
        }

    });


}


function DeleteData(id) {
    var UserID = localStorage.getItem("UserID");
    $.ajax({
        type: 'POST',
        url: 'Allowance.aspx/DeleteTransaction',
        //data: {},
        data: '{  "id" : "' + id + '","UserID" : "' + UserID + '" }', //advAmnt strINV tax1 tax2
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            vN = msg.d;
            //alert(vN);
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

    var field = document.getElementById("txtDescription").value;
    if (field == "" || field == null) {
        //  alert("Please type Title");
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
