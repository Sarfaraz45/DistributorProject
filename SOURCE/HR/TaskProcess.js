

LoadRegion();
//LoadVehicle();
//LoadDriver();


LoadHead();
 
LoadArea();
LoadLIST();
LoadShift();
LoadVehicleType();

function LoadSaveToastr() {
    Command: toastr["success"]("Task has been approved.")

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
function Approve(id,cycleid) {
    var UserID = localStorage.getItem("UserID");
    $.ajax({
        type: 'POST',
        url: 'TaskProcess.aspx/Approve',
        //data: {},
        data: '{ "id" : "' + id + '","UserID" : "' + UserID + '" ,"cycleid" : "' + cycleid + '" }', //advAmnt strINV tax1 tax2
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            vN = msg.d;
            LoadRegion();
            LoadSaveToastr();
        }

    });
}
 
function LoadTaskDetail(TaskID) {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "TaskProcess.aspx/LoadRegionTask",
        dataType: "json",
        //data: "{}",
        data: '{ "TaskID" : "' + TaskID + '" }', //advAmnt strINV tax1 tax2
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var ro = "";
            var splt = "";
            $.each(jsdata, function (key, value) {
                document.getElementById("txtTitle").value = value.Name;
                document.getElementById("txtStartDate").value = value.StartDate;
                document.getElementById("txtEndDate").value = value.EndDate;
                document.getElementById("ddlArea").value = value.Area;
                document.getElementById("ddlHead").value = value.ATTITLE;
                document.getElementById("ddlShift").value = value.ShiftTitle;
                LoadLIST();
                
                splt = value.VehicleList;
                var res = splt.split("`");

                for (var i = 0; i < res.length; i++) {
                    var itmlist = res[i].split('^');
                    document.getElementById("chk" + itmlist[0]).checked = true;
                    document.getElementById("txtchk" + itmlist[0]).value = itmlist[1];
                }
                document.getElementById('lbltaskid').innerTEXT = value.ID;
                

            });


        },
        error: function (result) {
            alert(result);
        }


    });

    $('#default-example-modal-lg').modal('show');
}


function SaveTransaction() {
    var UID = document.getElementById('ddlHead').value;
    var Title = document.getElementById('txtTitle').value;
    var Start = document.getElementById('txtStartDate').value;
    //var End = document.getElementById('txtEndDate').value;
    var AreaID = document.getElementById('ddlArea').value;
    var ddlShift = document.getElementById('ddlShift').value;
    var UserID = localStorage.getItem("UserID");
    var lblTaskID = document.getElementById('lbltaskid').innerTEXT;     
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
            url: 'TaskProcess.aspx/SaveTransaction',
            //data: {},
            data: '{ "Title" : "' + Title + '","UID" : "' + UID + '", "dta" : "' + dta + '","Start" : "' + Start + '","AreaID" : "' + AreaID + '" ,"ddlShift" : "' + ddlShift + '" ,"dtaVehicle" : "' + dtaVehicle + '","UserID" : "' + UserID + '","lblTaskID" : "' + lblTaskID + '" }', //advAmnt strINV tax1 tax2
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                vN = msg.d;
              //  alert(vN);
                LoadRegion();
                location.reload();
            }

        });

    }

}

$(document).ready(function () {
    var groupColumn = 0;    
    var table = $('#tablepagingVehDetail').DataTable({
        // sadiq bhai... m trying to help team work. i hope this will help to improve 
        // Vehicle type column visible false. there is no need to display in every row
        //  and disable sorting both columns VRN(Vehicle Registration Number) and Driver name)
        "columnDefs": [
            { "visible": false, "targets": groupColumn },
            { "targets": [0], "orderable": false, "visible": true },
            { "targets": [1], "orderable": false, "visible": true }
        ],

        "bFilter": false, // bFilter false to disable Searchfilter 
        "info": false, // visible false (showing 1 to 10 of 10 entries)
        "bLengthChange": false, // disable showing etries of rows

        "order": [[groupColumn, 'asc']], // order by groupcolum Ascending 
        "displayLength": 10,        // its upto your modal popup .. set per page rows. 
        // using drawcallback function, which will parse through the rows which are displayed, 
        //and enter a grouping TR element where a new group is found
        "drawCallback": function (settings) {
            var api = this.api();
            var rows = api.rows({ page: 'current' }).nodes();
            var last = null;

            api.column(groupColumn, { page: 'current' }).data().each(function (group, i) {
                if (last !== group) {
                    $(rows).eq(i).before(
                    // use your own styles for better look. 
                        '<tr style="background-color:#c7c7c7;color:#000;" class="group"><td colspan="2">' + group + '</td></tr>'
                    );

                    last = group;
                }
            });
        }
    });
});
function LoadRegion() {
    var Designation = localStorage.getItem("Designation");
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "TaskProcess.aspx/LoadRegion",
        dataType: "json",
        //data: "{}",
        data: '{ "DesID" : "' + Designation + '" }', //advAmnt strINV tax1 tax2
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var ro = "";

            if ($('#dt-basic-example').length != 0) {

                $('#dt-basic-example').remove();
            }

            ro = "<table  id='dt-basic-example' class='table table-bordered table-hover table-striped w-100'><thead class='thead-themed'><th>Task ID</th><th>Title</th><th>Date</th><th>Area</th><th>Activity</th><th>Action</th></thead><tbody>";
            $.each(jsdata, function (key, value) {

                ro += "<tr><td   class='one'>" + value.ID + "</td><td   class='two'>" + value.Name + "</td><td   class='three'>" + value.StartDate + "</td><td   class='three'>" + value.Area + "</td><td   class='three'>" + value.ATTITLE + "</td>  <td style='text-align:center;'><button class='btn buttons-selected btn-primary btn-sm mr-1' tabindex='0' aria-controls='dt-basic-example' type='button'  onclick='LoadTaskDetail(\"" + value.ID + "\");'><span><i class='fal fa-edit mr-1'></i> View</span></button><button class='btn buttons-selected btn-info btn-sm mr-1' tabindex='0' aria-controls='dt-basic-example' type='button'  onclick='Approve(\"" + value.ID + "\",\"" + value.CycleID + "\");'><span><i class='fal fa-check mr-1'></i> Approve</span></button><button class='btn buttons-selected btn-danger btn-sm mr-1' tabindex='0' aria-controls='dt-basic-example' type='button'  onclick='Reject(\"" + value.ID + "\",\"" + value.CycleID + "\");'><span><i class='fal fa-times mr-1'></i> Reject</span></button></td></tr>";

            });
            ro = ro + "</tbody></table>";

            $("#DivRegion").append(ro);

        },
        error: function (result) {
            alert(result);
        }


    });
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


//            $('#tablepagingVehDetail').dataTable(
//                {
//                    responsive: true
//                });

//            $('.js-thead-colors a').on('click', function () {
//                var theadColor = $(this).attr("data-bg");
//                console.log(theadColor);
//                $('#tablepagingVehDetail thead').removeClassPrefix('bg-').addClass(theadColor);
//            });

//            $('.js-tbody-colors a').on('click', function () {
//                var theadColor = $(this).attr("data-bg");
//                console.log(theadColor);
//                $('#tablepagingVehDetail').removeClassPrefix('bg-').addClass(theadColor);
//            });