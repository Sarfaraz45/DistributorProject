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

public partial class PURCHASE_PURCHASE_RETURN : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string SET_DATE()
    {
        string summary = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        // System.Windows.Forms.MessageBox.Show(summary);
        try
        {
            DataTable dt = AACommon.LoadControl("DATE_FILTER", con, null);


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i > 0) { summary = summary + "`"; }

                summary = summary + dt.Rows[i]["WeekStart"].ToString() + "`" + dt.Rows[i]["WeekEnd"].ToString();
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);

            //return null;
        }
        //}

        return summary;
    }

    [WebMethod]
    public static string LOAD_ACCOUNTS(string UserID)
    {

        string acc = "";
        string query = "SELECT [SupplierID],[SupplierTitle] + '^' + [SupplierID] AS SupplierTitle FROM [Supplier] where ISDELETE=0";
        string Con = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        SqlDataAdapter da = new SqlDataAdapter(query, Con);
        DataTable dt = new DataTable();
        da.Fill(dt);

        for (int i = 1; i <= dt.Rows.Count; i++)
        {
            //'["Karachi","Hyderabad","USA","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky"]'
            if (i == 1)
            { acc = acc + "['" + dt.Rows[i - 1]["SupplierTitle"].ToString() + "'"; }
            else if (i != 1 && i < dt.Rows.Count)
            { acc = acc + ",'" + dt.Rows[i - 1]["SupplierTitle"].ToString() + "'"; }
            else
            { acc = acc + ",'" + dt.Rows[i - 1]["SupplierTitle"].ToString() + "']"; }

            //acc = acc + "!" + dt.Rows[i-1]["AccountTitle"].ToString();
        }

        acc = SET_DATE() + "`" + acc;
        return acc;
    }

    [WebMethod]
    public static string LoadLIST(string cusID, string dtFROM, string dtTO)
    {
        string htm = "";
        htm = htm + "<table id='data-table' class='table table-striped table-hover no-head-border' >";
        htm = htm + "<thead class='vd_bg-dark-blue vd_white'><tr>";
        htm = htm + "<th>GR No.</th>";
        htm = htm + "<th>GR Date</th>";
        htm = htm + "<th>PO No.</th>";
        htm = htm + "<th>Supplier</th>";
        htm = htm + "<th></th>";
        htm = htm + "</tr>";
        htm = htm + "</thead>";
        htm = htm + "<tbody>";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlParameter DtFrom = new SqlParameter("@DtFrom", dtFROM);
        SqlParameter DtTo = new SqlParameter("@DtTo", dtTO);
        SqlParameter SupplierID = new SqlParameter("@SupplierID", cusID);
        DataSet ds = AACommon.ReturnDatasetBySP("PURCHASE_ORDER_FOR_RETURN_V2", Con, DtFrom, DtTo, SupplierID);
        DataTable dt = new DataTable();
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
        }

        for (int i = 0; i < dt.Rows.Count; i++)
        {

            htm = htm + "<tr >";
            htm = htm + "<td>" + dt.Rows[i]["SPID"].ToString() + "</td>";
            htm = htm + "<td>" + dt.Rows[i]["SPDate"].ToString() + "</td>";
            htm = htm + "<td>" + dt.Rows[i]["OrderNo"].ToString() + "</td>";
            htm = htm + "<td>" + dt.Rows[i]["SupplierTitle"].ToString() + "</td>";
            htm = htm + "<td><a href=\"javascript:ShowPO('" + dt.Rows[i]["SPID"].ToString() + "');\"><i class='append-icon fa fa-fw fa-file-text'></i>View</a></td>";
            htm = htm + "</tr>";
        }
        htm = htm + "</tbody>";
        htm = htm + "</table>";
        return htm;
    }




    [WebMethod]
    public static string ShowPO(string UserID, string PONO)
    {
        string htm = "";
        htm = htm + "<table id='tblPO_ItemsRequisition' class='table table-striped table-bordered dataTable no-footer' >";
        htm = htm + "<thead><tr>";
        htm = htm + "<th style='width:5%'>S.#</th>";
        htm = htm + "<th style='width:50%'>Item</th>";
        htm = htm + "<th style='width:15%'>Total kg</th>";
        htm = htm + "<th style='width:15%'>kg Return</th>";
        htm = htm + "<th style='width:15%'>kg Rem</th>";
        htm = htm + "</tr>";
        htm = htm + "</thead>";
        htm = htm + "<tbody>";
        string htmMain = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlParameter OrderNo = new SqlParameter("@OrderNo", PONO);
        DataSet ds = AACommon.ReturnDatasetBySP("PURCHASE_ORDER_FOR_RETURN", Con, OrderNo);
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
            string QtyPO = dt.Rows[i]["QtyReturn"].ToString();
            string QtyRem = dt.Rows[i]["QtyRem"].ToString();
            string dspName = dt.Rows[i]["DisplayName"].ToString();
            string estPrice = dt.Rows[i]["UnitPrice"].ToString();
            Decimal totP = Convert.ToDecimal(estPrice) * Convert.ToDecimal(Qty);
            string totPrice = Convert.ToString(totP);
            string suppID = dt.Rows[i]["AccountID"].ToString();
            string whid = dt.Rows[i]["WHID"].ToString();
            string dsbld = "";

            int a = i + 1;//ITEMID SOID
            htm = htm + "<tr >";
            htm = htm + "<td>" + a + "<span id='spnPO_ALL" + a + "' style='display:none'>" + itmID + "^" + untID + "^" + estPrice + "^" + totPrice + "^" + Qty + "^" + id + "^" + suppID + "^" + whid + "</span></td>";
            htm = htm + "<td>" + itmName + "</td>";
            htm = htm + "<td>" + Qty + "<span id='spnPO_QTY" + a + "' style='display:none'>" + Qty + "</span></td>";
            htm = htm + "<td>" + QtyPO + "<span id='spnPO_QTYPO" + a + "' style='display:none'>" + QtyPO + "</span></td>";

            if (QtyRem == "0") { dsbld = "disabled"; }
            htm = htm + "<td><input type='text' id='txtPO_QtyBal" + a + "' class='form-control' " + dsbld + " value='" + QtyRem + "'   style='width:100%; border:0px none;' /><span id='spnPO_QTYRem" + a + "' style='display:none'>" + QtyRem + "</span></td>";

            htm = htm + "</tr>";
        }
        htm = htm + "</tbody>";
        htm = htm + "</table>";
        return htm;
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
    public static string SaveGoods(string UserID, string str, string txtVoucherNo, string ddlSupplier, string whid, string vDate)
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
        //string aa = LoadNUMBER("IR", "SP_MASTER", "SPID", Con);
        //string[] idDT = aa.Split('`');
        //rqID = idDT[0].ToString();
        //rqDt = idDT[1].ToString();

        string aa = LoadNUMBER_DT("IR", "SP_MASTER", "SPID", vDate, Con);
        //string[] idDT = aa.Split('`');
        rqID = aa;// idDT[0].ToString();
        // rqDt = idDT[1].ToString();

        // rqHID = LoadHistoryID(rqID);




        /////////////////////////// INSERT in SP MASTER //////////////////
        SqlParameter SPID = new SqlParameter("@SPID", rqID);
        SqlParameter SPDate = new SqlParameter("@SPDate", vDate);
        SqlParameter TotalAmount = new SqlParameter("@TotalAmount", "0");
        SqlParameter DiscountAmount = new SqlParameter("@DiscountAmount", "0");
        SqlParameter TaxAmount = new SqlParameter("@TaxAmount", "0");
        SqlParameter TaxRate = new SqlParameter("@TaxRate", "0");

        SqlParameter GrandTotal = new SqlParameter("@GrandTotal", "0");
        SqlParameter AccountID = new SqlParameter("@AccountID", ddlSupplier);
        SqlParameter SP = new SqlParameter("@SP", "IR");
        SqlParameter OrderNo = new SqlParameter("@OrderNo", txtVoucherNo);
        SqlParameter WHID = new SqlParameter("@WHID", whid);
        AACommon.Execute("SP_MASTER_INSERT_RET", Con, SPID, SPDate, TotalAmount, DiscountAmount, TaxAmount, TaxRate, GrandTotal, AccountID, SP, OrderNo, WHID);



        /////////////////////// INSERT in SP DETAIL
        Decimal totAmnt = 0;
        string[] itmLST = str.Split('`');
        for (int i = 0; i < itmLST.Length; i++)
        {
            string[] itmROW = itmLST[i].Split('^');
            //txtAccID + "^" + txtAccTitle + "^" + ddlUnit + "^" + txtQty + "^" + txtPrice + "^" + txtTotalPrice
            if (itmROW.Length > 1)
            {
                string itmID = itmROW[0].ToString();
                string ddlUnit = itmROW[2].ToString();
                string txtQty = itmROW[3].ToString();
                string txtPrice = itmROW[4].ToString();
                string txtTotalPrice = itmROW[5].ToString();
                string rID = itmROW[6].ToString();

                totAmnt = totAmnt + Convert.ToDecimal(txtTotalPrice);

                SqlParameter SPID_1 = new SqlParameter("@SPID", rqID);
                SqlParameter ITEMID = new SqlParameter("@ITEMID", itmID);
                SqlParameter UnitID = new SqlParameter("@UnitID", ddlUnit);
                SqlParameter QtyIn = new SqlParameter("@QtyIn", txtQty);
                SqlParameter UnitPrice = new SqlParameter("@UnitPrice", txtPrice);
                SqlParameter TotalPrice = new SqlParameter("@TotalPrice", txtTotalPrice);
                SqlParameter rowID = new SqlParameter("@rowID", rID);
                SqlParameter OrderID = new SqlParameter("@OrderID", txtVoucherNo);
                SqlParameter Amnt = new SqlParameter("@Amnt", totAmnt);
                AACommon.Execute("SP_DETAIL_INSERT_IR", Con, SPID_1, ITEMID, UnitID, QtyIn, UnitPrice, TotalPrice, rowID, OrderID, Amnt);
            }
        }

        ////////////////////SAVE TRANSACTION IN ACCOUNTS ////////////////////
        //SaveTransactionACC(UserID, rqDt, rqID, "SR", totAmnt, "Sale Return", ddlSupplier);
        ///////////////////////////////////////////////////////////////////////

        return msg;
    }


    [WebMethod]
    public static string SaveTransactionACC(string UserID, string txtVDate, string txtVoucherNo, string ddlVoucherType, Decimal amnt, string txtTrans, string ddlSupplier)
    {

        string acc = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConACC"].ConnectionString);
        SqlConnection ConOPT = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);

        string f = LoadNUMBER_DT("File", "tbl_transaction", "FileNo", txtVDate, Con);
        //string[] fN = f.Split('`');
        string FNo = f;// fN[0];

        string v = LoadNUMBER_DT(ddlVoucherType, "tbl_transaction", "TaskID", txtVDate, Con);
        //string[] vN = v.Split('`');
        string vNo = v;// vN[0];

        SqlParameter dt = new SqlParameter("@Date", txtVDate);
        SqlParameter Narration = new SqlParameter("@Narration", txtTrans);
        SqlParameter amount = new SqlParameter("@Amount", amnt);
        SqlParameter Fiscalid = new SqlParameter("@FISCALID", "22");
        SqlParameter Companyid = new SqlParameter("@COMPANYID", "12");
        SqlParameter Active = new SqlParameter("@Active", "1");
        SqlParameter FileNo = new SqlParameter("@FileNo", FNo);
        SqlParameter TaskID = new SqlParameter("@TaskID", vNo);
        AACommon.Execute("Insert_Transaction", Con, dt, amount, Narration, Fiscalid, Companyid, Active, FileNo, TaskID);


        string dbAccID = AACommon.GetData("SELECT AccountID FROM AACCOUNTS_Integration WHERE (Description = 'Purchase')", Con, "AccountID"); ;
        
        string crAccID = AACommon.GetData("select LedgerID from Customer where CustomerID='" + ddlSupplier + "'", ConOPT, "LedgerID");
        //////////////////////// Debit //////////////////
        SqlParameter debit = new SqlParameter("@debit", "0");
        SqlParameter credit = new SqlParameter("@credit", amnt);
        SqlParameter Accid1 = new SqlParameter("@Accid1", "");
        SqlParameter Accid = new SqlParameter("@Accid", crAccID);
        SqlParameter Accounttype = new SqlParameter("@Accounttype", "");
        SqlParameter Acounttype1 = new SqlParameter("@Acounttype1", "");
        SqlParameter FISCALID = new SqlParameter("@FISCALID", "22");
        SqlParameter COMPANYID = new SqlParameter("@COMPANYID", "12");
        SqlParameter chequeno = new SqlParameter("@chequeno", "");
        SqlParameter ID = new SqlParameter("@ID", "0");
        SqlParameter BillNo = new SqlParameter("@BillNo", "0");

        SqlParameter Narration2 = new SqlParameter("@Narration2", txtTrans);

        SqlParameter FileNo2 = new SqlParameter("@FileNo", FNo);
        SqlParameter ProjectID = new SqlParameter("@ProjectID", "0");
        SqlParameter chequedate = new SqlParameter("@chequedate", "");
        AACommon.Execute("Insert_TransactionDetail_V2", Con, debit, credit, Accid1, Accid, Accounttype, Acounttype1, FISCALID, COMPANYID, chequeno, ID, BillNo, Narration2, FileNo2, ProjectID, chequedate);

        //////////////////////// Credit //////////////////
        SqlParameter debit_1 = new SqlParameter("@debit", amnt);
        SqlParameter credit_1 = new SqlParameter("@credit", "0");
        SqlParameter Accid1_1 = new SqlParameter("@Accid1", "");
        SqlParameter Accid_1 = new SqlParameter("@Accid", dbAccID);
        SqlParameter Accounttype_1 = new SqlParameter("@Accounttype", "");
        SqlParameter Acounttype1_1 = new SqlParameter("@Acounttype1", "");
        SqlParameter FISCALID_1 = new SqlParameter("@FISCALID", "22");
        SqlParameter COMPANYID_1 = new SqlParameter("@COMPANYID", "12");
        SqlParameter chequeno_1 = new SqlParameter("@chequeno", "");
        SqlParameter ID_1 = new SqlParameter("@ID", "0");
        SqlParameter BillNo_1 = new SqlParameter("@BillNo", "0");

        SqlParameter Narration2_1 = new SqlParameter("@Narration2", txtTrans);

        SqlParameter FileNo2_1 = new SqlParameter("@FileNo", FNo);
        SqlParameter ProjectID_1 = new SqlParameter("@ProjectID", "0");
        SqlParameter chequedate_1 = new SqlParameter("@chequedate", "");
        AACommon.Execute("Insert_TransactionDetail_V2", Con, debit_1, credit_1, Accid1_1, Accid_1, Accounttype_1, Acounttype1_1, FISCALID_1, COMPANYID_1, chequeno_1, ID_1, BillNo_1, Narration2_1, FileNo2_1, ProjectID_1, chequedate_1);



        return acc;
    }


    [WebMethod]
    public static string LoadGoods_List(string POID)
    {
        string htm = "";
        htm = htm + "<table id='tblGoodsReceived' class='table table-striped table-hover no-head-border' >";
        htm = htm + "<thead class='vd_bg-dark-blue vd_white'><tr>";
        htm = htm + "<th>PR No.</th>";
        htm = htm + "<th>Date</th>";
        htm = htm + "<th colspan='1'></th>";
        htm = htm + "</tr>";
        htm = htm + "</thead>";
        htm = htm + "<tbody>";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlParameter OrderID = new SqlParameter("@OrderID", POID);
        DataSet ds = AACommon.ReturnDatasetBySP("PURCHASE_RETURN_GET", Con, OrderID);
        DataTable dt = new DataTable();
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
        }

        for (int i = 0; i < dt.Rows.Count; i++)
        {

            htm = htm + "<tr >";
            htm = htm + "<td>" + dt.Rows[i]["SPID"].ToString() + "</td>";
            htm = htm + "<td>" + dt.Rows[i]["SPDate"].ToString() + "</td>";
            htm = htm + "<td><a href='../Reports/SALE_DC.aspx?a=" + dt.Rows[i]["SPID"].ToString() + "' target=_blank><i class='append-icon fa fa-fw fa-search-plus'></i>View</a></td>";

            htm = htm + "</tr>";
        }
        htm = htm + "</tbody>";
        htm = htm + "</table>";
        return htm;
    }
}