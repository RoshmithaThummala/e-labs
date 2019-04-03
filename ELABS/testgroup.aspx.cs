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
    public partial class Testg : System.Web.UI.Page
    {
        BAL bal = new BAL();
        DAL dal = new DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                tgid();
                data();
            }
        }

        public void reset()
        {
            //foreach (Control ctrl in this.Controls)
            //{
            //    if (ctrl.GetType() == typeof(TextBox))
            //    {
            //        ((TextBox)(ctrl)).Text = string.Empty;
            //    }
            //    else if (ctrl.GetType() == typeof(DropDownList))
            //    {
            //        ((DropDownList)(ctrl)).SelectedIndex = 0;
            //    }
            //    //check for all the CheckBox controls on the page and unchecked the selection
            //    else if (ctrl.GetType() == typeof(CheckBox))
            //    {
            //        ((CheckBox)(ctrl)).Checked = false;
            //    }
            //}

            txttestgrpname.Text = "";
            txttotalcost.Text = "";
            tgid();
        }

        public void tgid()  //Binding TestGroup id at pageload
        {
            DataTable dt = new DataTable();
            dt = dal.IncTG();

            foreach (DataRow dr in dt.Rows)
            {
                txtserialorderno.Text = dr["test_group_id"].ToString();
            }
        }

        public void data()  //Binding testgroup data to gridTestGroup grid
        {
            DataTable dt = dal.SelectTG();
            gridTestGroup.DataSource = dt;
            gridTestGroup.DataBind();
        }

        protected void btnnew_Click(object sender, EventArgs e)
        {
            try
            {
                    txttestgrpname.ReadOnly = false;
                    txttotalcost.ReadOnly = false;
                    txttestgrpname.Text = "";
                    txttotalcost.Text = "";
                    btnnew.Visible = false;
                    btnadd.Visible = true;
                    tgid();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            bal.Testgroupname = txtSearch.Text;
            DataTable dt = dal.SelectTestGroup(bal);
            gridTestGroup.DataSource = dt;
            gridTestGroup.DataBind();
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }

        protected void gridTestGroup_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void btnedit_Click(object sender, EventArgs e)
        {
            try
            {
                txttotalcost.ReadOnly = false;
                txttestgrpname.ReadOnly = false;
                check();
                //btnedit.Visible = false;
                btnupdate.Visible = true;
                data();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        private void check()
        {
            foreach (GridViewRow r in gridTestGroup.Rows)
            {
                if (r.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkaction = (r.Cells[0].FindControl("chktg") as CheckBox);
                    if (chkaction.Checked)
                    {
                        string cid = (r.Cells[1].FindControl("lblid") as Label).Text;
                        string name = (r.Cells[2].FindControl("lblname") as Label).Text;
                        string cost = (r.Cells[4].FindControl("lblcost") as Label).Text;
                        
                        if (name != "")
                        {
                            chksubgroup.Checked = false;
                            //string name = (r.Cells[2].FindControl("lblname") as Label).Text;
                            txtserialorderno.Text = cid;
                            txttestgrpname.Text = name;
                            txttotalcost.Text = cost;
                        }

                        else
                        {
                            chksubgroup.Checked = true;
                            string sname = (r.Cells[3].FindControl("lblsname") as Label).Text;
                            txtserialorderno.Text = cid;
                            txttestgrpname.Text = sname;
                            txttotalcost.Text = cost;
                        }
                    }
                }
            }
        }
        protected void btndelete_Click(object sender, EventArgs e)
        {
            try
            {
                //check();
                //chktg_CheckedChanged(null, null);
                //txttestgrpname.Enabled = true;
                //txttotalcost.Enabled = true;
                bal.Testgroupid = txtserialorderno.Text;
                dal.DeleteTestGroup(bal);
                reset();
                data();
                string script = "alert(\"DATA DELETED SUCCESSFULLY\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);

            }
            catch (Exception ex)
            {
                ex.ToString();

            }
        }

        protected void gridTestGroup_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            if (gridTestGroup.SelectedRow.Cells[1].Text != null)
            {
                chksubgroup.Checked = false;
                txtserialorderno.Text = gridTestGroup.SelectedRow.Cells[0].Text;
                txttestgrpname.Text = gridTestGroup.SelectedRow.Cells[1].Text;
                txttotalcost.Text = gridTestGroup.SelectedRow.Cells[3].Text;
            }

            else
            {
                chksubgroup.Checked = true;
                txtserialorderno.Text = gridTestGroup.SelectedRow.Cells[0].Text;
                txttestgrpname.Text = gridTestGroup.SelectedRow.Cells[2].Text;
                txttotalcost.Text = gridTestGroup.SelectedRow.Cells[3].Text;
            }
        }

        protected void btnprv_Click(object sender, EventArgs e)
        {
            int i = gridTestGroup.PageCount;
            if (gridTestGroup.PageIndex > 0)
            {
                gridTestGroup.PageIndex = gridTestGroup.PageIndex - 1;
            }
            else
            {
                string script = "alert(\"No Pages to display\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);
            }
            data();
        }

        protected void btnnext_Click(object sender, EventArgs e)
        {
            int i = gridTestGroup.PageIndex + 1;
            if (i < gridTestGroup.PageCount)
            {
                gridTestGroup.PageIndex = i;
            }
            else
            {
                string script = "alert(\"No Pages to display\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);
            }
            data();
        }

        
        protected void btnadd_Click(object sender, EventArgs e)
        {
            try
            {
                txttestgrpname.ReadOnly = true;
                //txtserialorderno.ReadOnly = true;
                txttotalcost.ReadOnly = true;
                //btnnew.Text = "New";
                if (chksubgroup.Checked == false)
                {
                    bal.Testgroupid = txtserialorderno.Text;
                    bal.Testgroupname = txttestgrpname.Text;
                    bal.Testgroupcost = txttotalcost.Text;
                    dal.InsertTestGroup(bal);
                }
                else
                {
                    bal.Testgroupid = txtserialorderno.Text;
                    bal.Testgroupname = txttestgrpname.Text;
                    bal.Testgroupcost = txttotalcost.Text;
                    dal.InsertTestSubGroup(bal);
                }
                //Response.Write("<span style='position:absolute;margin-left:750px;margin-top:530px;color:red'>DATA INSERTED SUCCESSFULLY</span>");
                string script = "alert(\"DATA INSERTED SUCCESSFULLY\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);
                btnnew.Visible = true;
                btnadd.Visible = false;
                data();
                reset();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (chksubgroup.Checked == false)
                {
                    bal.Testgroupid = txtserialorderno.Text;
                    bal.Testgroupname = txttestgrpname.Text;
                    bal.Testgroupcost = txttotalcost.Text;
                    dal.UpdateTestGroup(bal);
                }
                else
                {
                    bal.Testgroupid = txtserialorderno.Text;
                    bal.Testgroupname = txttestgrpname.Text;
                    bal.Testgroupcost = txttotalcost.Text;
                    dal.UpdateTestSubGroup(bal);
                }

                string script = "alert(\"DATA UPDATED SUCCESSFULLY\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);
                //btnedit.Visible = true;
                //btnupdate.Visible = false;
                data();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        
        protected void chktg_CheckedChanged(object sender, EventArgs e)
        {
            txttestgrpname.ReadOnly = false;
            txttotalcost.ReadOnly = false;

            foreach (GridViewRow r in gridTestGroup.Rows)
            {
                if (r.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkaction = (r.Cells[0].FindControl("chktg") as CheckBox);
                    if (chkaction.Checked)
                    {
                        Label cid = (Label)r.FindControl("lblid");
                        Label name = (Label)r.FindControl("lblname");
                        Label cost = (Label)r.FindControl("lblcost");
                        if (name.Text != "")
                        {
                            chksubgroup.Checked = false;
                            txtserialorderno.Text = cid.Text;
                            txttestgrpname.Text = name.Text;
                            txttotalcost.Text = cost.Text;
                        }

                        else
                        {
                            Label sname = (Label)r.FindControl("lblsname");
                            chksubgroup.Checked = true;
                            txtserialorderno.Text = cid.Text;
                            txttestgrpname.Text = sname.Text;
                            txttotalcost.Text = cost.Text;
                        }
                        //txttestgrpname.Enabled = true;
                        //txttotalcost.Enabled = true;
                    }
                }
            }
        }
    }
}