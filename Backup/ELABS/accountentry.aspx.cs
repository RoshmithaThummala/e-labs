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
    public partial class accounte : System.Web.UI.Page
    {
        BAL bal = new BAL();
        DAL dal = new DAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = dal.accountgroupid(bal);
                drpgroup.DataSource = dt;
                drpgroup.DataBind();
                drpgroup.DataTextField = "acc_groupname";
                drpgroup.DataValueField = "account_group_id";
                drpgroup.DataBind();


                if (Session["account_name"] == null)
                {
                    clear();
                }
                else
                {



                    txtaccountname.Text = Session["account_name"].ToString();
                    drpgroup.SelectedItem.Text = Session["account_group_id"].ToString();
                    drpdebitorcredit.SelectedItem.Text = Session["Debit_Credit"].ToString();
                    txtaddress.Text = Session["address"].ToString();
                    txtcity.Text = Session["city"].ToString();
                    txtmobile.Text = Session["mobile_no"].ToString();
                    txtopbal.Text = Session["opening_balance"].ToString();
                }
            }
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            BAL bal = new BAL();
            bal.accountname = txtaccountname.Text;
            bal.Address = txtaddress.Text;
            bal.city = txtcity.Text;
            bal.mobile = txtmobile.Text;
            bal.openingbalance = txtopbal.Text;
            //drpdebitorcredit.Text = bal.debit;
            //drpdebitorcredit.Text = bal.credit;
            if (drpdebitorcredit.Text == "Cr.")
            {
                bal.credit = Convert.ToDecimal(txtopbal.Text);
                bal.debit = 0;
            }
            else if
                (drpdebitorcredit.Text == "Dr.")
            {
                bal.debit = Convert.ToDecimal(txtopbal.Text);
                bal.credit = 0;
            }

            bal.groupname = drpgroup.Text;
            bal.debitcredit = drpdebitorcredit.Text;
            dal.accountinsert(bal);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Data Inserted')", true);
            clear();
        }

        protected void btnedit_Click(object sender, EventArgs e)
        {
            bal.accountname = txtaccountname.Text;

            bal.Address = txtaddress.Text;
            bal.city = txtcity.Text;
            bal.mobile = txtmobile.Text;
            bal.openingbalance = txtopbal.Text;
            //drpdebitorcredit.Text = bal.debit;
            //drpdebitorcredit.Text = bal.credit;
            if (drpdebitorcredit.Text == "Cr.")
            {
                bal.credit = Convert.ToDecimal(txtopbal.Text);
                bal.debit = 0;
            }
            else if
                (drpdebitorcredit.Text == "Dr.")
            {
                bal.debit = Convert.ToDecimal(txtopbal.Text);
                bal.credit = 0;
            }

            bal.groupname = drpgroup.Text;
            bal.debitcredit = drpdebitorcredit.Text;
            dal.accountupdate(bal);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Data updated')", true);
            clear();

        }

        protected void btndelete_Click(object sender, EventArgs e)
        {

            bal.accountname = txtaccountname.Text;
            dal.accountdelete(bal);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Data Deleted')", true);
        }

        public void clear()
        {
            txtaccountname.Text = string.Empty;
            txtaddress.Text = string.Empty;
            txtcity.Text = string.Empty;
            txtmobile.Text = string.Empty;
            txtopbal.Text = string.Empty;
            //drpdebitorcredit.Text = string.Empty;
            //drpgroup.Text = string.Empty;
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }

    }
}