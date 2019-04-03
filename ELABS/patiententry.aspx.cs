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
    public partial class WebForm4 : System.Web.UI.Page
    {
        BAL bal = new BAL();
        DAL dal = new DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                drprefby.Items.Add("select");
                drpgender.Items.Add("Select");
                drpgender.Items.Add("Male");
                drpgender.Items.Add("Female");
                drptitle.Items.Add("select");
                drptitle.Items.Add("Mr.");
                drptitle.Items.Add("Ms.");
                drptitle.Items.Add("Mrs.");

                DataTable dt = dal.selectdoctor();
                foreach (DataRow dr in dt.Rows)
                {
                    drprefby.Items.Add(dr["doctor_name"].ToString());
                }


                DataTable dt1 = dal.incrementpatientid();

                if (dt1.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt1.Rows)
                    {
                        txtlabno.Text = dr["lab_no"].ToString();
                    }
                }

                txtdate.Enabled = false;
                txtlabno.Enabled = false;
                txtage.Enabled = false;
                txtpatientname.Enabled = false;
                txttotalcost.Enabled = false;
                txtnetbalance.Enabled = false;
                txtadvance.Enabled = false;
                txtdiscount.Enabled = false;
                drpgender.Enabled = false;
                drprefby.Enabled = false;
                drptitle.Enabled = false;
                btnplus.Enabled = false;
                btndelete.Enabled = false;
                btnsearch.Enabled = false;
                btnupdate.Enabled = false;

                if (Request.QueryString["upd"] != null)
                {
                    txtdate.Enabled = true;
                    txtlabno.Enabled = true;
                    txtage.Enabled = true;
                    txtpatientname.Enabled = true;
                    txttotalcost.Enabled = true;
                    txtnetbalance.Enabled = true;
                    txtadvance.Enabled = true;
                    txtdiscount.Enabled = true;
                    drpgender.Enabled = true;
                    drprefby.Enabled = true;
                    drptitle.Enabled = true;
                    btnplus.Enabled = true;
                    btndelete.Enabled = true;
                    btnsearch.Enabled = true;
                    btnupdate.Enabled = true;

                    txtdate.Text = Session["present_date"].ToString();
                    txtlabno.Text = Session["lab_no"].ToString();
                    drptitle.Text = Session["title"].ToString();
                    txtpatientname.Text = Session["patient_name"].ToString();
                    txtage.Text = Session["age"].ToString();
                    drpgender.Text = Session["gender"].ToString();
                    drprefby.Text = Session["refby"].ToString();
                    lblnoof.Text = Session["nooftests"].ToString();
                    txttotalcost.Text = Session["totalcost"].ToString();
                    txtdiscount.Text = Session["discount"].ToString();
                    txtadvance.Text = Session["advance"].ToString();
                    txtnetbalance.Text = Session["netbalance"].ToString();

                    bal.Patient_name = txtpatientname.Text;
                    GridView1.DataSource = dal.searchpatienttestlist(bal);
                    GridView1.DataBind();
                }
            }
        }

        protected void btnplus_Click(object sender, EventArgs e)
        {
            Session["doctorname"] = drprefby.Text;
            Session["date"] = txtdate.Text;
            Session["labno"] = txtlabno.Text;
            Session["title"] = drptitle.Text;
            Session["patientname"] = txtpatientname.Text;
            Session["age"] = txtage.Text;
            Session["gender"] = drpgender.Text;
            Session["refby"] = drprefby.Text;
            Session["totalcost"] = txttotalcost.Text;
            Session["discount"] = txtdiscount.Text;
            Session["advance"] = txtadvance.Text;
            Session["netbalance"] = txtnetbalance.Text;
            Session["nooftests"] = lblnoof.Text;
            Session["patientid"] = txtlabno.Text;


            if (Session["val"] == null)
            {
                foreach (GridViewRow row in GridView1.Rows)
                {
                    CheckBox chk = (CheckBox)row.FindControl("CheckBox1");
                    if (chk.Checked)
                    {
                        int testid = Convert.ToInt32(row.Cells[1].Text);
                        int cost = Convert.ToInt32(row.Cells[3].Text);
                        int testgroupid = Convert.ToInt32(row.Cells[4].Text);
                        bal.Testlistid = Convert.ToInt32(Session["testlist_id"]);
                        bal.Patient_id = Convert.ToInt32(txtlabno.Text);
                        bal.Test_id = testid;
                        bal.Cost = cost;
                        bal.Test_group_id = testgroupid;
                        //bal.Result = DBNull.Value.ToString();
                        dal.insertpatienttestlist(bal);
                    }
                }
            }

            Response.Redirect("newpatiententry.aspx");
        }

        protected void btnnew_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["upd"] != null)
            {
                Response.Redirect("patiententry.aspx");
            }
            txtdate.Enabled = true;
            txtlabno.Enabled = true;
            txtage.Enabled = true;
            txtpatientname.Enabled = true;
            txttotalcost.Enabled = true;
            txtnetbalance.Enabled = true;
            txtadvance.Enabled = true;
            txtdiscount.Enabled = true;
            drpgender.Enabled = true;
            drprefby.Enabled = true;
            drptitle.Enabled = true;
            btnplus.Enabled = true;
            btndelete.Enabled = true;
            btnsearch.Enabled = true;
            btnupdate.Enabled = true;
        }

        protected void drprefby_SelectedIndexChanged(object sender, EventArgs e)
        {
            bal.Doctor_name = drprefby.Text;
            GridView1.DataSource = dal.selectdoctortest(bal);
            GridView1.DataBind();

            bal.Doctor_name = drprefby.Text;
            DataTable dt1 = dal.selectrefno(bal);
            Session["refno"] = dt1.Rows[0]["doctor_id"].ToString();
            Session["testlist_id"] = dt1.Rows[0]["testlist_id"].ToString();

            txttotalcost.Text = String.Empty;
            txtdiscount.Text = String.Empty;
            txtadvance.Text = String.Empty;
            txtnetbalance.Text = String.Empty;
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            int total = 0;
            int count = 0;
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (((CheckBox)row.FindControl("CheckBox1")).Checked)
                {
                    total += Convert.ToInt32(row.Cells[3].Text);
                    Session["testid"] = row.Cells[1].Text;

                    Session["cost"] = row.Cells[3].Text;
                    Session["test_group_id"] = row.Cells[4].Text;
                    count++;
                }
            }
            lblnoof.Text = count.ToString();
            txttotalcost.Text = total.ToString();
        }
        protected void txtadvance_TextChanged(object sender, EventArgs e)
        {
            int total = 0;
            total = Convert.ToInt32(txtnetbalance.Text) - Convert.ToInt32(txtadvance.Text);
            txtnetbalance.Text = total.ToString();
        }
        protected void txtdiscount_TextChanged(object sender, EventArgs e)
        {
            int total = 0;
            total = Convert.ToInt32(txttotalcost.Text) - ((Convert.ToInt32(txttotalcost.Text) * Convert.ToInt32(txtdiscount.Text)) / 100);
            txtnetbalance.Text = total.ToString();
        }
        protected void btnupdate_Click(object sender, EventArgs e)
        {
            bal.Present_date = Convert.ToDateTime(txtdate.Text);
            bal.Title = drptitle.Text;
            bal.Age = Convert.ToInt32(txtage.Text);
            bal.Gender = drpgender.Text;
            bal.Ref_by = drprefby.Text;
            bal.Ref_no = Session["ref_no"].ToString();
            bal.Account_id = Convert.ToInt32(Session["account_id"]);
            bal.Address = Session["address"].ToString();
            bal.Villagecity = Session["villagecity"].ToString();
            bal.Contact_no = Session["contact_number"].ToString();
            bal.Email_id = Session["email_id"].ToString();
            bal.Sample_date = Convert.ToDateTime(Session["sample_date"]);
            bal.Sample_time = Convert.ToDateTime(Session["sample_time"]);
            bal.Reporting_date = Convert.ToDateTime(Session["reporting_date"]);
            bal.Reporting_time = Convert.ToDateTime(Session["reporting_time"]);
            bal.Category = Session["category"].ToString();
            bal.Department = Session["department"].ToString();
            bal.Remarks = Session["remarks"].ToString();
            bal.Nooftests = Convert.ToInt32(lblnoof.Text);
            bal.Totalcost = Convert.ToInt32(txttotalcost.Text);
            bal.Discount = Convert.ToInt32(txtdiscount.Text);
            bal.Advance = Convert.ToInt32(txtadvance.Text);
            bal.Netbalance = Convert.ToInt32(txtnetbalance.Text);
            bal.Testlistid = Convert.ToInt32(Session["testlist_id"]);

            bal.Patient_name = txtpatientname.Text;
            dal.updatepatient(bal);

            bal.Testlistid = Convert.ToInt32(Session["testlist_id"]);
            bal.Patient_id = Convert.ToInt32(txtlabno.Text);
            bal.Test_id = Convert.ToInt32(Session["testid"]);
            bal.Test_group_id = Convert.ToInt32(Session["test_group_id"]);
            bal.Cost = Convert.ToInt32(Session["cost"]);
            bal.Patient_name = txtpatientname.Text;
            dal.updatepatienttest(bal);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "update", "update()", true);
        }
        protected void btndelete_Click(object sender, EventArgs e)
        {
            bal.Patient_name = txtpatientname.Text;
            dal.deletepatienttestlist(bal);

            bal.Patient_name = txtpatientname.Text;
            dal.deletepatient(bal);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "del", "del()", true);
            //Response.Redirect("patiententry.aspx");

        }
        protected void txtname_TextChanged(object sender, EventArgs e)
        {
            bal.Patient_name = txtname.Text;
            DataTable dt = dal.selectpatient1(bal);
            GridView2.DataSource = dal.selectpatient1(bal);
            GridView2.DataBind();
            ScriptManager.RegisterStartupScript(this, GetType(), "popup", "popup()", true);

        }
        protected void txtphone_TextChanged(object sender, EventArgs e)
        {
            bal.Contact_no = txtphone.Text;
            GridView2.DataSource = dal.selectpatientphone(bal);
            GridView2.DataBind();
            ScriptManager.RegisterStartupScript(this, GetType(), "popup", "popup()", true);
        }
        protected void txtaddress_TextChanged(object sender, EventArgs e)
        {
            bal.Address = txtaddress.Text;
            GridView2.DataSource = dal.selectpatientaddress(bal);
            GridView2.DataBind();
            ScriptManager.RegisterStartupScript(this, GetType(), "popup", "popup()", true);
        }
        protected void txtcity_TextChanged(object sender, EventArgs e)
        {
            bal.Villagecity = txtcity.Text;
            GridView2.DataSource = dal.selectpatientcity(bal);
            GridView2.DataBind();
            ScriptManager.RegisterStartupScript(this, GetType(), "popup", "popup()", true);
        }
        protected void chkselect_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView2.Rows)
            {
                CheckBox chk = (CheckBox)row.FindControl("chkselect");
                Label name = (Label)row.FindControl("Label3");
                if (chk.Checked == true)
                {

                    bal.Patient_name = name.Text;
                    DataTable dt = dal.selectpatient(bal);
                    DataTable dt1 = dal.searchpatienttestlist(bal);
                    GridView1.DataSource = dt1;
                    GridView1.DataBind();
                    foreach (DataRow dr in dt.Rows)
                    {
                        Session["search"] = "search";
                        string dat = dr["present_date"].ToString();
                        DateTime datetime = DateTime.Parse(dat);
                        txtdate.Text = datetime.ToString("yyyy-MM-dd");
                        txtlabno.Text = dr["lab_no"].ToString();
                        drptitle.Text = dr["title"].ToString();
                        txtpatientname.Text = dr["patient_name"].ToString();
                        txtage.Text = dr["age"].ToString();
                        drpgender.Text = dr["gender"].ToString();
                        drprefby.Text = dr["ref_by"].ToString();
                        lblnoof.Text = dr["nooftests"].ToString();
                        txttotalcost.Text = dr["totalcost"].ToString();
                        txtdiscount.Text = dr["discount"].ToString();
                        txtadvance.Text = dr["advance"].ToString();
                        txtnetbalance.Text = dr["netbalance"].ToString();


                        Session["present_date"] = txtdate.Text;
                        Session["lab_no"] = txtlabno.Text;
                        Session["title"] = drptitle.Text;
                        Session["patient_name"] = txtpatientname.Text;
                        Session["age"] = txtage.Text;
                        Session["gender"] = drpgender.Text;
                        Session["refby"] = drprefby.Text;
                        Session["nooftests"] = lblnoof.Text;
                        Session["totalcost"] = txttotalcost.Text;
                        Session["discount"] = txtdiscount.Text;
                        Session["advance"] = txtadvance.Text;
                        Session["netbalance"] = txtnetbalance.Text;
                        Session["refno"] = dr["ref_no"].ToString();
                        Session["account"] = dr["account_id"].ToString();
                        Session["addr"] = dr["address"].ToString();
                        Session["village"] = dr["villagecity"].ToString();
                        Session["contact number"] = dr["contact_no"].ToString();
                        Session["email id"] = dr["email_id"].ToString();
                        Session["sampledate"] = dr["sample_date"].ToString();
                        Session["sampletime"] = dr["sample_time"].ToString();
                        Session["reportingdate"] = dr["reporting_date"].ToString();
                        Session["reportingtime"] = dr["reporting_time"].ToString();
                        Session["categ"] = dr["category"].ToString();
                        Session["dept"] = dr["department"].ToString();
                        Session["remark"] = dr["remarks"].ToString();
                        Session["testlist_id"] = dr["testListId"].ToString();
                        Session["val"] = "";
                    }
                }
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {

        }
    }
}