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
    public static string Approve(string id, string UserID, string cycleid)
    {

        string vNo = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
//        SqlDataAdapter da = new SqlDataAdapter("select Top(1) * from TASK_CYCLE where IsAdministrator=1  and TaskOrder > '" + cycleid + "' Order by TaskOrder", Con);
        SqlDataAdapter da = new SqlDataAdapter("select Top(1) * from TASK_CYCLE where IsAdministrator=0  Order by TaskOrder", Con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            SqlCommand cmdUpdate = new SqlCommand("update TASK_STATUS set IsActive=0 where TaskID='" + id + "'", Con);
            Con.Open();
            cmdUpdate.ExecuteNonQuery();
            Con.Close();

            SqlCommand cmdStatus = new SqlCommand("insert into TASK_STATUS (TASKID,TaskCycleID,ApprovalDuration,DesID,STATUSBY,STATUSDATE ) values ('" + id + "','" + dt.Rows[0]["ID"].ToString() + "','0','" + dt.Rows[0]["DesID"].ToString() + "','" + UserID + "','" + DateTime.Now + "' )", Con);
            Con.Open();
            cmdStatus.ExecuteNonQuery();
            Con.Close();
        }
        //else
        //{
        //    SqlDataAdapter dda = new SqlDataAdapter("select Top(1) * from TASK_CYCLE where IsAdministrator=0   Order by TaskOrder", Con);
        //    DataTable dtt = new DataTable();
        //    dda.Fill(dtt);
        //    if (dtt.Rows.Count > 0)
        //    {
        //        SqlCommand cmdUpdate = new SqlCommand("update TASK_STATUS set IsActive=0 where TaskID='" + id + "'", Con);
        //        Con.Open();
        //        cmdUpdate.ExecuteNonQuery();
        //        Con.Close();

        //        SqlCommand cmdStatus = new SqlCommand("insert into TASK_STATUS (TASKID,TaskCycleID,ApprovalDuration,DesID,STATUSBY,STATUSDATE ) values ('" + id + "','" + dtt.Rows[0]["ID"].ToString() + "','0','" + dtt.Rows[0]["DesID"].ToString() + "','" + UserID + "','" + DateTime.Now + "' )", Con);
        //        Con.Open();
        //        cmdStatus.ExecuteNonQuery();
        //        Con.Close();
        //    }
        //}


        //SqlCommand cmd = new SqlCommand("insert into TASK_STATUS (TASKID,VEHID,DRIVERID,CREATEBY) values ('" + lbltaskid + "','" + ddlVehicle + "','" + ddlDriver + "','U-00001')", Con);
        //Con.Open();
        //cmd.ExecuteNonQuery();
        //Con.Close();
        return vNo;


    }
 
    [WebMethod]
    public static string LoadRegion(string  DesID)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        List<GetDistrictClass> RegionList = new List<GetDistrictClass>();
        RegionList.Clear();
        //string DesID = "DES-000027"; //AssistantDirector
        //string DesID = "DES-000028"; //DeputyDirector
        //string DesID = "DES-000029"; //Director

        SqlDataAdapter dacycle = new SqlDataAdapter("select  Top(1) * from TASK_CYCLE where  DesID='" + DesID + "' and IsAdministrator=1", Conn);
        DataTable dtcycle = new DataTable();
        dacycle.Fill(dtcycle);
        if (dtcycle.Rows.Count > 0)
        {
            //SqlDataAdapter da = new SqlDataAdapter("SELECT        dbo.TASK_MASTER.TASKID, dbo.TASK_MASTER.TASKTITLE, CONVERT(Nvarchar(50), dbo.TASK_MASTER.STARTDATE, 106) AS StartDate, CONVERT(Nvarchar(50), dbo.TASK_MASTER.ENDDATE, 106) AS EndDate,  STP_AREA_1.AreaTitle + ' ' + dbo.STP_AREA.AreaTitle AS Area, dbo.STP_ACTIVITY.ATTITLE FROM            dbo.TASK_MASTER INNER JOIN dbo.STP_AREA AS STP_AREA_1 ON dbo.TASK_MASTER.AREAID = STP_AREA_1.AreaID INNER JOIN dbo.STP_AREA ON STP_AREA_1.PID = dbo.STP_AREA.AreaID INNER JOIN dbo.STP_ACTIVITY ON dbo.TASK_MASTER.ACTID = dbo.STP_ACTIVITY.ACTID WHERE        (dbo.TASK_MASTER.ISDELETE = 0) AND (dbo.TASK_MASTER.ISCOMP = 0)", Conn);
            SqlDataAdapter da = new SqlDataAdapter("SELECT        dbo.TASK_MASTER.TASKID, dbo.TASK_MASTER.TASKTITLE, CONVERT(Nvarchar(50), dbo.TASK_MASTER.STARTDATE, 106) AS StartDate, CONVERT(Nvarchar(50), dbo.TASK_MASTER.ENDDATE, 106) AS EndDate,  STP_AREA_1.AreaTitle + ' ' + dbo.STP_AREA.AreaTitle AS Area, dbo.STP_ACTIVITY.ATTITLE, dbo.TASK_STATUS.TaskCycleID, dbo.TASK_STATUS.ApprovalDuration, dbo.TASK_STATUS.DesID, dbo.TASK_STATUS.STATUS,  dbo.TASK_STATUS.ISACTIVE FROM            dbo.TASK_MASTER INNER JOIN dbo.STP_AREA AS STP_AREA_1 ON dbo.TASK_MASTER.AREAID = STP_AREA_1.AreaID INNER JOIN dbo.STP_AREA ON STP_AREA_1.PID = dbo.STP_AREA.AreaID INNER JOIN dbo.STP_ACTIVITY ON dbo.TASK_MASTER.ACTID = dbo.STP_ACTIVITY.ACTID INNER JOIN dbo.TASK_STATUS ON dbo.TASK_MASTER.TASKID = dbo.TASK_STATUS.TASKID WHERE        (dbo.TASK_MASTER.ISDELETE = 0) AND (dbo.TASK_MASTER.ISCOMP = 0) AND (dbo.TASK_STATUS.ISACTIVE = 1) and dbo.TASK_STATUS.TaskCycleID='"+dtcycle.Rows[0]["ID"].ToString()+"'", Conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

           
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    GetDistrictClass dbdc = new GetDistrictClass();

                    dbdc.ID = dt.Rows[i]["TASKID"].ToString();
                    dbdc.Name = dt.Rows[i]["TASKTITLE"].ToString();
                    dbdc.StartDate = dt.Rows[i]["StartDate"].ToString();
                    dbdc.EndDate = dt.Rows[i]["EndDate"].ToString();
                    dbdc.Area = dt.Rows[i]["Area"].ToString();
                    dbdc.ATTITLE = dt.Rows[i]["ATTITLE"].ToString();
                    dbdc.ATTITLE = dt.Rows[i]["ATTITLE"].ToString();
                    dbdc.CycleID = dtcycle.Rows[0]["TaskOrder"].ToString();
                    RegionList.Insert(i, dbdc);
                }

            }

        }
        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(RegionList);


    }


    [WebMethod]
    public static string LoadVehicleDetail(string TaskID)
    {
         
        string MasterHTML = "";
        MasterHTML = "<table  class='table table-sm  dataTable dtr-inline'  id='tablepagingVehDetail' ><thead class='bg-primary-500'> <th>Vehicle</th><th>Driver</th><th style='text-align:center;'>Action</th> </thead><tbody>";
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter("SELECT        dbo.STP_VEHICLE.VEHTITLE, dbo.STP_Employee.FirstName + ' ' + dbo.STP_Employee.LastName AS Name, dbo.TASK_VEHICLES.TASKID, dbo.TASK_VEHICLES.ISDELETE, dbo.STP_VEHICLE_TYPE.VTTITLE FROM            dbo.STP_VEHICLE INNER JOIN dbo.TASK_VEHICLES ON dbo.STP_VEHICLE.VEHID = dbo.TASK_VEHICLES.VEHID INNER JOIN dbo.STP_Employee ON dbo.TASK_VEHICLES.DRIVERID = dbo.STP_Employee.EmpID INNER JOIN dbo.STP_VEHICLE_TYPE ON dbo.STP_VEHICLE.VTID = dbo.STP_VEHICLE_TYPE.VTID WHERE        (dbo.TASK_VEHICLES.ISDELETE = 0) and dbo.TASK_VEHICLES.TASKID='" + TaskID + "' order by dbo.STP_VEHICLE_TYPE.VTID", Conn);
        DataTable dt = new DataTable();
        da.Fill(dt);

        //List<GetDistrictClass> RegionList = new List<GetDistrictClass>();
        //RegionList.Clear();
        //if (dt.Rows.Count > 0)
        //{
        //    for (int i = 0; i < dt.Rows.Count; i++)
        //    {
        //        GetDistrictClass dbdc = new GetDistrictClass();

        //        dbdc.ID = dt.Rows[i]["TASKID"].ToString();
        //        dbdc.Name = dt.Rows[i]["Name"].ToString();
        //        dbdc.VEHTITLE = dt.Rows[i]["VEHTITLE"].ToString();
        //        dbdc.VTTITLE = dt.Rows[i]["VTTITLE"].ToString();
                
        //        RegionList.Insert(i, dbdc);
        //    }

        //}


        //JavaScriptSerializer jser = new JavaScriptSerializer();


        //return jser.Serialize(RegionList);


        if (dt.Rows.Count > 0)
        {
            string OldVt = "";
            string NewVt = "";
            string currentGroup = string.Empty;
            for (int i = 0; i < dt.Rows.Count; i++)
            { string rowGroup = dt.Rows[i]["VTTITLE"].ToString();
            if (rowGroup != currentGroup)
            {
                string VTTITLE = dt.Rows[i]["VTTITLE"].ToString();
                OldVt = VTTITLE;
                //MasterHTML = MasterHTML + "<tr><td  > " + dt.Rows[i]["VEHTITLE"].ToString() + "</td><td   >" + dt.Rows[i]["Name"].ToString() + "</td></tr>";
                MasterHTML = MasterHTML + "<tr><td colspan=3  style='font-weight: bolder;background: #c5c5bf'> " + dt.Rows[i]["VTTITLE"].ToString() + "</td> </tr>";
                NewVt = OldVt;
                currentGroup = rowGroup;
            }
            else

            {
                MasterHTML = MasterHTML + "<tr  ><td  > " + dt.Rows[i]["VEHTITLE"].ToString() + "</td><td   >" + dt.Rows[i]["Name"].ToString() + "</td><td style='text-align:center;'><button class='btn buttons-selected btn-danger btn-sm mr-1' tabindex='0' aria-controls='dt-basic-example' type='button'  ><span><i class='fal fa-download'></i> Delete</span></button></td></tr>";
            }
                }

            }
        //}
        MasterHTML = MasterHTML + "</tbody></table>";
        return MasterHTML;

    }


    [WebMethod]
    public static string SaveTransaction(string Title, string UID, string dta, string Start, string AreaID, string ddlShift, string dtaVehicle, string UserID, string lblTaskID)
    {

        string vNo = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        string a = lblTaskID;

        SqlCommand cmdDeleteTeam = new SqlCommand("delete from TASK_TEAM where TaskID='" + lblTaskID + "'", Con);
        Con.Open();
        cmdDeleteTeam.ExecuteNonQuery();
        Con.Close();

        SqlCommand cmdDeleteVehicleRequest = new SqlCommand("delete from TASK_VEHICLE_REQUEST where TaskID='" + lblTaskID + "'", Con);
        Con.Open();
        cmdDeleteVehicleRequest.ExecuteNonQuery();
        Con.Close();

        //SqlCommand cmdDelete = new SqlCommand("delete from TASK_MASTER where TaskID='" + lblTaskID + "'", Con);
        //Con.Open();
        //cmdDelete.ExecuteNonQuery();
        //Con.Close();
        SqlCommand cmd = new SqlCommand("update TASK_MASTER set  TASKTITLE='" + Title + "',STARTDATE='" + Start + "',AREAID='" + AreaID + "',ACTID='" + UID + "',ShiftID='" + ddlShift + "' where TaskID='"+a+"'", Con);
        Con.Open();
        cmd.ExecuteNonQuery();
        Con.Close();

       

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

            SqlCommand cmdDetail = new SqlCommand("insert into TASK_VEHICLE_REQUEST (TASKID,VTID,QTY,CREATEBY) values ('" + a + "','" + txtPIDVehicle + "','" + txtValueVehicle + "' ,'" + UserID + "')", Con);
            Con.Open();
            cmdDetail.ExecuteNonQuery();
            Con.Close();
        }
        return vNo = "Updated Successfully.!";
    }


    [WebMethod]
    public static string LoadRegionTask(string TaskID)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter("SELECT        dbo.TASK_MASTER.TASKID, dbo.TASK_MASTER.TASKTITLE, dbo.TASK_MASTER.STARTDATE AS StartDate, dbo.TASK_MASTER.ENDDATE AS EndDate, STP_AREA_1.AreaTitle + ' ' + dbo.STP_AREA.AreaTitle AS Area, STP_AREA_1.AreaID, dbo.STP_ACTIVITY.ATTITLE, dbo.STP_ACTIVITY.ACTID, dbo.Shift.ShiftTitle, dbo.Shift.ShiftID FROM            dbo.TASK_MASTER INNER JOIN dbo.STP_AREA AS STP_AREA_1 ON dbo.TASK_MASTER.AREAID = STP_AREA_1.AreaID INNER JOIN dbo.STP_AREA ON STP_AREA_1.PID = dbo.STP_AREA.AreaID INNER JOIN dbo.STP_ACTIVITY ON dbo.TASK_MASTER.ACTID = dbo.STP_ACTIVITY.ACTID INNER JOIN dbo.Shift ON dbo.TASK_MASTER.ShiftID = dbo.Shift.ShiftID WHERE        (dbo.TASK_MASTER.ISDELETE = 0) AND (dbo.TASK_MASTER.ISCOMP = 0) and dbo.TASK_MASTER.TASKID='" + TaskID + "'", Conn);
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
                dbdc.StartDate = dt.Rows[i]["StartDate"].ToString();
                dbdc.EndDate = dt.Rows[i]["EndDate"].ToString();
                dbdc.Area = dt.Rows[i]["AreaID"].ToString();
                dbdc.ATTITLE = dt.Rows[i]["ACTID"].ToString();
                dbdc.ShiftTitle = dt.Rows[i]["ShiftID"].ToString();
                string htm = "";
                SqlDataAdapter dda = new SqlDataAdapter("SELECT        dbo.TASK_VEHICLE_REQUEST.TASKID, dbo.STP_VEHICLE_TYPE.VTID, dbo.STP_VEHICLE_TYPE.VTTITLE, dbo.TASK_VEHICLE_REQUEST.QTY, dbo.TASK_VEHICLE_REQUEST.ISDELETE FROM            dbo.TASK_VEHICLE_REQUEST INNER JOIN dbo.STP_VEHICLE_TYPE ON dbo.TASK_VEHICLE_REQUEST.VTID = dbo.STP_VEHICLE_TYPE.VTID WHERE        (dbo.TASK_VEHICLE_REQUEST.ISDELETE = 0) and   dbo.TASK_VEHICLE_REQUEST.TASKID='" + TaskID + "'", Conn);
                DataTable dtt = new DataTable();
                dda.Fill(dtt);
                if (dtt.Rows.Count > 0)
                {
                    int cc = 0;
                    for (int j = 0; j < dtt.Rows.Count; j++)
                    {
                        if (cc == 0)
                        {
                            htm = htm + dtt.Rows[j]["VTID"].ToString() + '^' + dtt.Rows[j]["QTY"].ToString();
                        }
                        else
                        {
                            htm = htm + "`" + dtt.Rows[j]["VTID"].ToString() + '^' + dtt.Rows[j]["QTY"].ToString();
                        }
                        cc++;
                    }
                }
                dbdc.VehicleList = htm;
                RegionList.Insert(i, dbdc);
            }

        }


        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(RegionList);


    }

    [WebMethod]
    public static string LoadVehicle()
    {

        //string str = "select * from STP_Employee where IsDelete=0 order by FirstName";
        string str = "select * from STP_VEHICLE where IsDelete=0 order by VEHTITLE";

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
                dbdc.ID = dt.Rows[i]["VEHID"].ToString();
                dbdc.Name = dt.Rows[i]["VEHTITLE"].ToString();
                RegionList.Insert(i, dbdc);
            }

        }

        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(RegionList);


    }


    [WebMethod]
    public static string LoadDriver()
    {

        //string str = "select * from STP_Employee where IsDelete=0 order by FirstName";
        string str = "select * from STP_Employee where IsDelete=0 order by FirstName";

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
                dbdc.ID = dt.Rows[i]["EmpID"].ToString();
                dbdc.Name = dt.Rows[i]["FirstName"].ToString() + " " + dt.Rows[i]["LastName"].ToString();
                RegionList.Insert(i, dbdc);
            }

        }

        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(RegionList);


    }
     public class GetRegionClass
    {
        public string ID { get; set; }
        public string Name { get; set; }

    }

     [WebMethod]
     public static string SaveVehicle(string ddlVehicle, string ddlDriver, string lbltaskid)
     {

         string vNo = "";
         SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
         string a = AACommon.GetAlphaNumericIDSIX("TASK_MASTER", "TSK-", "TASKID", Con);
         SqlCommand cmd = new SqlCommand("insert into TASK_VEHICLES (TASKID,VEHID,DRIVERID,CREATEBY) values ('" + lbltaskid + "','" + ddlVehicle + "','" + ddlDriver + "','U-00001')", Con);
         Con.Open();
         cmd.ExecuteNonQuery();
         Con.Close();
         return vNo;

           
     }

    public class GetDistrictClass
    {
        public string ID { get; set; }
        public string Name { get; set; }
        public string Region { get; set; }
        public string Path { get; set; }
        public string Area { get; set; }

          public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string ATTITLE { get; set; }
        public string ShiftTitle { get; set; }
        public string VehicleList { get; set; }
        public string VEHTITLE { get; set; }
        public string VTTITLE { get; set; }
        public string CycleID { get; set; }
        
        

    }
     
}