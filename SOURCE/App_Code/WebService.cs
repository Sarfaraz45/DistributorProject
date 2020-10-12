using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Data.Sql;
using System.Web.Script.Services;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the followsing line. 
 [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService {
    public string PageURL;
    public WebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }

    [WebMethod]
    public string NotificationList(string DesID)
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);

        string TaskCount = "";
        string TaskDetail = "";

//        SqlDataAdapter da = new SqlDataAdapter("SELECT        dbo.TASK_MASTER.TASKID, dbo.TASK_MASTER.TASKTITLE, convert(nvarchar(20),dbo.TASK_MASTER.STARTDATE,106) AS STARTDATE,  convert(nvarchar(20),dbo.TASK_MASTER.ENDDATE,106) AS ENDDATE, dbo.STP_AREA.AreaTitle + ' ' + STP_AREA_1.AreaTitle AS Area, dbo.TASK_STATUS.ISACTIVE,  dbo.TASK_STATUS.DesID, dbo.TASK_STATUS.STATUSDATE FROM            dbo.TASK_STATUS INNER JOIN dbo.TASK_MASTER ON dbo.TASK_STATUS.TASKID = dbo.TASK_MASTER.TASKID INNER JOIN dbo.STP_AREA ON dbo.TASK_MASTER.AREAID = dbo.STP_AREA.AreaID INNER JOIN dbo.STP_AREA AS STP_AREA_1 ON dbo.STP_AREA.PID = STP_AREA_1.AreaID WHERE        (dbo.TASK_STATUS.ISACTIVE = 1) and dbo.TASK_STATUS.DesID='" + DesID + "' ", Con);
        SqlDataAdapter da = new SqlDataAdapter("SELECT        dbo.TASK_MASTER.TASKID, dbo.TASK_MASTER.TASKTITLE, CONVERT(nvarchar(20), dbo.TASK_MASTER.STARTDATE, 106) AS STARTDATE, CONVERT(nvarchar(20), dbo.TASK_MASTER.ENDDATE, 106) AS ENDDATE, dbo.STP_AREA.AreaTitle + ' ' + STP_AREA_1.AreaTitle AS Area, dbo.TASK_STATUS.ISACTIVE, dbo.TASK_STATUS.DesID, dbo.TASK_STATUS.STATUSDATE, dbo.Shift.ShiftTitle, dbo.STP_ACTIVITY.ATTITLE,  dbo.TASK_STATUS.TaskCycleID, dbo.TASK_CYCLE.TaskOrder, dbo.TASK_CYCLE.ApprovalDuration, dbo.TASK_CYCLE.IsAdministrator FROM            dbo.TASK_STATUS INNER JOIN dbo.TASK_MASTER ON dbo.TASK_STATUS.TASKID = dbo.TASK_MASTER.TASKID INNER JOIN dbo.STP_AREA ON dbo.TASK_MASTER.AREAID = dbo.STP_AREA.AreaID INNER JOIN dbo.STP_AREA AS STP_AREA_1 ON dbo.STP_AREA.PID = STP_AREA_1.AreaID INNER JOIN dbo.Shift ON dbo.TASK_MASTER.ShiftID = dbo.Shift.ShiftID INNER JOIN dbo.STP_ACTIVITY ON dbo.TASK_MASTER.ACTID = dbo.STP_ACTIVITY.ACTID INNER JOIN dbo.TASK_CYCLE ON dbo.TASK_STATUS.TaskCycleID = dbo.TASK_CYCLE.ID WHERE        (dbo.TASK_STATUS.ISACTIVE = 1) and dbo.TASK_STATUS.DesID='" + DesID + "' ", Con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        string htmlCOA = "";
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["IsAdministrator"].ToString() == "1")
                {
                    htmlCOA = htmlCOA + " <li class='unread'><a href='../HR/TaskProcess.aspx' class='d-flex align-items-center'> <span class='d-flex flex-column flex-1 ml-1'><span class='name'>TITLE : " + dt.Rows[i]["TASKTITLE"].ToString() + " </span><span  class='fs-nano text-muted mt-1' style='font-weight:bolder;'>DATE : " + dt.Rows[i]["STARTDATE"].ToString() + "  </span><span  class='fs-nano text-muted mt-1' style='font-weight:bolder;'>AREA : " + dt.Rows[i]["Area"].ToString() + "</span><span  class='fs-nano text-muted mt-1' style='font-weight:bolder;'>ACTIVITY : " + dt.Rows[i]["ATTITLE"].ToString() + "</span><span class='fs-nano text-muted mt-1' style='font-weight:bolder;'>TASK DATE & TIME : " + dt.Rows[i]["STATUSDATE"].ToString() + "</span></span></a></li>";
                }
                else
                {
                    if (dt.Rows[i]["IsAdministrator"].ToString() == "0" && dt.Rows[i]["TaskOrder"].ToString() == "1")
                    {
                        htmlCOA = htmlCOA + " <li class='unread'><a href='../HR/VehicleRequest.aspx' class='d-flex align-items-center'> <span class='d-flex flex-column flex-1 ml-1'><span class='name'>TITLE : " + dt.Rows[i]["TASKTITLE"].ToString() + " </span><span  class='fs-nano text-muted mt-1' style='font-weight:bolder;'>DATE : " + dt.Rows[i]["STARTDATE"].ToString() + "  </span><span  class='fs-nano text-muted mt-1' style='font-weight:bolder;'>AREA : " + dt.Rows[i]["Area"].ToString() + "</span><span  class='fs-nano text-muted mt-1' style='font-weight:bolder;'>ACTIVITY : " + dt.Rows[i]["ATTITLE"].ToString() + "</span><span class='fs-nano text-muted mt-1' style='font-weight:bolder;'>TASK DATE & TIME : " + dt.Rows[i]["STATUSDATE"].ToString() + "</span></span></a></li>";
                    }
                    else { htmlCOA = htmlCOA + " <li class='unread'><a href='../HR/TaskProcessOps.aspx' class='d-flex align-items-center'> <span class='d-flex flex-column flex-1 ml-1'><span class='name'>TITLE : " + dt.Rows[i]["TASKTITLE"].ToString() + " </span><span  class='fs-nano text-muted mt-1' style='font-weight:bolder;'>DATE : " + dt.Rows[i]["STARTDATE"].ToString() + "  </span><span  class='fs-nano text-muted mt-1' style='font-weight:bolder;'>AREA : " + dt.Rows[i]["Area"].ToString() + "</span><span  class='fs-nano text-muted mt-1' style='font-weight:bolder;'>ACTIVITY : " + dt.Rows[i]["ATTITLE"].ToString() + "</span><span class='fs-nano text-muted mt-1' style='font-weight:bolder;'>TASK DATE & TIME : " + dt.Rows[i]["STATUSDATE"].ToString() + "</span></span></a></li>"; }
                }
                

            }
            TaskDetail = htmlCOA;
            TaskCount = Convert.ToString(dt.Rows.Count);
        }
        else
        {
            TaskDetail = "";
            TaskCount = "0";
        }
         

        return TaskDetail + "`" + TaskCount;

    }

    [WebMethod]
    public string drawMenu(string UTID)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        //PageURL = Request.Url.AbsolutePath;
        PageURL = HttpContext.Current.Request.Url.AbsolutePath;

        int i = 0;
        int j = 0; string InnerHTML = "";

        PageURL = PageURL.ToLowerInvariant();





        string str = "select distinct FormID As id, FormTitle As name , PID As parentid , Path As path from  VW_MENU_NEW  where PID=0 and UserID='" + UTID + "' order by FormID";
        SqlDataAdapter sqladp = new SqlDataAdapter(str, Conn);
        DataTable dt = new DataTable();
        sqladp.Fill(dt);


        //InnerHTML = InnerHTML + "<ul id='js-nav-menu' class='nav-menu js-nav-built'>";
        InnerHTML = InnerHTML + "<ul id='js-nav-menu' class='nav-menu'>";
        for (i = 0; i < dt.Rows.Count; i++)
        {
            string hasChild = getchildes(Convert.ToInt32(dt.Rows[i]["id"].ToString()), UTID);
            if (hasChild == "")
            {
                string ActiveChild = "";
                string path = dt.Rows[i]["path"].ToString();
                path = path.ToLowerInvariant();

                if (PageURL.IndexOf(path) != -1)
                { ActiveChild = " class=active"; }

                InnerHTML = InnerHTML + "<li>";

                InnerHTML = InnerHTML + "<a href='" + "../" + dt.Rows[i]["path"].ToString() + "" + "' title=" + dt.Rows[i]["name"].ToString() + " data-filter-tags='" + dt.Rows[i]["id"].ToString() + "' ><i class='fal fa-info-circle'></i><span class='nav-link-text' data-i18n='nav." + dt.Rows[i]["id"].ToString() + "'>" + dt.Rows[i]["name"].ToString() + "</span></a>";

                InnerHTML = InnerHTML + "</li>";






            }
            else
            {
                string ActiveParent = "";
                if (hasChild.IndexOf("class=active") != -1) { ActiveParent = " active"; }

                string TotalChild = hasChild;
                TotalChild = TotalChild.Substring(0, TotalChild.IndexOf("`"));
                hasChild = hasChild.Substring(hasChild.IndexOf("`") + 1);


                //                InnerHTML = InnerHTML + " <li ><a href='#' title=" + dt.Rows[i]["name"].ToString() + " data-filter-tags='" + dt.Rows[i]["id"].ToString() + "'  class='waves-effect waves-themed'><i class='fal fa-info-circle'></i><span class='nav-link-text' data-i18n='nav." + dt.Rows[i]["id"].ToString() + "'>" + dt.Rows[i]["name"].ToString() + "</span><b class='collapse-sign'><em class='fal fa-angle-up'></em></b></a>";
                InnerHTML = InnerHTML + " <li ><a href='#' title=" + dt.Rows[i]["name"].ToString() + " data-filter-tags='" + dt.Rows[i]["id"].ToString() + "'  ><i class='fal fa-info-circle'></i><span class='nav-link-text' data-i18n='nav." + dt.Rows[i]["id"].ToString() + "'>" + dt.Rows[i]["name"].ToString() + "</span></a>";

                //                InnerHTML = InnerHTML + " <ul style='display: block;'>";
                InnerHTML = InnerHTML + " <ul>";


                InnerHTML = InnerHTML + hasChild;
                InnerHTML = InnerHTML + "</ul></li>";

            }
        }

        InnerHTML = InnerHTML + "</ul>";

        return InnerHTML;


    }

    public string getchildes(int x, string UTID)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        string SubString = "";
        int k = 0;

        string str = "select distinct FormID As id, FormTitle As name , PID As parentid , Path As path from  VW_MENU_NEW  where PID=" + x + " and UserID='" + UTID + "' order by FormID";
        SqlDataAdapter da = new SqlDataAdapter(str, Conn);
        DataTable dtA = new DataTable();
        da.Fill(dtA);
        int noOfChild = dtA.Rows.Count;

        for (int i = 0; i < dtA.Rows.Count; i++)
        {
            if (dtA.Rows.Count == 0)
            {
                SubString = "";
            }
            else
            {
                string hasChild = getSubchildes(Convert.ToInt32(dtA.Rows[i]["id"].ToString()), UTID, x);
                if (hasChild == "")
                {
                    string ActiveChild = "";
                    string path = dtA.Rows[i]["path"].ToString();
                    path = path.ToLowerInvariant();

                    if (PageURL.IndexOf(path) != -1)
                    { ActiveChild = " class=active"; }


                    //                    SubString = SubString + " <li><a href='" + "../" + dtA.Rows[i]["path"].ToString() + "" + "' title=" + dtA.Rows[i]["name"].ToString() + " data-filter-tags='" + x + "' '" + dtA.Rows[i]["id"].ToString() + "' class='waves-effect waves-themed'><span class='nav-link-text' data-i18n='nav." + x + "_" + dtA.Rows[i]["id"].ToString() + "'>" + dtA.Rows[i]["name"].ToString() + "</span></a></li>";
                    SubString = SubString + " <li><a href='" + "../" + dtA.Rows[i]["path"].ToString() + "" + "' title=" + dtA.Rows[i]["name"].ToString() + " data-filter-tags='" + x + " " + dtA.Rows[i]["id"].ToString() + "'  ><span class='nav-link-text' data-i18n='nav." + x + "_" + dtA.Rows[i]["id"].ToString() + "'>" + dtA.Rows[i]["name"].ToString() + "</span></a></li>";


                }
                else
                {
                    string ActiveParent = "";
                    if (hasChild.IndexOf("class=active") != -1) { ActiveParent = " active"; }

                    string TotalChild = hasChild;
                    TotalChild = TotalChild.Substring(0, TotalChild.IndexOf("`"));
                    hasChild = hasChild.Substring(hasChild.IndexOf("`") + 1);
                    //  SubString = SubString + "<li class='open'><a href='javascript:void(0);' title=" + dtA.Rows[i]["name"].ToString() + " data-filter-tags='" + x + " " + dtA.Rows[i]["id"].ToString() + "' class='waves-effect waves-themed' aria-expanded='true'><span class='nav-link-text' data-i18n='nav." + x + "_" + dtA.Rows[i]["id"].ToString() + "'>" + dtA.Rows[i]["name"].ToString() + "</span><b class='collapse-sign'><em class='fal fa-angle-up'></em></b></a>";
                    //SubString = SubString + " <li><a href='" + "../" + dtA.Rows[i]["path"].ToString() + "" + "' title=" + dtA.Rows[i]["name"].ToString() + " data-filter-tags='" + x + "' '" + dtA.Rows[i]["id"].ToString() + "' class='waves-effect waves-themed'><span class='nav-link-text' data-i18n='nav." + x + "_" + dtA.Rows[i]["id"].ToString() + "'>" + dtA.Rows[i]["name"].ToString() + "</span></a></li>";
                    SubString = SubString + " <li><a href='#" + "' title=" + dtA.Rows[i]["name"].ToString() + " data-filter-tags='" + x + " " + dtA.Rows[i]["id"].ToString() + "'  ><span class='nav-link-text' data-i18n='nav." + x + "_" + dtA.Rows[i]["id"].ToString() + "'>" + dtA.Rows[i]["name"].ToString() + "</span></a>";
                     SubString = SubString + " <ul>";

                    SubString = SubString + hasChild;
                   // SubString = SubString + "</li>";
                    SubString = SubString + "</ul></li>";






                }

            }
        }
        if (noOfChild > 0) { SubString = noOfChild + "`" + SubString; }


        return SubString;
    }


    public string getSubchildes(int x, string UTID, int z)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        string SubString = "";
        int k = 0;

        string str = "select distinct FormID As id, FormTitle As name , PID As parentid , Path As path from  VW_MENU_NEW  where PID=" + x + " and UserID='" + UTID + "' order by FormID";
        SqlDataAdapter da = new SqlDataAdapter(str, Conn);
        DataTable dtA = new DataTable();
        da.Fill(dtA);
        int noOfChild = dtA.Rows.Count;

        for (int i = 0; i < dtA.Rows.Count; i++)
        {
            if (dtA.Rows.Count == 0)
            {
                SubString = "";
            }
            else
            {
                string hasChild = getchildes(Convert.ToInt32(dtA.Rows[i]["id"].ToString()), UTID);
                if (hasChild == "")
                {
                    string ActiveChild = "";
                    string path = dtA.Rows[i]["Path"].ToString();
                    path = path.ToLowerInvariant();

                    if (PageURL.IndexOf(path) != -1)
                    { ActiveChild = " class=active"; }
                    //                    SubString = SubString + "<ul style='display: block;'><li><a href='" + "../" + dtA.Rows[i]["Path"].ToString() + "' title='Showcase' data-filter-tags='" + z + " " + x + " " + dtA.Rows[i]["name"].ToString() + "'  class='waves-effect waves-themed'><span class='nav-link-text' data-i18n='nav." + z + "_" + x + "_" + dtA.Rows[i]["id"].ToString() + "'>" + dtA.Rows[i]["name"].ToString() + "</span></a></li></ul>";
                    SubString = SubString + " <li><a href='" + "../" + dtA.Rows[i]["Path"].ToString() + "' title='Showcase' data-filter-tags='" + z + " " + x + " " + dtA.Rows[i]["name"].ToString() + "'  ><span class='nav-link-text' data-i18n='nav." + z + "_" + x + "_" + dtA.Rows[i]["id"].ToString() + "'>" + dtA.Rows[i]["name"].ToString() + "</span></a></li>";

                }
                else
                {
                    string ActiveParent = "";
                    if (hasChild.IndexOf("class=active") != -1) { ActiveParent = " active"; }

                    string TotalChild = hasChild;
                    TotalChild = TotalChild.Substring(0, TotalChild.IndexOf("`"));
                    hasChild = hasChild.Substring(hasChild.IndexOf("`") + 1);

                    SubString = SubString + "<li class='has-sub" + ActiveParent + "'>";
                    SubString = SubString + "<a href='javascript:;'>";
                    SubString = SubString + "<b class='caret pull-right'></b>";
                    SubString = SubString + "<span class='badge pull-right'>" + TotalChild + "</span>";
                    SubString = SubString + "<i class='fa " + dtA.Rows[i]["ICON_CSS"].ToString() + "'></i>";
                    SubString = SubString + "<span>" + dtA.Rows[i]["FormTitle"].ToString() + "</span>";
                    SubString = SubString + "</a>";
                    SubString = SubString + "<ul class='sub-menu'>";
                    SubString = SubString + hasChild;
                    SubString = SubString + "</ul></li>";

                }

            }
        }
        if (noOfChild > 0) { SubString = noOfChild + "`" + SubString; }


        return SubString;
    }

   


    [WebMethod]
    public string ChangeSetting(string NewPassword, string UserID)
    {

        string retMessage = string.Empty;
        NewPassword = Encryption.Encrypt(NewPassword);
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlCommand cmd = new SqlCommand("update USERS set Password='" + NewPassword + "' where UserID='" + UserID + "'", Conn);
        Conn.Open();
        cmd.ExecuteNonQuery();
        Conn.Close();
        retMessage = "true";
        return retMessage;
    }
    
}
