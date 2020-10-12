<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Rights_Old.aspx.cs" Inherits="Setup_Rights" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src=" jquery-1.8.2.js"></script>
    <script src="jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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

        var UID=document.getElementById('ContentPlaceHolder1_ddlUser').value;
        ///////////////////////////////////////////
        //////////////////////////////////////////
        //txtAccCode txtDebit txtCredit txtRefNo txtAdjDate txtDesc hdnAmount
        var dta="";
        var elm = {}; var tMarks = 0;
        var elms = document.getElementById('dvForm').getElementsByTagName("input");
        var str = ""; var cc = 0;
        for (var i = 0; i < elms.length; i++) {
            if (elms[i].id.indexOf('chk') != -1) {

                elm = elms[i];
                var iD = elm.id;
                if (document.getElementById(iD).checked) {
                    var nID = iD.replace("chk","");
                    if (dta == "") {
                        dta = nID ;
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
            setTimeout(function () { document.getElementById('btnApproved').className = 'btn vd_btn vd_bg-green'; document.getElementById('btnApproved').value = 'Assign Rights'; alert('Rights has been assigned'); }, 2000);
        }

    }


</script>

 <div class="panel widget light-widget panel-bd-top">
                        <div class="panel-heading bordered">
                    <h3 class="panel-title"> <span class="menu-icon"> <i class="icon-pie"></i> </span> User Rights! <b><span id="spnPONo"></span></b></h3>
                    <div class="vd_panel-menu">
  <div data-action="minimize" data-original-title="Minimize" data-toggle="tooltip" data-placement="bottom" class=" menu entypo-icon"> <i class="icon-minus3"></i> </div>
  <div data-action="refresh"  data-original-title="Refresh" data-toggle="tooltip" data-placement="bottom" class=" menu entypo-icon smaller-font"> <i class="icon-cycle"></i> </div>
  
  <div data-action="close" data-original-title="Close" data-toggle="tooltip" data-placement="bottom" class=" menu entypo-icon"> <i class="icon-cross"></i> </div>
</div>
<!-- vd_panel-menu --> 
                  </div>
                        <div class=" panel-body-list" style="padding:10px">
                     <div class="form-group">
                           <asp:HiddenField ID="hdnAccounts" runat="server" Value='["Karachi","Hyderabad","USA","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky"]' />
    <asp:HiddenField ID="hdnAmount" runat="server" Value="0" />
    <asp:HiddenField ID="hdnRemVal" runat="server" Value="0" />
    <asp:HiddenField ID="hdnNarration" runat="server" Value="0" />
     <asp:HiddenField ID="hdnDate" runat="server" Value="0" />
     <asp:HiddenField ID="hdnTotDb" runat="server" Value="0" />
     <asp:HiddenField ID="hdnTotCr" runat="server" Value="0" />
     <asp:HiddenField ID="hdnProjects" runat="server" Value="0" />
     <asp:HiddenField ID="hdnParty" runat="server" Value="0" />
     <asp:HiddenField ID="hdnDebit" runat="server" Value="0" />
                         <div class="row">
                <!-- begin col-12 -->
			    <div class="col-md-12">
			        <!-- begin panel -->
                   <div class="panel panel-inverse">
                        
                        <div class="panel-body">

                            
                                    <asp:Label ID="lblMsg" runat="server" CssClass="parsley-errors-list" Visible="False"></asp:Label>
                                    <asp:TextBox ID="txtid" runat="server" Visible="False" CssClass="form_inputfeild" placeholder="Enter Name"></asp:TextBox>                
                              
                            
                            <div class="row">
                            

                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">User</label>
                                    
                                    <div class="col-md-6">
                                     <asp:DropDownList ID="ddlUser" runat="server" CssClass="form-control"></asp:DropDownList>
                                       
                                    </div>

                                    <div class="col-md-3">
                                    <a class="btn vd_btn vd_bg-green vd_white btn-sm" href="javascript:LoadLIST();"><span class="menu-icon"><i class="fa fa-fw fa-check-circle"></i></span> Search</a>
                                    </div>
                                </div>
                            </div>

                            

                        </div>
                         <div class="row" id="dvForm" style="display:none">
                            

                            <div class="col-lg-12">
                                 <div id="dvDetail" ></div>  
                          </div>

                          <div class="col-lg-12">
                          <button type="button" id="btnApproved" class="btn vd_btn vd_bg-green" onclick="SaveTransaction();">Assign Rights</button>
                              
                                    </div>

                          </div> 
                        </div>
                   </div>
                </div>

              
</div>
                      </div>


                      
                     
                     
                     
                    
                                                                                <asp:HiddenField ID="hdnid" runat="server" />

          
                  </div>
                </div>
                <!-- Panel Widget --> 

</asp:Content>

