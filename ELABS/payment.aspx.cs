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
    public partial class WebForm1 : System.Web.UI.Page
    {
        DAL dal = new DAL();
        BAL bal = new BAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlpatientname.Items.Add("select");
                ddlpaymentmode.Items.Add("select");
                ddlpaymentmode.Items.Add("Cash");
                ddlpaymentmode.Items.Add("Cheque");
            }
            
        }
  
        protected void txtdate_TextChanged(object sender, EventArgs e)
        {
            bal.Payment_date = txtdate.Text;
            ddlpatientname.DataSource = dal.selectpaymentdate(bal);
            ddlpatientname.DataTextField = "patient_name";
            ddlpatientname.DataBind(); 
        }

        protected void btnok_Click(object sender, EventArgs e)
        {
            bal.Patient_name = ddlpatientname.Text;
            DataTable dt = dal.selectspname(bal);
            GridView1.DataSource = dt;
            GridView1.DataBind();
           
            
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Label lb3 = (Label)row.FindControl("label3");
            Label lb4 = (Label)row.FindControl("label4");
            Label lb5 = (Label)row.FindControl("label5");
            Label lb6 = (Label)row.FindControl("label6");
            Label lb7 = (Label)row.FindControl("label7");
            Label lb8 = (Label)row.FindControl("label8");
            Label lb11 = (Label)row.FindControl("label11");
            Label lb12 = (Label)row.FindControl("label12");
            Label lb13 = (Label)row.FindControl("label13");
            Label lb14 = (Label)row.FindControl("label14");
            ddlpaymentmode.Text = lb4.Text;
            txtvchno.Text = lb3.Text;
            txtamountpaid.Text = lb5.Text;
            txtshortnarration.Text = lb6.Text;
            txtlonnarration.Text = lb7.Text;
            txtpatient.Text = lb8.Text;
            txttotalamountv.Text = lb11.Text;
            txttotalamtv.Text = lb11.Text;
            txtbalanceamount.Text = lb12.Text;
            txtdiscount.Text = lb13.Text;
            txtaccountname.Text = lb14.Text;

        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (((CheckBox)row.FindControl("chk")).Checked)
                {
                    for (int i = 0; i < GridView1.Rows.Count; i++)
                    {
                        Label name = (Label)row.FindControl("Label9");
                        bal.Patient_name = ddlpatientname.Text;
                        dal.paydelete(bal);
                        DataTable dt = dal.selectspname(bal);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                       
                    }
                }
            }
            txtdate.Text = string.Empty;
            ddlpatientname.ClearSelection();
            ddlpaymentmode.ClearSelection();
            txtvchno.Text = string.Empty;
            txtaccountname.Text = string.Empty;
            txtshortnarration.Text = string.Empty;
            txtlonnarration.Text = string.Empty;
            txtamountpaid.Text = string.Empty;
            txttotalamountv.Text = string.Empty;
            txttotalamtv.Text = string.Empty;
            txtdiscount.Text = string.Empty;
            txtbalanceamount.Text = string.Empty;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "aiert('Data Deleted Sucessfully')", true);
           
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            bal.Patient_name = ddlpatientname.Text;
            bal.Payment_mode = ddlpaymentmode.Text;
            dal.payupdate(bal);
            DataTable dt = dal.selectspname(bal);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Data Updated Sucessfully');", true);

        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            bal.Patient_id = Convert.ToInt32(txtpatient.Text);
            bal.Voucher_no = Convert.ToInt32(txtvchno.Text);
            bal.Payment_date = txtdate.Text;
            bal.Patient_name = ddlpatientname.Text;
            bal.Account_name = txtaccountname.Text;
            bal.Amountpayed =decimal.Parse(txtamountpaid.Text);
            bal.Payment_mode = ddlpaymentmode.Text;
            //bal.TotalCost = decimal.Parse(txttotalamount.Text);
            bal.TotalCost = txttotalamountv.Text; 
            bal.Netbalance = decimal.Parse(txttotalamtv.Text);
            bal.Discount = Convert.ToInt32(txtdiscount.Text);
            dal.payinsert(bal);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Data Saved Sucessfully');", true);
        }

      
    }
}













































