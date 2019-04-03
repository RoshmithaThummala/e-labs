using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using elabs;

namespace elabReports
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        BAL bal = new BAL();
        DAL dal = new DAL();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnok_Click(object sender, System.EventArgs e)
        {
            if (txtfromCP.Text != "" && txttoCP.Text != "")
            {
                bal.FromCP = txtfromCP.Text;
                bal.ToCP = txttoCP.Text;
                dt = dal.commissionPerct(bal);
                gvCommissionPertCP.DataSource = dt;
                gvCommissionPertCP.DataBind();
                int x = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    int y = int.Parse(dt.Rows[i]["cost"].ToString());
                    x = x + y;
                    txttotalcostCP.Text = x.ToString();
                    txttotalcommisionCP.Text = string.Empty;
                }
                if (txtcomCP.Text != "")
                {
                    int q = int.Parse(txtcomCP.Text);
                    float s = 0;
                    for (int p = 0; p < dt.Rows.Count; p++)
                    {
                        int k = int.Parse(dt.Rows[p]["cost"].ToString());
                        float j = (k * q) / 100;
                        //gvCommissionPertCP.Rows[p]["Commission"] = j.ToString();
                        gvCommissionPertCP.Rows[p].Cells[9].Text = j.ToString();
                        s = s + j;
                        txttotalcommisionCP.Text = s.ToString();
                    }
                }
            }
            if (txtdoctorCP.Text != "")
            {
                bal.DoctName = txtdoctorCP.Text;
                bal.FromCP = txtfromCP.Text;
                bal.ToCP = txttoCP.Text;
                dt = dal.commissionPerDoctName(bal);
                gvCommissionPertCP.DataSource = dt;
                gvCommissionPertCP.DataBind();
                if (dt.Rows.Count > 0)
                {
                int x = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    int y = int.Parse(dt.Rows[i]["cost"].ToString());
                    x = x + y;
                    txttotalcostCP.Text = x.ToString();
                }
                if (txtcomCP.Text != "")
                {
                    int q = int.Parse(txtcomCP.Text);
                    float s = 0;
                    for (int p = 0; p < dt.Rows.Count; p++)
                    {
                        int k = int.Parse(dt.Rows[p]["cost"].ToString());
                        float j = (k * q) / 100;
                        gvCommissionPertCP.Rows[p].Cells[9].Text = j.ToString();
                        s = s + j;
                        txttotalcommisionCP.Text = s.ToString();
                    }
                    //txttotalcommisionCP.Text = string.Empty;
                }
            }
            }
            else
            {
                txttotalcostCP.Text = String.Empty;
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /*Verifies that the control is rendered */
        }
        protected void btnexcel_Click(object sender, System.EventArgs e)
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Commission%Wise.xls"));
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            gvCommissionPertCP.AllowPaging = false;
            bal.FromCP = txtfromCP.Text;
            bal.ToCP = txttoCP.Text;
            dt = dal.commissionPerct(bal);
            gvCommissionPertCP.DataSource = dt;
            gvCommissionPertCP.DataBind();
            gvCommissionPertCP.HeaderRow.Style.Add("background-color", "#FFFFFF");
            for (int i = 0; i < gvCommissionPertCP.HeaderRow.Cells.Count; i++)
            {
                gvCommissionPertCP.HeaderRow.Cells[i].Style.Add("background-color", "#df5015");
            }
            gvCommissionPertCP.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }

        protected void btnclose_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }
    }
}