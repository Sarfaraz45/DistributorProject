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

public partial class Setup_Rights : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string SaveTransaction(string UID, string dta)
    {

        string vNo = "";
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);

        
        SqlParameter UTID_1 = new SqlParameter("@UTID", UID);
        AACommon.Execute("USER_FORMS_DELETE", Con, UTID_1);


        string[] trnsString = dta.Split('^');

        for (int i = 0; i < trnsString.Length; i++)
        {
            string[] trnsD = trnsString[i].Split('`');
            string txtPID = trnsD[0];
            string txtFID = trnsD[1];

            SqlParameter FormID = new SqlParameter("@FormID", txtFID);
            SqlParameter PID = new SqlParameter("@PID", txtPID);
            SqlParameter UTID = new SqlParameter("@UTID", UID);
            AACommon.Execute("USER_FORMS_INSERT", Con, FormID, PID, UTID);




        }

       
        return vNo;
    }


    [WebMethod]
    public static string LoadLIST(string UTID)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        int i = 0;
        int j = 0; string InnerHTML = "";
        string str = "";// "select distinct FormID As id, FormTitle As name , PID As parentid , Path As path from  VW_MENU  where PID=0 and UTID='" + UTID + "' order by FormID";
        str = "select FormID As id, FormTitle As name,PID As parentid,isnull((select UTFID from USER_FORMS where FormID=forms.FormID and UTID='" + UTID + "'),0) as UTFID,'' As path from forms where PID='0' and IsDelete='0' order by FormID";
        
        SqlDataAdapter sqladp = new SqlDataAdapter(str, Conn);
        DataTable dt = new DataTable();
        sqladp.Fill(dt);

        //InnerHTML = InnerHTML;// +"<ul><li class='nav-header'>Navigation</li>";
        for (i = 0; i < dt.Rows.Count; i++)
        {
            string chkID = "chk" + dt.Rows[i]["parentid"].ToString() + "`" + dt.Rows[i]["id"].ToString();
            string utfid = dt.Rows[i]["UTFID"].ToString();
            string chek = "";
            if (utfid != "0") { chek = "checked"; }

            string hasChild = getchildes(Convert.ToInt32(dt.Rows[i]["id"].ToString()), UTID);
            if (hasChild == "")
            {

                InnerHTML = InnerHTML + "<li><input type='checkbox' id='" + chkID + "' "+chek+">" + dt.Rows[i]["name"].ToString() + "</input>";
                InnerHTML = InnerHTML + "</li>";

            }
            else
            {
               
                string TotalChild = hasChild;
                TotalChild = TotalChild.Substring(0, TotalChild.IndexOf("`"));
                hasChild = hasChild.Substring(hasChild.IndexOf("`") + 1);

                InnerHTML = InnerHTML + "<li>";
                InnerHTML = InnerHTML + "<span>" + dt.Rows[i]["name"].ToString() + "</span>";
                InnerHTML = InnerHTML + "<ul>";
                InnerHTML = InnerHTML + hasChild;
                InnerHTML = InnerHTML + "</ul></li>";

            }
        }
        InnerHTML = InnerHTML + "</ul>";
        //dvMenu.InnerHtml = InnerHTML;
        return InnerHTML;


    }

    public static string getchildes(int x, string UTID)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        string SubString = "";
        int k = 0;
        string str = "";// "select distinct FormID As id, FormTitle As name , PID As parentid , Path As path from  VW_MENU  where PID=" + x + " and UTID='" + UTID + "' order by FormID";

        str = "select FormID As id, FormTitle As name,PID As parentid,isnull((select UTFID from USER_FORMS where FormID=forms.FormID and UTID='" + UTID + "'),0) as UTFID,'' As path from forms where PID=" + x + " and IsDelete='0' order by FormID";
        SqlDataAdapter da = new SqlDataAdapter(str, Conn);
        DataTable dtA = new DataTable();
        da.Fill(dtA);
        int noOfChild = dtA.Rows.Count;

        for (int i = 0; i < dtA.Rows.Count; i++)
        {
            string chkID = "chk" + dtA.Rows[i]["parentid"].ToString() + "`" + dtA.Rows[i]["id"].ToString();
            string utfid = dtA.Rows[i]["UTFID"].ToString();
            string chek = "";
            if (utfid != "0") { chek = "checked"; }

            if (dtA.Rows.Count == 0)
            {
                SubString = "";
            }
            else
            {
                string hasChild = getSubchildes(Convert.ToInt32(dtA.Rows[i]["id"].ToString()), UTID);
                if (hasChild == "")
                {

                    SubString = SubString + "<li><input type='checkbox' id='" + chkID + "' "+chek+">" + dtA.Rows[i]["name"].ToString() + "</input>";
                    SubString = SubString + "</li>";

                }
                else
                {
                    string TotalChild = hasChild;
                    TotalChild = TotalChild.Substring(0, TotalChild.IndexOf("`"));
                    hasChild = hasChild.Substring(hasChild.IndexOf("`") + 1);


                    SubString = SubString + "<li>";
                    SubString = SubString + "<span>" + dtA.Rows[i]["name"].ToString() + "</span>";
                    SubString = SubString + "<ul>";
                    SubString = SubString + hasChild;
                    SubString = SubString + "</ul></li>";

                }

            }
        }
        if (noOfChild > 0) { SubString = noOfChild + "`" + SubString; }


        return SubString;
    }


    public static string getSubchildes(int x, string UTID)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        string SubString = "";
        int k = 0;
        string str = "";// "select * from  VW_MENU  where PID=" + x + " order by FormID";
        str = "select FormID As id, FormTitle As name,PID As parentid,isnull((select UTFID from USER_FORMS where FormID=forms.FormID and UTID='" + UTID + "'),0) as UTFID,'' As path from forms where PID=" + x + " and IsDelete='0' order by FormID";
        SqlDataAdapter da = new SqlDataAdapter(str, Conn);
        DataTable dtA = new DataTable();
        da.Fill(dtA);
        int noOfChild = dtA.Rows.Count;

        for (int i = 0; i < dtA.Rows.Count; i++)
        {
            string chkID = "chk" + dtA.Rows[i]["parentid"].ToString() + "`" + dtA.Rows[i]["id"].ToString();
            string utfid = dtA.Rows[i]["UTFID"].ToString();
            string chek = "";
            if (utfid != "0") { chek = "checked"; }
            if (dtA.Rows.Count == 0)
            {
                SubString = "";
            }
            else
            {
                string hasChild = getchildes(Convert.ToInt32(dtA.Rows[i]["id"].ToString()), UTID);
                if (hasChild == "")
                {
                    SubString = SubString + "<li><input type='checkbox' id='" + chkID + "' "+chek+">" + dtA.Rows[i]["name"].ToString() + "</input>";
                    SubString = SubString + "</li>";

                }
                else
                {
                    string TotalChild = hasChild;
                    TotalChild = TotalChild.Substring(0, TotalChild.IndexOf("`"));
                    hasChild = hasChild.Substring(hasChild.IndexOf("`") + 1);

                    SubString = SubString + "<li>";
                    SubString = SubString + "<span>" + dtA.Rows[i]["name"].ToString() + "</span>";
                    SubString = SubString + "<ul>";
                    SubString = SubString + hasChild;
                    SubString = SubString + "</ul></li>";

                }

            }
        }
        if (noOfChild > 0) { SubString = noOfChild + "`" + SubString; }


        return SubString;
    }




    [WebMethod]
    public static string LoadUTIDCombo()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        DataSet ds = AACommon.ReturnDatasetBySPWithoutParameter("USER_Get", Conn);
        List<GetRegionClass> RegionList = new List<GetRegionClass>();
        RegionList.Clear();
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                GetRegionClass dbdc = new GetRegionClass();

                dbdc.ID = ds.Tables[0].Rows[i]["UID"].ToString();
                dbdc.Name = ds.Tables[0].Rows[i]["UserName"].ToString();
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

}