<%@ Page Title="" Language="C#" MasterPageFile="~/HR/MasterPage.master" AutoEventWireup="true" CodeFile="Rights.aspx.cs" Inherits="HR_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="jquery-1.8.2.js" type="text/javascript"></script>
   
   <title>WasteEnable | User Rights</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <main id="js-page-content" role="main" class="page-content">
                        
                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class='subheader-icon fal fa-edit'></i> User Rights
                            </h1>
                        </div>
                     
                          <label  id="lblID" style="display:none;"></label>
     
                         <div class="row">
                            <div class="col-xl-12">
                                <div id="panel-1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            User Rights Information 
                                        </h2>

                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">      
                                      
                                            <form>    <asp:Label ID="lblMsg" runat="server" CssClass="parsley-errors-list" Visible="False"></asp:Label>
                                    <asp:TextBox ID="txtid" runat="server" Visible="False" CssClass="form_inputfeild" placeholder="Enter Name"></asp:TextBox>      
                                                   <div class="row">
                                                  <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="example-palaceholder">Select User</label>
                                                 <asp:DropDownList ID="ddlUser" runat="server" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                                </div>
                                                
                                                </div>
                                                  
                                                <div class="row" style="height:20px;"></div>

                                                                    
                                                 <div class="form-group" style="text-align:right;">
                                             <button type="button" id="btnSave" class="btn btn-success waves-effect waves-themed" onclick="LoadLIST();">Search</button>
                                        <%--     <button type="button" class="btn btn-danger waves-effect waves-themed">Delete</button>--%>
                                             <%--<button type="button" id="btnClear" class="btn btn-warning waves-effect waves-themed" onclick="Cancel();">Cancel</button>--%>
                                             </div>
                                               
                                            
                                            </form>
                                                                         
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>

                            
                          
                        </div>

                          <div class="row">
                            <div class="col-xl-12">
                                <div id="Div1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Rights List
                                        </h2>

                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>

                                    <div class="panel-container show">
                                        <div class="panel-content">                                          
                                            <form>
                                                
                                              <%--  <div class="form-group" id="DivRegion">
                                                    
                                                </div>--%>

                                                 <div class="row" id="dvForm" style="display:none">
                            

                            <div class="col-lg-12">
                                 <div id="dvDetail" ></div>  
                          </div>

                          <div class="col-lg-12">
                          <button type="button" id="btnApproved" class="btn btn-warning waves-effect waves-themed" onclick="SaveTransaction();">Assign Rights</button>
                              
                                    </div>

                          </div>
                                <asp:HiddenField ID="hdnid" runat="server" />
                                                </form></div></div>
                                    </div>
                                    </div></div>
                    </main>
    
         <script type="text/javascript">

             $(document).ready(function () {                 
                 $.ajax({
                     type: "POST",
                     url: "Rights.aspx/LoadUTIDCombo",
                     data: {},
                     dataType: "json",
                     contentType: "application/json; charset=utf-8",
                     success: function (data) {
                         var jsdata = JSON.parse(data.d);
                         var rows = "";
                         if ($('#ContentPlaceHolder1_ddlUser').select.length != 0) {

                             $('#ContentPlaceHolder1_ddlUser').empty();
                         }

                         $.each(jsdata, function (key, value) {
                             rows += "<option  value=" + value.ID + ">" + value.Name + "</option>";
                         });

                         $("#ContentPlaceHolder1_ddlUser").append(rows);



                     },
                     error: function (data) {
                         alert("error found");
                     }
                 });
             });


             function LoadLIST_A() {
                 document.getElementById('dvDetail').innerHTML = "";
                 //alert(document.getElementById('ContentPlaceHolder1_ddlUser').value);
                 $.ajax({
                     type: "POST",
                     contentType: "application/json; charset=utf-8",
                     url: "Rights.aspx/LoadLIST",
                     dataType: "json",
                     data: '{ "UTID" : "' + document.getElementById('ContentPlaceHolder1_ddlUser').value + '" }',
                     //async: false,
                     success: function (msg) {
                         //var jsdata = JSON.parse(data.d);
                         alert(msg.d);
                         document.getElementById('dvDetail').innerHTML = msg.d;
                     },
                     error: function (result) {
                         alert(result);
                     }
                 });

             }



             function LoadLIST() {

                 document.getElementById('dvForm').style.display = 'none';
                 document.getElementById('dvDetail').innerHTML = "";
                 $.ajax({
                     type: 'POST',
                     url: 'Rights.aspx/LoadLIST',
                     //data: {},
                     data: '{ "UTID" : "' + document.getElementById('ContentPlaceHolder1_ddlUser').value + '" }',
                     contentType: 'application/json; charset=utf-8',
                     dataType: 'json',
                     success: function (msg) {
                         //var s = msg.d.split('`');
                         // alert("Process");
                         document.getElementById('dvForm').style.display = 'block';
                         document.getElementById('dvDetail').innerHTML = msg.d;

                     }

                 });
                 // alert(tblRows);

             }



             function SaveTransaction() {
                 document.getElementById('btnApproved').value = '';
                 document.getElementById('btnApproved').className = 'progress-bar progress-bar-warning';

                 var UID = document.getElementById('ContentPlaceHolder1_ddlUser').value;
                 ///////////////////////////////////////////
                 //////////////////////////////////////////
                 //txtAccCode txtDebit txtCredit txtRefNo txtAdjDate txtDesc hdnAmount
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
                         url: 'Rights.aspx/SaveTransaction',
                         //data: {},
                         data: '{ "UID" : "' + UID + '", "dta" : "' + dta + '" }', //advAmnt strINV tax1 tax2
                         contentType: 'application/json; charset=utf-8',
                         dataType: 'json',
                         success: function (msg) {
                             vN = msg.d;
                         }

                     });
                     setTimeout(function () { document.getElementById('btnApproved').className = 'btn btn-warning waves-effect waves-themed'; document.getElementById('btnApproved').value = 'Assign Rights'; alert('Rights has been assigned'); }, 2000);
                 }

             }


</script>
</asp:Content>


