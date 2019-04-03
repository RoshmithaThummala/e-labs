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
    public partial class WebForm2 : System.Web.UI.Page
    {
        //Class1 cs = new Class1();
        //Class2 cs1 = new Class2();

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
            bal.Date1 = txtfrom.Text;
            bal.Date2 = txtto.Text;
            DataTable dt = new DataTable();
            dt = dal.selectaccount(bal);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            decimal total = 0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string y = dt.Rows[i]["opening_balance"].ToString();
                decimal z = decimal.Parse(y);
                total = total + z;
                txttotalamount.Text = total.ToString();
            }
            
           
        }
        protected void BindGridview()
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
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
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Balancelist.xls"));
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridView1.AllowPaging = false;
            BindGridview();
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
    }
}