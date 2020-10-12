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
    public static string LoadDesignation()
    {

        //string str = "select * from STP_Employee where IsDelete=0 order by FirstName";
        string str = "select '0' AS DesID,'  - - Select Designation ' AS  DesTitle from STP_Designation union select DesID,DesTitle from STP_Designation where IsDelete=0 order by DesTitle";

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
    public static string LoadEmployeeType()
    {

        //string str = "select * from STP_Employee where IsDelete=0 order by FirstName";
        string str = "select '0' AS EmpTypeID,'  - - Select Employee Type ' AS  EmpTypeTitle from STP_EmployeeType union select EmpTypeID,EmpTypeTitle from STP_EmployeeType where IsDelete=0 order by EmpTypeTitle";

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
                dbdc.ID = dt.Rows[i]["EmpTypeID"].ToString();
                dbdc.Name = dt.Rows[i]["EmpTypeTitle"].ToString();
                RegionList.Insert(i, dbdc);
            }

        }

        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(RegionList);


    }

    [WebMethod]
    public static string LoadUserType()
    {

        //string str = "select * from STP_Employee where IsDelete=0 order by FirstName";
        string str = "select '0' AS UTID,'  - - Select User Type ' AS  UTDesc from USERTYPE union select UTID,UTDesc from USERTYPE where IsDelete=0 order by UTDesc";

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
                dbdc.ID = dt.Rows[i]["UTID"].ToString();
                dbdc.Name = dt.Rows[i]["UTDesc"].ToString();
                RegionList.Insert(i, dbdc);
            }

        }

        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(RegionList);


    }


    [WebMethod]
    public static string LoadShift()
    {

        //string str = "select * from STP_Employee where IsDelete=0 order by FirstName";
        string str = "select '0' AS ShiftID,'  - - Select Shift ' AS  ShiftTitle from Shift union select ShiftID,ShiftTitle from Shift where IsDelete=0 order by ShiftTitle";

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
                dbdc.ID = dt.Rows[i]["ShiftID"].ToString();
                dbdc.Name = dt.Rows[i]["ShiftTitle"].ToString();
                RegionList.Insert(i, dbdc);
            }

        }

        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(RegionList);


    }

    [WebMethod]
    public static string LoadArea()
    {

        //string str = "select * from STP_Employee where IsDelete=0 order by FirstName";
        string str = "SELECT      f.AreaID, f.name, f.pid, f.path FROM        STP_AREA CROSS APPLY fnTree(STP_AREA.AreaID) f WHERE       STP_AREA.pid =0 ORDER BY    f.path OPTION (MAXRECURSION 0);";

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
                dbdc.ID = dt.Rows[i]["AreaID"].ToString();
                dbdc.Name = dt.Rows[i]["path"].ToString();
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

        SqlDataAdapter da = new SqlDataAdapter("SELECT        dbo.STP_Employee.EmpID, dbo.STP_Employee.FirstName, dbo.STP_Employee.DOB, dbo.STP_Employee.Gender, dbo.STP_Employee.EmpTypeID, dbo.STP_Employee.DesID, dbo.STP_Employee.ShiftID, dbo.STP_Employee.AreaID, dbo.STP_Employee.JoiningDate, dbo.STP_Employee.CNIC, dbo.STP_Employee.PermAddress, dbo.STP_Employee.Mobile, dbo.USERS.loginID, dbo.USERS.Password, dbo.STP_Designation.DesTitle,  dbo.STP_AREA.AreaTitle + ' ' + STP_AREA_1.AreaTitle AS Area, dbo.STP_Employee.IsDelete FROM            dbo.STP_Employee INNER JOIN dbo.USERS ON dbo.STP_Employee.EmpID = dbo.USERS.EmpID INNER JOIN dbo.STP_Designation ON dbo.STP_Employee.DesID = dbo.STP_Designation.DesID INNER JOIN dbo.STP_AREA ON dbo.STP_Employee.AreaID = dbo.STP_AREA.AreaID INNER JOIN dbo.STP_AREA AS STP_AREA_1 ON dbo.STP_AREA.PID = STP_AREA_1.AreaID WHERE        (dbo.STP_Employee.IsDelete = 0) order by EmpID Desc", Conn);
        DataTable dt = new DataTable();
        da.Fill(dt);        
        
        List<GetDistrictClass> RegionList = new List<GetDistrictClass>();
        RegionList.Clear();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GetDistrictClass dbdc = new GetDistrictClass();

                dbdc.ID = dt.Rows[i]["EmpID"].ToString();
                dbdc.Name = dt.Rows[i]["FirstName"].ToString();
                dbdc.VDESC = dt.Rows[i]["DesTitle"].ToString();
                dbdc.VTID = dt.Rows[i]["Area"].ToString();
                dbdc.REGNO = dt.Rows[i]["loginID"].ToString();            
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

        SqlDataAdapter da = new SqlDataAdapter("SELECT     * from STP_Employee where IsDelete=0 and EmpID='" + id + "' order by 1", Conn);
        DataTable dt = new DataTable();
        da.Fill(dt);

        List<GetDistrictClass> RegionList = new List<GetDistrictClass>();
        RegionList.Clear();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GetDistrictClass dbdc = new GetDistrictClass();

                dbdc.ID = dt.Rows[i]["EmpID"].ToString();
                dbdc.Name = dt.Rows[i]["FirstName"].ToString();
                dbdc.DOB = dt.Rows[i]["DOB"].ToString();
                dbdc.Gender = dt.Rows[i]["Gender"].ToString();
                dbdc.EmpTypeID = dt.Rows[i]["EmpTypeID"].ToString();
                dbdc.DesID = dt.Rows[i]["DesID"].ToString();
                dbdc.ShiftID = dt.Rows[i]["ShiftID"].ToString();
                dbdc.AreaID = dt.Rows[i]["AreaID"].ToString();
                dbdc.JoiningDate = dt.Rows[i]["JoiningDate"].ToString();
                dbdc.CNIC = dt.Rows[i]["CNIC"].ToString();
                dbdc.PermAddress = dt.Rows[i]["PermAddress"].ToString();
                dbdc.Mobile = dt.Rows[i]["Mobile"].ToString();
                

                SqlDataAdapter daUser = new SqlDataAdapter("select * from Users where EmpID='" + id + "'", Conn);
                DataTable dtUser = new DataTable();
                daUser.Fill(dtUser);
                if (dtUser.Rows.Count > 0)
                {
                    dbdc.LoginID = dtUser.Rows[0]["loginID"].ToString();
                    dbdc.UTID = dtUser.Rows[0]["UTID"].ToString();
                }

                RegionList.Insert(i, dbdc);
            }

        }


        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(RegionList);


    }
   
   
    [WebMethod]
    public static string SaveTransaction(string Title, string DOB, string UserID, string ddlGender, string ddlDesignation, string ddlShift, string ddlArea, string ddlEmployeeType, string ddlUserType, string txtCNIC, string txtContact, string DOJ, string txtAddress, string txtLoginID, string txtPassword)
    {

        string vNo = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        string a = AACommon.GetAlphaNumericIDSIX("STP_Employee", "EMP-", "EmpID", Con);
        SqlCommand cmd = new SqlCommand("insert into STP_Employee (EmpID,FirstName,DOB,Gender,EmpTypeID,DesID,ShiftID,AreaID,JoiningDate,CNIC,PermAddress,Mobile,CREATEBY) values ( '" + a + "', '" + Title + "','" + DOB + "','" + ddlGender + "','" + ddlEmployeeType + "','" + ddlDesignation + "','" + ddlShift + "','" + ddlArea + "','" + DOJ + "','" + txtCNIC + "','" + txtAddress + "','" + txtContact + "' ,'" + UserID + "')", Con);
        Con.Open();
        cmd.ExecuteNonQuery();
        Con.Close();
        if (txtLoginID.Length > 0)
        {
            string U = AACommon.GetAlphaNumericIDSIX("USERS", "USR-", "UserID", Con);
            SqlCommand cmdUser = new SqlCommand("insert into USERS (UserID,UserName,loginID,Password,EmpID,UTID,CREATEBY,DesID) values ('" + U + "','" + Title + "','" + txtLoginID + "','" + txtPassword + "','" + a + "','" + ddlUserType + "','" + UserID + "','" + ddlDesignation + "')", Con);
            Con.Open();
            cmdUser.ExecuteNonQuery();
            Con.Close();
        }

        
        return vNo = "Saved Successfully.!";
    }

    [WebMethod]
    public static string UpdateTransaction(string Title, string DOB, string UserID, string ddlGender, string ddlDesignation, string ddlShift, string ddlArea, string ddlEmployeeType, string ddlUserType, string txtCNIC, string txtContact, string DOJ, string txtAddress, string txtLoginID, string txtPassword, string id)
    {

        string vNo = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);

        SqlCommand cmd = new SqlCommand("update  STP_Employee set FirstName='" + Title + "',DOB='" + DOB + "',Gender='" + ddlGender + "',EmpTypeID='" + ddlEmployeeType + "',DesID='" + ddlDesignation + "',ShiftID='" + ddlShift + "',AreaID='" + ddlArea + "',JoiningDate='" + DOJ + "',CNIC='" + txtCNIC + "',PermAddress='" + txtAddress + "',Mobile='" + txtContact + "' where EmpID='"+id+"'", Con);
        Con.Open();
        cmd.ExecuteNonQuery();
        Con.Close();
        if (txtLoginID.Length > 0)
        {
            SqlCommand cmdUser = new SqlCommand("update USERS set UserName='" + Title + "',loginID='" + txtLoginID + "',Password='" + txtPassword + "',UTID='" + ddlUserType + "',DesID='" + ddlDesignation + "' where EmpID='" + id + "'", Con);
            Con.Open();
            cmdUser.ExecuteNonQuery();
            Con.Close();
        }

        return vNo = "Updated Successfully.!";
    }



    [WebMethod]
    public static string DeleteTransaction(string id, string UserID)
    {

        string vNo = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);

        SqlCommand cmd = new SqlCommand("update USERS  set IsDelete=1,MODIFYBY='" + UserID + "',MODIFYDATE='" + DateTime.Now + "' where EmpID='" + id + "'", Con);
        Con.Open();
        cmd.ExecuteNonQuery();
        Con.Close();

        SqlCommand cmd2 = new SqlCommand("update STP_Employee  set IsDelete=1,DeleteBy='" + UserID + "',DeleteDate='" + DateTime.Now + "' where EmpID='" + id + "'", Con);
        Con.Open();
        cmd2.ExecuteNonQuery();
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

            public string DOB { get; set; }
        public string Gender { get; set; }
        public string EmpTypeID { get; set; }
        public string DesID { get; set; }
            public string ShiftID { get; set; }
        public string AreaID { get; set; }
        public string JoiningDate { get; set; }
        public string CNIC { get; set; }
        public string PermAddress { get; set; }
        public string Mobile { get; set; }

        public string LoginID { get; set; }
        public string UTID { get; set; }
        
         

    }

     
}