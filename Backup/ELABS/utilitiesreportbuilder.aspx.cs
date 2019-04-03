using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using elabsproject;
using elabs;

namespace elabsproject
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        BAL bal = new BAL();
        DAL dal = new DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridview();
            }
        }
        protected void BindGridview()
        {
            DataTable dt = new DataTable();
            dt = dal.selectbind();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btninsert_Click(object sender, EventArgs e)
        {
            if (txtreport.Text == "")
            {
                bal.Report_id = "";
                bal.Template_name1 = txttemplatename.Text;
                bal.ApplyOn1 = applyon.Text;
                bal.Location1 = FileUpload1.FileName;
                txtmaploc.Text = FileUpload1.FileName;
                dal.insert(bal);
                BindGridview();
                txttemplatename.Text = "";
                applyon.ClearSelection();
                txtmaploc.Text = "";
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkrow = (row.Cells[0].FindControl("CheckBox1") as CheckBox);
                    if (chkrow.Checked)
                    {
                        Label lbl1 = (Label)row.FindControl("Label1");
                        Label lbl2 = (Label)row.FindControl("Label2");
                        Label lbl3 = (Label)row.FindControl("Label3");
                        txttemplatename.Text = lbl1.Text;
                        applyon.Text = lbl2.Text;
                        txtmaploc.Text = lbl3.Text;
                    }
                }
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            bal.Template_name1 = txttemplatename.Text;
            bal.ApplyOn1 = applyon.Text;
            bal.Location1 = txtmaploc.Text;
            txtmaploc.Text = FileUpload1.FileName;
            dal.update(bal);
            BindGridview();
            txttemplatename.Text = "";
            applyon.ClearSelection();
            txtmaploc.Text = "";
        }
               
        protected void btndelete_Click(object sender, EventArgs e)
        {         
            bal.Template_name1 = txttemplatename.Text;
            dal.delete(bal);
            BindGridview();
            txttemplatename.Text = "";
            applyon.ClearSelection();
            txtmaploc.Text = "";       
        }

        protected void txtreport_TextChanged(object sender, EventArgs e)
        {
            if (txtreport.Text!=null)
            {
                bal.Template_name1 = txtreport.Text;
                DataTable dt = new DataTable();
                dt = dal.search(bal);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }

        protected void btnrefresh_Click(object sender, EventArgs e)
        {
            txtreport.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}