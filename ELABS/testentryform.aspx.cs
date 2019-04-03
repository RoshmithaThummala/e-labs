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
    public partial class WebForm1 : System.Web.UI.Page
    {
        BAL bal = new BAL();
        DAL dal = new DAL();
        string b;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {          
                DataTable dt = new DataTable();
                //if (Session["id"].ToString() != null)
                if (Request.QueryString["param"] != null)
                {
                    //txtserialorderno.Text = Session["id"].ToString();
                    txtserialorderno.Text = Request.QueryString["param"];
                    bal.Testid = txtserialorderno.Text;
                    dt = dal.SelectTest(bal);
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        txttestname.Text = dt.Rows[i]["test_name"].ToString();
                        string a = dt.Rows[i]["test_group_id"].ToString();
                        b = dt.Rows[i]["test_subgroup_id"].ToString();
                        txtunit.Text = dt.Rows[i]["unit"].ToString();
                        txtdefaultvalue.Text = dt.Rows[i]["default_value"].ToString();
                        txtcost.Text = dt.Rows[i]["cost"].ToString();
                        txtnormalrange.Text = dt.Rows[i]["normal_range"].ToString();
                        txtlowerrange.Text = dt.Rows[i]["lower_range"].ToString();
                        txtupperrange.Text = dt.Rows[i]["upper_range"].ToString();
                        txtnotes.Text = dt.Rows[i]["notes"].ToString();
                        if ((dt.Rows[i]["widel_test"].ToString() == "y") || (dt.Rows[i]["widel_test"].ToString() == "Y"))
                        {
                            chkwildtest.Checked = true;
                        }
                        else
                        {
                            chkwildtest.Checked = false;
                        }

                        bal.Testgroupid = a;
                        dt = dal.selectgname(bal);
                        drpgroup.DataSource = dt;
                        drpgroup.DataTextField = "test_group_name";
                        drpgroup.DataValueField = "test_group_name";
                        drpgroup.DataBind();

                        if (b != "")
                        {
                            chkundersubgroup.Checked = true;
                            //chkundersubgroup_CheckedChanged(null,null);
                            bal.Testgroupid = b;
                            dt = dal.selectsgname(bal);
                            drpsubgroup.DataSource = dt;
                            drpsubgroup.DataTextField = "test_sub_groupname";
                            drpsubgroup.DataValueField = "test_sub_groupname";
                            drpsubgroup.DataBind();
                        }
                    }
                }
                if (Request.QueryString["param"] == null)
                {
                    testid();
                    groupdrop();
                }
            }
        }

        public void reset()
        {
            txttestname.Text = "";
            drpgroup.Text = null;
            drpsubgroup.Text = null;
            txtunit.Text = "";
            txtdefaultvalue.Text = "";
            txtcost.Text = "";
            txtnormalrange.Text = "";
            txtlowerrange.Text = "";
            txtupperrange.Text = "";
            txtnotes.Text = "";
            chkwildtest.Checked = false;
            testid();
            groupdrop();
        }

        public void testid()  //Binding testid at pageload
        {
            DataTable dt = new DataTable();
            dt = dal.IncTest();

            foreach (DataRow dr in dt.Rows)
            {
                txtserialorderno.Text = dr["test_id"].ToString();
            }
        }

        public void groupdrop()   //Binding data to Group DropDown
        {
            using (SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=ELABS;User ID=sa;Password=abc"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select test_group_name from testgroup where test_group_name!=''", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                drpgroup.DataSource = ds;
                drpgroup.DataTextField = "test_group_name";
                drpgroup.DataValueField = "test_group_name";
                drpgroup.DataBind();
                drpgroup.Items.Insert(0, new ListItem("---SELECT GROUP---", "0"));
                con.Close();
            }
        }

        public void subgroupdrop()   //Binding data to SubGroup DropDown
        {
            using (SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=ELABS;User ID=sa;Password=abc"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select test_sub_groupname from testgroup where test_sub_groupname!=''", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                drpsubgroup.DataSource = ds;
                drpsubgroup.DataTextField = "test_sub_groupname";
                drpsubgroup.DataValueField = "test_sub_groupname";
                drpsubgroup.DataBind();
                drpsubgroup.Items.Insert(0, new ListItem("---SELECT SUB GROUP---", "0"));
                con.Close();
            }
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkundersubgroup.Checked == true)
                {
                    bal.Testname = txttestname.Text;
                    bal.Testid = txtserialorderno.Text;
                    bal.Testgroupname = drpgroup.Text;
                    dal.SelectTestGroupId(bal);
                    bal.Testgroupid = bal.Testgroupid;
                    bal.Testunit = txtunit.Text;
                    bal.Testdvalue = txtdefaultvalue.Text;
                    bal.Testcost = txtcost.Text;
                    bal.Testnrange = txtnormalrange.Text;
                    bal.Testlrange = txtlowerrange.Text;
                    bal.Testurange = txtupperrange.Text;
                    bal.Testnotes = txtnotes.Text;
                    if (chkwildtest.Checked == true)
                        bal.Testwidal = "Y";
                    else
                        bal.Testwidal = "N";
                    bal.Testsubgroupname = drpsubgroup.Text;
                    dal.SelectTestSubGroupId(bal);
                    bal.Testsubgroupid = bal.Testsubgroupid;
                    bal.Testcomm = "0.00";
                    //Insert data into ListofTests and Tests
                    dal.InsertLoT(bal);
                    dal.InsertTest(bal);
                    string script = "alert(\"DATA INSERTED SUCCESSFULLY\");";
                    ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);
                    reset();
                }
                else
                {
                    bal.Testname = txttestname.Text;
                    bal.Testid = txtserialorderno.Text;
                    bal.Testgroupname = drpgroup.Text;
                    dal.SelectTestGroupId(bal);
                    bal.Testgroupid = bal.Testgroupid;
                    bal.Testunit = txtunit.Text;
                    bal.Testdvalue = txtdefaultvalue.Text;
                    bal.Testcost = txtcost.Text;
                    bal.Testnrange = int.Parse(txtnormalrange.Text).ToString();
                    bal.Testlrange = int.Parse(txtlowerrange.Text).ToString();
                    bal.Testurange = txtupperrange.Text;
                    bal.Testnotes = txtnotes.Text;
                    if (chkwildtest.Checked == true)
                        bal.Testwidal = "Y";
                    else
                        bal.Testwidal = "N";
                    //bal.Testsubgroupname = drpsubgroup.Text;
                    //dal.SelectTestSubGroupId(bal);
                    //bal.Testsubgroupid = bal.Testsubgroupid;
                    bal.Testcomm = "0.00";
                    //Insert data into ListofTests and Tests
                    dal.InsertLoT(bal);
                    dal.InsertTestS(bal);
                    string script = "alert(\"DATA INSERTED SUCCESSFULLY\");";
                    ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);
                    reset();
                }
            }
            catch(Exception ex)
            {
                ex.ToString();
            }
        }

        protected void chkundersubgroup_CheckedChanged(object sender, EventArgs e)
        {
            //if (Request.QueryString["param"] != "")
            //{
            //    DataTable dt = new DataTable();
            //    bal.Testgroupid = b;
            //    dt = dal.selectsgname(bal);
            //    drpsubgroup.DataSource = dt;
            //    drpsubgroup.DataTextField = "test_sub_groupname";
            //    drpsubgroup.DataValueField = "test_sub_groupname";
            //    drpsubgroup.DataBind();
            //}
            //else
            //{
                subgroupdrop();
            //}
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            try
            {
                bal.Testid = txtserialorderno.Text;
                bal.Testname = txttestname.Text;
                bal.Testgroupname = drpgroup.Text;
                dal.SelectTestGroupId(bal);
                bal.Testgroupid = bal.Testgroupid;
                bal.Testunit = txtunit.Text;
                bal.Testdvalue = txtdefaultvalue.Text;
                bal.Testcost = txtcost.Text;
                bal.Testnrange = txtnormalrange.Text;
                bal.Testlrange = txtlowerrange.Text;
                bal.Testurange = txtupperrange.Text;
                bal.Testnotes = txtnotes.Text;
                if (chkwildtest.Checked == true)
                    bal.Testwidal = "Y";
                else
                    bal.Testwidal = "N";
                bal.Testsubgroupname = drpsubgroup.Text;
                dal.SelectTestSubGroupId(bal);
                bal.Testsubgroupid = bal.Testsubgroupid;
                //Update ListofTests and Tests
                dal.UpdateLoT(bal);
                dal.UpdateTest(bal);
                string script = "alert(\"DATA UPDATED SUCCESSFULLY\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);
                reset();
            }
            catch(Exception ex)
            {
                ex.ToString();
            }
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            bal.Testid = txtserialorderno.Text;
            //Delete ListofTests and Tests
            dal.DeleteLoT(bal);
            dal.DeleteTest(bal);
            string script = "alert(\"DATA DELETED SUCCESSFULLY\");";
            ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);
            reset();
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            //this.ClientScript.RegisterClientScriptBlock(this.GetType(), "Close", "window.close()", true);
            Response.Redirect("companymenulist.aspx");
        }
    }
}