using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace elabs
{
    public partial class formula : System.Web.UI.Page
    {
        BAL bal = new BAL();
        DAL dal = new DAL();
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=ELABS;User ID=sa;Password=abc");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Page.IsPostBack))
            {
                groupname();
                testfromula();

                //drpselectgroup.DataTextField = "GroupName";
                //drpselectgroup.DataValueField = "GroupName";
                test();
            }
        }

        private void check()
        {
            foreach (GridViewRow r in gridTestFormula.Rows)
            {
                if (r.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkaction = (r.Cells[0].FindControl("CheckBox1") as CheckBox);
                    if (chkaction.Checked)
                    {
                        string name = (r.Cells[1].FindControl("Label1") as Label).Text;
                        string formula = (r.Cells[2].FindControl("Label2") as Label).Text;
                        bal.Testname = name;
                        dal.DeleteTestFormula(bal);
                        testfromula();
                    }
                }
            }
        }

        public void reset()
        {
            foreach (Control ctrl in this.Controls)
            {
                if (ctrl.GetType() == typeof(TextBox))
                {
                    ((TextBox)(ctrl)).Text = string.Empty;
                }
                else if (ctrl.GetType() == typeof(DropDownList))
                {
                    ((DropDownList)(ctrl)).SelectedIndex = 0;
                }
                //check for all the CheckBox controls on the page and unchecked the selection
                else if (ctrl.GetType() == typeof(CheckBox))
                {
                    ((CheckBox)(ctrl)).Checked = false;
                }
            }

        }

        public void groupname()
        {
            using (con)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select GroupName from ListofTests", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                drpselectgroup.DataSource = ds;
                drpselectgroup.DataTextField = "GroupName";
                drpselectgroup.DataValueField = "GroupName";
                drpselectgroup.DataBind();
                drpselectgroup.Items.Insert(0, new ListItem("---SELECT TEST GROUP NAME---", "0"));
                con.Close();
            }
        }

        public void testfromula()
        {
            DataTable dt = new DataTable();
            dt = dal.SelectTestFormula();
            gridTestFormula.DataSource = dt;
            gridTestFormula.DataBind();
        }

        public void test()
        {
            DataTable dt = new DataTable();
            dt = dal.SelectTest();
            gridTest.DataSource = dt;
            gridTest.DataBind();
        }

        public void groupdrop()
        {
            using (SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=ELABS;User ID=sa;Password=abc"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select GroupName from ListofTests", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                drpselectgroup.DataSource = ds;
                drpselectgroup.DataTextField = "GroupName";
                drpselectgroup.DataValueField = "GroupName";
                drpselectgroup.DataBind();
                drpselectgroup.Items.Insert(0, new ListItem("", "0"));
                con.Close();
            }
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            try
            {
                bal.Testgroupname = drpselectgroup.Text;
                dal.SelectTestGroupId(bal);
                bal.Testgroupid = bal.Testgroupid;
                bal.Formula = txtformulaexp.Text;
                bal.Testname = drpmakeformula.Text;
                dal.InsertTestFormula(bal);
                testfromula();
                string script = "alert(\"TEST FORMULA INSERTED SUCCESSFULLY\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            try
            {
                check();
                testfromula();
                string script = "alert(\"TEST FORMULA DELETED SUCCESSFULLY\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);
            }
            catch (Exception ex)
            {
                ex.ToString();

            }
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }

        protected void drpselectgroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            string GroupName = (drpselectgroup.SelectedValue);
            con.Open();
            SqlCommand cmd = new SqlCommand("select TestName from ListofTests where GroupName='" + GroupName + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            drpmakeformula.DataSource = ds;
            drpmakeformula.DataTextField = "TestName";
            drpmakeformula.DataValueField = "TestName";
            drpmakeformula.DataBind();
            drpmakeformula.Items.Insert(0, new ListItem("---SELECT TEST NAME---", "0"));
            con.Close();
        }

        protected void btnincludethis_Click(object sender, EventArgs e)
        {
            txtformulaexp.Text = txtinclude.Text;
            txtinclude.Text = "";
        }

        protected void btnplus_Click(object sender, EventArgs e)
        {
            txtinclude.Text += btnplus.Text; 
        }

        protected void btnminus_Click(object sender, EventArgs e)
        {
            txtinclude.Text += btnminus.Text;
        }

        protected void btnquotes_Click(object sender, EventArgs e)
        {
            txtinclude.Text += btnquotes.Text;
        }

        protected void btndivision_Click(object sender, EventArgs e)
        {
            txtinclude.Text += btndivision.Text;
        }

        protected void btnleftbrace_Click(object sender, EventArgs e)
        {
            txtinclude.Text += btnleftbrace.Text;
        }

        protected void btnrightbrace_Click(object sender, EventArgs e)
        {
            txtinclude.Text += btnrightbrace.Text;
        }

        protected void btnpower_Click(object sender, EventArgs e)
        {
            txtinclude.Text += btnpower.Text;
        }

        protected void btnperc_Click(object sender, EventArgs e)
        {
            txtinclude.Text += btnperc.Text;
        }
    }
}