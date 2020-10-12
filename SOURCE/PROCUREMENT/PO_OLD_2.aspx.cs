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

public partial class PROCUREMENT_PO_OLD_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
    public static string LOAD_DEBIT()
    {

        string acc = "";
        string query = "SELECT [L4_ID],[Desc_Level4] + '^' + [L4_ID] AS AccountTitle,[Desc_Level4] FROM [vwALL_ACCOUNTS]";
        string Con = ConfigurationManager.ConnectionStrings["ConACC"].ConnectionString;
        SqlDataAdapter da = new SqlDataAdapter(query, Con);
        DataTable dt = new DataTable();
        da.Fill(dt);

        for (int i = 1; i <= dt.Rows.Count; i++)
        {
            //'["Karachi","Hyderabad","USA","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky"]'
            if (i == 1)
            { acc = acc + "['" + dt.Rows[i - 1]["AccountTitle"].ToString() + "'"; }
            else if (i != 1 && i < dt.Rows.Count)
            { acc = acc + ",'" + dt.Rows[i - 1]["AccountTitle"].ToString() + "'"; }
            else
            { acc = acc + ",'" + dt.Rows[i - 1]["AccountTitle"].ToString() + "']"; }

            //acc = acc + "!" + dt.Rows[i-1]["AccountTitle"].ToString();
        }

        return acc;
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
        string query = "SELECT ITEMID, ITEMID+ ' ^ ' +ITEMName as ITEMName, ItemCode,UnitTypeID FROM ITM_ITEM WHERE ([IsDelete] = '0')";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
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
        acc = acc + "`" + LoadNUMBER("PR", "SP_MASTER", "SPID",Con) + "`" + htmUNT;
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
                vUNT = vUNT + ds.Tables[0].Rows[i]["UnitID"].ToString() + "^" + ds.Tables[0].Rows[i]["DisplayName"].ToString();
            }
            else
            {
                vUNT = vUNT + "~" + ds.Tables[0].Rows[i]["UnitID"].ToString() + "^" + ds.Tables[0].Rows[i]["DisplayName"].ToString();
            }
            
        }
        ds.Dispose();
        vUNT = vUNT + "</span>";
        return vUNT;
    }

    [WebMethod]
    public static string SaveTransaction(string UserID,  string str, string txtVDate, string txtVoucherNo, string txtTotAmount, string txtDiscount, string txtTaxRate, string txtTotTax, string txtGrandTotal, string ddlSupplier, string txtDebitID, string txtDepositAmount, string ddlWH)
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
        string aa = LoadNUMBER("PR", "SP_MASTER", "SPID",Con);
        string[] idDT = aa.Split('`');
        rqID = idDT[0].ToString();
        rqDt = idDT[1].ToString();

       // rqHID = LoadHistoryID(rqID);

        
       

        /////////////////////////// INSERT in SP MASTER //////////////////
        SqlParameter SPID = new SqlParameter("@SPID", rqID);
        SqlParameter SPDate = new SqlParameter("@SPDate", txtVDate);
        SqlParameter TotalAmount = new SqlParameter("@TotalAmount",txtTotAmount);
        SqlParameter DiscountAmount = new SqlParameter("@DiscountAmount", txtDiscount);
        SqlParameter TaxAmount = new SqlParameter("@TaxAmount", txtTotTax);
        SqlParameter TaxRate = new SqlParameter("@TaxRate", txtTaxRate);

        SqlParameter GrandTotal = new SqlParameter("@GrandTotal", txtGrandTotal);
        SqlParameter AccountID = new SqlParameter("@AccountID", ddlSupplier);
        SqlParameter SP = new SqlParameter("@SP", "P");
        SqlParameter WHID = new SqlParameter("@WHID", ddlWH);
        AACommon.Execute("SP_MASTER_INSERT_JOB", Con, SPID, SPDate, TotalAmount, DiscountAmount, TaxAmount, TaxRate, GrandTotal, AccountID, SP, WHID);


        /////////////////////// INSERT in SP DETAIL

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

            SqlParameter SPID_1 = new SqlParameter("@SPID", rqID);
            SqlParameter ITEMID = new SqlParameter("@ITEMID", itmID);
            SqlParameter UnitID = new SqlParameter("@UnitID", ddlUnit);
            SqlParameter QtyIn = new SqlParameter("@QtyIn", txtQty);
            SqlParameter UnitPrice = new SqlParameter("@UnitPrice", txtPrice);
            SqlParameter TotalPrice = new SqlParameter("@TotalPrice", txtTotalPrice);
            AACommon.Execute("SP_DETAIL_INSERT", Con, SPID_1, ITEMID, UnitID, QtyIn, UnitPrice, TotalPrice);

        }
            

        ////////////////////SAVE TRANSACTION IN ACCOUNTS ////////////////////
        SaveTransactionACC(UserID, txtVDate, rqID, "PR", txtGrandTotal, "Purchase Order", ddlSupplier);
        if (txtDepositAmount != "0")
        {
            SaveTransaction_PAYMENT(UserID,  txtVDate, ddlSupplier, txtDebitID, txtDepositAmount);
        }
        ///////////////////////////////////////////////////////////////////////

            return msg;
    }


    [WebMethod]
    public static string SaveTransactionACC(string UserID, string txtVDate, string txtVoucherNo, string ddlVoucherType, string amnt, string txtTrans, string ddlSupplier)
    {

        string acc = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConACC"].ConnectionString);
        SqlConnection ConOPT = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);

        string f = LoadNUMBER("File", "tbl_transaction", "FileNo",Con);
        string[] fN = f.Split('`');
        string FNo = fN[0];

        string v = LoadNUMBER(ddlVoucherType, "tbl_transaction", "TaskID",Con);
        string[] vN = v.Split('`');
        string vNo = vN[0];

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
        string crAccID = AACommon.GetData("select LedgerID from Supplier where SupplierID='" + ddlSupplier + "'", ConOPT, "LedgerID");
        //////////////////////// Debit //////////////////
            SqlParameter debit = new SqlParameter("@debit", amnt);
            SqlParameter credit = new SqlParameter("@credit", "0");
            SqlParameter Accid1 = new SqlParameter("@Accid1", "");
            SqlParameter Accid = new SqlParameter("@Accid", dbAccID);
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
            SqlParameter debit_1 = new SqlParameter("@debit", "0");
            SqlParameter credit_1 = new SqlParameter("@credit", amnt);
            SqlParameter Accid1_1 = new SqlParameter("@Accid1", "");
            SqlParameter Accid_1 = new SqlParameter("@Accid", crAccID);
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
    public static string SaveTransaction_PAYMENT(string UserID, string txtVDate, string txtPartyID, string txtDebitID, string amnt)
    {

        string acc = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConACC"].ConnectionString);
        SqlConnection ConOPT = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);

        string CrAccID = AACommon.GetData("select LedgerID from Supplier where SupplierID='" + txtPartyID + "'", ConOPT, "LedgerID");

        string tx1_AccID = AACommon.GetData("select AccountID from AACCOUNTS_Integration where Description='PO WHT1'", Con, "AccountID");
        string tx2_AccID = AACommon.GetData("select AccountID from AACCOUNTS_Integration where Description='PO WHT2'", Con, "AccountID");


        string fyID = "0";
        fyID = AACommon.GetData("select FYID from fiscalYear where '" + txtVDate + "'>=startyear and '" + txtVDate + "'<=endyear", Con, "FYID");
        if (fyID == "No")
        {
            fyID = "0";
        }


        string f = LoadNUMBER("File", "tbl_transaction", "FileNo", Con);
        string[] fN = f.Split('`');
        string FNo = fN[0];

        string v = LoadNUMBER("PV", "tbl_transaction", "TaskID", Con);
        string[] vN = v.Split('`');
        string vNo = vN[0];

        SqlParameter dt = new SqlParameter("@Date", txtVDate);
        SqlParameter Narration = new SqlParameter("@Narration", "Payment to Supplier for Purchase");
        SqlParameter amount = new SqlParameter("@Amount", amnt);
        SqlParameter Fiscalid = new SqlParameter("@FISCALID", fyID);
        SqlParameter Companyid = new SqlParameter("@COMPANYID", "12");
        SqlParameter Active = new SqlParameter("@Active", "1");
        SqlParameter FileNo = new SqlParameter("@FileNo", FNo);
        SqlParameter TaskID = new SqlParameter("@TaskID", vNo);
        AACommon.Execute("Insert_Transaction", Con, dt, amount, Narration, Fiscalid, Companyid, Active, FileNo, TaskID);


            SqlParameter debit = new SqlParameter("@debit", "0");
            SqlParameter credit = new SqlParameter("@credit", amnt);
            SqlParameter Accid1 = new SqlParameter("@Accid1", "");
            SqlParameter Accid = new SqlParameter("@Accid", txtDebitID);
            SqlParameter Accounttype = new SqlParameter("@Accounttype", "");
            SqlParameter Acounttype1 = new SqlParameter("@Acounttype1", "");
            SqlParameter FISCALID = new SqlParameter("@FISCALID", fyID);
            SqlParameter COMPANYID = new SqlParameter("@COMPANYID", "12");
            SqlParameter chequeno = new SqlParameter("@chequeno", "");
            SqlParameter ID = new SqlParameter("@ID", "0");
            SqlParameter BillNo = new SqlParameter("@BillNo", "");

            SqlParameter Narration2 = new SqlParameter("@Narration2", "Payment to Supplier for Purchase");

            SqlParameter FileNo2 = new SqlParameter("@FileNo", FNo);
            SqlParameter ProjectID = new SqlParameter("@ProjectID", "0");
            SqlParameter chequedate = new SqlParameter("@chequedate", txtVDate);
            AACommon.Execute("Insert_TransactionDetail_V2", Con, debit, credit, Accid1, Accid, Accounttype, Acounttype1, FISCALID, COMPANYID, chequeno, ID, BillNo, Narration2, FileNo2, ProjectID, chequedate);


        SqlParameter debit_C = new SqlParameter("@debit", amnt);
        SqlParameter credit_C = new SqlParameter("@credit", "0");
        SqlParameter Accid1_C = new SqlParameter("@Accid1", "");
        SqlParameter Accid_C = new SqlParameter("@Accid", CrAccID);
        SqlParameter Accounttype_C = new SqlParameter("@Accounttype", "");
        SqlParameter Acounttype1_C = new SqlParameter("@Acounttype1", "");
        SqlParameter FISCALID_C = new SqlParameter("@FISCALID", fyID);
        SqlParameter COMPANYID_C = new SqlParameter("@COMPANYID", "12");
        SqlParameter chequeno_C = new SqlParameter("@chequeno", "");
        SqlParameter ID_C = new SqlParameter("@ID", "0");
        SqlParameter BillNo_C = new SqlParameter("@BillNo", "");

        SqlParameter Narration2_C = new SqlParameter("@Narration2", "Payment to Supplier for Purchase");

        SqlParameter FileNo2_C = new SqlParameter("@FileNo", FNo);
        SqlParameter ProjectID_C = new SqlParameter("@ProjectID", "0");
        SqlParameter chequedate_C = new SqlParameter("@chequedate", "");
        AACommon.Execute("Insert_TransactionDetail_V2", Con, debit_C, credit_C, Accid1_C, Accid_C, Accounttype_C, Acounttype1_C, FISCALID_C, COMPANYID_C, chequeno_C, ID_C, BillNo_C, Narration2_C, FileNo2_C, ProjectID_C, chequedate_C);

        return vNo;
    }


    [WebMethod]
    public static string LoadNUMBER_DT(string frmt, string tbl, string fld, string dtNew, SqlConnection Con)
    {
        string vNO = "";

        string FYDesc = "0";
        FYDesc = AACommon.GetData("select FYDesc from fiscalYear where '" + dtNew + "'>=startyear and '" + dtNew + "'<=endyear", Con, "FYDesc");
        if (FYDesc == "No")
        {
            FYDesc = "0";
        }

        string[] vDT = dtNew.Split('/');
        string mm1 = vDT[0];//System.DateTime.Now.Month.ToString();
        string yy1 = vDT[2];//System.DateTime.Now.Year.ToString();
        yy1 = Convert.ToString(Convert.ToInt32(yy1) - 2000);
        if (mm1.Length == 1) { mm1 = "0" + mm1; }
        if (yy1.Length == 1) { yy1 = "0" + yy1; }
        string format1 = frmt + "-" + FYDesc + "-";
        vNO = AACommon.GetAlphaNumericIDSIX(tbl, format1, fld, Con);
        return vNO;
    }
}