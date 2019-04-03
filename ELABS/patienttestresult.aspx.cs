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
    public partial class WebForm2 : System.Web.UI.Page
    {
        BAL bal = new BAL();
        DAL dal = new DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                drpselectresult.Items.Add("select");
                drpselectresult.Items.Add("Negative");
                drpselectresult.Items.Add("Positive");
                drppatientname.Items.Add("select");
            }
        }

        protected void drppatientname_SelectedIndexChanged(object sender, EventArgs e)
        {
            bal.Patient_name = drppatientname.Text;
            DataTable dt = dal.selectpending(bal);
            foreach (DataRow dr in dt.Rows)
            {
                lblpatientname.Text = dr["patient_name"].ToString();
                lblage.Text = dr["age"].ToString();
                lblgender.Text = dr["gender"].ToString();
                Session["patientid"] = dr["patient_id"].ToString();
            }
            GridView1.DataSource = dal.pendingreport(bal);
            GridView1.DataBind();

            getpending();
        }

        protected void btnok_Click(object sender, EventArgs e)
        {
            //bal.Fromdate = Convert.ToDateTime(txtfromdate.Text);
            //bal.Todate = Convert.ToDateTime(txttodate.Text);

            bal.Fromdate = (txtfromdate.Text);
            bal.Todate = (txttodate.Text);
            
            DataTable dt = dal.selectpatient_name(bal);
            foreach (DataRow dr in dt.Rows)
            {
                drppatientname.Items.Add(dr["patient_name"].ToString());
            }

            DataTable dt1 = dal.pendingreports(bal);
            GridView1.DataSource = dt1;
            GridView1.DataBind();
        }
        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chk = (row.Cells[0].FindControl("CheckBox1")) as CheckBox;
                if (chk.Checked)
                {
                    Label testname = (Label)row.FindControl("Label2");
                    Label patientid = (Label)row.FindControl("Label5");

                    bal.Test_name = testname.Text;
                    bal.Patient_id = Convert.ToInt32(patientid.Text);
                    bal.Result = drpselectresult.Text;
                    dal.updatepatienttestlist(bal);
                }
            }
            pending();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "pending", "pending()", true);
        }

        protected void drpselectresult_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public void pending()
        {
            //bal.Fromdate = Convert.ToDateTime(txtfromdate.Text);
            //bal.Todate = Convert.ToDateTime(txttodate.Text);

            bal.Fromdate = (txtfromdate.Text);
            bal.Todate = (txttodate.Text);
            
            GridView1.DataSource = dal.pendingreports(bal);
            GridView1.DataBind();
        }

        public void getpending()
        {
            bal.Patient_name = drppatientname.Text;
            DataTable dt = dal.selectpending(bal);
            foreach (DataRow dr in dt.Rows)
            {
                lblpatientname.Text = dr["patient_name"].ToString();
                lblage.Text = dr["age"].ToString();
                lblgender.Text = dr["gender"].ToString();
                Session["patientid"] = dr["patient_id"].ToString();
            }
            GridView1.DataSource = dal.pendingreport(bal);
            GridView1.DataBind();
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
           Response.Redirect("patiententry.aspx");
        }
    }
}