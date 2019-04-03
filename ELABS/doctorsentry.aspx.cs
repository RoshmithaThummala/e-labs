using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using elabs;
using System.Data;
using System.Data.SqlClient;

namespace ELABS
{
    public partial class doctors : System.Web.UI.Page
    {
        BAL bal = new BAL();
        DAL dal = new DAL();

        int total = 0;
        decimal commission = 0;
        int count = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                retrieve();
            }
            txtrefno.Text = (dal.maxdocid() + 1).ToString();
            dal.testlistidval(bal);
        }

        public void retrieve()
        {
            DataTable dt = dal.showtest(bal);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnnew_Click(object sender, EventArgs e)
        {
            //txtcontactno.Enabled = true;
            //txtdoctorname.Enabled = true;
            //txtemailid.Enabled = true;
            //txtrefno.Enabled = true;

            label();

            dal.testlistidval(bal);
           // bal.doctorrefnumber = txtrefno.Text;
            bal.doctorname = txtdoctorname.Text;
            bal.contactnumber = txtcontactno.Text;
            bal.email = txtemailid.Text;
            bal.numberoftests = lblnooftests.Text;
            txttestlistid.Text = bal.testlistids;
            bal.TotalCost = Convert.ToString(total);
            bal.totalcommission = Convert.ToDecimal(commission);
            if (bal.numberoftests == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('Please select tests!')", true);
            }
            else
            {
                dal.testlistid(bal);
                dal.doctorinsert(bal);
                clear();
                foreach (GridViewRow row in GridView1.Rows)
                {
                    TextBox lbl = (TextBox)row.FindControl("Label3");
                    lbl.Text = "0.0000";
                    CheckBox ch = (CheckBox)row.FindControl("CheckBox1");
                    ch.Checked = false;
                }
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('Inserted Successfully!')", true);
                txtrefno.Text = (dal.maxdocid() + 1).ToString();
            }
        }

        public void label()
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (((CheckBox)row.FindControl("CheckBox1")).Checked)
                {
                    TextBox lbl = (TextBox)row.FindControl("Label3");
                    Label lbl1 = (Label)row.FindControl("Label2");

                    commission += Convert.ToDecimal(lbl.Text);
                    total += Convert.ToInt32(lbl1.Text);
                }
            }
        }

        public void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (((CheckBox)row.FindControl("CheckBox1")).Checked)
                {
                    TextBox lbl = (TextBox)row.FindControl("Label3");
                    Label lbl1 = (Label)row.FindControl("Label2");
                    count++;
                    commission += Convert.ToDecimal(lbl.Text);
                    total += Convert.ToInt32(lbl1.Text);
                }
                this.lblnooftests.Text = count.ToString();
            }
        }

        public void clear()
        {
            txtrefno.Text = string.Empty;
            txtdoctorname.Text = string.Empty;
            txtemailid.Text = string.Empty;
            txtcontactno.Text = string.Empty;
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }

        protected void next_Click(object sender, EventArgs e)
        {
            int i = GridView1.PageIndex + 1;
            if (i < GridView1.PageCount)
            {
                GridView1.PageIndex = i;
                //if (chakfastsearch.Checked)
                //{
                //    lblwatchwindowsno.Text = (i + 1).ToString();
                //    lblshowing.Text = GridView1.Rows.Count.ToString();
                //}
            }

            else
            {
                string script = "alert(\"No Pages to display\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);
            }
            retrieve();
        }

        protected void prev_Click(object sender, EventArgs e)
        {
            int i = GridView1.PageCount;
            if (GridView1.PageIndex > 0)
            {
                GridView1.PageIndex = GridView1.PageIndex - 1;
                //lblwatchwindowsno.Text = ((GridView1.PageIndex) + 1).ToString();
            }

            else
            {
                string script = "alert(\"No Pages to display\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);
            }
            retrieve();
        }

        protected void first_Click(object sender, EventArgs e)
        {
            GridView1.PageIndex = 0;
            retrieve();
        }

        protected void last_Click(object sender, EventArgs e)
        {
            int i = GridView1.PageCount;
            GridView1.PageIndex = i;
            retrieve();
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {

        }

        protected void btndelete_Click(object sender, EventArgs e)
        {

        }
    }
}