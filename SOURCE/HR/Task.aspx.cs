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
    public static string LoadLIST(string AreaID)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        int i = 0;
        int j = 0; string InnerHTML = "";
        string str = "";
        str = "select * from OPT_TEAM_MASTER where IsDelete=0 and AreaID='"+AreaID+"'order by TEAMTITLE";
        SqlDataAdapter sqladp = new SqlDataAdapter(str, Conn);
        DataTable dt = new DataTable();
        sqladp.Fill(dt);     
        for (i = 0; i < dt.Rows.Count; i++)
        {
            string chkID = "chk" + dt.Rows[i]["TEAMID"].ToString();            
            string chek = "";          
            InnerHTML = InnerHTML + "<div class='custom-control custom-checkbox'><input type='checkbox'   class='custom-control-input' id='" + chkID + "' " + chek + "></input>";
            InnerHTML = InnerHTML + " <label class='custom-control-label' for='" + chkID + "'> " + dt.Rows[i]["TEAMTITLE"].ToString() +"</label>";
            InnerHTML = InnerHTML + " </div>";
        }        
        return InnerHTML;
    }

    [WebMethod]
    public static string LoadVehicleType()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        int i = 0;
        int j = 0; string InnerHTML = "<div class='row'>";
        string str = "";
        str = "select * from STP_VEHICLE_TYPE where IsDelete=0 order by VTTITLE";
        SqlDataAdapter sqladp = new SqlDataAdapter(str, Conn);
        DataTable dt = new DataTable();
        sqladp.Fill(dt);
        for (i = 0; i < dt.Rows.Count; i++)
        {
            string chkID = "chk" + dt.Rows[i]["VTID"].ToString();
            string chek = "";
        ////////////////////////    InnerHTML = InnerHTML + "<div class='custom-control custom-checkbox'><input type='checkbox'   class='custom-control-input' id='" + chkID + "' " + chek + "></input>";
            //InnerHTML = InnerHTML + " <input type='text' class='form-control' value= " + dt.Rows[i]["VTTITLE"].ToString() + ">";
            //////////////InnerHTML = InnerHTML + "<label class='custom-control-label' for='" + chkID + "'> " + dt.Rows[i]["VTTITLE"].ToString() + "</label>";
//            InnerHTML = InnerHTML + "<label class='custom-control-label' for='" + chkID + "'> " + dt.Rows[i]["VTTITLE"].ToString() + "</label>";
/////////////            InnerHTML = InnerHTML + " </div>";

            InnerHTML = InnerHTML + "<div class='input-group col-md-6' style='margin-bottom: 10px;'><div class='input-group-prepend'><div class='input-group-text'><div class='custom-control custom-checkbox'><input type='checkbox' class='custom-control-input' id='" + chkID + "' " + chek + "><label class='custom-control-label' for='" + chkID + "' " + chek + ">" + dt.Rows[i]["VTTITLE"].ToString() + "</label></div></div></div><input type='number' class='form-control' value=0 aria-label='Text input with checkbox' id='txt" + chkID + chek + "'  min='0'></div>";
        }
        InnerHTML = InnerHTML + "</div>";
        //InnerHTML = InnerHTML + " <div class='input-group'><div class='input-group-prepend'><div class='input-group-text'><div class='custom-control custom-checkbox'><input type='checkbox' class='custom-control-input' id='" + chkID + "' " + chek + "><label class='custom-control-label' for='" + chkID + "' " + chek + ">" + dt.Rows[i]["VTTITLE"].ToString() + "</label></div></div><div class='input-group-text text-success'><i class='fal fa-dollar-sign'></i></div></div><input type='text' class='form-control' aria-label='Text input with checkbox' id=''" + chkID + " " + chek + " checkbox-group-2'></div>";
        return InnerHTML;
    }


    [WebMethod]
    public static string LoadHead()
    {
        
        //string str = "select * from STP_Employee where IsDelete=0 order by FirstName";
        string str = "select '0' AS ACTID,' -- Select Task Type' AS ATTITLE from STP_ACTIVITY  union  select ACTID,ATTITLE from STP_ACTIVITY where IsDelete=0 order by ATTITLE";
        
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
                dbdc.ID = dt.Rows[i]["ACTID"].ToString();
                dbdc.Name = dt.Rows[i]["ATTITLE"].ToString();
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
        string str = "select '0' AS ShiftID,' -- Select Shift' AS ShiftTitle from Shift  union   select ShiftID,ShiftTitle from Shift where IsDelete=0 order by ShiftTitle";

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

                //dbdc.ID = dt.Rows[i]["EmpID"].ToString();
                //dbdc.Name =  dt.Rows[i]["FirstName"].ToString() + " " + dt.Rows[i]["LastName"].ToString();
                dbdc.ID = dt.Rows[i]["ShiftID"].ToString();
                dbdc.Name = dt.Rows[i]["ShiftTitle"].ToString();
                RegionList.Insert(i, dbdc);
            }

        }

        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(RegionList);


    }

    [WebMethod]
    public static string LoadType()
    {

        //string str = "select * from STP_Employee where IsDelete=0 order by FirstName";
        string str = "select * from STP_VEHICLE_TYPE where IsDelete=0 order by VTTITLE";

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

                //dbdc.ID = dt.Rows[i]["EmpID"].ToString();
                //dbdc.Name =  dt.Rows[i]["FirstName"].ToString() + " " + dt.Rows[i]["LastName"].ToString();
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
        SqlDataAdapter da = new SqlDataAdapter("SELECT        dbo.TASK_MASTER.TASKID, dbo.TASK_MASTER.TASKTITLE, CONVERT(nvarchar(20), dbo.TASK_MASTER.STARTDATE, 106) AS STARTDATE, CONVERT(nvarchar(20), dbo.TASK_MASTER.ENDDATE, 106) AS ENDDATE, dbo.STP_AREA.AreaTitle + ' ' + STP_AREA_1.AreaTitle AS Area, dbo.STP_ACTIVITY.ATTITLE, dbo.Shift.ShiftTitle, dbo.TASK_MASTER.AREAID, dbo.TASK_MASTER.ACTID, dbo.TASK_MASTER.ShiftID FROM            dbo.TASK_MASTER INNER JOIN dbo.STP_AREA ON dbo.TASK_MASTER.AREAID = dbo.STP_AREA.AreaID INNER JOIN dbo.STP_ACTIVITY ON dbo.TASK_MASTER.ACTID = dbo.STP_ACTIVITY.ACTID INNER JOIN dbo.STP_AREA AS STP_AREA_1 ON dbo.STP_AREA.PID = STP_AREA_1.AreaID INNER JOIN dbo.Shift ON dbo.TASK_MASTER.ShiftID = dbo.Shift.ShiftID WHERE        (dbo.TASK_MASTER.ISDELETE = 0) AND (dbo.TASK_MASTER.ISCOMP = 0) order by  dbo.TASK_MASTER.TASKID DESC", Conn);
        DataTable dt = new DataTable();
        da.Fill(dt);        
        
        List<GetDistrictClass> RegionList = new List<GetDistrictClass>();
        RegionList.Clear();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GetDistrictClass dbdc = new GetDistrictClass();

                dbdc.ID = dt.Rows[i]["TASKID"].ToString();
                dbdc.Name = dt.Rows[i]["TASKTITLE"].ToString();
                dbdc.STARTDATE = dt.Rows[i]["STARTDATE"].ToString();
                dbdc.Area = dt.Rows[i]["Area"].ToString();
                dbdc.ATTITLE = dt.Rows[i]["ATTITLE"].ToString();
                dbdc.ShiftTitle = dt.Rows[i]["ShiftTitle"].ToString();
                RegionList.Insert(i, dbdc);
            }

        }


        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(RegionList);


    }
   
    [WebMethod]
    public static string SaveTransaction(string Title, string UID, string dta, string Start,  string txtRemarks, string AreaID, string ddlShift, string dtaVehicle,string UserID)
    {

        string vNo = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        string a = AACommon.GetAlphaNumericIDSIX("TASK_MASTER", "TSK-", "TASKID", Con);
        SqlCommand cmd = new SqlCommand("insert into TASK_MASTER (TASKID,TASKTITLE,STARTDATE,AREAID,ACTID,ShiftID,CREATEBY) values ('" + a + "','" + Title + "','" + Start + "','" + AreaID + "','" + UID + "','" + ddlShift + "','" + UserID + "')", Con);
        Con.Open();
        cmd.ExecuteNonQuery();
        Con.Close();

        SqlDataAdapter daCycle;
        DataTable dtCycle;
        string query = "select Top(1) * from TASK_CYCLE where IsAdministrator=1 order by TaskOrder";
        daCycle = new SqlDataAdapter(query, Con);
        dtCycle = new DataTable();
        daCycle.Fill(dtCycle);
        if (dtCycle.Rows.Count > 0)
        {
            SqlCommand cmdStatus = new SqlCommand("insert into TASK_STATUS (TASKID,TaskCycleID,ApprovalDuration,DesID,STATUSBY,STATUSDATE,REMARKS) values ('" + a + "','" + dtCycle.Rows[0]["ID"].ToString() + "','0','" + dtCycle.Rows[0]["DesID"].ToString() + "','" + UserID + "','" + DateTime.Now + "','" + txtRemarks + "')", Con);
            Con.Open();
            cmdStatus.ExecuteNonQuery();
            Con.Close();       
        }
        else
        {
            query = "select  Top(1) * from TASK_CYCLE where IsAdministrator=0 order by TaskOrder";
            daCycle = new SqlDataAdapter(query, Con);
            dtCycle = new DataTable();
            daCycle.Fill(dtCycle);
            if (dtCycle.Rows.Count > 0)
            {
                SqlCommand cmdStatus = new SqlCommand("insert into TASK_STATUS (TASKID,TaskCycleID,ApprovalDuration,DesID,STATUSBY,STATUSDATE,REMARKS) values ('" + a + "','" + dtCycle.Rows[0]["ID"].ToString() + "','0','" + dtCycle.Rows[0]["DesID"].ToString() + "','" + UserID + "','" + DateTime.Now + "','" + txtRemarks + "')", Con);
                Con.Open();
                cmdStatus.ExecuteNonQuery();
                Con.Close();       
            }
        }
        
        string[] trnsString = dta.Split('^');

        for (int i = 0; i < trnsString.Length; i++)
        {
            string[] trnsD = trnsString[i].Split('`');
            string txtPID = trnsD[0];

            SqlCommand cmdDetail = new SqlCommand("insert into TASK_TEAM (TASKID,TEAMID) values ('" + a + "','" + txtPID + "')", Con);
            Con.Open();
            cmdDetail.ExecuteNonQuery();
            Con.Close();
        }

        string[] trnsStringVehicle = dtaVehicle.Split('^');

        for (int i = 0; i < trnsStringVehicle.Length; i++)
        {
            string[] trnsDVehicle = trnsStringVehicle[i].Split('`');
            string txtPIDVehicle = trnsDVehicle[0];
            string txtValueVehicle = trnsDVehicle[1];

            SqlCommand cmdDetail = new SqlCommand("insert into TASK_VEHICLE_REQUEST (TASKID,VTID,QTY,REMARKS,CREATEBY) values ('" + a + "','" + txtPIDVehicle + "','" + txtValueVehicle + "','" + txtRemarks + "','" + UserID + "')", Con);
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
        public string STARTDATE { get; set; }
        public string ENDDATE { get; set; }

        public string Area { get; set; }
        public string ATTITLE { get; set; }
        public string ShiftTitle { get; set; }
         
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

}