using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class HR_Default : System.Web.UI.Page
{
    //public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    




   

    [WebMethod]
    public static string LoadRegion()
    {

        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        DataSet ds = AACommon.ReturnDatasetBySPWithoutParameter("STP_Employee_Get", Conn);
        List<GetEmployeeSalaryClass> GetEmployeeSalaryClass = new List<GetEmployeeSalaryClass>();
        GetEmployeeSalaryClass.Clear();
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                GetEmployeeSalaryClass dbdc = new GetEmployeeSalaryClass();

                
                
                dbdc.EmpID = ds.Tables[0].Rows[i]["EmpID"].ToString();
                dbdc.Name = ds.Tables[0].Rows[i]["FirstName"].ToString() + ds.Tables[0].Rows[i]["LastName"].ToString();                
                GetEmployeeSalaryClass.Insert(i, dbdc);
            }

        }


            JavaScriptSerializer jser = new JavaScriptSerializer();


            return jser.Serialize(GetEmployeeSalaryClass);


        }



    public class GetEmployeeSalaryClass
    {
        public string SerialNo { get; set; }
        public string ID { get; set; }
        public string EmpID { get; set; }
        public string Name { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string BasicSalary { get; set; }
        public string TaxPercentage { get; set; }
        public string TaxAmount { get; set; }
        public string EstimatedSalary { get; set; }
        public string ActiveFrom { get; set; }
        public string DOB { get; set; }
        public string Gender { get; set; }
        public string BloodGroup { get; set; }
        public string MaritalStatus { get; set; }
        public string StationID { get; set; }
        public string DepID { get; set; }
        public string Department { get; set; }
        public string EmpTypeID { get; set; }
        public string EmployeeType { get; set; }
        public string EmpCatID { get; set; }
        public string DesID { get; set; }
        public string Designation { get; set; }
        public string ShifID { get; set; }
        public string Shift { get; set; }
        public string ManagerID { get; set; }
        public string JoiningDate { get; set; }
        public string CNIC { get; set; }
        public string PassportNo { get; set; }
        public string TaxNo { get; set; }
        public string PermAddress { get; set; }
        public string PresAddress { get; set; }
        public string PhoneHome { get; set; }
        public string PhoneOffice { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string EmergencyContact { get; set; }

    }


   
    [WebMethod]
    public static string InsertAttendance(string EmployeeID, string timein, string timeOut , string MonthYear, string UserID)
    {
        //string sub = MonthYear.Substring(0, 2);
        //string datetime = MonthYear.Substring(0, 10);


        string TimeINN = MonthYear + ' ' + timein;
        string TimeOUTT = MonthYear + ' ' + timeOut;
        string retMessage = string.Empty;
        string msg = "";
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        SqlParameter EmpID = new SqlParameter("@EmpID", EmployeeID);
        SqlParameter Date = new SqlParameter("@Date", MonthYear);
        SqlParameter TimeIn_P = new SqlParameter("@TimeIn", timein);
        SqlParameter TimeOut_P = new SqlParameter("@TimeOut", timeOut);
        SqlParameter CreateBy = new SqlParameter("@CreateBy", UserID);
        msg = AACommon.Execute("ATT_Attendance_Insert", Conn, EmpID, Date, TimeIn_P,TimeOut_P, CreateBy);


        if (msg == "Record Saved Successfully")
        {
        
                retMessage = "true";
            }
            else
            {
                retMessage = "false";
            }
        return retMessage;
        }
        

    
    


}