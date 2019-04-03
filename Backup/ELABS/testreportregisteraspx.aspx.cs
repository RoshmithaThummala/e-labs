using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using elabs;

namespace elabReports
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        BAL bal = new BAL();
        DAL dal = new DAL();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnok_Click(object sender, EventArgs e)
        {
            if (txtsearch1.Text == "" && txtsearch2.Text=="" && txtfrom.Text != "" && txtto.Text != "")
            {
                bal.FromC = txtfrom.Text;
                bal.ToC = txtto.Text;
                dt = dal.transactionRegister(bal);
                gvTransactionReg.DataSource = dt;
                gvTransactionReg.DataBind();
                GridViewRow row = gvTransactionReg.SelectedRow;
                int x = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    int y = int.Parse(dt.Rows[i]["cost"].ToString());
                    x = x + y;
                    txttotalamount.Text = x.ToString();
                }
                
                //bal.TotalCost = txttotalamount.Text;
            }
            txttotalamount.Text = String.Empty;
            //else
            //{
            //    string display = "From And To Date Should Not Be Empty";
            //    ClientScript.RegisterStartupScript(this.GetType(), "yourMessage", "alert('" + display + "');", true);
            //}
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void btnexcel_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "TestReport.xls"));
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            gvTransactionReg.AllowPaging = false;
            bal.FromC = txtfrom.Text;
            bal.ToC = txtto.Text;
            dt = dal.transactionRegister(bal);
            gvTransactionReg.DataSource = dt;
            gvTransactionReg.DataBind();
            //Change the Header Row back to white color
            gvTransactionReg.HeaderRow.Style.Add("background-color", "#FFFFFF");
            //Applying stlye to gridview header cells
            for (int i = 0; i < gvTransactionReg.HeaderRow.Cells.Count; i++)
            {
                gvTransactionReg.HeaderRow.Cells[i].Style.Add("background-color", "#df5015");
            }
            gvTransactionReg.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }
        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
            //Response.Write("<script>window.close();</script>");
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Close_Window", "self.close();", true);
            //this.ClientScript.RegisterClientScriptBlock(this.GetType(), "Close", "window.close()", true);
        }
        protected void txtsearch1_TextChanged(object sender, EventArgs e)
        {
            //if (txtfrom.Text == "" || txtfrom.Text != "" && txtto.Text == "" || txtto.Text != "")
            //{
            if (ddlsearch1.Text == "patient_name" && txtsearch2.Text == "")
            {
                bal.Patientname = txtsearch1.Text;
                dt = dal.ddlSearchName(bal);
                gvTransactionReg.DataSource = dt;
                gvTransactionReg.DataBind();
            }
            if (ddlsearch1.Text == "test_name" && txtsearch2.Text == "")
            {
                bal.Testname = txtsearch1.Text;
                dt = dal.ddlSearchTest(bal);
                gvTransactionReg.DataSource = dt;
                gvTransactionReg.DataBind();
            }
            if (ddlsearch1.Text == "address" && txtsearch2.Text == "")
            {
                bal.Address = txtsearch1.Text;
                dt = dal.ddlSearchAddress(bal);
                gvTransactionReg.DataSource = dt;
                gvTransactionReg.DataBind();
            }
            if (ddlsearch1.Text == "villagecity" && txtsearch2.Text == "")
            {
                bal.Vilgcity = txtsearch1.Text;
                dt = dal.ddlSearchVillagecity(bal);
                gvTransactionReg.DataSource = dt;
                gvTransactionReg.DataBind();
            }
            int x = 0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int y = int.Parse(dt.Rows[i]["cost"].ToString());
                x = x + y;
                txttotalamount.Text = x.ToString();
            }
            //}
        }
        protected void txtsearch2_TextChanged1(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=Elabs;User ID=sa;Password=abc");
            DataTable dt = new DataTable();
            string ddl1 = ddlsearch1.Text;
            string ddl2 = ddlsearch2.Text;
            bal.FromC = txtfrom.Text;
            bal.ToC = txtto.Text;
            bal.Search1 = txtsearch1.Text;
            bal.Search2 = txtsearch2.Text;
            if (ddl2 == "patient_name")
            {
                SqlCommand cmd = new SqlCommand("select distinct p.reporting_date,p.department,p.patient_name,tg.test_group_name,t.test_name,t.unit,pt.result,pt.cost,p.ref_by,p.address,p.villagecity from patient p join patientTestsList pt on p.testListId=pt.testListId join test t on pt.test_id=t.test_id join testgroup tg on t.test_group_id=tg.test_group_id where p.reporting_date between '" + bal.FromC + "' and '" + bal.ToC + "' and " + ddl1 + " like '" + bal.Search1 + "' + '%' and " + ddl2 + " like '" + bal.Search2 + "' +'%'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            else
            {
                SqlCommand cmd = new SqlCommand("select distinct p.reporting_date,p.department,p.patient_name,tg.test_group_name,t.test_name,t.unit,pt.result,pt.cost,p.ref_by,p.address,p.villagecity from patient p join patientTestsList pt on p.testListId=pt.testListId join test t on pt.test_id=t.test_id join testgroup tg on t.test_group_id=tg.test_group_id where p.reporting_date between '" + bal.FromC + "' and '" + bal.ToC + "' and " + ddl1 + " like '" + bal.Search1 + "' + '%' and " + ddl2 + " like '" + bal.Search2 + "' +'%'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            gvTransactionReg.DataSource = dt;
            gvTransactionReg.DataBind();

            int x = 0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int y = int.Parse(dt.Rows[i]["cost"].ToString());
                x = x + y;
                txttotalamount.Text = x.ToString();
            }
        }
        }
    }
