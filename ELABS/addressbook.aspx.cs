using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using elabs;

namespace ELABS
{
    public partial class add : System.Web.UI.Page
    {
        BAL bal = new BAL();
        DAL dal = new DAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //txtaccounts.Enabled = false;
                //txtgroup.Enabled = false;
                //txtmobile.Enabled = false;

                bal.accountgroupname = GridView1.Columns[3].ToString();
                DataTable dt = dal.getaddressbook(bal);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Label lbl = (Label)row.FindControl("Label8");
            bal.accountid = Convert.ToInt32(lbl.Text);
            dal.selectaccountid(bal);

            Session["account_name"] = bal.accountname;
            Session["account_group_id"] = bal.accountgroupname;
            Session["opening_balance"] = bal.openingbalance;
            Session["address"] = bal.Address;
            Session["city"] = bal.city;
            Session["mobile_no"] = bal.mobile;
            Session["Debit_Credit"] = bal.debitcredit;

            Response.Redirect("accountentry.aspx");
        }

        protected void txtaccounts_TextChanged(object sender, EventArgs e)
        {
            bal.accountname = txtaccounts.Text;
            DataTable dt = dal.accountnamesearch(bal);
            GridView1.DataSource = dt;
            GridView1.DataBind();

            //lblshowing.Text = "accountbased";
            if (chakfastsearch.Checked)
            {
                int i = int.Parse(dt.Rows.Count.ToString());
                lblresults.Text = i.ToString();
                lblwatchwindowsno.Text = (GridView1.PageIndex + 1).ToString();
                lblshowing.Text = GridView1.Rows.Count.ToString();

                //txtgroup.Text = string.Empty;
                //txtmobile.Text = string.Empty;
            }
        }

        protected void txtgroup_TextChanged(object sender, EventArgs e)
        {
            bal.accountname = txtaccounts.Text;
            bal.groupname = txtgroup.Text;
            DataTable dt = dal.groupnamesearch(bal);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            //lblshowing.Text = "groupbased";
            if (chakfastsearch.Checked)
            {
                int i = int.Parse(dt.Rows.Count.ToString());
                lblresults.Text = i.ToString();
                lblwatchwindowsno.Text = (GridView1.PageIndex + 1).ToString();
                lblshowing.Text = GridView1.Rows.Count.ToString();

                //txtaccounts.Text = string.Empty;
                //txtmobile.Text = string.Empty;
            }
        }

        protected void txtmobile_TextChanged(object sender, EventArgs e)
        {
            bal.accountname = txtaccounts.Text;
            bal.groupname = txtgroup.Text;
            bal.mobile = txtmobile.Text;
            DataTable dt = dal.mobilesearch(bal);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            //lblshowing.Text = "mobilebased";
            if (chakfastsearch.Checked)
            {
                int i = int.Parse(dt.Rows.Count.ToString());
                lblresults.Text = i.ToString();
                lblwatchwindowsno.Text = (GridView1.PageIndex + 1).ToString();
                lblshowing.Text = GridView1.Rows.Count.ToString();

                //txtgroup.Text = string.Empty;
                //txtaccounts.Text = string.Empty;
            }
        }

        protected void chakfastsearch_CheckedChanged(object sender, EventArgs e)
        {
            if (chakfastsearch.Checked == true)
            {
                txtaccounts.Enabled = true;
                txtgroup.Enabled = true;
                txtmobile.Enabled = true;

                if (txtaccounts.Text == "" && txtgroup.Text == "" && txtmobile.Text == "")
                {
                    gload();
                }

                else if(txtaccounts.Text !="" && (txtgroup.Text == "" && txtmobile.Text ==""))
                {
                    txtaccounts_TextChanged(null, null);
                }

                else if (txtaccounts.Text != "" && txtgroup.Text != "" && txtmobile.Text == "")
                {
                    txtgroup_TextChanged(null, null);
                }

                else if (txtaccounts.Text != "" && txtgroup.Text != "" && txtmobile.Text != "")
                {
                    txtmobile_TextChanged(null, null);
                }
            }
            else
            {
                txtaccounts.Enabled = false;
                txtgroup.Enabled = false;
                txtmobile.Enabled = false;
            }
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }

        public void gload()
        {
            DataTable dt = new DataTable();
            dt = dal.getaddressbook(bal);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            if (chakfastsearch.Checked)
            {
                int i = int.Parse(dt.Rows.Count.ToString());
                lblresults.Text = i.ToString();
                lblwatchwindowsno.Text = (GridView1.PageIndex + 1).ToString();
                lblshowing.Text = GridView1.Rows.Count.ToString();
            }
        }

        protected void btnnext_Click(object sender, EventArgs e)
        {
            int i = GridView1.PageIndex + 1;
            if (i < GridView1.PageCount)
            {
                GridView1.PageIndex = i;
                if (chakfastsearch.Checked)
                {
                    lblwatchwindowsno.Text = (i + 1).ToString();
                    lblshowing.Text = GridView1.Rows.Count.ToString();
                }
            }
            else
            {
                string script = "alert(\"No Pages to display\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);
            }
            if (txtaccounts.Text == "" && txtgroup.Text == "" && txtmobile.Text == "")
            {
                gload();
            }

            else if (txtaccounts.Text != "" && txtgroup.Text == "" && txtmobile.Text == "")
            {
                txtaccounts_TextChanged(null, null);
            }
            else if (txtaccounts.Text == "" && txtgroup.Text != "" && txtmobile.Text == "")
            {
                txtgroup_TextChanged(null, null);
            }
            else if (txtaccounts.Text == "" && txtgroup.Text == "" && txtmobile.Text != "")
            {
                txtmobile_TextChanged(null, null);
            }
        }

        protected void btnprev_Click(object sender, EventArgs e)
        {
            int i = GridView1.PageCount;
            if (GridView1.PageIndex > 0)
            {
                GridView1.PageIndex = GridView1.PageIndex - 1;
                lblwatchwindowsno.Text = ((GridView1.PageIndex) + 1).ToString();
            }
            else
            {
                string script = "alert(\"No Pages to display\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);
            }
            if (txtaccounts.Text == "" && txtgroup.Text == "" && txtmobile.Text == "")
            {
                gload();
            }

            else if (txtaccounts.Text != "" && (txtgroup.Text == "" && txtmobile.Text == ""))
            {
                txtaccounts_TextChanged(null, null);
            }

            else if (txtaccounts.Text != "" && txtgroup.Text != "" && txtmobile.Text == "")
            {
                txtgroup_TextChanged(null, null);
            }

            else if (txtaccounts.Text != "" && txtgroup.Text != "" && txtmobile.Text != "")
            {
                txtmobile_TextChanged(null, null);
            }
        }
    }
}