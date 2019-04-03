using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using elabs;

namespace ELABS
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DAL dal = new DAL();
        BAL bal = new BAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt = dal.baind();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddDetails.aspx"); 
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            var r = GridView1.Rows[GridView1.SelectedIndex];
            Session["num"] = r.Cells[r.Cells.Count - 1].Text;
            bal.Uid = Convert.ToInt32(GridView1.SelectedRow.Cells[7].Text);

            DataTable dt = dal.Edit(bal);
            int i = dt.Rows.Count;
            if (dt.Rows.Count >= 1)
            {
                Session["uid"] = bal.Uid;
                Session["company_name"] = bal.Company_name;
                Session["address"] = bal.Address;
                Session["technian_name"] = bal.Technian_name1;
                Session["contact_no"] = bal.Contact_no;
            }
            Response.Redirect("login.aspx");
            Response.Redirect("companyinformation.aspx");
        }
    }
}