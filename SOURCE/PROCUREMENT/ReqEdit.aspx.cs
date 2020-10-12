using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Data.Sql;
using System.Web.Script.Serialization;
using System.IO;
public partial class Transaction_ReqEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string LoadLIST(string UserID, string reqID)
    {
        string htm = "";
        htm = htm + "<table id='tblItems' class='table table-striped table-bordered dataTable no-footer' >";
        htm = htm + "<thead><tr>";
        htm = htm + "<th>Sr. No.</th>";
        htm = htm + "<th></th>";
        htm = htm + "<th>Item</th>";
        htm = htm + "<th>Qty.</th>";
        htm = htm + "<th>Approved Qty.</th>";
        htm = htm + "<th>Est. Unit Price</th>";
        htm = htm + "<th>Total Price</th>";
        htm = htm + "</tr>";
        htm = htm + "</thead>";
        htm = htm + "<tbody>";
        string htmMain = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlParameter ReqID = new SqlParameter("@ReqID", reqID);
        DataSet ds = AACommon.ReturnDatasetBySP("PROC_REQUISITION_RCVD_DETAIL", Con, ReqID);
        DataTable dt = new DataTable();
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
        }

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            htmMain = dt.Rows[i]["ReqID"].ToString() + "`" + dt.Rows[i]["ReqDate"].ToString() + "`" + dt.Rows[i]["ReqBy"].ToString();
            htmMain = htmMain + "`" + dt.Rows[i]["HDate"].ToString() + "`" + dt.Rows[i]["RecvdFrom"].ToString() ;
            int a = i + 1;//ITEMID SOID
            htm = htm + "<tr >";
            htm = htm + "<td>" + a + "</td>";
            htm = htm + "<td><input type='checkbox' id='chk" + a + "' checked=checked /><span id='spn" + a + "' style='display:none'>" + dt.Rows[i]["ITEMID"].ToString() + "^" + dt.Rows[i]["UnitID"].ToString() + "^" + dt.Rows[i]["EstPrice"].ToString() + "^" + dt.Rows[i]["TotalPrice"].ToString() + "</span></td>";
            htm = htm + "<td>" + dt.Rows[i]["ITEMName"].ToString() + "</td>";
            htm = htm + "<td>" + dt.Rows[i]["Qty"].ToString() + " " + dt.Rows[i]["DisplayName"].ToString() + "</td>";
            htm = htm + "<td><input type='text' id='txtAprvdQty" + a + "' class='form-control' value='" + dt.Rows[i]["Qty"].ToString() + "'   style='width:100%; border:0px none;' onkeyup='tot(this);'/></td>";
            htm = htm + "<td style='text-align:right'>" + dt.Rows[i]["EstPrice"].ToString() + "</td>";
            htm = htm + "<td style='text-align:right'>" + dt.Rows[i]["TotalPrice"].ToString() + "</td>";
            
            htm = htm + "</tr>";
        }
        htm = htm + "</tbody>";
        htm = htm + "</table>";
        htm = htm + "`" + htmMain;
        return htm;
    }

    [WebMethod]
    public static string LoadHistoryID(string frmt)
    {
        string vNO = "";

        string format1 = frmt + "-";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        vNO = AACommon.GetAlphaNumericIDSIX("PROC_REQUISITION_HISTORY", format1, "ReqHID", Con);

        return vNO;
    }

    [WebMethod]
    public static string SaveTransaction(string UserID, string str,  string txtVoucherNo)
    {
        string msg = "";


        string rqID = "";
        string rqHID = "";
        string rqDt = "";
        string rqBy = UserID;
        string rqAt = "";
        string stsID = "";// 0:Pending, 1:Approved, 2:Rejected


        ///////////////////////// ID GNERATOR /////////////////////////////


        rqHID = LoadHistoryID(txtVoucherNo);

        ///////////////////////// USER STATUS /////////////////////////////
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlParameter LvlUser = new SqlParameter("@LvlUser", UserID);
        DataSet ds = AACommon.ReturnDatasetBySP("PROC_REQ_NXT_USER", Con, LvlUser);

        if (ds.Tables[0].Rows.Count > 0)
        {
            string nxtUSR = ds.Tables[0].Rows[0]["nxtUSR"].ToString();
            if (ds.Tables[0].Rows[0]["nxtUSR"].ToString() == "0")
            {
                stsID = "1";
                rqAt = nxtUSR;

            }
            else
            {
                stsID = "1";
                rqAt = nxtUSR;
            }

        }
        ds.Dispose();


        /////////////////////////// INSERT in PROC_REQUISITION_HISTORY //////////////////
        SqlParameter ReqHID = new SqlParameter("@ReqHID", rqHID);
        SqlParameter ReqID_1 = new SqlParameter("@ReqID", txtVoucherNo);
        SqlParameter SendBy = new SqlParameter("@SendBy", rqBy);
        SqlParameter SendTo = new SqlParameter("@SendTo", rqAt);
        SqlParameter StatusID = new SqlParameter("@StatusID", stsID);
        AACommon.Execute("PROC_REQUISITION_HISTORY_INSERT_V2", Con, ReqHID, ReqID_1, SendBy, SendTo, StatusID);

        /////////////////////// INSERT in REQUISITION DETAIL

        string[] itmLST = str.Split('`');
        for (int i = 0; i < itmLST.Length; i++)
        {
            string[] itmROW = itmLST[i].Split('^');
            //txtAccID + "^" + txtAccTitle + "^" + ddlUnit + "^" + txtQty + "^" + txtPrice + "^" + txtTotalPrice
            string itmID = itmROW[0].ToString();
            string ddlUnit = itmROW[2].ToString();
            string txtQty = itmROW[3].ToString();
            string txtPrice = itmROW[4].ToString();
            string txtTotalPrice = itmROW[5].ToString();

            SqlParameter ReqHID_1 = new SqlParameter("@ReqHID", rqHID);
            SqlParameter ITEMID = new SqlParameter("@ITEMID", itmID);
            SqlParameter UnitID = new SqlParameter("@UnitID", ddlUnit);
            SqlParameter Qty = new SqlParameter("@Qty", txtQty);
            SqlParameter EstPrice = new SqlParameter("@EstPrice", txtPrice);
            SqlParameter TotalPrice = new SqlParameter("@TotalPrice", txtTotalPrice);
            SqlParameter EntryBy = new SqlParameter("@EntryBy", rqBy);
            AACommon.Execute("PROC_REQUISITION_DETAIL_INSERT", Con, ReqHID_1, ITEMID, UnitID, Qty, EstPrice, TotalPrice, EntryBy);

        }

        return msg;
    }
}