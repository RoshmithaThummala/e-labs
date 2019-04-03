using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using elabs;

namespace Elabs_Project
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        BAL bal = new BAL();
        DAL dal = new DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                drpaccount.Items.Add("select");
                drpcategory.Items.Add("select");
                drpcategory.Items.Add("Category1");
                drpcategory.Items.Add("Category2");
                drpdepartment.Items.Add("select");
                drpdepartment.Items.Add("IPD");
                drpdepartment.Items.Add("OPD");
                txtrefno.Text = Session["refno"].ToString();

                DataTable dt = dal.selectaccount();
                foreach (DataRow dr in dt.Rows)
                {
                    drpaccount.Items.Add(dr["account_id"].ToString());
                }
                if (Session["val"] != null)
                {
                    txtrefno.Text = Session["refno"].ToString();
                    drpaccount.Text = Session["account"].ToString();
                    txtaddressofpatient.Text = Session["addr"].ToString();
                    txtcity.Text = Session["village"].ToString();
                    txtcontactno.Text = Session["contact number"].ToString();
                    txtemailidofpatient.Text = Session["email id"].ToString();
                    string sampledate = Session["sampledate"].ToString();
                    DateTime datet = DateTime.Parse(sampledate);
                    txtsampledate.Text = datet.ToString("yyyy-MM-dd");
                    string sampletime = Session["sampletime"].ToString();
                    DateTime dtime = DateTime.Parse(sampletime);
                    txttime.Text = dtime.ToString("HH:mm:ss");
                    string reportingdate = Session["reportingdate"].ToString();
                    DateTime dateti = DateTime.Parse(reportingdate);
                    txtreportingdate.Text = dateti.ToString("yyyy-MM-dd");

                    string reportingtime = Session["reportingtime"].ToString();
                    DateTime dtim = DateTime.Parse(reportingtime);
                    txtrpttime.Text = dtim.ToString("HH:mm:ss");
                    drpcategory.Text = Session["categ"].ToString();
                    drpdepartment.Text = Session["dept"].ToString();
                    txtremarks.Text = Session["remark"].ToString();

                    Session["contactno"] = txtcontactno.Text;
                    Session["address"] = txtaddressofpatient.Text;
                    Session["city"] = txtcity.Text;
                    //Session["val"] = null;
                }
                else
                {
                    drpaccount.Text = "";
                    txtaddressofpatient.Text = "";
                    txtcity.Text = "";
                    txtcontactno.Text = "";
                    txtemailidofpatient.Text = "";
                    txtsampledate.Text = "";
                    txttime.Text = "";
                    txtreportingdate.Text = "";
                    txtrpttime.Text = "";
                    drpcategory.Text = "";
                    drpdepartment.Text = "";
                    txtremarks.Text = "";
                }
            }
        }

        protected void btnnext_Click(object sender, EventArgs e)
        {
            bal.Present_date = Convert.ToDateTime(Session["date"]);
            bal.Lab_no = Convert.ToInt32(Session["labno"]);
            bal.Title = Session["title"].ToString();
            bal.Patient_name = Session["patientname"].ToString();
            bal.Age = Convert.ToInt32(Session["age"]);
            bal.Gender = Session["gender"].ToString();
            bal.Ref_by = Session["refby"].ToString();
            bal.Ref_no = txtrefno.Text;
            bal.Account_id = Convert.ToInt32(drpaccount.Text);
            bal.Address = txtaddressofpatient.Text;
            bal.Villagecity = txtcity.Text;
            bal.Contact_no = txtcontactno.Text;
            bal.Email_id = txtemailidofpatient.Text;
            bal.Sample_date = Convert.ToDateTime(txtsampledate.Text);
            bal.Sample_time = Convert.ToDateTime(txttime.Text);
            bal.Reporting_date = Convert.ToDateTime(txtreportingdate.Text);
            bal.Reporting_time = Convert.ToDateTime(txtrpttime.Text);
            bal.Category = drpcategory.Text;
            bal.Department = drpdepartment.Text;
            bal.Remarks = txtremarks.Text;
            bal.Totalcost = Convert.ToInt32(Session["totalcost"]);
            bal.Discount = Convert.ToInt32(Session["discount"]);
            bal.Advance = Convert.ToInt32(Session["advance"]);
            bal.Netbalance = Convert.ToInt32(Session["netbalance"]);
            bal.Nooftests = Convert.ToInt32(Session["nooftests"]);
            bal.Patient_id = Convert.ToInt32(Session["patientid"]);
            bal.Testlistid = Convert.ToInt32(Session["testlist_id"]);
            dal.insertpatient(bal);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "insert", "insert()", true);
        }

        protected void btnprevious_Click(object sender, EventArgs e)
        {
            if (Session["search"] != null)
            {
                Session["ref_no"] = txtrefno.Text;
                Session["account_id"] = drpaccount.Text;
                Session["address"] = txtaddressofpatient.Text;
                Session["villagecity"] = txtcity.Text;
                Session["contact_number"] = txtcontactno.Text;
                Session["email_id"] = txtemailidofpatient.Text;
                Session["sample_date"] = txtsampledate.Text;
                Session["sample_time"] = txttime.Text;
                Session["reporting_date"] = txtreportingdate.Text;
                Session["reporting_time"] = txtrpttime.Text;
                Session["category"] = drpcategory.Text;
                Session["department"] = drpdepartment.Text;
                Session["remarks"] = txtremarks.Text;
                string txt = "ud";
                Response.Redirect("patiententry.aspx?upd=" + txt);
            }
            else
            {
                Response.Redirect("patiententry.aspx");
            }
        }
    }
}