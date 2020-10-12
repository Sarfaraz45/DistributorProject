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
using System.IO;

public partial class PROCUREMENT_PendingRequisitionList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string LoadLIST(string UserID)
    {
        string htm = "";
        htm = htm + "<table id='data-table'  class='table table-striped table-hover no-head-border' >";
        htm = htm + "<thead class='vd_bg-dark-blue vd_white'><tr>";
        htm = htm + "<th>Requisition ID</th>";
        htm = htm + "<th>Requisition Date</th>";
        htm = htm + "<th>Requisition By</th>";
        htm = htm + "<th></th>";
        htm = htm + "</tr>";
        htm = htm + "</thead>";
        htm = htm + "<tbody>";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlParameter userID = new SqlParameter("@UserID",UserID);
        DataSet ds = AACommon.ReturnDatasetBySP("PROC_REQUISITION_PENDING_V2", Con, userID);
        DataTable dt = new DataTable();
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
        }

        for (int i = 0; i < dt.Rows.Count; i++)
        {

            htm = htm + "<tr >";
            htm = htm + "<td>" + dt.Rows[i]["ReqID"].ToString() + "</td>";
            htm = htm + "<td>" + dt.Rows[i]["RqDate"].ToString() + "</td>";
            htm = htm + "<td>" + dt.Rows[i]["ReqByName"].ToString() + "</td>";
            htm = htm + "<td><a href='ReqEdit.aspx?ID=" + dt.Rows[i]["ReqID"].ToString() + "' >View Detail</a></td>";
            htm = htm + "</tr>";
        }
        htm = htm + "</tbody>";
        htm = htm + "</table>";
        return htm;
    }
}