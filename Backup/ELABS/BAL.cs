using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace elabs
{
    public class BAL
    {
        //////////////////////MAIN

        private int company_id;
        public int Company_id
        {
            get { return company_id; }
            set { company_id = value; }
        }
        private string company_name;
        public string Company_name
        {
            get { return company_name; }
            set { company_name = value; }
        }
        private string formation_year;
        public string Formation_year
        {
            get { return formation_year; }
            set { formation_year = value; }
        }
        //private string address;
        //public string Address
        //{
        //    get { return address; }
        //    set { address = value; }
        //}
        private string Technian_name;
        public string Technian_name1
        {
            get { return Technian_name; }
            set { Technian_name = value; }
        }
        //private string contact_no;
        //public string Contact_no
        //{
        //    get { return contact_no; }
        //    set { contact_no = value; }
        //}
        private int uid;
        public int Uid
        {
            get { return uid; }
            set { uid = value; }
        }
        //---------------------------------------------------//


        private string username;
        public string Username
        {
            get { return username; }
            set { username = value; }
        }
        private string position;
        public string Position
        {
            get { return position; }
            set { position = value; }
        }
        private string password;
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        public string txtpassword { get; set; }
        private string Role;
        public string Role1
        {
            get { return Role; }
            set { Role = value; }
        }

        //For TESTGROUP

        private string testgroupid;

        public string Testgroupid
        {
            get { return testgroupid; }
            set { testgroupid = value; }
        }
        private string testsubgroupid;

        public string Testsubgroupid
        {
            get { return testsubgroupid; }
            set { testsubgroupid = value; }
        }
        private string testgroupname;

        public string Testgroupname
        {
            get { return testgroupname; }
            set { testgroupname = value; }
        }
        private string testsubgroupname;

        public string Testsubgroupname
        {
            get { return testsubgroupname; }
            set { testsubgroupname = value; }
        }
        private string testgroupcost;

        public string Testgroupcost
        {
            get { return testgroupcost; }
            set { testgroupcost = value; }
        }

        //For ENTRY FORM

        //private string testname;

        //public string Testname
        //{
        //    get { return testname; }
        //    set { testname = value; }
        //}
        private string testid;

        public string Testid
        {
            get { return testid; }
            set { testid = value; }
        }

        private string testunit;

        public string Testunit
        {
            get { return testunit; }
            set { testunit = value; }
        }
        private string testdvalue;

        public string Testdvalue
        {
            get { return testdvalue; }
            set { testdvalue = value; }
        }
        private string testcost;

        public string Testcost
        {
            get { return testcost; }
            set { testcost = value; }
        }
        private string testnrange;

        public string Testnrange
        {
            get { return testnrange; }
            set { testnrange = value; }
        }
        private string testlrange;

        public string Testlrange
        {
            get { return testlrange; }
            set { testlrange = value; }
        }
        private string testurange;

        public string Testurange
        {
            get { return testurange; }
            set { testurange = value; }
        }
        private string testnotes;

        public string Testnotes
        {
            get { return testnotes; }
            set { testnotes = value; }
        }
        private string testwidal;

        public string Testwidal
        {
            get { return testwidal; }
            set { testwidal = value; }
        }
        private string testcomm;

        public string Testcomm
        {
            get { return testcomm; }
            set { testcomm = value; }
        }
        private static string Tname;

        public static string Tname1
        {
            get { return BAL.Tname; }
            set { BAL.Tname = value; }
        }
        private string formula;

        public string Formula
        {
            get { return formula; }
            set { formula = value; }
        }


        //////////////////////////////////////////////////
        public string doctorrefnumber { get; set; }
        public string doctorname { get; set; }
        public string email { get; set; }
        public string contactnumber { get; set; }
        public string testlistids { get; set; }
        public string numberoftests { get; set; }
        //public string totalcost { get; set; }
        public decimal totalcommission { get; set; }
        public string accountname { get; set; }
        public string groupname { get; set; }
        public string mobile { get; set; }
        public string openingbalance { get; set; }
        public decimal debit { get; set; }
        public decimal credit { get; set; }
        //public string address { get; set; }
        public string city { get; set; }
        public string debitcredit { get; set; }
        public string accountgroupname { get; set; }
        public string acsubgroupname { get; set; }
        public int accountid { get; set; }
        //public string testid { get; set; }
        public string accountgroupid { get; set; }

        /////////////////////////////////////////////////////////////////////////////d

        private DateTime present_date;

        public DateTime Present_date
        {
            get { return present_date; }
            set { present_date = value; }
        }
        private int lab_no;

        public int Lab_no
        {
            get { return lab_no; }
            set { lab_no = value; }
        }
        private string title;

        public string Title
        {
            get { return title; }
            set { title = value; }
        }
        //private string patient_name;

        //public string Patient_name
        //{
        //    get { return patient_name; }
        //    set { patient_name = value; }
        //}
        //private int age;

        //public int Age
        //{
        //    get { return age; }
        //    set { age = value; }
        //}
        //private string gender;

        //public string Gender
        //{
        //    get { return gender; }
        //    set { gender = value; }
        //}
        //private string ref_by;

        //public string Ref_by
        //{
        //    get { return ref_by; }
        //    set { ref_by = value; }
        //}
        private string ref_no;

        public string Ref_no
        {
            get { return ref_no; }
            set { ref_no = value; }
        }
        //private int account_id;

        //public int Account_id
        //{
        //    get { return account_id; }
        //    set { account_id = value; }
        //}
        //private string address;

        //public string Address
        //{
        //    get { return address; }
        //    set { address = value; }
        //}
        //private string villagecity;

        //public string Villagecity
        //{
        //    get { return villagecity; }
        //    set { villagecity = value; }
        //}
        //private string contact_no;

        //public string Contact_no
        //{
        //    get { return contact_no; }
        //    set { contact_no = value; }
        //}
        private string email_id;

        public string Email_id
        {
            get { return email_id; }
            set { email_id = value; }
        }
        private DateTime sample_date;

        public DateTime Sample_date
        {
            get { return sample_date; }
            set { sample_date = value; }
        }
        private DateTime sample_time;

        public DateTime Sample_time
        {
            get { return sample_time; }
            set { sample_time = value; }
        }
        //private DateTime reporting_date;

        //public DateTime Reporting_date
        //{
        //    get { return reporting_date; }
        //    set { reporting_date = value; }
        //}
        private DateTime reporting_time;

        public DateTime Reporting_time
        {
            get { return reporting_time; }
            set { reporting_time = value; }
        }
        private string category;

        public string Category
        {
            get { return category; }
            set { category = value; }
        }
        private string department;

        public string Department
        {
            get { return department; }
            set { department = value; }
        }
        private string remarks;

        public string Remarks
        {
            get { return remarks; }
            set { remarks = value; }
        }
        private int totalcost;

        public int Totalcost
        {
            get { return totalcost; }
            set { totalcost = value; }
        }
        //private int discount;

        //public int Discount
        //{
        //    get { return discount; }
        //    set { discount = value; }
        //}
        private int advance;

        public int Advance
        {
            get { return advance; }
            set { advance = value; }
        }
        //private int netbalance;

        //public int Netbalance
        //{
        //    get { return netbalance; }
        //    set { netbalance = value; }
        //}
        private int nooftests;

        public int Nooftests
        {
            get { return nooftests; }
            set { nooftests = value; }
        }
        //private int patient_id;

        //public int Patient_id
        //{
        //    get { return patient_id; }
        //    set { patient_id = value; }
        //}
        private int testlistid;

        public int Testlistid
        {
            get { return testlistid; }
            set { testlistid = value; }
        }
        private string doctor_name;

        public string Doctor_name
        {
            get { return doctor_name; }
            set { doctor_name = value; }
        }
        private int test_id;

        public int Test_id
        {
            get { return test_id; }
            set { test_id = value; }
        }
        private int test_group_id;

        public int Test_group_id
        {
            get { return test_group_id; }
            set { test_group_id = value; }
        }
        private int cost;

        public int Cost
        {
            get { return cost; }
            set { cost = value; }
        }
        private string result;

        public string Result
        {
            get { return result; }
            set { result = value; }
        }
        //private DateTime fromdate;

        //public DateTime Fromdate
        //{
        //    get { return fromdate; }
        //    set { fromdate = value; }
        //}
        //private DateTime todate;

        //public DateTime Todate
        //{
        //    get { return todate; }
        //    set { todate = value; }
        //}
        private string test_name;

        public string Test_name
        {
            get { return test_name; }
            set { test_name = value; }
        }

        /////////////////////////////////////////////////////////////////////////////v

        private int payment_id;

        public int Payment_id
        {
            get { return payment_id; }
            set { payment_id = value; }
        }
        private string payment_date;

        public string Payment_date
        {
            get { return payment_date; }
            set { payment_date = value; }
        }
        //private DateTime payment_date;

        //public DateTime Payment_date
        //{
        //    get { return payment_date; }
        //    set { payment_date = value; }
        //}
        private int voucher_no;

        public int Voucher_no
        {
            get { return voucher_no; }
            set { voucher_no = value; }
        }
        private string payment_mode;

        public string Payment_mode
        {
            get { return payment_mode; }
            set { payment_mode = value; }
        }
        //private int amountpayed;

        //public int Amountpayed
        //{
        //    get { return amountpayed; }
        //    set { amountpayed = value; }
        //}
        private Decimal amountpayed;

        public Decimal Amountpayed
        {
            get { return amountpayed; }
            set { amountpayed = value; }
        }
        private string short_narration;

        public string Short_narration
        {
            get { return short_narration; }
            set { short_narration = value; }
        }
        private string long_narration;

        public string Long_narration
        {
            get { return long_narration; }
            set { long_narration = value; }
        }
        private string patient_name;

        public string Patient_name
        {
            get { return patient_name; }
            set { patient_name = value; }
        }
        private int account_id;

        public int Account_id
        {
            get { return account_id; }
            set { account_id = value; }
        }
        //private decimal totalcost;

        //public decimal Totalcost
        //{
        //    get { return totalcost; }
        //    set { totalcost = value; }
        //}
        private decimal netbalance;

        public decimal Netbalance
        {
            get { return netbalance; }
            set { netbalance = value; }
        }

        private int discount;

        public int Discount
        {
            get { return discount; }
            set { discount = value; }
        }
        private string account_name;

        public string Account_name
        {
            get { return account_name; }
            set { account_name = value; }
        }
        private int patient_id;

        public int Patient_id
        {
            get { return patient_id; }
            set { patient_id = value; }
        }
 

        ////////////////////////////////////////////////

        private string fromC;

        public string FromC
        {
            get { return fromC; }
            set { fromC = value; }
        }
        private string toC;

        public string ToC
        {
            get { return toC; }
            set { toC = value; }
        }
        private string totalCost;

        public string TotalCost
        {
            get { return totalCost; }
            set { totalCost = value; }
        }
        private string patientname;

        public string Patientname
        {
            get { return patientname; }
            set { patientname = value; }
        }
        private string testname;

        public string Testname
        {
            get { return testname; }
            set { testname = value; }
        }
        private string address;

        public string Address
        {
            get { return address; }
            set { address = value; }
        }
        private string vilgcity;

        public string Vilgcity
        {
            get { return vilgcity; }
            set { vilgcity = value; }
        }
        private string search1;

        public string Search1
        {
            get { return search1; }
            set { search1 = value; }
        }
        private string search2;

        public string Search2
        {
            get { return search2; }
            set { search2 = value; }
        }

        //*********************************Commission Report % ************************************//
        private string fromCP;

        public string FromCP
        {
            get { return fromCP; }
            set { fromCP = value; }
        }
        private string toCP;

        public string ToCP
        {
            get { return toCP; }
            set { toCP = value; }
        }
        private string doctName;

        public string DoctName
        {
            get { return doctName; }
            set { doctName = value; }
        }
        //*****************************Commission TestWise*************************************//
        private string fromCT;

        public string FromCT
        {
            get { return fromCT; }
            set { fromCT = value; }
        }
        private string toCT;

        public string ToCT
        {
            get { return toCT; }
            set { toCT = value; }
        }

        private string doctNameCT;

        public string DoctNameCT
        {
            get { return doctNameCT; }
            set { doctNameCT = value; }
        }



        ///////////////////////////////////////////////////

        //private int lab_no;

        //public int Lab_no
        //{
        //    get { return lab_no; }
        //    set { lab_no = value; }
        //}
        //private string patient_name;

        //public string Patient_name
        //{
        //    get { return patient_name; }
        //    set { patient_name = value; }
        //}
        private int age;

        public int Age
        {
            get { return age; }
            set { age = value; }
        }
        private string gender;

        public string Gender
        {
            get { return gender; }
            set { gender = value; }
        }
        private string ref_by;

        public string Ref_by
        {
            get { return ref_by; }
            set { ref_by = value; }
        }
        //private string address;

        //public string Address
        //{
        //    get { return address; }
        //    set { address = value; }
        //}
        private string villagecity;

        public string Villagecity
        {
            get { return villagecity; }
            set { villagecity = value; }
        }
        private string contact_no;

        public string Contact_no
        {
            get { return contact_no; }
            set { contact_no = value; }
        }
        private DateTime reporting_date;

        public DateTime Reporting_date
        {
            get { return reporting_date; }
            set { reporting_date = value; }
        }

        private string fromdate;

        public string Fromdate
        {
            get { return fromdate; }
            set { fromdate = value; }
        }
        private string todate;

        public string Todate
        {
            get { return todate; }
            set { todate = value; }
        }
        //private string result;

        //public string Result
        //{
        //    get { return result; }
        //    set { result = value; }
        //}


        //////////////////////////////////////////////////////////
        private string date1;

        public string Date1
        {
            get { return date1; }
            set { date1 = value; }
        }
        private string date2;

        public string Date2
        {
            get { return date2; }
            set { date2 = value; }
        }

        private string report_id;

        public string Report_id
        {
            get { return report_id; }
            set { report_id = value; }
        }
        private string Template_name;

        public string Template_name1
        {
            get { return Template_name; }
            set { Template_name = value; }
        }
        private string ApplyOn;

        public string ApplyOn1
        {
            get { return ApplyOn; }
            set { ApplyOn = value; }
        }
        private string Location;

        public string Location1
        {
            get { return Location; }
            set { Location = value; }
        }
        //private string patient_name;

        //public string Patient_name
        //{
        //    get { return patient_name; }
        //    set { patient_name = value; }
        //}
        private string searchitem1;

        public string Searchitem1
        {
            get { return searchitem1; }
            set { searchitem1 = value; }
        }
        private string searchitem2;

        public string Searchitem2
        {
            get { return searchitem2; }
            set { searchitem2 = value; }
        }


        /// <summary>
        /// ////////////////////////////////////////////////
        /// </summary>
        //public string Fromdate { get; set; }
        //public string Todate { get; set; }
    }
}