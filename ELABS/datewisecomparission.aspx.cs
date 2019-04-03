using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.DataVisualization.Charting;
using elabs;

namespace ELabs
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        DAL dal = new DAL();
        BAL bal = new BAL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnok_Click(object sender, EventArgs e)
        {
            bal.Fromdate = (txtfrom.Text);
            bal.Todate = (txtto.Text);
            GridView1.DataSource = dal.datewise(bal);
            GridView1.DataBind();
            DataTable dt = dal.datewise(bal);
            string[] x = new string[dt.Rows.Count];
            int[] y = new int[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i][0].ToString();
                y[i] = Convert.ToInt32(dt.Rows[i][1]);
            }
            Chart1.Series[0].Points.DataBindXY(x, y);
            
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }
    }
}