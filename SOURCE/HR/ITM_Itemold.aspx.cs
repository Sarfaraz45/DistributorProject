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

public partial class ERP_ITM_Item : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }








    [WebMethod]
    public static string InsertRegion(string ITEMName, string ItemCode, string BarCode, string Discription, string UserID, string UnitTypeID, string DistPerc, string TradePrice, string RetailPrice, string PackingTypeID)
    {

        string retMessage = string.Empty;
        string msg = "";
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        string ID = AACommon.GetAlphaNumericIDSIX("ITM_ITEM", "ITM-", "ITEMID", Conn);
        SqlParameter ITEMID_P = new SqlParameter("@ITEMID", ID);
        SqlParameter ITEMName_P = new SqlParameter("@ITEMName", ITEMName);
        SqlParameter ItemCode_P = new SqlParameter("@ItemCode", ItemCode);
        SqlParameter BarCode_P = new SqlParameter("@BarCode", BarCode);
        SqlParameter Discription_P = new SqlParameter("@Discription", Discription);
        SqlParameter CREATEBY = new SqlParameter("@CreateBy", UserID);
        SqlParameter IsSale_P = new SqlParameter("@IsSale", "1");
        SqlParameter IsPurchase_P = new SqlParameter("@IsPurchase", "1");
        SqlParameter UnitTypeID_P = new SqlParameter("@UnitTypeID", UnitTypeID);
        SqlParameter DistPercentage_P = new SqlParameter("@DistPercentage", DistPerc);
        SqlParameter TradePrice_P = new SqlParameter("@TradePrice", TradePrice);
        SqlParameter RetailPrice_P = new SqlParameter("@RetailPrice", RetailPrice);
        SqlParameter PackingTypeID_P = new SqlParameter("@PackingTypeID", PackingTypeID);



        //isale=1
        //ispurchase=0

        msg = AACommon.Execute("ITM_ITEM_INSERT", Conn, ITEMID_P, ITEMName_P, ItemCode_P, BarCode_P, Discription_P, CREATEBY, IsSale_P, IsPurchase_P, UnitTypeID_P, DistPercentage_P, TradePrice_P, RetailPrice_P, PackingTypeID_P);


        if (msg == "Record Saved Successfully")
        {
            retMessage = "true";
        }
        else
        {
            retMessage = "false";
        }

        return retMessage;
    }


    [WebMethod]
    public static string UpdateRegion(string ITEMID, string ITEMName, string ItemCode, string BarCode, string Discription, string UnitTypeID, string DistPerc, string TradePrice, string RetailPrice, string PackingTypeID)
    {
        string retMessage = string.Empty;
        string msg = "";
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlParameter ITEMID_P = new SqlParameter("@ITEMID", ITEMID);
        SqlParameter ITEMName_P = new SqlParameter("@ITEMName", ITEMName);
        SqlParameter ItemCode_P = new SqlParameter("@ItemCode", ItemCode);
        SqlParameter BarCode_P = new SqlParameter("@BarCode", BarCode);
        SqlParameter Discription_P = new SqlParameter("@Discription", Discription);
        SqlParameter UnitTypeID_P = new SqlParameter("@UnitTypeID", UnitTypeID);
        SqlParameter DistPercentage_P = new SqlParameter("@DistPercentage", DistPerc);
        SqlParameter TradePrice_P = new SqlParameter("@TradePrice", TradePrice);
        SqlParameter RetailPrice_P = new SqlParameter("@RetailPrice", RetailPrice);
        SqlParameter PackingTypeID_P = new SqlParameter("@PackingTypeID", PackingTypeID);
        msg = AACommon.Execute("ITM_ITEM_UPDATE", Conn, ITEMID_P, ITEMName_P, ItemCode_P, BarCode_P, Discription_P, UnitTypeID_P, DistPercentage_P, TradePrice_P, RetailPrice_P, PackingTypeID_P);


        if (msg == "Record Saved Successfully")
        {
            retMessage = "true";
        }
        else
        {
            retMessage = "false";
        }

        return retMessage;
    }


    [WebMethod]
    public static string DeleteRegion(string ITEMID, string UserID)
    {

        string retMessage = string.Empty;
        string msg = "";
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);


        SqlParameter ITEMID_P = new SqlParameter("@ITEMID", ITEMID);
        SqlParameter DeleteBy_P = new SqlParameter("@DeleteBy", UserID);
        msg = AACommon.Execute("ITM_ITEM_DELETE", Conn, ITEMID_P, DeleteBy_P);


        if (msg == "Record Saved Successfully")
        {
            retMessage = "true";
        }
        else
        {
            retMessage = "false";
        }

        return retMessage;

    }

















    [WebMethod]
    public static string LoadRegion()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        DataSet ds = AACommon.ReturnDatasetBySPWithoutParameter("ITM_ITEM_GET", Conn);
        List<GetRegionClass> RegionList = new List<GetRegionClass>();
       
        RegionList.Clear();
    
        //if (ds.Tables[0].Rows.Count > 0)
        //{
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            GetRegionClass dbdc = new GetRegionClass();

            dbdc.ITEMID = ds.Tables[0].Rows[i]["ITEMID"].ToString();
            dbdc.ITEMName = ds.Tables[0].Rows[i]["ITEMName"].ToString();
            dbdc.ItemCode = ds.Tables[0].Rows[i]["ItemCode"].ToString();
            dbdc.BarCode = ds.Tables[0].Rows[i]["BarCode"].ToString();
            dbdc.Discription = ds.Tables[0].Rows[i]["Discription"].ToString();
            dbdc.UnitTypeID = ds.Tables[0].Rows[i]["UnitTypeID"].ToString();
            dbdc.DistPercentage = ds.Tables[0].Rows[i]["DistPercentage"].ToString();
            dbdc.TradePrice = ds.Tables[0].Rows[i]["TradePrice"].ToString();
            dbdc.RetailPrice = ds.Tables[0].Rows[i]["RetailPrice"].ToString();
            dbdc.PackingTypeID = ds.Tables[0].Rows[i]["PackingTypeID"].ToString();

            RegionList.Insert(i, dbdc);
        }

        //}


        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(RegionList);


    }

    

    public class GetRegionClass
    {
        public string ITEMID { get; set; }
        public string ITEMName { get; set; }
        public string ItemCode { get; set; }
        public string BarCode { get; set; }
        public string Discription { get; set; }
        public string UnitTypeID { get; set; }



        public string DistPercentage { get; set; }

        public string TradePrice { get; set; }

        public string RetailPrice { get; set; }

        public string PackingTypeID { get; set; }
    }




    //dropdown list

    [WebMethod]
    public static string LoadRegionCombo1()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        DataSet ds = AACommon.ReturnDatasetBySPWithoutParameter("ITM_UNIT_TYPE_Get", Conn);
        List<GetRegionClasss> RegionList = new List<GetRegionClasss>();
        RegionList.Clear();
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                GetRegionClasss dbdc = new GetRegionClasss();

                dbdc.UnitTypeID = ds.Tables[0].Rows[i][0].ToString();
                dbdc.UnitTypeDesc = ds.Tables[0].Rows[i][1].ToString();
                RegionList.Insert(i, dbdc);
            }

        }

        JavaScriptSerializer jser = new JavaScriptSerializer();
        return jser.Serialize(RegionList);
    }

    [WebMethod]
    public static string LoadRegionCombo2()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        DataSet ds = AACommon.ReturnDatasetBySPWithoutParameter("ITEM_Packing_Get", Conn);
        List<GetRegionClasssPCK> RegionList = new List<GetRegionClasssPCK>();
        RegionList.Clear();
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                GetRegionClasssPCK dbdc = new GetRegionClasssPCK();

                dbdc.PackingTypeID = ds.Tables[0].Rows[i][0].ToString();
                dbdc.PackingTypeDesc = ds.Tables[0].Rows[i][1].ToString();
                RegionList.Insert(i, dbdc);
            }

        }

        JavaScriptSerializer jser = new JavaScriptSerializer();
        return jser.Serialize(RegionList);
    }




    public class GetRegionClasss
    {
        public string UnitTypeID { get; set; }
        public string UnitTypeDesc { get; set; }
    }

    public class GetRegionClasssPCK
    {

        public string PackingTypeID { get; set; }

        public string PackingTypeDesc { get; set; }
    }










}