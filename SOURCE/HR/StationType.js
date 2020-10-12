

LoadRegion();

function LoadDetail(id) {
   
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "StationType.aspx/LoadDetail",
        dataType: "json",
        //  data: "{}",
        data: '{ "id" : "' + id + '"}', //advAmnt strINV tax1 tax2
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var ro = "";


            $.each(jsdata, function (key, value) {
                document.getElementById("txtTitle").value = value.Name;
                
                document.getElementById("lblID").innerHTML = id;
                document.getElementById("btnSave").innerHTML = "Update";

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
        url: "StationType.aspx/LoadRegion",
        dataType: "json",
        data: "{}",
        success: function (data) {
            var jsdata = JSON.parse(data.d);
            var ro = "";

            if ($('#dt-basic-example').length != 0) {

                $('#dt-basic-example').remove();
            }

            ro = "<table id='dt-basic-example'class='table table-sm  dataTable dtr-inline table-hover' ><thead class='thead-themed'> <th>Title</th><th style='text-align:center;'>Action</th></thead><tbody>";
            $.each(jsdata, function (key, value) {

                ro += "<tr><td   class='two' style='width:80%;'>" + value.Name + "</td> <td style='text-align:center;width:20%;'><button class='btn buttons-selected btn-primary btn-sm mr-1' tabindex='0' aria-controls='dt-basic-example' type='button'  onclick='LoadDetail(\"" + value.ID + "\");'><span><i class='fal fa-edit mr-1'></i> Select</span></button><button class='btn buttons-selected btn-danger btn-sm mr-1' tabindex='0' aria-controls='dt-basic-example' type='button'  onclick='DeleteData(\"" + value.ID + "\");'><span><i class='fal fa-times mr-1'></i> Delete</span></button></td></tr>";

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
    
    document.getElementById("lblID").innerHTML = "";
    document.getElementById("btnSave").innerHTML = "Submit";
}

function InsertData() {
    
    var Title = document.getElementById('txtTitle').value;    
    var UserID = localStorage.getItem("UserID");
        $.ajax({
            type: 'POST',
            url: 'StationType.aspx/SaveTransaction',
            //data: {},
            data: '{ "Title" : "' + Title + '","UserID" : "' + UserID + '" }', //advAmnt strINV tax1 tax2
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                vN = msg.d;
                alert(vN);
                LoadRegion();
            }

        });
       

}

function UpdateData() {

    var Title = document.getElementById('txtTitle').value;
    
    var id = document.getElementById("lblID").innerHTML;
    var UserID = localStorage.getItem("UserID");
    $.ajax({
        type: 'POST',
        url: 'StationType.aspx/UpdateTransaction',
        //data: {},
        data: '{ "Title" : "' + Title + '", "id" : "' + id + '" ,"UserID" : "' + UserID + '"}', //advAmnt strINV tax1 tax2
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            vN = msg.d;
            alert(vN);
            LoadRegion();
        }

    });


}


function DeleteData(id) {
    var UserID = localStorage.getItem("UserID");
    $.ajax({
        type: 'POST',
        url: 'StationType.aspx/DeleteTransaction',
        //data: {},
        data: '{  "id" : "' + id + '","UserID" : "' + UserID + '" }', //advAmnt strINV tax1 tax2
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            vN = msg.d;
            alert(vN);
            LoadRegion();
        }

    });


}

function SaveData() { 
    if ($("#btnSave").text() == "Submit") {
       
        InsertData();
    }
    else if ($("#btnSave").text() == "Update") {      
        UpdateData();
    } 
    Cancel();
 

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
