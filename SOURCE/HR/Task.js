
LoadHead();
LoadRegion();
//LoadType();
LoadArea();
LoadLIST();
LoadShift();
LoadVehicleType();


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

    var field = document.getElementById("StartDate").value;
    if (field == "" || field == null) {
        var text = document.getElementById('StartDate');
        text.classList.remove('is-valid');
        text.classList.add('is-invalid');
    }
    else {

        var text = document.getElementById('StartDate');
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


}



function TeamWarningToastr() {
    Command: toastr["warning"]("Select at least One Team from Area List...!")

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


function LoadLIST() {
    document.getElementById("dvForm").style.display = "none";
    document.getElementById("dvDetail").innerHTML = "";
    var AreaID = document.getElementById('ddlArea').value;
    $.ajax({
        type: 'POST',
        url: 'Task.aspx/LoadLIST',
        //data: {},        
        data: '{ "AreaID" : "' + AreaID + '" }', //advAmnt strINV tax1 tax2
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {            
            document.getElementById('dvForm').style.display = 'block';
            document.getElementById('dvDetail').innerHTML = msg.d;
        }
    });
}

function LoadVehicleType() {
    document.getElementById("dvFormVehicle").style.display = "none";
    document.getElementById("dvDetailVehicle").innerHTML = "";
    $.ajax({
        type: 'POST',
        url: 'Task.aspx/LoadVehicleType',
        data: {},                
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            document.getElementById('dvFormVehicle').style.display = 'block';
            document.getElementById('dvDetailVehicle').innerHTML = msg.d;
        }
    });
}
function LoadHead() { 
    $.ajax({
        type: "POST",
        url: "Task.aspx/LoadHead",
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

function LoadShift() {
    $.ajax({
        type: "POST",
        url: "Task.aspx/LoadShift",
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

function LoadType() {
    $.ajax({
        type: "POST",
        url: "Task.aspx/LoadType",
        data: {},
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var rows = "";
            if ($('#ddlType').select.length != 0) {

                $('#ddlType').empty();
            }

            $.each(jsdata, function (key, value) {
                rows += "<option  value=" + value.ID + ">" + value.Name + "</option>";
            });

            $("#ddlType").append(rows);
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
        url: "Task.aspx/LoadRegion",
        dataType: "json",
        data: "{}",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var ro = "";

            if ($('#tablepaging').length != 0) {

                $('#tablepaging').remove();
            }

            ro = "<table id='tablepaging' class='table table-bordered table-hover m-0'  style='cursor: pointer;'><thead class='thead-themed'><th>ID</th><th>Title</th><th>Date</th><th>Area</th><th>Activity</th></thead><tbody>";
            $.each(jsdata, function (key, value) {

                ro += "<tr><td   class='one'>" + value.ID + "</td><td   class='two'>" + value.Name + "</td><td   class='three'>" + value.STARTDATE + "</td><td   class='three'>" + value.Area + "</td><td   class='three'>" + value.ATTITLE + "</td></tr>";

            });
            ro = ro + "</tbody></table>";

            $("#DivRegion").append(ro);

        },
        error: function (result) {
            alert(result);
        }


    });
}


function LoadArea() {
    $.ajax({
        type: "POST",
        url: "Task.aspx/LoadArea",
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

function SaveTransaction() {
    

    var field = document.getElementById("txtTitle").value;
    if (field == "" || field == null) {
        //alert("Please type Title");
        return false;
    }
    var field = document.getElementById("ddlHead").value;
    if (field == "" || field == null || field == "0") {
        //alert("Please type VRN");
        return false;
    }
    var field = document.getElementById("ddlArea").value;
    if (field == "" || field == null || field == "0") {
        //alert("Please type VRN");
        return false;
    }

    var field = document.getElementById("ddlShift").value;
    if (field == "" || field == null || field == "0") {
        //alert("Please type VRN");
        return false;
    }

    var field = document.getElementById("StartDate").value;
    if (field == "" || field == null) {
        return false;
    }

    var field = document.getElementById("txtRemarks").value;
    if (field == "" || field == null) {
        return false;
    }



    var dta = "";
    var elm = {}; var tMarks = 0;
    var elms = document.getElementById('dvForm').getElementsByTagName("input");
    var str = ""; var cc = 0;
    for (var i = 0; i < elms.length; i++) {
        if (elms[i].id.indexOf('chk') != -1) {

            elm = elms[i];
            var iD = elm.id;
            if (document.getElementById(iD).checked) {
                var nID = iD.replace("chk", "");
                if (dta == "") {
                    dta = nID;
                }
                else {
                    dta = dta + "^" + nID;
                }
            }


        }

    }

    if (dta == "") {
        TeamWarningToastr();
        return false;
    }



    var UID = document.getElementById('ddlHead').value;
    var Title = document.getElementById('txtTitle').value;
    var Start = document.getElementById('StartDate').value;
    //var End = document.getElementById('EndDate').value;
    var AreaID = document.getElementById('ddlArea').value;
    var ddlShift = document.getElementById('ddlShift').value;
//    var ddlType = document.getElementById('ddlType').value;
//    var txtQty = document.getElementById('txtQty').value;
//    var FromDate = document.getElementById('FromDate').value;
//    var ToDate = document.getElementById('ToDate').value;
    var txtRemarks = document.getElementById('txtRemarks').value;
    var UserID = localStorage.getItem("UserID");
    var dta = "";
    var elm = {}; var tMarks = 0;
    var elms = document.getElementById('dvForm').getElementsByTagName("input");
    var str = ""; var cc = 0;
    for (var i = 0; i < elms.length; i++) {
        if (elms[i].id.indexOf('chk') != -1) {

            elm = elms[i];
            var iD = elm.id;
            if (document.getElementById(iD).checked) {
                var nID = iD.replace("chk", "");
                if (dta == "") {
                    dta = nID;
                }
                else {
                    dta = dta + "^" + nID;
                }
            }


        }
        else {

        }
    }


    var dtaVehicle = "";
    var elmVehicle = {}; var tMarksVehicle = 0;
    var elmsVehicle = document.getElementById('dvFormVehicle').getElementsByTagName("input");
    var strVehicle = ""; var ccVehicle = 0;
    for (var i = 0; i < elmsVehicle.length; i++) {
        if (elmsVehicle[i].id.indexOf('chk') != -1) {

            elmVehicle = elmsVehicle[i];
            var iDVehicle = elmVehicle.id;
            if (document.getElementById(iDVehicle).checked) {
                var nIDVehicle = iDVehicle.replace("chk", "");
                var txtvalue = "txtchk" + nIDVehicle;              
                var txt = document.getElementById(txtvalue).value;
              
                if (dtaVehicle == "") {
                    dtaVehicle = nIDVehicle + "`" + txt;
                }
                else {

                    dtaVehicle = dtaVehicle + "^" + nIDVehicle + "`" + txt;
                }
            }


        }
        else {

        }
    }
    

    if (dta != "") {

        $.ajax({
            type: 'POST',
            url: 'Task.aspx/SaveTransaction',
            //data: {},
            data: '{ "Title" : "' + Title + '","UID" : "' + UID + '", "dta" : "' + dta + '","Start" : "' + Start + '" ,"txtRemarks" : "' + txtRemarks + '" ,"AreaID" : "' + AreaID + '" ,"ddlShift" : "' + ddlShift + '" ,"dtaVehicle" : "' + dtaVehicle + '","UserID" : "' + UserID + '" }', //advAmnt strINV tax1 tax2
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                vN = msg.d;
              //  alert(vN);
                //LoadRegion();
                location.reload();
            }

        });
      
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