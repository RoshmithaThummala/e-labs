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
    public partial class userinformation : System.Web.UI.Page
    {
        BAL bal = new BAL();    // Class1 cs1 = new Class1();
        DAL dal = new DAL();    // Class2 cs2 = new Class2();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            bal.Username = txtusername.Text;
            bal.Position = drpposition.Text;
            bal.Password = txtpassword.Text;
            bal.Uid = int.Parse(Session["uid"].ToString());
            dal.register(bal);

            txtusername.Text = "";
            drpposition.Text = "";
            txtpassword.Text = "";
        }
    }
}