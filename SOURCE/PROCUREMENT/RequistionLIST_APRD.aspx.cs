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


public partial class PROCUREMENT_RequistionLIST_APRD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string LoadDATE(string UserID)
    {
        
        string vDate = "";
        string mm1 = System.DateTime.Now.Month.ToString();
        string yy1 = System.DateTime.Now.Year.ToString();
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        DataSet dsDATE = AACommon.ReturnDatasetBySP("Get_CurrentDate", Con, null);
        if (dsDATE.Tables[0].Rows.Count > 0)
        {
            mm1 = dsDATE.Tables[0].Rows[0]["MM"].ToString();
            yy1 = dsDATE.Tables[0].Rows[0]["YY"].ToString();
            vDate = mm1 + "/" + dsDATE.Tables[0].Rows[0]["DD"].ToString() + "/" + yy1;
        }
        dsDATE.Dispose();
        yy1 = Convert.ToString(Convert.ToInt32(yy1) - 2000);

        
        return vDate;
    }


    [WebMethod]
    public static string LoadLIST(string UserID)
    {
        string htm = "";
        htm = htm + "<table id='data-table' class='table table-striped table-hover no-head-border' >";
        htm = htm + "<thead class='vd_bg-dark-blue vd_white'><tr>";
        htm = htm + "<th>Requisition ID</th>";
        htm = htm + "<th>Requisition By</th>";
        htm = htm + "<th>Approved By</th>";
        htm = htm + "<th colspan='3'></th>";
        htm = htm + "</tr>";
        htm = htm + "</thead>";
        htm = htm + "<tbody>";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        DataSet ds = AACommon.ReturnDatasetBySP("PROC_REQUISITION_APPROVED_LIST", Con, null);
        DataTable dt = new DataTable();
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];        
        }

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string rqID = dt.Rows[i]["ReqID"].ToString();
            string rqBy = dt.Rows[i]["ReqByName"].ToString() + " on " + dt.Rows[i]["RqDate"].ToString();
            string appBy = dt.Rows[i]["AppBy"].ToString() + " on " + dt.Rows[i]["AppDate"].ToString();

            htm = htm + "<tr >";
            htm = htm + "<td>" + rqID + "</td>";
            htm = htm + "<td>" + rqBy +  "</td>";
            htm = htm + "<td>" + appBy + "</td>";

            htm = htm + "<td><a href=\"javascript:ShowQuotation('" + rqID + "','" + rqBy + "','" + appBy + "');\"><i class='append-icon fa fa-fw fa-file-text'></i>Quotation</a></td>";
            htm = htm + "<td><a href=\"javascript:ShowPO('" + rqID + "','" + rqBy + "','" + appBy + "');\"><i class='append-icon fa fa-fw fa-thumbs-up'></i>Issue PO</a></td>";
            htm = htm + "<td><a href='../REPORTS/Req_His.aspx?ID=" + dt.Rows[i]["ReqID"].ToString() + "' target='_blank' ><i class='append-icon fa fa-fw fa-history'></i>View History</a></td>";
            htm = htm + "</tr>";
        }
        htm = htm + "</tbody>";
        htm = htm + "</table>";
        return htm;
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
        htm = htm + "<th>Total Wt.</th>";
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
            htm = htm + "<td>" + a + "<span id='spn" + a + "' style='display:none'>" + dt.Rows[i]["ITEMID"].ToString() + "^" + dt.Rows[i]["UnitID"].ToString() + "^" + dt.Rows[i]["EstPrice"].ToString() + "^" + dt.Rows[i]["TotalPrice"].ToString() + "^" + dt.Rows[i]["Qty"].ToString() + "^" + dt.Rows[i]["TotWt"].ToString() + "^" + dt.Rows[i]["BaseMultiplier"].ToString() + "</span></td>";
            htm = htm + "<td>" + dt.Rows[i]["ITEMName"].ToString() + "</td>";
            htm = htm + "<td>" + dt.Rows[i]["Qty"].ToString() + " " + dt.Rows[i]["DisplayName"].ToString() + "<span id='spnQTY" + a + "' style='display:none'>" + dt.Rows[i]["Qty"].ToString() + "</span></td>";
            htm = htm + "<td style='text-align:right'><input type='text' id='txtWt" + a + "' class='form-control' value='" + dt.Rows[i]["TotWt"].ToString() + "' disabled   style='width:100%; border:0px none;' /></td>";
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
    public static string LoadREQUISTION_PO(string UserID, string reqID)
    {
        string htm = "";
        htm = htm + "<table id='tblPO_ItemsRequisition' class='table table-striped table-bordered dataTable no-footer' >";
        htm = htm + "<thead><tr>";
        htm = htm + "<th style='width:5%'>S.#</th>";
        htm = htm + "<th style='width:35%'>Item</th>";
        htm = htm + "<th style='width:10%'>Qty.</th>";
        htm = htm + "<th style='width:10%'>Qty. PO.</th>";
        htm = htm + "<th style='width:10%'>Qty. Bal.</th>";
        htm = htm + "<th style='width:15%'>Unit Price</th>";
        htm = htm + "<th style='width:15%'>Total Price</th>";
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
            string id = dt.Rows[i]["ID"].ToString();
            string itmID = dt.Rows[i]["ITEMID"].ToString();
            string untID = dt.Rows[i]["UnitID"].ToString();
            string itmName = dt.Rows[i]["ITEMName"].ToString();
            string Qty = dt.Rows[i]["Qty"].ToString();
            string QtyPO = dt.Rows[i]["QtyPO"].ToString();
            string QtyRem = dt.Rows[i]["QtyRem"].ToString();
            string dspName = dt.Rows[i]["DisplayName"].ToString();
            string estPrice = dt.Rows[i]["EstPrice"].ToString();
            string totPrice = dt.Rows[i]["TotalPrice"].ToString();
            string dsbld = "";
            htmMain = dt.Rows[i]["ReqID"].ToString() + "`" + dt.Rows[i]["ReqDate"].ToString() + "`" + dt.Rows[i]["ReqBy"].ToString();
            htmMain = htmMain + "`" + dt.Rows[i]["HDate"].ToString() + "`" + dt.Rows[i]["RecvdFrom"].ToString() + "`" + dt.Rows[i]["SupplierID"].ToString();
            int a = i + 1;//ITEMID SOID
            htm = htm + "<tr >";
            htm = htm + "<td>" + a + "<span id='spnPO_ALL" + a + "' style='display:none'>" + itmID + "^" + untID + "^" + estPrice + "^" + totPrice + "^" + Qty + "^" + id + "</span></td>";
            htm = htm + "<td>" + itmName + "</td>";
            htm = htm + "<td>" + Qty + " " + dspName + "<span id='spnPO_QTY" + a + "' style='display:none'>" + Qty + "</span></td>";
            htm = htm + "<td>" + QtyPO + " " + dspName + "<span id='spnPO_QTYPO" + a + "' style='display:none'>" + QtyPO + "</span></td>";
            
            if (QtyRem == "0"){ dsbld = "disabled"; }
            htm = htm + "<td><input type='text' id='txtPO_QtyBal" + a + "' class='form-control' " + dsbld + " value='" + QtyRem + "'   style='width:100%; border:0px none;' onkeyup='totPO(this);'/><span id='spnPO_QTYRem" + a + "' style='display:none'>" + QtyRem + "</span></td>";

            htm = htm + "<td style='text-align:right'><input type='text' id='txtPO_UnitPrice" + a + "' disabled class='form-control' value='" + estPrice + "'   style='width:100%; border:0px none;' onkeyup='totPO(this);'/></td>";
            htm = htm + "<td style='text-align:right'><input type='text' id='txtPO_TotalPrice" + a + "' disabled class='form-control' value='" + totPrice + "'   style='width:100%; border:0px none;'/></td>";

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
        SqlParameter CreateBy = new SqlParameter("@CreateBy",UserID);
        AACommon.Execute("PROC_QUOTATION_MASTER_INSERT", Con, QTID, ReqID, SupplierID, CreateBy);

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

    [WebMethod]
    public static string LoadQUOTATION(string reqID)
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
        SqlParameter ReqID = new SqlParameter("@ReqID",reqID);
        DataSet ds = AACommon.ReturnDatasetBySP("PROC_QUOTATION_GET", Con, ReqID);
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
    public static string LoadPOID(string frmt)
    {
        string vNO = "";

        string format1 = frmt + "-";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        vNO = AACommon.GetAlphaNumericIDSIX("PROC_QUOTATION_MASTER", format1, "QTID", Con);

        return vNO;
    }

    [WebMethod]
    public static string LoadNUMBER(string frmt, string tbl, string col, SqlConnection Con)
    {
        string vNO = "";
        string vDate = "";
        string mm1 = System.DateTime.Now.Month.ToString();
        string yy1 = System.DateTime.Now.Year.ToString();
        //SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        DataSet dsDATE = AACommon.ReturnDatasetBySP("Get_CurrentDate", Con, null);
        if (dsDATE.Tables[0].Rows.Count > 0)
        {
            mm1 = dsDATE.Tables[0].Rows[0]["MM"].ToString();
            yy1 = dsDATE.Tables[0].Rows[0]["YY"].ToString();
            vDate = mm1 + "/" + dsDATE.Tables[0].Rows[0]["DD"].ToString() + "/" + yy1;
        }
        dsDATE.Dispose();
        yy1 = Convert.ToString(Convert.ToInt32(yy1) - 2000);

        if (mm1.Length == 1) { mm1 = "0" + mm1; }
        if (yy1.Length == 1) { yy1 = "0" + yy1; }
        string format1 = frmt + "-" + mm1 + "-" + yy1 + "-";

        vNO = AACommon.GetAlphaNumericIDSIX(tbl, format1, col, Con);
        vNO = vNO + "`" + vDate;
        return vNO;
    }
    [WebMethod]
    public static string LoadNUMBER_DT(string frmt, string tbl, string fld, string dtNew, SqlConnection Con)
    {
        string vNO = "";
        string[] vDT = dtNew.Split('/');
        string mm1 = vDT[0];//System.DateTime.Now.Month.ToString();
        string yy1 = vDT[2];//System.DateTime.Now.Year.ToString();
        yy1 = Convert.ToString(Convert.ToInt32(yy1) - 2000);
        if (mm1.Length == 1) { mm1 = "0" + mm1; }
        if (yy1.Length == 1) { yy1 = "0" + yy1; }
        string format1 = frmt + "-" + mm1 + "-" + yy1 + "-";
        vNO = AACommon.GetAlphaNumericIDSIX(tbl, format1, fld, Con);
        return vNO;
    }

    [WebMethod]
    public static string SavePO(string UserID, string str, string txtVoucherNo, string ddlSupplier, string txtVDate)
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

        string aa = LoadNUMBER_DT("PO", "SO_MASTER", "SOID", txtVDate, Con);
        // string[] idDT = aa.Split('`');
        rqID = aa;// idDT[0].ToString();
        //rqDt = idDT[1].ToString();



        /////////////////////////// INSERT in PROC_REQUISITION_HISTORY //////////////////
        SqlParameter SOID = new SqlParameter("@SOID", rqID);
        SqlParameter SODate = new SqlParameter("@SODate", txtVDate);
        SqlParameter TotalAmount = new SqlParameter("@TotalAmount", "0");
        SqlParameter DiscountAmount = new SqlParameter("@DiscountAmount", "0");
        SqlParameter TaxAmount = new SqlParameter("@TaxAmount", "0");
        SqlParameter TaxRate = new SqlParameter("@TaxRate", "0");

        SqlParameter GrandTotal = new SqlParameter("@GrandTotal", "0");
        SqlParameter AccountID = new SqlParameter("@AccountID", ddlSupplier);
        SqlParameter SP = new SqlParameter("@SP", "P");//RqID
        SqlParameter RqID = new SqlParameter("@RqID", txtVoucherNo);
        AACommon.Execute("PROC_PO_MASTER_INSERT", Con, SOID, SODate, TotalAmount, DiscountAmount, TaxAmount, TaxRate, GrandTotal, AccountID, SP, RqID);


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
            string rowID = itmROW[6].ToString();

            Decimal untPQut = 0;Decimal totPr=0;
            string untP = txtPrice;
            untPQut = Convert.ToDecimal(untP); 
            totPr = Convert.ToDecimal(txtQty) * untPQut;

            SqlParameter ID = new SqlParameter("@ID", rowID);
            SqlParameter SOID_1 = new SqlParameter("@SOID", rqID);
            SqlParameter ITEMID = new SqlParameter("@ITEMID", itmID);
            SqlParameter UnitID = new SqlParameter("@UnitID", ddlUnit);
            SqlParameter QtyIn = new SqlParameter("@QtyIn", txtQty);
            SqlParameter UnitPrice = new SqlParameter("@UnitPrice", untP);
            SqlParameter TotalPrice = new SqlParameter("@TotalPrice", totPr);
            SqlParameter ReqID = new SqlParameter("@ReqID", txtVoucherNo);
            AACommon.Execute("PROC_PO_DETAIL_INSERT", Con, ID, SOID_1, ITEMID, UnitID, QtyIn, UnitPrice, TotalPrice, ReqID);

        }

        return msg;
    }

    [WebMethod]
    public static string LoadPO(string reqID)
    {
        string htm = "";
        htm = htm + "<table id='tblPO' class='table table-striped table-hover no-head-border' >";
        htm = htm + "<thead class='vd_bg-dark-blue vd_white'><tr>";
        htm = htm + "<th>PO No.</th>";
        htm = htm + "<th>Date</th>";
        htm = htm + "<th>Supplier</th>";
        htm = htm + "<th colspan='2'></th>";
        htm = htm + "</tr>";
        htm = htm + "</thead>";
        htm = htm + "<tbody>";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlParameter ReqID = new SqlParameter("@ReqID", reqID);
        DataSet ds = AACommon.ReturnDatasetBySP("PROC_PO_GET", Con, ReqID);
        DataTable dt = new DataTable();
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
        }

        for (int i = 0; i < dt.Rows.Count; i++)
        {

            htm = htm + "<tr >";
            htm = htm + "<td>" + dt.Rows[i]["SOID"].ToString() + "</td>";
            htm = htm + "<td>" + dt.Rows[i]["SODate"].ToString() + "</td>";
            htm = htm + "<td>" + dt.Rows[i]["SupplierTitle"].ToString() + "</td>";
            htm = htm + "<td><a href=\"javascript:ViewPO('" + dt.Rows[i]["SOID"].ToString() + "');\"><i class='append-icon fa fa-fw fa-search-plus'></i>View</a></td>";
            htm = htm + "<td><a href=\"javascript:DeletePO('" + dt.Rows[i]["SOID"].ToString() + "');\"><i class='append-icon fa fa-fw fa-times'></i>Delete</a></td>";
            htm = htm + "</tr>";
        }
        htm = htm + "</tbody>";
        htm = htm + "</table>";
        return htm;
    }


    [WebMethod]
    public static string SupplierEmail(string UserID, string txtVoucherNo)
    {
        string htm = "";
        
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        DataSet ds = AACommon.ReturnDatasetBySP("SUPPLIER_GET_FOR_MAIL", Con, null);
        DataTable dt = new DataTable();
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
        }

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string SuppID = dt.Rows[i]["SupplierID"].ToString();
            string SuppTitle = dt.Rows[i]["SupplierTitle"].ToString() ;
            string email = dt.Rows[i]["Email"].ToString() ;

            SqlParameter SupplierID = new SqlParameter("@SupplierID", SuppID);
            SqlParameter ReqID = new SqlParameter("@ReqID", txtVoucherNo);
            SqlParameter CreateBy = new SqlParameter("@CreateBy", UserID);
            SqlParameter SupplierTitle = new SqlParameter("@SupplierTitle", SuppTitle);
            SqlParameter Email = new SqlParameter("@Email", email);
            AACommon.Execute("PROC_QUOTATION_EMAIL_INSERT", Con, SupplierID, ReqID, CreateBy, SupplierTitle, Email);


        }
        
        return htm;
    }
}