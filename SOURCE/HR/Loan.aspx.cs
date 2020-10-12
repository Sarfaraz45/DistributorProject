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

        SqlDataAdapter da = new SqlDataAdapter("SELECT   *   ,convert(nvarchar(20),Date,106) AS DateNew from HR_Loan WHERE        (dbo.HR_Loan.IsDelete = 0)", Conn);
        DataTable dt = new DataTable();
        da.Fill(dt);        
        
        List<GetDistrictClass> RegionList = new List<GetDistrictClass>();
        RegionList.Clear();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GetDistrictClass dbdc = new GetDistrictClass();

                dbdc.ID = dt.Rows[i]["LoanID"].ToString();
                dbdc.Name = dt.Rows[i]["LoanTitle"].ToString();
                dbdc.VDESC = dt.Rows[i]["empid"].ToString();                
                dbdc.REGNO = dt.Rows[i]["Amount"].ToString();
                dbdc.CHASISNO = dt.Rows[i]["DateNew"].ToString();
                dbdc.MODEL = dt.Rows[i]["Paid"].ToString();                
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

        SqlDataAdapter da = new SqlDataAdapter("SELECT     *  from HR_Loan where IsDelete=0 and LoanID='" + id + "' order by 1", Conn);
        DataTable dt = new DataTable();
        da.Fill(dt);

        List<GetDistrictClass> RegionList = new List<GetDistrictClass>();
        RegionList.Clear();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GetDistrictClass dbdc = new GetDistrictClass();

                dbdc.ID = dt.Rows[i]["LoanID"].ToString();
                dbdc.Name = dt.Rows[i]["LoanTitle"].ToString();
                dbdc.VDESC = dt.Rows[i]["EmpID"].ToString();                
                dbdc.REGNO = dt.Rows[i]["Amount"].ToString();
                dbdc.CHASISNO = dt.Rows[i]["Date"].ToString();
                dbdc.MODEL = dt.Rows[i]["Paid"].ToString();
                dbdc.VDESC = dt.Rows[i]["EmpID"].ToString();
                dbdc.Balance = dt.Rows[i]["Balance"].ToString(); 
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
        SqlCommand cmd = new SqlCommand("insert into HR_Loan ( LoanTitle,EmpID,Amount,Date,CREATEBY) values ('" + Title + "', '" + ddlHead + "','" + txtChasisNo + "','" + txtRegNo + "' ,'" + UserID + "')", Con);
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

        SqlCommand cmd = new SqlCommand("update HR_Loan  set  LoanTitle='" + Title + "',EmpID='" + ddlHead + "',Amount='" + txtChasisNo + "',Date='" + txtRegNo + "'  where LoanID='" + id + "'", Con);
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

        SqlCommand cmd = new SqlCommand("update HR_Loan  set IsDelete=1,DELETEBY='" + UserID + "',DELETEDATE='" + DateTime.Now + "' where LoanID='" + id + "'", Con);
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
        public string Balance { get; set; }
         
         
    }

     
}