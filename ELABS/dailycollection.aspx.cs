using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using elabs;

namespace DOCTORproject
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        DAL dal = new DAL();
        BAL bal = new BAL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnok_Click(object sender, EventArgs e)
        {
            bal.Todate = txtto.Text;
            bal.Fromdate = txtfrom.Text;
            GridView1.DataSource = dal.fromto_DAILY_LIST(bal);
            GridView1.DataBind();
            GridView2.DataSource = dal.DAILY_LIST_SECNDtbl(bal);
            GridView2.DataBind();
            bal.Todate = txtto.Text;
            bal.Fromdate = txtfrom.Text;
            DataTable table1 = dal.totalcommisionOFDAIL_LIST_textboxcommission(bal);
            object sumObject;
            sumObject = table1.Compute("Sum(totalcommission)", "");
            txttotalcomission.Text = sumObject.ToString();

            bal.Todate = txtto.Text;
            bal.Fromdate = txtfrom.Text;
            DataTable table2 = dal.DAILYLIST_PENDING_TOTAL_textbox(bal);
            object balance;
            object totalcollection;
            balance = table2.Compute("Sum(nooftests)", "");
            totalcollection = table2.Compute("Sum(netbalance)", "");
            txttotalcollection.Text = totalcollection.ToString();
            txtpendingbalance.Text = balance.ToString();
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