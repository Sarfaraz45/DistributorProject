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
public partial class PROCUREMENT_QuotationAP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string LoadREQUISTION(string UserID, string reqID)
    {
        string htm = "";
        htm = htm + "<table id='tblItemsRequisition' class='table table-striped table-bordered dataTable no-footer' >";
        htm = htm + "<thead><tr>";
        htm = htm + "<th>Sr. No.</th>";
        htm = htm + "<th>Item</th>";
        htm = htm + "<th>Qty.</th>";
        htm = htm + "<th>Unit Price</th>";
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
            htmMain = htmMain + "`" + dt.Rows[i]["HDate"].ToString() + "`" + dt.Rows[i]["RecvdFrom"].ToString();
            int a = i + 1;//ITEMID SOID
            htm = htm + "<tr >";
            htm = htm + "<td>" + a + "<span id='spn" + a + "' style='display:none'>" + dt.Rows[i]["ITEMID"].ToString() + "^" + dt.Rows[i]["UnitID"].ToString() + "^" + dt.Rows[i]["EstPrice"].ToString() + "^" + dt.Rows[i]["TotalPrice"].ToString() + "^" + dt.Rows[i]["Qty"].ToString() + "</span></td>";
            htm = htm + "<td>" + dt.Rows[i]["ITEMName"].ToString() + "</td>";
            htm = htm + "<td>" + dt.Rows[i]["Qty"].ToString() + " " + dt.Rows[i]["DisplayName"].ToString() + "<span id='spnQTY" + a + "' style='display:none'>" + dt.Rows[i]["Qty"].ToString() + "</span></td>";
            htm = htm + "<td style='text-align:right'><input type='text' id='txtUnitPrice" + a + "' class='form-control' value='0'   style='width:100%; border:0px none;' onkeyup='tot(this);'/></td>";
            htm = htm + "<td style='text-align:right'><input type='text' id='txtTotalPrice" + a + "' disabled class='form-control' value='0'   style='width:100%; border:0px none;'/></td>";

            htm = htm + "</tr>";
        }
        htm = htm + "</tbody>";
        htm = htm + "</table>";
        htm = htm + "`" + htmMain;
        return htm;
    }

    [WebMethod]
    public static string LoadQUOTATION(string reqID, string SuppID)
    {
        string htm = "";
        htm = htm + "<table id='tblQuoatation' class='table table-striped table-hover no-head-border' >";
        htm = htm + "<thead class='vd_bg-dark-blue vd_white'><tr>";
        htm = htm + "<th>Quotation Date</th>";
        htm = htm + "<th>Supplier</th>";
        htm = htm + "<th>Date</th>";
        htm = htm + "<th colspan='2'></th>";
        htm = htm + "</tr>";
        htm = htm + "</thead>";
        htm = htm + "<tbody>";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlParameter ReqID = new SqlParameter("@ReqID", reqID);
        SqlParameter SupplierID = new SqlParameter("@SupplierID", SuppID);
        DataSet ds = AACommon.ReturnDatasetBySP("PROC_QUOTATION_GET_BY_SUPPLIER", Con, ReqID, SupplierID);
        DataTable dt = new DataTable();
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
        }

        for (int i = 0; i < dt.Rows.Count; i++)
        {

            htm = htm + "<tr >";
            htm = htm + "<td>" + dt.Rows[i]["QTDate"].ToString() + "</td>";
            htm = htm + "<td>" + dt.Rows[i]["SupplierTitle"].ToString() + "</td>";
            htm = htm + "<td>" + dt.Rows[i]["TotalAmount"].ToString() + "</td>";
            htm = htm + "<td><a href='../Reports/PROC_QUOTATION_INFO.aspx?a=" + dt.Rows[i]["QTID"].ToString() + "' target='_blank'><i class='append-icon fa fa-fw fa-search-plus'></i>View</a></td>";
            htm = htm + "<td><a href=\"javascript:DeleteQuotation('" + dt.Rows[i]["QTID"].ToString() + "');\"><i class='append-icon fa fa-fw fa-times'></i>Delete</a></td>";
            htm = htm + "</tr>";
        }
        htm = htm + "</tbody>";
        htm = htm + "</table>";
        return htm;
    }

    [WebMethod]
    public static string LoadHistoryID(string frmt)
    {
        string vNO = "";

        string format1 = frmt + "-";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        vNO = AACommon.GetAlphaNumericIDSIX("PROC_QUOTATION_MASTER", format1, "QTID", Con);

        return vNO;
    }

    [WebMethod]
    public static string SaveQuotation(string UserID, string str, string txtVoucherNo, string ddlSupplier)
    {
        string msg = "";

        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        string rqID = "";
        string rqHID = "";
        string rqDt = "";
        string rqBy = UserID;
        string rqAt = "";
        string stsID = "";// 0:Pending, 1:Approved, 2:Rejected


        ///////////////////////// ID GNERATOR /////////////////////////////


        rqHID = LoadHistoryID("QT");



        /////////////////////////// INSERT in PROC_REQUISITION_HISTORY //////////////////
        SqlParameter QTID = new SqlParameter("@QTID", rqHID);
        SqlParameter ReqID = new SqlParameter("@ReqID", txtVoucherNo);
        SqlParameter SupplierID = new SqlParameter("@SupplierID", ddlSupplier);
        SqlParameter CreateBy = new SqlParameter("@CreateBy", UserID);
        AACommon.Execute("PROC_QUOTATION_MASTER_INSERT_V2", Con, QTID, ReqID, SupplierID, CreateBy);

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

            SqlParameter QTID_1 = new SqlParameter("@QTID", rqHID);
            SqlParameter ITEMID = new SqlParameter("@ITEMID", itmID);
            SqlParameter UnitID = new SqlParameter("@UnitID", ddlUnit);
            SqlParameter Qty = new SqlParameter("@Qty", txtQty);
            SqlParameter UnitPrice = new SqlParameter("@UnitPrice", txtPrice);
            SqlParameter TotalPrice = new SqlParameter("@TotalPrice", txtTotalPrice);
            AACommon.Execute("PROC_QUOTATION_DETAIL_INSERT", Con, QTID_1, ITEMID, UnitID, Qty, UnitPrice, TotalPrice);

        }

        return msg;
    }

}