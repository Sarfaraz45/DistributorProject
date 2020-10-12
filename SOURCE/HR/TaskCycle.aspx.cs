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
        string str = "select '0' AS DesID,'  - - Select Designation' AS  DesTitle from STP_Designation union select DesID,DesTitle from STP_Designation where IsDelete=0 order by DesTitle";

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
                dbdc.ID = dt.Rows[i]["DesID"].ToString();
                dbdc.Name = dt.Rows[i]["DesTitle"].ToString();
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

        SqlDataAdapter da = new SqlDataAdapter("SELECT        dbo.TASK_CYCLE.ID, dbo.TASK_CYCLE.TaskOrder, dbo.STP_Designation.DesID, dbo.STP_Designation.DesTitle, dbo.TASK_CYCLE.ApprovalDuration, dbo.TASK_CYCLE.IsDurationApproved,  dbo.TASK_CYCLE.IsAdministrator FROM            dbo.TASK_CYCLE INNER JOIN dbo.STP_Designation ON dbo.TASK_CYCLE.DesID = dbo.STP_Designation.DesID WHERE        (dbo.STP_Designation.IsDelete = 0)  order by dbo.TASK_CYCLE.IsAdministrator desc ,dbo.TASK_CYCLE.TaskOrder", Conn);
        DataTable dt = new DataTable();
        da.Fill(dt);        
        
        List<GetDistrictClass> RegionList = new List<GetDistrictClass>();
        RegionList.Clear();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GetDistrictClass dbdc = new GetDistrictClass();

                dbdc.ID = dt.Rows[i]["ID"].ToString();
                dbdc.Name = dt.Rows[i]["TaskOrder"].ToString();
                dbdc.VDESC = dt.Rows[i]["DesTitle"].ToString();

                if (dt.Rows[i]["ApprovalDuration"].ToString() == "0")
                { dbdc.VTID = "Unlimited"; }
                else
                { dbdc.VTID = dt.Rows[i]["ApprovalDuration"].ToString() + " Minutes"; }

                if (dt.Rows[i]["IsAdministrator"].ToString() == "0")
                { dbdc.REGNO = "Operation Team"; }
                else
                { dbdc.REGNO = "Board"; }
 
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

        SqlDataAdapter da = new SqlDataAdapter("SELECT     * from TASK_CYCLE where  ID='" + id + "' order by 1", Conn);
        DataTable dt = new DataTable();
        da.Fill(dt);

        List<GetDistrictClass> RegionList = new List<GetDistrictClass>();
        RegionList.Clear();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GetDistrictClass dbdc = new GetDistrictClass();

                dbdc.ID = dt.Rows[i]["ID"].ToString();
                dbdc.Name = dt.Rows[i]["TaskOrder"].ToString();
                dbdc.VDESC = dt.Rows[i]["DesID"].ToString();
                dbdc.VTID = dt.Rows[i]["ApprovalDuration"].ToString();
                dbdc.REGNO = dt.Rows[i]["IsAdministrator"].ToString();
                
                RegionList.Insert(i, dbdc);
            }

        }


        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(RegionList);


    }
   
   
    [WebMethod]
    public static string SaveTransaction(string ddlOrder, string ddlHead, string txtDuration, string UserID, string IsAdministrator )
    {

        string vNo = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);

        SqlCommand cmd = new SqlCommand("insert into TASK_CYCLE (TaskOrder,DesID,ApprovalDuration,CreateBy,IsAdministrator) values (  '" + ddlOrder + "','" + ddlHead + "','" + txtDuration + "','" + UserID + "','" + IsAdministrator + "' )", Con);
        Con.Open();
        cmd.ExecuteNonQuery();
        Con.Close();
        
        return vNo = "Saved Successfully.!";
    }

    [WebMethod]
    public static string UpdateTransaction(string id, string ddlOrder, string ddlHead, string txtDuration, string UserID, string IsAdministrator)
    {

        string vNo = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);

        SqlCommand cmd = new SqlCommand("update TASK_CYCLE  set  TaskOrder='" + ddlOrder + "',DesID='" + ddlHead + "',ApprovalDuration='" + txtDuration + "',IsAdministrator='" + IsAdministrator + "' where ID='" + id + "'", Con);
        Con.Open();
        cmd.ExecuteNonQuery();
        Con.Close();

        return vNo = "Updated Successfully.!";
    }



    [WebMethod]
    public static string CheckDuplication( string ddlHead)
    {

        string vNo = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);

        SqlDataAdapter da = new SqlDataAdapter("select * from TASK_CYCLE where DesID='" + ddlHead + "'", Con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            vNo = "true";
        }
        else { vNo = "false"; }


        return vNo;
    }



    [WebMethod]
    public static string DeleteTransaction(string id, string UserID)
    {

        string vNo = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);

        SqlCommand cmd = new SqlCommand("delete TASK_CYCLE    where ID='" + id + "'", Con);
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