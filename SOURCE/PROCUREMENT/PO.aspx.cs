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

public partial class PROCUREMENT_PO : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [WebMethod]
    public static string LoadNUMBER(string frmt)
    {
        string vNO = "";
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

        if (mm1.Length == 1) { mm1 = "0" + mm1; }
        if (yy1.Length == 1) { yy1 = "0" + yy1; }
        string format1 = frmt + "-" + mm1 + "-" + yy1 + "-";

        vNO = AACommon.GetAlphaNumericIDSIX("SO_MASTER", format1, "SOID", Con);
        vNO = vNO + "`" + vDate;
        return vNO;
    }


    [WebMethod]
    public static string LoadHistoryID(string frmt)
    {
        string vNO = "";
        
        string format1 = frmt + "-" ;
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        vNO = AACommon.GetAlphaNumericIDSIX("PROC_REQUISITION_HISTORY", format1, "ReqHID", Con);
        
        return vNO;
    }

    [WebMethod]
    public static string LOAD_ITEMS(string UserID)
    {

        string acc = ""; string htmUNT = "";
        string query = "SELECT ITEMID, ITEMID+ ' ^ ' +ITEMName + ' ^ ' + Convert(varchar(12),Wt)  as ITEMName, ItemCode,UnitTypeID FROM ITM_ITEM WHERE ([IsDelete] = '0')";
        string Con = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        SqlDataAdapter da = new SqlDataAdapter(query, Con);
        DataTable dt = new DataTable();
        da.Fill(dt);

        for (int i = 1; i <= dt.Rows.Count; i++)
        {
            string itmID = dt.Rows[i - 1]["ITEMID"].ToString();
            string UntTyp = dt.Rows[i - 1]["UnitTypeID"].ToString();
            //'["Karachi","Hyderabad","USA","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky"]'
            if (i == 1)
            { acc = acc + "['" + dt.Rows[i - 1]["ITEMName"].ToString() + "'"; }
            else if (i != 1 && i < dt.Rows.Count)
            { acc = acc + ",'" + dt.Rows[i - 1]["ITEMName"].ToString() + "'"; }
            else
            { acc = acc + ",'" + dt.Rows[i - 1]["ITEMName"].ToString() + "']"; }

            htmUNT = htmUNT+LoadUNITS(itmID, UntTyp);
        }
        acc = acc + "`" + LoadNUMBER("PO") + "`" + htmUNT + "`" + LOAD_Supplier();
        return acc;
    }

    [WebMethod]
    public static string LOAD_Supplier()
    {

        string acc = "";
        string query = "SELECT [SupplierID],[SupplierTitle] + '^' + [SupplierID] AS SupplierTitle FROM [Supplier] where ISDELETE='0'";
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

        return acc;
    }


    [WebMethod]
    public static string LoadUNITS(string itmID, string UntTyp)
    {
        string vUNT = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlParameter UnitTypeID = new SqlParameter("@UnitTypeID", UntTyp);
        DataSet ds = AACommon.ReturnDatasetBySP("ITM_UNITS_GET", Con, UnitTypeID);
        vUNT = "<span id='spnUNT" + itmID + "' style='display:none;'>";
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++ )
        {
            if (i == 0)
            {
                vUNT = vUNT + ds.Tables[0].Rows[i]["UnitID"].ToString() + "^" + ds.Tables[0].Rows[i]["DisplayName"].ToString() + "^" + ds.Tables[0].Rows[i]["BaseMultiplier"].ToString();
            }
            else
            {
                vUNT = vUNT + "~" + ds.Tables[0].Rows[i]["UnitID"].ToString() + "^" + ds.Tables[0].Rows[i]["DisplayName"].ToString() + "^" + ds.Tables[0].Rows[i]["BaseMultiplier"].ToString();
            }
            
        }
        ds.Dispose();
        vUNT = vUNT + "</span>";
        return vUNT;
    }

    [WebMethod]
    public static string LoadNUMBER_DT(string frmt, string dtNew)
    {
        string vNO = "";
        string vDate = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);

        string[] vDT = dtNew.Split('/');
        string mm1 = vDT[0];//System.DateTime.Now.Month.ToString();
        string yy1 = vDT[2];//System.DateTime.Now.Year.ToString();

        yy1 = Convert.ToString(Convert.ToInt32(yy1) - 2000);

        if (mm1.Length == 1) { mm1 = "0" + mm1; }
        if (yy1.Length == 1) { yy1 = "0" + yy1; }
        string format1 = frmt + "-" + mm1 + "-" + yy1 + "-";

        vNO = AACommon.GetAlphaNumericIDSIX("PROC_REQUISITION", format1, "ReqID", Con);
        return vNO;
    }

    [WebMethod]
    public static string SaveTransaction_OLD(string UserID, string str, string txtVDate, string txtVoucherNo, string ddlSupplier, string txtTotAmount)
    {
        string msg = "";


        string rqID = "";
        string rqHID = "";
        string rqDt = "";
        string rqBy = UserID;
        string rqAt = "";
        string stsID = "";// 0:Pending, 1:Approved, 2:Rejected


        ///////////////////////// ID GNERATOR /////////////////////////////
        string aa = LoadNUMBER_DT("RQ", txtVDate);
       // string[] idDT = aa.Split('`');
        rqID = aa;// idDT[0].ToString();
        //rqDt = idDT[1].ToString();

        rqHID = LoadHistoryID(rqID);

        ///////////////////////// USER STATUS /////////////////////////////
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlParameter LvlUser = new SqlParameter("@LvlUser", UserID);
        DataSet ds = AACommon.ReturnDatasetBySP("PROC_REQ_NXT_USER", Con, LvlUser);
        
        if (ds.Tables[0].Rows.Count>0)
        {
            string nxtUSR = ds.Tables[0].Rows[0]["nxtUSR"].ToString();
            if (ds.Tables[0].Rows[0]["nxtUSR"].ToString() == "0")
            {
                stsID = "1";
                rqAt = nxtUSR;

            }
            else
            { 
                stsID = "0";
                rqAt = nxtUSR;
            }

        }
        ds.Dispose();

        string prty = AACommon.GetData("select SupplierTitle from Supplier where SupplierID='" + ddlSupplier + "'", Con, "SupplierTitle");
        /////////////////////////// INSERT in PROC_REQUISITION //////////////////
        SqlParameter ReqID = new SqlParameter("@ReqID",rqID);
        SqlParameter ReqDate = new SqlParameter("@ReqDate", txtVDate);
        SqlParameter ReqBy = new SqlParameter("@ReqBy", rqBy);
        SqlParameter ReqAt = new SqlParameter("@ReqAt", rqAt);
        SqlParameter SupplierID = new SqlParameter("@SupplierID", ddlSupplier);
        SqlParameter StatusID = new SqlParameter("@StatusID", stsID);
        AACommon.Execute("PROC_REQUISITION_INSERT_V2", Con, ReqID, ReqDate, ReqBy, ReqAt,SupplierID, StatusID);

        /////////////////////////// INSERT in PROC_REQUISITION_HISTORY //////////////////
        SqlParameter ReqHID = new SqlParameter("@ReqHID", rqHID);
        SqlParameter ReqID_1 = new SqlParameter("@ReqID", rqID);
        SqlParameter SendBy = new SqlParameter("@SendBy", rqBy);
        SqlParameter SendTo = new SqlParameter("@SendTo", rqAt);
       AACommon.Execute("PROC_REQUISITION_HISTORY_INSERT", Con, ReqHID, ReqID_1, SendBy, SendTo);

        /////////////////////// INSERT in REQUISITION DETAIL

        string[] itmLST = str.Split('`');
        string htmLIST = ""; Decimal totPrice = 0;
        for (int i = 0; i < itmLST.Length; i++)
        {
            string[] itmROW = itmLST[i].Split('^');
            //txtAccID + "^" + txtAccTitle + "^" + ddlUnit + "^" + txtQty + "^" + txtPrice + "^" + txtTotalPrice
            string itmID = itmROW[0].ToString();
            string txtAccTitle = itmROW[1].ToString();
            string ddlUnit = itmROW[2].ToString();
            string txtQty = itmROW[3].ToString();
            string txtPrice = itmROW[4].ToString();
            string txtTotalPrice = itmROW[5].ToString();

            SqlParameter ReqHID_1 = new SqlParameter("@ReqHID",rqHID);
            SqlParameter ITEMID = new SqlParameter("@ITEMID", itmID);
            SqlParameter UnitID = new SqlParameter("@UnitID", ddlUnit);
            SqlParameter Qty = new SqlParameter("@Qty", txtQty);
            SqlParameter EstPrice = new SqlParameter("@EstPrice", txtPrice);
            SqlParameter TotalPrice = new SqlParameter("@TotalPrice", txtTotalPrice);
            SqlParameter EntryBy = new SqlParameter("@EntryBy", rqBy);
            AACommon.Execute("PROC_REQUISITION_DETAIL_INSERT", Con, ReqHID_1, ITEMID, UnitID, Qty, EstPrice, TotalPrice, EntryBy);


            string bMul = AACommon.GetData("select BaseMultiplier from ITM_UNIT where UnitID='"+ddlUnit+"'", Con, "BaseMultiplier");
            Decimal wt = Convert.ToDecimal(bMul) * Convert.ToDecimal(txtQty);
            Decimal pric = Convert.ToDecimal(txtPrice) / Convert.ToDecimal(bMul);
            if (i == 0) { htmLIST = txtAccTitle + "^" + pric + "^" + wt + "^" + txtTotalPrice; }
            else { htmLIST = htmLIST + "`" + txtAccTitle + "^" + pric + "^" + wt + "^" + txtTotalPrice; }
            totPrice = totPrice+ Convert.ToDecimal(txtTotalPrice);

        }
        //EmailApp(); 
        EmailApp(rqID, txtVDate, prty, htmLIST, Convert.ToString(totPrice), "0", Convert.ToString(totPrice));
            return msg;
    }

    [WebMethod]
    public static string SaveTransaction(string UserID, string str, string txtVDate, string txtVoucherNo, string ddlSupplier, string txtTotAmount, string brnchID)
    {
        string msg = "";

        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        string rqID = "";
        string rqHID = "";
        string rqDt = "";
        string rqBy = UserID;
        string rqAt = "";
        string stsID = "";// 0:Pending, 1:Approved, 2:Rejected

        string[] dtS = txtVDate.Split('-');

        txtVDate = dtS[1] + "/" + dtS[2] + "/" + dtS[0];
        ///////////////////////// ID GNERATOR /////////////////////////////
        string aa = LoadNUMBER_DT("PO", txtVDate);
        // string[] idDT = aa.Split('`');
        rqID = aa;// idDT[0].ToString();
        //rqDt = idDT[1].ToString();



        /////////////////////////// INSERT in PROC_REQUISITION_HISTORY //////////////////
        SqlParameter SOID = new SqlParameter("@SOID", rqID);
        SqlParameter SODate = new SqlParameter("@SODate", txtVDate);
        SqlParameter TotalAmount = new SqlParameter("@TotalAmount", txtTotAmount);
        SqlParameter DiscountAmount = new SqlParameter("@DiscountAmount", "0");
        SqlParameter TaxAmount = new SqlParameter("@TaxAmount", "0");
        SqlParameter TaxRate = new SqlParameter("@TaxRate", "0");

        SqlParameter GrandTotal = new SqlParameter("@GrandTotal", txtTotAmount);
        SqlParameter AccountID = new SqlParameter("@AccountID", ddlSupplier);
        SqlParameter SP = new SqlParameter("@SP", "P");//RqID
        SqlParameter RqID = new SqlParameter("@RqID", txtVoucherNo);
        SqlParameter BranchID = new SqlParameter("@BranchID", brnchID);
        AACommon.Execute("PROC_PO_MASTER_INSERT", Con, SOID, SODate, TotalAmount, DiscountAmount, TaxAmount, TaxRate, GrandTotal, AccountID, SP, RqID, BranchID);


        /////////////////////// INSERT in REQUISITION DETAIL

        string[] itmLST = str.Split('`');
        for (int i = 0; i < itmLST.Length; i++)
        {
            string[] itmROW = itmLST[i].Split('^');
            //txtAccID + "^" + txtAccTitle + "^" + ddlUnit + "^" + txtQty + "^" + txtPrice + "^" + txtTotalPrice
            //txtAccID + "^" + txtAccTitle + "^" + ddlUnit + "^" + txtQty + "^" + txtPrice + "^" + txtTotalPrice;
            string itmID = itmROW[0].ToString();
            string ddlUnit = itmROW[2].ToString();
            string txtQty = itmROW[3].ToString();
            string txtPrice = itmROW[4].ToString();
            string txtTotalPrice = itmROW[5].ToString();

            Decimal untPQut = 0; Decimal totPr = 0;
            string untP = txtPrice;
            untPQut = Convert.ToDecimal(untP);
            totPr = Convert.ToDecimal(txtQty) * untPQut;
            SqlParameter SOID_1 = new SqlParameter("@SOID", rqID);
            SqlParameter ITEMID = new SqlParameter("@ITEMID", itmID);
            SqlParameter UnitID = new SqlParameter("@UnitID", ddlUnit);
            SqlParameter QtyIn = new SqlParameter("@QtyIn", txtQty);
            SqlParameter UnitPrice = new SqlParameter("@UnitPrice", untP);
            SqlParameter TotalPrice = new SqlParameter("@TotalPrice", totPr);
            SqlParameter ReqID = new SqlParameter("@ReqID", txtVoucherNo);
            AACommon.Execute("PROC_PO_DETAIL_INSERT", Con, SOID_1, ITEMID, UnitID, QtyIn, UnitPrice, TotalPrice, ReqID);

        }

        return msg;
    }


    [WebMethod]
    public static string EmailApp(string tID,string tDT,string prty,string htmITMS,string tot, string tx, string grndTOT)
    {
        string htm = "";

        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlParameter EmailType = new SqlParameter("@EmailType", "PUR REQ");
        DataSet ds = AACommon.ReturnDatasetBySP("Email_List", Con, EmailType);
        DataTable dt = new DataTable();
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
        }

        for (int i = 0; i < dt.Rows.Count; i++)
        {

            string UserName = dt.Rows[i]["UserName"].ToString();
            string email = dt.Rows[i]["UserEmail"].ToString();

          //  EmailClass.SendEmail(tID, tDT, "Kashif Trading", UserName, "Purchase Requisition", prty, "Item", "Unit Price", "Total Wt.", "Total Price", htmITMS, tot, tx, grndTOT, "02134590932", "info@kashiftrading.com", "www.kashiftrading.com", "Khayaban e Ittehad DHA 6 Karachi", email, "New Purchase Requisition");


        }

        return htm;
    }

}