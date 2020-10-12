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


public partial class PROCUREMENT_PO_LIST : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string LoadLIST(string UserID)
    {
        string htm = "";
        htm = htm + "<table id='data-table' class='table table-striped table-hover no-head-border' >";
        htm = htm + "<thead class='vd_bg-dark-blue vd_white'><tr>";
        htm = htm + "<th>PO ID</th>";
        htm = htm + "<th>PO Date</th>";
        htm = htm + "<th>Supplier</th>";
        htm = htm + "<th></th>";
        htm = htm + "</tr>";
        htm = htm + "</thead>";
        htm = htm + "<tbody>";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        DataSet ds = AACommon.ReturnDatasetBySP("PO_LIST_V2", Con, null);
        DataTable dt = new DataTable();
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];        
        }

        for (int i = 0; i < dt.Rows.Count; i++)
        {

            htm = htm + "<tr >";
            htm = htm + "<td>" + dt.Rows[i]["SOID"].ToString() + "</td>";
            htm = htm + "<td>" + dt.Rows[i]["PODate"].ToString() + "</td>";
            htm = htm + "<td>" + dt.Rows[i]["SupplierTitle"].ToString() + "</td>";
            htm = htm + "<td><a href='../REPORTS/PO_His.aspx?ID=" + dt.Rows[i]["SOID"].ToString() + "' target='_blank'>Print</a></td>";
            htm = htm + "</tr>";
        }
        htm = htm + "</tbody>";
        htm = htm + "</table>";
        return htm;
    }
}