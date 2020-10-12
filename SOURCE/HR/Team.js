
LoadHead();
LoadRegion();
LoadArea();
LoadLIST();


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


}


function TeamWarningToastr() {
    Command: toastr["warning"]("Select at least One Team Member from Area List...!")

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


function LoadSaveToastr() {
    Command: toastr["success"]("Team has been saved Successfully.")

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
        url: 'Team.aspx/LoadLIST',
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
function LoadHead() { 
    $.ajax({
        type: "POST",
        url: "Team.aspx/LoadHead",
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


function LoadArea() {
    $.ajax({
        type: "POST",
        url: "Team.aspx/LoadArea",
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

function LoadRegion() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Team.aspx/LoadRegion",
        dataType: "json",
        data: "{}",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var ro = "";

            if ($('#dt-basic-example').length != 0) {

                $('#dt-basic-example').remove();
            }

            ro = "<table id='dt-basic-example'class='table table-bordered table-hover table-striped w-100' ><thead class='thead-themed'><th>Team ID</th><th>Title</th><th>Head</th><th>Area</th></thead><tbody>";
            $.each(jsdata, function (key, value) {

                ro += "<tr><td   class='one'>" + value.ID + "</td><td   class='two'>" + value.Name + "</td><td   class='three'>" + value.Region + "</td><td   class='three'>" + value.Area + "</td></tr>";

            });
            ro = ro + "</tbody></table>";

            $("#DivRegion").append(ro);

        },
        error: function (result) {
            alert(result);
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
    var AreaID = document.getElementById('ddlArea').value;
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
    if (dta != "") {
        $.ajax({
            type: 'POST',
            url: 'Team.aspx/SaveTransaction',
            //data: {},
            data: '{ "Title" : "' + Title + '","UID" : "' + UID + '", "dta" : "' + dta + '" , "AreaID" : "' + AreaID + '" }', //advAmnt strINV tax1 tax2
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                vN = msg.d;
                // alert(vN);
                LoadSaveToastr();
                location.reload();
                //LoadRegion();
                
            }

        });
      
    }

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
