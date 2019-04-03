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
    public partial class _new : System.Web.UI.Page
    {
        BAL bal = new BAL();
        DAL dal = new DAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = dal.accountgroupid(bal);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnnew_Click(object sender, EventArgs e)
        {
            bal.accountgroupname = txtacountgroupname.Text;
            bal.acsubgroupname = drpundegroup.Text;
            dal.groupinsert(bal);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Data Inserted')", true);
            DataTable dt = dal.accountgroupid(bal);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            txtacountgroupname.Text = string.Empty;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Label lbl = (Label)row.FindControl("Label1");
            bal.accountid = Convert.ToInt32(lbl.Text);
            dal.selectaccountgroup(bal);

            txtacountgroupname.Text = bal.accountgroupname;
            drpundegroup.SelectedItem.Text = bal.acsubgroupname;
            txtaccountgroupid.Text = bal.accountgroupid;
        }

        protected void txtaccountgroupid_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtacountgroupname_TextChanged(object sender, EventArgs e)
        {
            bal.accountgroupname = txtacountgroupname.Text;
            DataTable dt = dal.showaccountgroup(bal);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            bal.accountgroupid = txtaccountgroupid.Text;
            dal.delaccountgroup(bal);
            DataTable dt = dal.accountgroupid(bal);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            txtacountgroupname.Text = string.Empty;
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }

        protected void btnedit_Click(object sender, EventArgs e)
        {
            bal.accountgroupid = txtaccountgroupid.Text;
            bal.accountgroupname = txtacountgroupname.Text;
            bal.acsubgroupname = drpundegroup.Text;
            dal.updateaccountgroup(bal);
            DataTable dt = dal.accountgroupid(bal);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            txtacountgroupname.Text = string.Empty;
        }

    }
}