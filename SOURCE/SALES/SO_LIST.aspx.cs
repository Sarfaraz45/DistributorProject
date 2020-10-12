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


public partial class SALES_SO_LIST : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string SET_DATE(string dtFROM, string dtTO)
    {
        string summary = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        // System.Windows.Forms.MessageBox.Show(summary);
        try
        {
            DataTable dt = AACommon.LoadControl("DATE_FILTER", con, null);


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i > 0) { summary = summary + "`"; }

                summary = summary + dt.Rows[i]["WeekStart"].ToString() + "^" + dt.Rows[i]["WeekEnd"].ToString();
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);

            //return null;
        }
        //}

        return summary;
    }

    [WebMethod]
    public static string LoadLIST(string cusID, string dtFROM, string dtTO)
    {
        string htm = "";
        htm = htm + "<table id='data-table' class='table  dataTable dtr-inline table-hover' >";
        htm = htm + "<thead  class='thead-themed'><tr>";
        htm = htm + "<th>SO ID</th>";
        htm = htm + "<th>SO Date</th>";
        htm = htm + "<th>Customer</th>";
        htm = htm + "<th></th>";
        htm = htm + "</tr>";
        htm = htm + "</thead>";
        htm = htm + "<tbody>";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlParameter DtFrom = new SqlParameter("@DtFrom", dtFROM);
        SqlParameter DtTo = new SqlParameter("@DtTo", dtTO);
        SqlParameter CustomerID = new SqlParameter("@CustomerID", cusID);
        DataSet ds = AACommon.ReturnDatasetBySP("SO_LIST_V2", Con, DtFrom, DtTo, CustomerID);
        DataTable dt = new DataTable();
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];        
        }

        for (int i = 0; i < dt.Rows.Count; i++)
        {

            htm = htm + "<tr >";
            htm = htm + "<td>" + dt.Rows[i]["SOID"].ToString() + "</td>";
            htm = htm + "<td>" + dt.Rows[i]["SODate"].ToString() + "</td>";
            htm = htm + "<td>" + dt.Rows[i]["CustomerTitle"].ToString() + "</td>";
            htm = htm + "<td><a href='SaleOrderEDIT.aspx?ID=" + dt.Rows[i]["SOID"].ToString() + "'>Edit</a></td>";
            htm = htm + "</tr>";
        }
        htm = htm + "</tbody>";
        htm = htm + "</table>";
        return htm;
    }
}