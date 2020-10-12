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

public partial class Sales_SaleOrder : System.Web.UI.Page
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
        acc = acc + "`" + LoadNUMBER("SO", "SO_MASTER", "SOID", Con) + "`" + htmUNT + "`" + LOAD_Customer();
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
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
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
    public static string LOAD_Customer()
    {

        string acc = "";
        string query = "SELECT [CustomerID],[CustomerTitle] + '^' + [CustomerID] AS CustomerTitle FROM [Customer] where ISDELETE='0'";
        string Con = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        SqlDataAdapter da = new SqlDataAdapter(query, Con);
        DataTable dt = new DataTable();
        da.Fill(dt);

        for (int i = 1; i <= dt.Rows.Count; i++)
        {
            //'["Karachi","Hyderabad","USA","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky"]'
            if (i == 1)
            { acc = acc + "['" + dt.Rows[i - 1]["CustomerTitle"].ToString() + "'"; }
            else if (i != 1 && i < dt.Rows.Count)
            { acc = acc + ",'" + dt.Rows[i - 1]["CustomerTitle"].ToString() + "'"; }
            else
            { acc = acc + ",'" + dt.Rows[i - 1]["CustomerTitle"].ToString() + "']"; }

            //acc = acc + "!" + dt.Rows[i-1]["AccountTitle"].ToString();
        }

        return acc;
    }

    [WebMethod]
    public static string LoadNUMBER_DT(string frmt, string tbl, string fld, string dtNew, SqlConnection Con)
    {
        string vNO = "";
        string[] vDT = dtNew.Split('-');
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
    public static string SaveTransaction(string UserID, string str, string txtVDate, string txtVoucherNo, string txtTotAmount, string txtDiscount, string txtTaxRate, string txtTotTax, string txtGrandTotal, string ddlCustomer, string delDate, string txtPartyPO, string txtRemarks, string txtLC, string txtInsurance, string txtIncoTerm)
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
        string aa = LoadNUMBER_DT("SO", "SO_MASTER", "SOID", txtVDate, Con);
        //string aa = LoadNUMBER("SO", "SO_MASTER", "SOID", Con);
       // string[] idDT = aa.Split('`');
        rqID = aa;// idDT[0].ToString();
       // rqDt = idDT[1].ToString();

       // rqHID = LoadHistoryID(rqID);

        
       

        /////////////////////////// INSERT in SP MASTER //////////////////
        SqlParameter SOID = new SqlParameter("@SOID", rqID);
        SqlParameter SODate = new SqlParameter("@SODate", txtVDate);
        SqlParameter TotalAmount = new SqlParameter("@TotalAmount",txtTotAmount);
        SqlParameter DiscountAmount = new SqlParameter("@DiscountAmount", txtDiscount);
        SqlParameter TaxAmount = new SqlParameter("@TaxAmount", txtTotTax);
        SqlParameter TaxRate = new SqlParameter("@TaxRate", txtTaxRate);

        SqlParameter GrandTotal = new SqlParameter("@GrandTotal", txtGrandTotal);
        SqlParameter AccountID = new SqlParameter("@AccountID", ddlCustomer);
        SqlParameter DeliveryDate = new SqlParameter("@DeliveryDate", delDate);
        SqlParameter SP = new SqlParameter("@SP", "S");
        SqlParameter PartyPO = new SqlParameter("@PartyPO", txtPartyPO);//
        SqlParameter Remarks = new SqlParameter("@Remarks", txtRemarks);

        SqlParameter LC = new SqlParameter("@LC", txtLC);//
        SqlParameter INSURANCE = new SqlParameter("@INSURANCE", txtInsurance);
        SqlParameter INCOTERM = new SqlParameter("@INCOTERM", txtIncoTerm);

        AACommon.Execute("SO_MASTER_INSERT_V3", Con, SOID, SODate, TotalAmount, DiscountAmount, TaxAmount, TaxRate, GrandTotal, AccountID, DeliveryDate, SP, PartyPO, Remarks, LC, INSURANCE, INCOTERM);


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
            string txtLineNo = itmROW[6].ToString();

            SqlParameter SOID_1 = new SqlParameter("@SOID", rqID);
            SqlParameter ITEMID = new SqlParameter("@ITEMID", itmID);
            SqlParameter UnitID = new SqlParameter("@UnitID", ddlUnit);
            SqlParameter QtyIn = new SqlParameter("@QtyIn", txtQty);
            SqlParameter UnitPrice = new SqlParameter("@UnitPrice", txtPrice);
            SqlParameter TotalPrice = new SqlParameter("@TotalPrice", txtTotalPrice);
            SqlParameter Line_No = new SqlParameter("@Line_No", txtLineNo);
            AACommon.Execute("SO_DETAIL_INSERT_V2", Con, SOID_1, ITEMID, UnitID, QtyIn, UnitPrice, TotalPrice, Line_No);

        }
            

        ////////////////////SAVE TRANSACTION IN ACCOUNTS ////////////////////
        ///////////////////////////////////////////////////////////////////////

            return msg;
            
    }

    [WebMethod]
    public static string Get_Price(string CusID, string ItemID)
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        string prc = AACommon.GetData("select UnitPrice from vwPRICE_BY_CUSTOMER where CustomerID='" + CusID + "' and ItemID='" + ItemID + "'", Con, "UnitPrice");
        if (prc == "No") { prc = "0"; }

        return prc;
    }
   
}