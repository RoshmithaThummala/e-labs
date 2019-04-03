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
using System.Text;
using elabsproject;
using elabs;

namespace elabsproject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ELABSConnectionString"].ConnectionString);

        BAL bal = new BAL();
        DAL dal = new DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void btnok_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                bal.Date1 = (txtfrom.Text);
                bal.Date2 = (txtto.Text);
                DataTable dt = new DataTable();
                dt = dal.selectdate(bal);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                int total = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    int y = int.Parse((dt.Rows[i]["cost"]).ToString());
                    total = total + y;
                    txttotalamount.Text = total.ToString();
                }
            }
        }

        protected void BindGridView()
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                dt = dal.select();
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        protected void btnexcel_Click(object sender, EventArgs e)
        {           
            bal.Date1 = txtfrom.Text;
            bal.Date2 = txtto.Text;
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Hospitalreport.xls"));
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridView1.AllowPaging = false;
            BindGridView();
            //Change the Header Row back to white color
            GridView1.HeaderRow.Style.Add("background-color", "#FFFFFF");
            //Applying stlye to gridview header cells
            for (int i = 0; i < GridView1.HeaderRow.Cells.Count; i++)
            {
                GridView1.HeaderRow.Cells[i].Style.Add("background-color", "#df5015");
            }
            GridView1.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }


        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }

        protected void btnprint_Click(object sender, EventArgs e)
        {

           
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            if (TextBox1.Text != null)
            {
                bal.Patient_name = TextBox1.Text;
                DataTable dt = new DataTable();
                dt = dal.selectsearch(bal);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                int total = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    int y = int.Parse((dt.Rows[i]["cost"]).ToString());
                    total = total + y;
                    txttotalamount.Text = total.ToString();
                }
            }         
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            string s = drppateintname.Text;
            string s1 = drpaddress.Text;
            DataTable dt = new DataTable();
            bal.Date1 = txtfrom.Text;
            bal.Date2 = txtto.Text;
            bal.Searchitem1 = TextBox1.Text;
            bal.Searchitem2 = TextBox2.Text;
           

            if (s1 == "patient_name")
            {
                SqlCommand cmd = new SqlCommand("select Distinct reporting_date,department,patient_name,age,gender,ref_by,test_group_name,test_name,PatientTestsList.cost,address,villagecity,patient.contact_no from patient JOIN PatientTestsList ON patient.testListId=PatientTestsList.testListId JOIN test ON PatientTestsList.test_id=test.test_id  JOIN testgroup ON test.test_group_id=testgroup.test_group_id where reporting_date between'" + bal.Date1 + "' and '" + bal.Date2 + "' and "+s+" like '" + bal.Searchitem1 + "' +'%' and " + s1 + " like '" + bal.Searchitem2 + "' +'%'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                int total = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    int y = int.Parse((dt.Rows[i]["cost"]).ToString());
                    total = total + y;
                    txttotalamount.Text = total.ToString();
                }
            }
            else
            {
                SqlCommand cmd = new SqlCommand("select Distinct reporting_date,department,patient_name,age,gender,ref_by,test_group_name,test_name,PatientTestsList.cost,address,villagecity,patient.contact_no from patient JOIN PatientTestsList ON patient.testListId=PatientTestsList.testListId JOIN test ON PatientTestsList.test_id=test.test_id  JOIN testgroup ON test.test_group_id=testgroup.test_group_id where reporting_date between '" + bal.Date1 + "' and '" + bal.Date2 + "' and " + s + " like '" + bal.Searchitem1 + "' +'%' and " + s1 + " like '" + bal.Searchitem2 + "' +'%'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                int total = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    int y = int.Parse((dt.Rows[i]["cost"]).ToString());
                    total = total + y;
                    txttotalamount.Text = total.ToString();
                }
            }

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}