using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using elabs;

namespace ELABS
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        BAL bal = new BAL();     // Class1 cs1 = new Class1();
        DAL dal = new DAL();     // Class2 cs2 = new Class2();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btninsert_Click(object sender, EventArgs e)
        {
            bal.Company_name = txtcompanyname.Text;
            bal.Formation_year = txtformationyear.Text;
            bal.Address = txtaddress.Text;
            bal.Technian_name1 = txttechnicienname.Text;
            bal.Contact_no = txtcontactno.Text;
            bal.Uid = dal.autogenuid() + 1;
            dal.insertC(bal);
            Response.Redirect("startingform.aspx");
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("startingform.aspx");
        }
    }
}