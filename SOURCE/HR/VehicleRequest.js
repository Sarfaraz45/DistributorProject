

LoadRegion();
LoadVehicle();
LoadDriver();

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
function SaveTransaction() {

    var lbltaskid = document.getElementById('lbltaskid').innerTEXT;
    var lblCycleID = document.getElementById('lblCycleID').innerTEXT;
    var UserID = localStorage.getItem("UserID");
    $.ajax({
        type: 'POST',
        url: 'VehicleRequest.aspx/SaveTransaction',
        //data: {},
        data: '{   "lbltaskid" : "' + lbltaskid + '",  "UserID" : "' + UserID + '",  "lblCycleID" : "' + lblCycleID + '"}', //advAmnt strINV tax1 tax2
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            vN = msg.d;
            //LoadRegion();
            location.reload();
        }

    });
}

function SaveVehicle() {
    var ddlVehicle = document.getElementById('ddlVehicle').value;
    var ddlDriver = document.getElementById('ddlDriver').value;
    //var txtVehicleQty = document.getElementById('txtVehicleQty').value;
    var lbltaskid = document.getElementById('lbltaskid').innerTEXT;

    $.ajax({
        type: 'POST',
        url: 'VehicleRequest.aspx/SaveVehicle',
        //data: {},
        data: '{ "ddlVehicle" : "' + ddlVehicle + '","ddlDriver" : "' + ddlDriver + '", "lbltaskid" : "' + lbltaskid + '"}', //advAmnt strINV tax1 tax2
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            vN = msg.d;
            LoadTaskDetail(document.getElementById("lbltaskid").innerTEXT);
        }

    });
}
function LoadDriver() {
    $.ajax({
        type: "POST",
        url: "VehicleRequest.aspx/LoadDriver",
        data: {},
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var rows = "";
            if ($('#ddlDriver').select.length != 0) {

                $('#ddlDriver').empty();
            }

            $.each(jsdata, function (key, value) {
                rows += "<option  value=" + value.ID + ">" + value.Name + "</option>";
            });

            $("#ddlDriver").append(rows);
        },
        error: function (data) {
            alert("error found");
        }
    });

}
function LoadVehicle() {
    $.ajax({
        type: "POST",
        url: "VehicleRequest.aspx/LoadVehicle",
        data: {},
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var rows = "";
            if ($('#ddlVehicle').select.length != 0) {

                $('#ddlVehicle').empty();
            }

            $.each(jsdata, function (key, value) {
                rows += "<option  value=" + value.ID + ">" + value.Name + "</option>";
            });

            $("#ddlVehicle").append(rows);
        },
        error: function (data) {
            alert("error found");
        }
    });

}
function AddVehicle(id) {
    var TaskID = document.getElementById('lbltaskid').innerTEXT;
    var Vehicle = document.getElementById(id + 'ddlVehicle').value;
    var Driver = document.getElementById(id + 'ddlDriver').value;
    var UserID = localStorage.getItem("UserID");

    $.ajax({
        type: 'POST',
        url: 'VehicleRequest.aspx/SaveVehicle',
        //data: {},
        data: '{ "ddlVehicle" : "' + Vehicle + '","ddlDriver" : "' + Driver + '", "lbltaskid" : "' + TaskID + '", "UserID" : "' + UserID + '"}', //advAmnt strINV tax1 tax2
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            vN = msg.d;
            LoadTaskDetail(document.getElementById("lbltaskid").innerTEXT);
        }

    });
    
}
function LoadTaskDetail(TaskID) {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "VehicleRequest.aspx/LoadRegionTask",
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
                document.getElementById("txtArea").value = value.Area;
                document.getElementById("txtActivity").value = value.ATTITLE;
                document.getElementById("txtShift").value = value.ShiftTitle;
                splt = value.VehicleList;
                document.getElementById('lbltaskid').innerTEXT = value.ID;
                document.getElementById('lblCycleID').innerTEXT = value.CycleID;

            });


            if ($('#tablepagingNew').length != 0) {

                $('#tablepagingNew').remove();
            }

            ro = "<table id='tablepagingNew' class='table table-sm m-0' ><thead class='bg-primary-500'><th>Vehicle Type</th><th style='text-align:center;'>Req: Qty</th><th style='text-align:center;'>Avl: Qty</th><th>Vehicle</th><th>Driver</th><th style='text-align:center;'>Action</th></thead><tbody>";
            var res = splt.split("`");
            for (var i = 0; i < res.length; i++) {
                var itmlist = res[i].split('^');
                var ddlvehicle = LoadVehicleByType(itmlist[2], document.getElementById('lbltaskid').innerTEXT);
                var ddlvehicleList = ddlvehicle.split('^');
//                var ddlvehicle = document.getElementById("ddlVehicle").innerHTML;
//                ddlvehicle = "<select class='form-control' id='" + itmlist[2] + "ddlVehicle'><option value='0'>Select</option>" + ddlvehicle + "</select>";

                var ddlDriver = document.getElementById("ddlDriver").innerHTML;
                ddlDriver = "<select class='form-control' id='" + itmlist[2] + "ddlDriver'><option value='0'>Select</option>" + ddlDriver + "</select>";
                //                ro += "<tr><td   class='one'>" + itmlist[0] + "</td><td   class='two'  style='text-align:center;'>" + itmlist[1] + "</td><td style='text-align:center;'>" + itmlist[3] + "</td><td>" + ddlvehicle + "</td><td>" + ddlDriver + "</td><td style='text-align:center;'><button class='btn buttons-selected btn-warning btn-sm mr-1' tabindex='0' aria-controls='dt-basic-example' type='button' onclick='AddVehicle(" + itmlist[2] + ");'  ><span><i class='fal fa-download'></i> Add</span></button></td></tr>";
                ro += "<tr><td   class='one'>" + itmlist[0] + "</td><td   class='two'  style='text-align:center;'>" + itmlist[1] + "</td><td style='text-align:center;'>" + ddlvehicleList[1] + "</td><td>" + ddlvehicleList[0] + "</td><td>" + ddlDriver + "</td><td style='text-align:center;'><button class='btn buttons-selected btn-warning btn-sm mr-1' tabindex='0' aria-controls='dt-basic-example' type='button' onclick='AddVehicle(" + itmlist[2] + ");'  ><span><i class='fal fa-download'></i> Add</span></button></td></tr>";
            }
            ro = ro + "</tbody></table>";

            $("#DivRegionType").append(ro);
            LoadVehicleDetail(TaskID);

        },
        error: function (result) {
            alert(result);
        }


    });

    $('#default-example-modal-lg').modal('show');
}


function LoadVehicleByType(VTID, TaskID) {
    document.getElementById("lbltemp").innerTEXT = "";
    var count = "0";
    var rows = "<select id='" + VTID + "ddlVehicle' class='form-control'><option value='0'>Select</option>";
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "VehicleRequest.aspx/LoadVehicleByType",
        dataType: "json",
        //data: "{}",
        data: '{ "VTID" : "' + VTID + '" }', //advAmnt strINV tax1 tax2
        async: false,
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            $.each(jsdata, function (key, value) {
                rows += "<option  value=" + value.ID + ">" + value.Name + "</option>";
                count = value.Count;
            });
            rows = rows + "</select>";
            document.getElementById("lbltemp").innerTEXT = rows + "^" + count;

        },
        error: function (data) {
            alert("error found");
        }

    });
    var abc = document.getElementById("lbltemp").innerTEXT;
 
    return abc;
    
}

function LoadVehicleDetail(TaskID) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "VehicleRequest.aspx/LoadVehicleDetail",
        dataType: "json",
        //data: "{}",
        data: '{ "TaskID" : "' + TaskID + '" }', //advAmnt strINV tax1 tax2
        success: function (data) {
//            var jsdata = JSON.parse(data.d);
//            var ro = ""; 
            //            if ($('#tablepagingVehDetail').length != 0) {

            //                $('#tablepagingVehDetail').remove();
            //            }
            //          
            //            ro = "<table id='tablepagingVehDetail' class='table table-sm table-bordered table-hover table-striped w-100' ><thead  class='thead-dark'><th>Group</th><th>Vehicle</th><th>Driver</th> </thead><tbody>";
            //            $.each(jsdata, function (key, value) {

            //                //                ro += "<tr><td   class='one'>" + value.VEHTITLE + "</td><td   class='two'>" + value.Name + "</td><td style='text-align:center;'><button class='btn buttons-selected btn-danger btn-sm mr-1' tabindex='0' aria-controls='dt-basic-example' type='button'  ><span><i class='fal fa-times'></i> Delete</span></button></td></tr>";
            //                ro += "<tr><td   class='one'>" + value.VTTITLE + "</td><td   class='one'>" + value.VEHTITLE + "</td><td   class='two'>" + value.Name + "</td></tr>";

            //            });
            //            ro = ro + "</tbody></table>";
            //           

            //            $("#DivRegionVehDetail").append(ro);
            document.getElementById("DivRegionVehDetail").innerHTML = data.d;

        },
        error: function (result) {
            alert(result);
        }


    });
//    var groupColumn = 0;
//    var table = $('#tablepagingVehDetail').DataTable({
//        // sadiq bhai... m trying to help team work. i hope this will help to improve 
//        // Vehicle type column visible false. there is no need to display in every row
//        //  and disable sorting both columns VRN(Vehicle Registration Number) and Driver name)
//        "columnDefs": [
//            { "visible": false, "targets": groupColumn },
//            { "targets": [0], "orderable": false, "visible": true },
//            { "targets": [1], "orderable": false, "visible": true }
//        ],

//        "bFilter": false, // bFilter false to disable Searchfilter 
//        "info": false, // visible false (showing 1 to 10 of 10 entries)
//        "bLengthChange": false, // disable showing etries of rows

//        "order": [[groupColumn, 'asc']], // order by groupcolum Ascending 
//        "displayLength": 10,        // its upto your modal popup .. set per page rows. 
//        // using drawcallback function, which will parse through the rows which are displayed, 
//        //and enter a grouping TR element where a new group is found
//        "drawCallback": function (settings) {
//            var api = this.api();
//            var rows = api.rows({ page: 'current' }).nodes();
//            var last = null;

//            api.column(groupColumn, { page: 'current' }).data().each(function (group, i) {
//                if (last !== group) {
//                    $(rows).eq(i).before(
//                    // use your own styles for better look. 
//                        '<tr style="background-color:#c7c7c7;color:#000;" class="group"><td colspan="2">' + group + '</td></tr>'
//                    );

//                    last = group;
//                }
//            });
//        }
//    });
     

//    $('#tablepagingVehDetail').dataTable(
//                    {
//                        responsive: true,
//                        pageLength: 15,
//                        order: [
//                        [0, 'desc']
//                    ],
//                        rowGroup:
//                        {
//                            dataSrc: 0
//                        }
//                        }); 

//    var table = $('#tablepagingVehDetail').DataTable({
//        "columnDefs": [
//            { "visible": false, "targets": 0 }
//        ],
//        "bFilter": false, // bFilter false to disable Searchfilter 
//                "info": false, // visible false (showing 1 to 10 of 10 entries)
//                "bLengthChange": false, // disable showing etries of rows
//        "order": [[1, 'asc']],
//        "displayLength": 25,
//        "drawCallback": function (settings) {
//            var api = this.api();
//            var rows = api.rows({ page: 'current' }).nodes();
//            var last = null;

//            api.column(0, { page: 'current' }).data().each(function (group, i) {
//                if (last !== group) {
//                    $(rows).eq(i).before(
//                        '<tr class="group"><td colspan="2">' + group + '</td></tr>'                        
//                    );

//                    last = group;
//                }
//            });
//        }
//    });
 
   
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
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "VehicleRequest.aspx/LoadRegion",
        dataType: "json",
        data: "{}",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var ro = "";

            if ($('#dt-basic-example').length != 0) {

                $('#dt-basic-example').remove();
            }

            ro = "<table  id='dt-basic-example' class='table table-bordered table-hover table-striped w-100'><thead class='thead-themed'><th>Task ID</th><th>Title</th><th>Task Date</th><th>Area</th><th>Activity</th><th>Action</th></thead><tbody>";
            $.each(jsdata, function (key, value) {

                ro += "<tr><td   class='one'>" + value.ID + "</td><td   class='two'>" + value.Name + "</td><td   class='three'>" + value.StartDate + "</td><td   class='three'>" + value.Area + "</td><td   class='three'>" + value.ATTITLE + "</td>  <td style='text-align:center;'><button class='btn buttons-selected btn-primary btn-sm mr-1' tabindex='0' aria-controls='dt-basic-example' type='button'  onclick='LoadTaskDetail(\"" + value.ID + "\");'><span><i class='fal fa-edit mr-1'></i> View</span></button></td></tr>";

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