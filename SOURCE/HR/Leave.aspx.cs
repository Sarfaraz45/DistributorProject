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
        string str = "select '0' AS LvID,'  - - Select Leave Type ' AS  LvTitle from STP_LEAVETYPE union select LvID,LvTitle from STP_LEAVETYPE where IsDelete=0 order by LvTitle";

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
                dbdc.ID = dt.Rows[i]["LvID"].ToString();
                dbdc.Name = dt.Rows[i]["LvTitle"].ToString();
                RegionList.Insert(i, dbdc);
            }

        }

        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(RegionList);


    }



    [WebMethod]
    public static string LoadEmployee()
    {

        //string str = "select * from STP_Employee where IsDelete=0 order by FirstName";
        string str = "select '0' AS EmpID,'  - - Select Employee ' AS  FirstName from STP_Employee union select EmpID,FirstName from STP_Employee where IsDelete=0 order by FirstName";

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
                dbdc.ID = dt.Rows[i]["EmpID"].ToString();
                dbdc.Name = dt.Rows[i]["FirstName"].ToString();
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

        SqlDataAdapter da = new SqlDataAdapter("SELECT        dbo.HR_Leave.LeaveID, dbo.HR_Leave.LeaveTitle, dbo.STP_Employee.EmpID, dbo.STP_Employee.FirstName, dbo.STP_LEAVETYPE.LvID, dbo.STP_LEAVETYPE.LvTitle, CONVERT(nvarchar(20), dbo.HR_Leave.FromDate, 106)  AS FromDate, CONVERT(nvarchar(20), dbo.HR_Leave.ToDate, 106) AS ToDate, dbo.HR_Leave.Comments FROM            dbo.HR_Leave INNER JOIN dbo.STP_Employee ON dbo.HR_Leave.EmpID = dbo.STP_Employee.EmpID INNER JOIN dbo.STP_LEAVETYPE ON dbo.HR_Leave.LvID = dbo.STP_LEAVETYPE.LvID WHERE        (dbo.HR_Leave.IsDelete = 0)", Conn);
        DataTable dt = new DataTable();
        da.Fill(dt);        
        
        List<GetDistrictClass> RegionList = new List<GetDistrictClass>();
        RegionList.Clear();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GetDistrictClass dbdc = new GetDistrictClass();

                dbdc.ID = dt.Rows[i]["LeaveID"].ToString();
                dbdc.Name = dt.Rows[i]["LeaveTitle"].ToString();
                dbdc.VDESC = dt.Rows[i]["FirstName"].ToString();
                dbdc.LvID = dt.Rows[i]["LvTitle"].ToString();
                dbdc.REGNO = dt.Rows[i]["FromDate"].ToString();
                dbdc.CHASISNO = dt.Rows[i]["ToDate"].ToString();
                dbdc.MODEL = dt.Rows[i]["Comments"].ToString();                
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

        SqlDataAdapter da = new SqlDataAdapter("SELECT     * from HR_Leave where IsDelete=0 and LeaveID='" + id + "' order by 1", Conn);
        DataTable dt = new DataTable();
        da.Fill(dt);

        List<GetDistrictClass> RegionList = new List<GetDistrictClass>();
        RegionList.Clear();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GetDistrictClass dbdc = new GetDistrictClass();

                dbdc.ID = dt.Rows[i]["LeaveID"].ToString();
                dbdc.Name = dt.Rows[i]["LeaveTitle"].ToString();
                dbdc.VDESC = dt.Rows[i]["EmpID"].ToString();
                dbdc.LvID = dt.Rows[i]["LvID"].ToString();
                dbdc.REGNO = dt.Rows[i]["FromDate"].ToString();
                dbdc.CHASISNO = dt.Rows[i]["ToDate"].ToString();
                dbdc.MODEL = dt.Rows[i]["Comments"].ToString();
                dbdc.VDESC = dt.Rows[i]["EmpID"].ToString(); 
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
        SqlCommand cmd = new SqlCommand("insert into HR_Leave ( LvID,LeaveTitle,EmpID,FromDate,ToDate,Comments,CREATEBY) values ( '" + ddlHead + "','" + Title + "','" + txtDescription + "','" + txtRegNo + "','" + txtChasisNo + "','" + txtModel + "','" + UserID + "')", Con);
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

        SqlCommand cmd = new SqlCommand("update HR_Leave  set  LeaveTitle='" + Title + "',EmpID='" + txtDescription + "',LvID='" + ddlHead + "',FromDate='" + txtRegNo + "',ToDate='" + txtChasisNo + "',Comments='" + txtModel + "' where LeaveID='" + id + "'", Con);
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

        SqlCommand cmd = new SqlCommand("update HR_Leave  set IsDelete=1,DELETEBY='" + UserID + "',DELETEDATE='" + DateTime.Now + "' where LeaveID='" + id + "'", Con);
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

          public string LvID { get; set; }
        public string REGNO { get; set; }
        public string CHASISNO { get; set; }
        public string MODEL { get; set; }
         
         
    }

     
}