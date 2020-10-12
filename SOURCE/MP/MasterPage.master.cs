using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
using System.Data;

public partial class Masterpage_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);

        SqlDataAdapter daDT = new SqlDataAdapter("Select CONVERT(VARCHAR(10), StartDate, 101) as StartDate,CONVERT(VARCHAR(10), EndDate, 101) as EndDate FROM DATE_RANGE", Con);
        DataTable dtDT = new DataTable();
        daDT.Fill(dtDT);
        if (dtDT.Rows.Count > 0)
        {
            for (int i = 0; i < dtDT.Rows.Count; i++)
            {

                hdnPrdStart.Value = dtDT.Rows[i]["StartDate"].ToString();
                hdnPrdEnd.Value = dtDT.Rows[i]["EndDate"].ToString();
            }

        }
    }
    
    
}
