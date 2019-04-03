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
    public partial class WebForm2 : System.Web.UI.Page
    {
        BAL bal = new BAL();   //Class1 cs1 = new Class1();
        DAL dal = new DAL();   //Class2 cs2 = new Class2();

        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Text = Session["num"].ToString();
            Session["companynamedetails"] = TextBox1.Text;
            TextBox1.Visible = false;
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            bal.Uid = Convert.ToInt32(TextBox1.Text);
            bal.Username = txtusername.Text;
            bal.Password = txtpassword.Text;
            DataTable dt = dal.login(bal);
            //if (dt.Rows.Count >= 1)
            //{
            //    Response.Redirect("companymenulist.aspx");
            //}
            int i = dt.Rows.Count;
            if (dt.Rows.Count >= 1)
            {
                for (int a = 0; a < dt.Rows.Count; a++)
                {
                    string role = dt.Rows[0]["position"].ToString();
                    string uname = dt.Rows[0]["username"].ToString();
                    string pwd = dt.Rows[0]["password"].ToString();
                    if (txtusername.Text == uname && txtpassword.Text == pwd)
                    {
                        Response.Redirect("companymenulist.aspx");
                    }
                    //else if (dt.Rows[0]["position"].ToString() == "Technicion")
                    else
                    {
                        string script = "alert(\"ENTER VALID USERNAME & PASSWORD\");";
                        ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);
                        //Response.Redirect("companymenulist.aspx");
                    }
                }
                Response.Redirect("companymenulist.aspx");
            }

            else
            {
                string script = "alert(\"ENTER VALID USERNAME & PASSWORD\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);
            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("startingform.aspx");
        }
    }
}