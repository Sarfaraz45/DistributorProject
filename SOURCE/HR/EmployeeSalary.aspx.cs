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

public partial class Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string DeleteRegion(string SalaryID, string UserID)
    {

        string retMessage = string.Empty;
        string msg = "";
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        SqlParameter ID = new SqlParameter("@SalaryID", SalaryID);
        SqlParameter DeleteBy = new SqlParameter("@DeleteBy", UserID);
        msg = AACommon.Execute("PRL_Emp_Allowance_Delete_By_Salary", Conn, ID, DeleteBy);

        SqlParameter ID_D = new SqlParameter("@SalaryID", SalaryID);
        SqlParameter DeleteBy_D = new SqlParameter("@DeleteBy", UserID);
        msg = AACommon.Execute("PRL_Emp_Deduction_Delete_By_Salary", Conn, ID_D, DeleteBy_D);

        SqlParameter ID1 = new SqlParameter("@SalaryID", SalaryID);
        SqlParameter DeleteBy1 = new SqlParameter("@DeleteBy", UserID);
        msg = AACommon.Execute("PRL_Emp_Salary_Delete", Conn, ID1, DeleteBy1);
        
        


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


    [WebMethod]
    public static string LoadRegion()
    {

        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        DataSet ds = AACommon.ReturnDatasetBySPWithoutParameter("PRL_EMPLOYEE_SALARY_SETUP_LIST", Conn);
        List<GetEmployeeSalaryClass> GetEmployeeSalaryClass = new List<GetEmployeeSalaryClass>();
        GetEmployeeSalaryClass.Clear();
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                GetEmployeeSalaryClass dbdc = new GetEmployeeSalaryClass();

                dbdc.SerialNo = ds.Tables[0].Rows[i]["SerialNo"].ToString();
                dbdc.ID = ds.Tables[0].Rows[i]["SalaryID"].ToString();
                dbdc.EmpID = ds.Tables[0].Rows[i]["EmpID"].ToString();
                dbdc.Name = ds.Tables[0].Rows[i]["Name"].ToString();
                dbdc.FirstName = ds.Tables[0].Rows[i]["FirstName"].ToString();
                dbdc.LastName = ds.Tables[0].Rows[i]["LastName"].ToString();
                dbdc.BasicSalary = ds.Tables[0].Rows[i]["BasicSalary"].ToString();
                dbdc.TaxPercentage = ds.Tables[0].Rows[i]["TaxPercentage"].ToString();
                dbdc.TaxAmount = ds.Tables[0].Rows[i]["TaxAmount"].ToString();
                dbdc.EstimatedSalary = ds.Tables[0].Rows[i]["EstimatedSalary"].ToString();
                dbdc.HourlySalary = ds.Tables[0].Rows[i]["HourlySalary"].ToString();
                dbdc.ActiveFrom = ds.Tables[0].Rows[i]["ActiveFrom"].ToString();
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
        public string HourlySalary { get; set; }
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


   
    public class GetCompanyClass
    {
        public string ID { get; set; }
        public string CompanyName { get; set; }
        public string StationType { get; set; }
        public string ParentStation { get; set; }
        public string SalesTax { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string CompanyLogo { get; set; }
        public string Email { get; set; }
        public string WebSite { get; set; }

    }


    [WebMethod]
    public static string LoadEmployee()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        DataSet ds = AACommon.ReturnDatasetBySPWithoutParameter("STP_Employee_Get", Conn);
        List<GetCompanyClass> GetCompanyClass = new List<GetCompanyClass>();
        GetCompanyClass.Clear();
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                GetCompanyClass dbdc = new GetCompanyClass();

                dbdc.ID = ds.Tables[0].Rows[i][0].ToString();
                dbdc.CompanyName = ds.Tables[0].Rows[i][1].ToString();
                GetCompanyClass.Insert(i, dbdc);
            }

        }


        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(GetCompanyClass);


    }



    [WebMethod]
    public static string LoadAllowance()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        DataSet ds = AACommon.ReturnDatasetBySPWithoutParameter("PRL_Allowance_Get", Conn);
        List<GetAllowanceClass> GetAllowanceClass = new List<GetAllowanceClass>();
        GetAllowanceClass.Clear();
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                GetAllowanceClass dbdc = new GetAllowanceClass();

                dbdc.ID = ds.Tables[0].Rows[i][0].ToString();
                dbdc.Name = ds.Tables[0].Rows[i][1].ToString();
                dbdc.Amount = ds.Tables[0].Rows[i][2].ToString();
                GetAllowanceClass.Insert(i, dbdc);
            }

        }


        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(GetAllowanceClass);


    }



    [WebMethod]
    public static string LoadDeduction()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        DataSet ds = AACommon.ReturnDatasetBySPWithoutParameter("PRL_Deduction_Get", Conn);
        List<GetAllowanceClass> GetAllowanceClass = new List<GetAllowanceClass>();
        GetAllowanceClass.Clear();
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                GetAllowanceClass dbdc = new GetAllowanceClass();

                dbdc.ID = ds.Tables[0].Rows[i][0].ToString();
                dbdc.Name = ds.Tables[0].Rows[i][1].ToString();
                dbdc.Amount = ds.Tables[0].Rows[i][2].ToString();
                GetAllowanceClass.Insert(i, dbdc);
            }

        }


        JavaScriptSerializer jser = new JavaScriptSerializer();


        return jser.Serialize(GetAllowanceClass);


    }


    public class GetAllowanceClass
    {
        public string ID { get; set; }
        public string Name { get; set; }
        public string Amount { get; set; }
       
    }

    [WebMethod]
    public static string InsertRegion(string EmpID, string BasicSalary, string TaxPercentage, string TaxAmount, string EstimatedSalary, string HourlyRate, string ActiveFrom, string UserID)
    {

        string retMessage = string.Empty;
        string msg = "";
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        string IDAuto = AACommon.GetAlphaNumericIDSIX("PRL_Emp_Salary", "SAL-", "SalaryID", Conn);
        SqlParameter SalaryID = new SqlParameter("@SalaryID", IDAuto);
        SqlParameter EmpID_P = new SqlParameter("@EmpID", EmpID);
        SqlParameter BasicSalary_P = new SqlParameter("@BasicSalary", BasicSalary);
        SqlParameter TaxPercentage_P = new SqlParameter("@TaxPercentage", TaxPercentage);
        SqlParameter TaxAmount_P = new SqlParameter("@TaxAmount", TaxAmount);
        SqlParameter EstimatedSalary_P = new SqlParameter("@EstimatedSalary", EstimatedSalary);
        SqlParameter HourlyRate_P = new SqlParameter("@HourlySalary", HourlyRate);
        SqlParameter ActiveFrom_P = new SqlParameter("@ActiveFrom", ActiveFrom);
        SqlParameter IsActive = new SqlParameter("@IsActive", 1);      
        SqlParameter CreateBy = new SqlParameter("@CreateBy", UserID);
        msg = AACommon.Execute("PRL_Emp_Salary_Insert", Conn, SalaryID, EmpID_P, BasicSalary_P, TaxPercentage_P, TaxAmount_P, EstimatedSalary_P,HourlyRate_P, ActiveFrom_P,IsActive, CreateBy);


        if (msg == "Record Saved Successfully")
        {
            retMessage = "true";
        }
        else
        {
            retMessage = "false";
        }

        return retMessage + IDAuto;
    }


    [WebMethod]
    public static string InsertAllowance(string SalaryID, string AllowanceID, string Amount, string UserID)
    {

        string retMessage = string.Empty;
        string msg = "";
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        string IDAuto = AACommon.GetAlphaNumericIDSIX("PRL_Emp_Allowance", "PRL-EMP-ALW-", "EmpAllowanceID", Conn);
        SqlParameter EmpAllowanceID = new SqlParameter("@EmpAllowanceID", IDAuto);
        SqlParameter SalaryID_P = new SqlParameter("@SalaryID", SalaryID);
        SqlParameter AllowanceID_P = new SqlParameter("@AllowanceID", AllowanceID);
        SqlParameter Amount_P = new SqlParameter("@Amount", Amount);        
        SqlParameter IsActive = new SqlParameter("@IsActive", 1);
        SqlParameter CreateBy = new SqlParameter("@CreateBy", UserID);
        msg = AACommon.Execute("PRL_Emp_Allowance_Insert", Conn, EmpAllowanceID,SalaryID_P, AllowanceID_P, Amount_P, IsActive, CreateBy);


        if (msg == "Record Saved Successfully")
        {
            retMessage = "true";
        }
        else
        {
            retMessage = "false";
        }

        return retMessage + IDAuto;
    }


    [WebMethod]
    public static string InsertDeduction(string SalaryID, string DeductionID, string Amount, string UserID)
    {

        string retMessage = string.Empty;
        string msg = "";
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        string IDAuto = AACommon.GetAlphaNumericIDSIX("PRL_Emp_Deduction", "PRL-EMP-DED-", "EmpDeductionID", Conn);
        SqlParameter EmpAllowanceID = new SqlParameter("@EmpDeductionID", IDAuto);
        SqlParameter SalaryID_P = new SqlParameter("@SalaryID", SalaryID);
        SqlParameter AllowanceID_P = new SqlParameter("@DeductionID", DeductionID);
        SqlParameter Amount_P = new SqlParameter("@Amount", Amount);
        SqlParameter IsActive = new SqlParameter("@IsActive", 1);
        SqlParameter CreateBy = new SqlParameter("@CreateBy", UserID);
        msg = AACommon.Execute("PRL_Emp_Deduction_Insert", Conn, EmpAllowanceID, SalaryID_P, AllowanceID_P, Amount_P, IsActive, CreateBy);


        if (msg == "Record Saved Successfully")
        {
            retMessage = "true";
        }
        else
        {
            retMessage = "false";
        }

        return retMessage + IDAuto;
    }

}