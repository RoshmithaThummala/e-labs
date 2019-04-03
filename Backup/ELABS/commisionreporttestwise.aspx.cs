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
    public partial class WebForm3 : System.Web.UI.Page
    {
        DAL dal = new DAL();
        BAL bal = new BAL();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnok_Click(object sender, EventArgs e)
        {
            if (txtdoctornameCT.Text == "")
            {
                bal.FromCT = txtfromCT.Text;
                bal.ToCT = txttoCT.Text;
                dt = dal.commissionTestWise(bal);
                gvComnTestWise.DataSource = dt;
                gvComnTestWise.DataBind();
                GridViewRow row = gvComnTestWise.SelectedRow;
                int x = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    int y = int.Parse(dt.Rows[i]["cost"].ToString());
                    x = x + y;
                    txttotalcostCT.Text = x.ToString();
                }
                int s = 0;
                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    int z = int.Parse(dt.Rows[j]["Commission"].ToString());
                    s = s + z;
                    txttotalcommisssionCT.Text = s.ToString();
                }
            }
            if (txtdoctornameCT.Text != "" && txtfromCT.Text != "" && txttoCT.Text != "")
            {
                bal.DoctNameCT = txtdoctornameCT.Text;
                bal.FromCT = txtfromCT.Text;
                bal.ToCT = txttoCT.Text;
                dt = dal.commissionTestDoctor(bal);
                gvComnTestWise.DataSource = dt;
                gvComnTestWise.DataBind();
                int x = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    int y = int.Parse(dt.Rows[i]["cost"].ToString());
                    x = x + y;
                    txttotalcostCT.Text = x.ToString();
                }
                int s = 0;
                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    int z = int.Parse(dt.Rows[j]["Commission"].ToString());
                    s = s + z;
                    txttotalcommisssionCT.Text = s.ToString();
                }
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /*Verifies that the control is rendered */
        }
        protected void btnexcel_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "CommisionTestWise.xls"));
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            gvComnTestWise.AllowPaging = false;
            bal.FromCT = txtfromCT.Text;
            bal.ToCT = txttoCT.Text;
            dt = dal.commissionTestWise(bal);
            gvComnTestWise.DataSource = dt;
            gvComnTestWise.DataBind();
            gvComnTestWise.HeaderRow.Style.Add("background-color", "#FFFFFF");
            for (int i = 0; i < gvComnTestWise.HeaderRow.Cells.Count; i++)
            {
                gvComnTestWise.HeaderRow.Cells[i].Style.Add("background-color", "#df5015");
            }
            gvComnTestWise.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }
    }
}