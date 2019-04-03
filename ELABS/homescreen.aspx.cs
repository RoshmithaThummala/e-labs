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
    public partial class WebForm4 : System.Web.UI.Page
    {
        BAL bal = new BAL();
        DAL dal = new DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnok_Click(object sender, EventArgs e)
        {
            bal.Fromdate = (txtfrom.Text);
            bal.Todate = (txtto.Text);
            GridView1.DataSource = dal.HomeTestwise(bal);
            GridView1.DataBind();
            GridView2.DataSource = dal.Homedoctorwise(bal);
            GridView2.DataBind();
            //GridView3.DataSource = dal.timewise(bal);
            //GridView3.DataBind();
            //GridView5.DataSource = dal.doctorwise(bal);
            //GridView5.DataBind();
            DetailsView1.DataSource = dal.details(bal);
            DetailsView1.DataBind();
            GridView6.DataSource = dal.datewise(bal);
            GridView6.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            bal.Fromdate = (TextBox6.Text);
            bal.Todate = (TextBox7.Text);
            GridView5.DataSource = dal.doctorwise(bal);
            GridView5.DataBind();
            DataTable dt = dal.doctorwise(bal);
            string[] x = new string[dt.Rows.Count];
            int[] y = new int[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i][0].ToString();
                y[i] = Convert.ToInt32(dt.Rows[i][1]);
            }
            Chart2.Series[0].Points.DataBindXY(x, y);
        }
        protected void btnoktestwise_Click(object sender, EventArgs e)
        {
            bal.Fromdate = (txtfromtestwise.Text);
            bal.Todate = (txttotestwise.Text);
            GridView3.DataSource = dal.timewise(bal);
            GridView3.DataBind();
            DataTable dt = dal.timewise(bal);
            string[] x = new string[dt.Rows.Count];
            int[] y = new int[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i][0].ToString();
                y[i] = Convert.ToInt32(dt.Rows[i][1]);
            }
            Chart1.Series[0].Points.DataBindXY(x, y);
            
        }
        protected void btnokdatewise_Click(object sender, EventArgs e)
        {
            bal.Fromdate = (txtfromdatewise.Text);
            bal.Todate = (txttodatewise.Text);
            GridView7.DataSource = dal.datewise(bal);
            GridView7.DataBind();
            DataTable dt = dal.datewise(bal);
            string[] x = new string[dt.Rows.Count];
            int[] y = new int[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i][0].ToString();
                y[i] = Convert.ToInt32(dt.Rows[i][1]);
            }
            Chart3.Series[0].Points.DataBindXY(x, y);
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }

        protected void btnclose_Click1(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }

        protected void btnclosetestewise_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }

        protected void btnclosedatewise_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }
    }
}