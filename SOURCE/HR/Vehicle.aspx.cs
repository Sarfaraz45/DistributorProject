using System;
using System.Collections;
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
using System.ComponentModel.DataAnnotations;
using System.Web.UI.HtmlControls;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class HR_Default : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

    [WebMethod]
    public static string LoadHead()
    {

        //string str = "select * from STP_Employee where IsDelete=0 order by FirstName";
        string str = "select '0' AS VTID,'  - - Select Vehicle Type ' AS  VTTITLE from STP_VEHICLE_TYPE union select VTID,VTTITLE from STP_VEHICLE_TYPE where IsDelete=0 order by VTTITLE";

        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter(str, Con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        List<GetRegionClass> RegionList = new List<GetRegionClass>();
        RegionList.Clear();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GetRegionClass dbdc = new GetRegionClass();
                dbdc.ID = dt.Rows[i]["VTID"].ToString();
                dbdc.Name = dt.Rows[i]["VTTITLE"].ToString();
                RegionList.Insert(i, dbdc);
            }

        }

        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(RegionList);


    }


    [WebMethod]
    public static string LoadRegion()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);

        SqlDataAdapter da = new SqlDataAdapter("SELECT     * from STP_VEHICLE where IsDelete=0 order by 1", Conn);
        DataTable dt = new DataTable();
        da.Fill(dt);        
        
        List<GetDistrictClass> RegionList = new List<GetDistrictClass>();
        RegionList.Clear();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GetDistrictClass dbdc = new GetDistrictClass();

                dbdc.ID = dt.Rows[i]["VEHID"].ToString();
                dbdc.Name = dt.Rows[i]["VEHTITLE"].ToString();
                dbdc.VDESC = dt.Rows[i]["VEHDESC"].ToString();
                dbdc.VTID = dt.Rows[i]["VTID"].ToString();
                dbdc.REGNO = dt.Rows[i]["REGNO"].ToString();
                dbdc.CHASISNO = dt.Rows[i]["CHASISNO"].ToString();
                dbdc.MODEL = dt.Rows[i]["MODEL"].ToString();
                dbdc.VDESC = dt.Rows[i]["VEHDESC"].ToString(); 
                RegionList.Insert(i, dbdc);
            }

        }


        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(RegionList);


    }


    [WebMethod]
    public static string LoadDetail(string id)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);

        SqlDataAdapter da = new SqlDataAdapter("SELECT     * from STP_VEHICLE where IsDelete=0 and VEHID='" + id + "' order by 1", Conn);
        DataTable dt = new DataTable();
        da.Fill(dt);

        List<GetDistrictClass> RegionList = new List<GetDistrictClass>();
        RegionList.Clear();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GetDistrictClass dbdc = new GetDistrictClass();

                dbdc.ID = dt.Rows[i]["VEHID"].ToString();
                dbdc.Name = dt.Rows[i]["VEHTITLE"].ToString();
                dbdc.VDESC = dt.Rows[i]["VEHDESC"].ToString();
                dbdc.VTID = dt.Rows[i]["VTID"].ToString();
                dbdc.REGNO = dt.Rows[i]["REGNO"].ToString();
                dbdc.CHASISNO = dt.Rows[i]["CHASISNO"].ToString();
                dbdc.MODEL = dt.Rows[i]["MODEL"].ToString();
                dbdc.VDESC = dt.Rows[i]["VEHDESC"].ToString(); 
                RegionList.Insert(i, dbdc);
            }

        }


        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(RegionList);


    }
   
   
    [WebMethod]
    public static string SaveTransaction(string Title, string txtDescription, string UserID, string txtRegNo, string txtChasisNo, string txtModel, string ddlHead)
    {

        string vNo = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        string a = AACommon.GetAlphaNumericIDSIX("STP_VEHICLE", "V-", "VEHID", Con);
        SqlCommand cmd = new SqlCommand("insert into STP_VEHICLE (VEHID,VTID,VEHTITLE,VEHDESC,REGNO,CHASISNO,MODEL,CREATEBY) values ( '" + a + "', '" + ddlHead + "','" + Title + "','" + txtDescription + "','" + txtRegNo + "','" + txtChasisNo + "','" + txtModel + "','" + UserID + "')", Con);
        Con.Open();
        cmd.ExecuteNonQuery();
        Con.Close();
        
        return vNo = "Saved Successfully.!";
    }

    [WebMethod]
    public static string UpdateTransaction(string Title, string txtDescription, string id, string UserID, string txtRegNo, string txtChasisNo, string txtModel, string ddlHead)
    {

        string vNo = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);

        SqlCommand cmd = new SqlCommand("update STP_VEHICLE  set  VEHTITLE='" + Title + "',VEHDESC='" + txtDescription + "',VTID='" + ddlHead + "',REGNO='" + txtRegNo + "',CHASISNO='" + txtChasisNo + "',MODEL='" + txtModel + "' where VEHID='" + id + "'", Con);
        Con.Open();
        cmd.ExecuteNonQuery();
        Con.Close();

        return vNo = "Updated Successfully.!";
    }



    [WebMethod]
    public static string DeleteTransaction(string id, string UserID)
    {

        string vNo = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);

        SqlCommand cmd = new SqlCommand("update STP_VEHICLE  set IsDelete=1,DELETEBY='" + UserID + "',DELETEDATE='" + DateTime.Now + "' where VEHID='" + id + "'", Con);
        Con.Open();
        cmd.ExecuteNonQuery();
        Con.Close();

        return vNo = "Deleted Successfully.!";
    }


     public class GetRegionClass
    {
        public string ID { get; set; }
        public string Name { get; set; }
        public string VDESC { get; set; }
         
    }
    public class GetDistrictClass
    {
        public string ID { get; set; }
        public string Name { get; set; }
        public string Region { get; set; }
        public string Path { get; set; }
        public string Area { get; set; }
        public string VDESC { get; set; }

          public string VTID { get; set; }
        public string REGNO { get; set; }
        public string CHASISNO { get; set; }
        public string MODEL { get; set; }
         
         
    }

     
}