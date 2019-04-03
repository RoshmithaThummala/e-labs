using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebElabsproject;
using System.Data;
using System.Data.SqlClient;
using elabs;

namespace WebElabsproject
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        BAL bal = new BAL();
        DAL dal = new DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void txtdate_TextChanged(object sender, EventArgs e)
        {
            bal.Payment_date = (txtdate.Text);
            drppatientname.DataSource = dal.selectreceipt(bal);
            drppatientname.DataTextField = "patient_name";
            drppatientname.DataBind();
        }

        protected void btnok_Click(object sender, EventArgs e)
        {
            bal.Patient_name = drppatientname.Text;
            DataTable dt = dal.selectrecipetname(bal);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Label lb1 = (Label)row.FindControl("label16");
            Label lb2 = (Label)row.FindControl("label12");
            txtlongnarration.Text = lb1.Text;
            txttotalamount.Text = lb2.Text;

        }

        protected void btnprint_Click(object sender, EventArgs e)
        {
           
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }

       
    }
}