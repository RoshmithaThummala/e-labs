using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using elabs;

namespace Elabs_Asp_Project
{
    public partial class companyinformation : System.Web.UI.Page
    {
        BAL bal = new BAL();   // Class1 cs1 = new Class1();
        DAL dal = new DAL();   // Class2 cs2 = new Class2();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bal.Uid = Convert.ToInt32(Session["companynamedetails"]);
                DataTable dt = dal.Edit(bal);
                foreach (DataRow d in dt.Rows)
                {
                    txtlabname.Text = d["company_name"].ToString();
                    txtaddress.Text = d["address"].ToString();
                    txttechnicianname.Text = d["technician_name"].ToString();
                    txtcontactno.Text = d["contact_no"].ToString();
                }
            }
        }
        protected void btnregisternow_Click(object sender, EventArgs e)
        {
            Response.Redirect("userinformation.aspx");
        }
        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }
        protected void btnupdate_Click(object sender, EventArgs e)
        {
                bal.Company_name = txtlabname.Text;
                bal.Address = txtaddress.Text;
                bal.Technian_name1 = txttechnicianname.Text;
                bal.Contact_no = txtcontactno.Text;
                bal.Uid = Convert.ToInt32(Session["companynamedetails"]);
                dal.upDatecompany_DETAILS(bal);

        }
    }
}