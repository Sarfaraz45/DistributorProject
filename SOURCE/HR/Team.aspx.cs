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
      //  fill_Tree();
    }



    [WebMethod]
    public static string LoadLIST(string AreaID)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        int i = 0;
        int j = 0; string InnerHTML = "";
        string str = "";
        str = "select EmpID,FirstName from STP_Employee where IsDelete=0 and AreaID='" + AreaID + "' order by FirstName";
        SqlDataAdapter sqladp = new SqlDataAdapter(str, Conn);
        DataTable dt = new DataTable();
        sqladp.Fill(dt);     
        for (i = 0; i < dt.Rows.Count; i++)
        {
            string chkID = "chk" + dt.Rows[i]["EmpID"].ToString();            
            string chek = "";
            InnerHTML = InnerHTML + "<div class='custom-control custom-checkbox '><input type='checkbox'   class='custom-control-input' id='" + chkID + "' " + chek + "></input>";
            InnerHTML = InnerHTML + " <label class='custom-control-label' for='" + chkID + "'> " + dt.Rows[i]["FirstName"].ToString()+"</label>";
            InnerHTML = InnerHTML + " </div>";
        }        
        return InnerHTML;
    }


    [WebMethod]
    public static string LoadHead()
    {
        
        //string str = "select * from STP_Employee where IsDelete=0 order by FirstName";
        string str = "select '0' AS UserID,' -- Select Team Head' AS UserName from USERS  union  select UserID,UserName from USERS where IsDelete=0 order by UserName";
        
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter(str,Con);
        DataTable dt = new DataTable();
        da.Fill(dt);        
        List<GetRegionClass> RegionList = new List<GetRegionClass>();
        RegionList.Clear();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GetRegionClass dbdc = new GetRegionClass();

                //dbdc.ID = dt.Rows[i]["EmpID"].ToString();
                //dbdc.Name =  dt.Rows[i]["FirstName"].ToString() + " " + dt.Rows[i]["LastName"].ToString();
                dbdc.ID = dt.Rows[i]["UserID"].ToString();
                dbdc.Name = dt.Rows[i]["UserName"].ToString();
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
            //foreach (DataRow dr in dt.Rows)
            //{
                 

            //    if (dr[3].ToString().Contains(">>"))
            //        dr.Delete();
            //}
            //dt.AcceptChanges();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GetRegionClass dbdc = new GetRegionClass();

                //dbdc.ID = dt.Rows[i]["EmpID"].ToString();
                //dbdc.Name =  dt.Rows[i]["FirstName"].ToString() + " " + dt.Rows[i]["LastName"].ToString();
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
//        SqlDataAdapter da = new SqlDataAdapter("SELECT        dbo.OPT_TEAM_MASTER.TEAMID, dbo.OPT_TEAM_MASTER.TEAMTITLE, dbo.OPT_TEAM_MASTER.ISACTIVE, dbo.USERS.UserName FROM            dbo.USERS INNER JOIN dbo.OPT_TEAM_MASTER ON dbo.USERS.UserID = dbo.OPT_TEAM_MASTER.HEADID WHERE        (dbo.OPT_TEAM_MASTER.ISDELETE = 0) AND (dbo.USERS.ISDELETE = 0)", Conn);
        SqlDataAdapter da = new SqlDataAdapter("SELECT        dbo.OPT_TEAM_MASTER.TEAMID, dbo.OPT_TEAM_MASTER.TEAMTITLE, dbo.OPT_TEAM_MASTER.ISACTIVE, dbo.USERS.UserName, dbo.STP_AREA.AreaTitle + ' ' + STP_AREA_1.AreaTitle AS Area FROM            dbo.USERS INNER JOIN dbo.OPT_TEAM_MASTER ON dbo.USERS.UserID = dbo.OPT_TEAM_MASTER.HEADID INNER JOIN dbo.STP_AREA ON dbo.OPT_TEAM_MASTER.AreaID = dbo.STP_AREA.AreaID INNER JOIN dbo.STP_AREA AS STP_AREA_1 ON dbo.STP_AREA.PID = STP_AREA_1.AreaID WHERE        (dbo.OPT_TEAM_MASTER.ISDELETE = 0) AND (dbo.USERS.ISDELETE = 0)", Conn);
        DataTable dt = new DataTable();
        da.Fill(dt);        
        
        List<GetDistrictClass> RegionList = new List<GetDistrictClass>();
        RegionList.Clear();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GetDistrictClass dbdc = new GetDistrictClass();

                dbdc.ID = dt.Rows[i]["TEAMID"].ToString();
                dbdc.Name = dt.Rows[i]["TEAMTITLE"].ToString();
                dbdc.Region = dt.Rows[i]["UserName"].ToString();
                dbdc.Area = dt.Rows[i]["Area"].ToString();   
                RegionList.Insert(i, dbdc);
            }

        }


        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(RegionList);


    }
   
    [WebMethod]
    public static string SaveTransaction(string Title, string UID, string dta, string AreaID)
    {

        string vNo = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        string a = AACommon.GetAlphaNumericIDSIX("OPT_TEAM_MASTER","TM-","TEAMID",Con);
        SqlCommand cmd = new SqlCommand("insert into OPT_TEAM_MASTER (TEAMID,TEAMTITLE,HEADID,CREATEBY,AreaID) values ('" + a + "','" + Title + "','" + UID + "','U-00001','"+AreaID+"')", Con);
        Con.Open();
        cmd.ExecuteNonQuery();
        Con.Close();
        string[] trnsString = dta.Split('^');

        for (int i = 0; i < trnsString.Length; i++)
        {
            string[] trnsD = trnsString[i].Split('`');
            string txtPID = trnsD[0];

            SqlCommand cmdDetail = new SqlCommand("insert into OPT_TEAM_RESOURCES (TEAMID,EMPID,CREATEBY) values ('" + a + "','" + txtPID + "','U-00001')", Con);
            Con.Open();
            cmdDetail.ExecuteNonQuery();
            Con.Close();
        }
        return vNo = "Saved Successfully.!";
    }


     public class GetRegionClass
    {
        public string ID { get; set; }
        public string Name { get; set; }

    }
    public class GetDistrictClass
    {
        public string ID { get; set; }
        public string Name { get; set; }
        public string Region { get; set; }
        public string Path { get; set; }
        public string Area { get; set; }
        
    }


    public void fill_Tree()
    {

        DataSet ds = AACommon.ReturnDatasetBySP("Get_AREA", con, null);

        DataSet dataSet = new DataSet();
        dataSet.Tables.Add("Table");
        dataSet.Tables[0].Columns.Add("ID", typeof(string));
        dataSet.Tables[0].Columns.Add("ParentID", typeof(string));
        dataSet.Tables[0].Columns.Add("Text", typeof(string));

        DataRow row = null;
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            row = dataSet.Tables[0].NewRow();
            row["ID"] = ds.Tables[0].Rows[i]["AreaID"].ToString();
            if (ds.Tables[0].Rows[i]["PID"].ToString() != "0")
            { row["ParentID"] = ds.Tables[0].Rows[i]["PID"].ToString(); }
            row["Text"] = ds.Tables[0].Rows[i]["AreaTitle"].ToString();
            dataSet.Tables[0].Rows.Add(row);


        }


        TreeView1.DataSource = new TreeViewBindingTest.HierarchicalDataSet(dataSet, "ID", "ParentID");
        TreeView1.DataBind();


    }


    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        
        

        //SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        //int i = 0;
        //int j = 0; string htm = "";
        //string str = "";
        //str = "select * from STP_Employee where IsDelete=0 and AreaID='" + TreeView1.SelectedNode.Value + "'order by FirstName";
        //SqlDataAdapter sqladp = new SqlDataAdapter(str, Conn);
        //DataTable dt = new DataTable();
        //sqladp.Fill(dt);
        //for (i = 0; i < dt.Rows.Count; i++)
        //{
        //    string chkID = "chk" + dt.Rows[i]["EmpID"].ToString();
        //    string chek = "";
        //    htm = htm + "<div class='custom-control custom-checkbox'><input type='checkbox'   class='custom-control-input' id='" + chkID + "' " + chek + "></input>";
        //    htm = htm + " <label class='custom-control-label' for='" + chkID + "'> " + dt.Rows[i]["FirstName"].ToString() + " " + dt.Rows[i]["LastName"].ToString() + "</label>";
        //    htm = htm + " </div>";
        //}
        ////HtmlGenericControl div = FindControl(dvDetail) as HtmlGenericControl;
        ////div.InnerHtml = InnerHTML;
        //dvDetail.InnerText = htm;
        //return InnerHTML;
    }

}