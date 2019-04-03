using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Data.OleDb;
using System.Data.Common;
using System.Drawing;
using System.Configuration;
using System.Text;
using System.Web.Configuration;

namespace elabs
{
    public partial class list : System.Web.UI.Page
    {
        DAL dal = new DAL();
        BAL bal = new BAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lotid();
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        public void lotid()  //Binding LOT data at pageload
        {
            DataTable dt = new DataTable();
            dt = dal.SelectLoT();
            gridlot.DataSource = dt;
            gridlot.DataBind();
            if (chkenablesearch.Checked)
            {
                int i = int.Parse(dt.Rows.Count.ToString());
                lblresult.Text = i.ToString();
                lblpage.Text = (gridlot.PageIndex + 1).ToString();
                lblshow.Text = gridlot.Rows.Count.ToString();
            }
        }

        public void tnamesearch()  //Search By GroupName method
        {
            bal.Testgroupname = txttestname.Text;
            DataTable dt = dal.SearchLottname(bal);
            gridlot.DataSource = dt;
            gridlot.DataBind();
            if (chkenablesearch.Checked)
            {
                int i = int.Parse(dt.Rows.Count.ToString());
                lblresult.Text = i.ToString();
                lblpage.Text = (gridlot.PageIndex + 1).ToString();
                lblshow.Text = gridlot.Rows.Count.ToString();
            }
        }

        public void tcostsearch()  //Search by Cost method
        {
            bal.Testcost = txtcost.Text;
            DataTable dt = dal.SearchLotcost(bal);
            gridlot.DataSource = dt;
            gridlot.DataBind();
            if (chkenablesearch.Checked)
            {
                int i = int.Parse(dt.Rows.Count.ToString());
                lblresult.Text = i.ToString();
                lblpage.Text = (gridlot.PageIndex + 1).ToString();
                lblshow.Text = gridlot.Rows.Count.ToString();
            }
        }

        public void namecostserach()  //Search by GroupName & Cost method
        {
            bal.Testgroupname = txttestname.Text;
            bal.Testcost = txtcost.Text;
            DataTable dt = dal.SearchLotboth(bal);
            gridlot.DataSource = dt;
            gridlot.DataBind();
            if (chkenablesearch.Checked)
            {
                int i = int.Parse(dt.Rows.Count.ToString());
                lblresult.Text = i.ToString();
                lblpage.Text = (gridlot.PageIndex + 1).ToString();
                lblshow.Text = gridlot.Rows.Count.ToString();
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            gridlot.Visible = true;
            GridView1.Visible = false;
            Response.Redirect("testentryform.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            gridlot.Visible = true;
            GridView1.Visible = false;
            foreach (GridViewRow r in gridlot.Rows)
            {
                if (r.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkaction = (r.Cells[0].FindControl("chklist") as CheckBox);
                    if (chkaction.Checked)
                    {
                        string cid = (r.Cells[1].FindControl("lblsrno") as Label).Text;
                        Session["id"] = cid;
                        //Response.Redirect("testentryform.aspx");
                        Response.Redirect("testentryform.aspx?param=" + cid);
                    }
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            gridlot.Visible = true;
            GridView1.Visible = false;
            foreach (GridViewRow r in gridlot.Rows)
            {
                if (r.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkaction = (r.Cells[0].FindControl("chklist") as CheckBox);
                    if (chkaction.Checked)
                    {
                        string cid = (r.Cells[1].FindControl("lblsrno") as Label).Text;
                        Session["id"] = cid;
                        //Response.Redirect("testentryform.aspx");
                        Response.Redirect("testentryform.aspx?param=" + cid);
                    }
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }

        protected void btnprev_Click(object sender, EventArgs e)
        {
            gridlot.Visible = true;
            GridView1.Visible = false;
            int i = gridlot.PageCount;
            if (gridlot.PageIndex > 0)
            {
                gridlot.PageIndex = gridlot.PageIndex - 1;
                lblpage.Text = ((gridlot.PageIndex) + 1).ToString();
            }
            else
            {
                string script = "alert(\"No Pages to display\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);
            }
            if (txttestname.Text == "" && txtcost.Text == "")
            {
                lotid();
            }

            else if (txttestname.Text != "" && txtcost.Text == "")
            {
                tnamesearch();
            }
            else if (txttestname.Text == "" && txtcost.Text != "")
            {
                tcostsearch();
            }
            else if (txttestname.Text != "" && txtcost.Text != "")
            {
                namecostserach();
            }
        }

        protected void btnnext_Click(object sender, EventArgs e)
        {
            gridlot.Visible = true;
            GridView1.Visible = false;
            int i = gridlot.PageIndex + 1;
            if (i < gridlot.PageCount)
            {
                gridlot.PageIndex = i;
                if (chkenablesearch.Checked)
                {
                    lblpage.Text = (i + 1).ToString();
                    lblshow.Text = gridlot.Rows.Count.ToString();
                }
            }
            else
            {
                string script = "alert(\"No Pages to display\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "", script, true);
            }
            if (txttestname.Text == "" && txtcost.Text == "")
            {
                lotid();
            }

            else if (txttestname.Text != "" && txtcost.Text == "")
            {
                tnamesearch();
            }
            else if (txttestname.Text == "" && txtcost.Text != "")
            {
                tcostsearch();
            }
            else if (txttestname.Text != "" && txtcost.Text != "")
            {
                namecostserach();
            }
        }

        protected void btnexport_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            SqlConnection cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ELABSConnectionString"].ConnectionString);
            //SqlConnection cn = new SqlConnection("Data Source=.;Initial Catalog=ELABS;User ID=sa;Password=abc");

            cn.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from ListofTests", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                string fileName = Path.Combine(Server.MapPath("~/ImportDocument") + ".xlsx");
                string conString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + fileName + ";Extended Properties='Excel 12.0 Xml;HDR=Yes'";
                using (OleDbConnection con = new OleDbConnection(conString))
                {
                    //try
                    //{
                    //    string strCreate = "Create table EmployeeData (" + " [empid] varchar(50), " + " [empname] varchar(200), " + " [emailid] varchar(200), " + " [phonenum] varchar(200), " + " [address] varchar(200), " + " [dob] varchar(50))";
                    //    if (con.State == ConnectionState.Closed)
                    //    {
                    //        con.Open();
                    //    }

                    //    OleDbCommand cm = new OleDbCommand(strCreate, con);
                    //    cm.ExecuteNonQuery();
                    //}
                    //catch
                    //{
                    //}

                    con.Close();
                    con.Open();
                    OleDbCommand cd = new OleDbCommand("drop table [ListofTests$]", con);
                    cd.ExecuteNonQuery();

                    string strCreateTab = "Create table [ListofTests$] (" + " [SrNo] varchar(50), " + " [TestName] varchar(50), " + " [GroupName] varchar(50), " + " [Unit] varchar(50), " + " [NormalRange] varchar(50), " + " [Cost] int)";
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    OleDbCommand cmd = new OleDbCommand(strCreateTab, con);
                    cmd.ExecuteNonQuery();


                    string strInsert = "Insert into ListofTests([SrNo],[TestName]," +
                        " [GroupName], [Unit], [NormalRange], [Cost]" +
                        ") values(?,?,?,?,?,?)";
                    OleDbCommand cmdIns = new OleDbCommand(strInsert, con);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 50);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 50);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 50);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 50);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 50);
                    cmdIns.Parameters.Add("?", OleDbType.Integer);

                    foreach (DataRow row in dt.Rows)
                    {
                        cmdIns.Parameters[0].Value = row["SrNo"];
                        cmdIns.Parameters[1].Value = row["TestName"];
                        cmdIns.Parameters[2].Value = row["GroupName"];
                        cmdIns.Parameters[3].Value = row["Unit"];
                        cmdIns.Parameters[4].Value = row["NormalRange"];
                        cmdIns.Parameters[5].Value = row["Cost"];

                        cmdIns.ExecuteNonQuery();
                    }
                }


                byte[] content = File.ReadAllBytes(fileName);
                HttpContext context = HttpContext.Current;

                context.Response.BinaryWrite(content);
                context.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                context.Response.AppendHeader("Content-Disposition", "attachment; filename=ListofTests.xlsx");
                Context.Response.End();
            }
        }
        
        protected void btnimport_Click(object sender, EventArgs e)
        {
            gridlot.Visible = false;
            GridView1.Visible = true;

            if (fileuploadExcel.PostedFile.ContentType == "application/vnd.ms-excel" ||
        fileuploadExcel.PostedFile.ContentType == "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
            {
                try
                {
                    string fileName = Path.Combine(Server.MapPath("~/") + Path.GetExtension(fileuploadExcel.PostedFile.FileName));
                    fileuploadExcel.PostedFile.SaveAs(fileName);

                    string conString = "";
                    string ext = Path.GetExtension(fileuploadExcel.PostedFile.FileName);
                    if (ext.ToLower() == ".xls")
                    {
                        conString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + fileName + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\""; ;
                    }
                    else if (ext.ToLower() == ".xlsx")
                    {
                        conString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + fileName + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"";
                    }

                    string query = "select * from [ListofTests$] where TestName is not null";
                    OleDbConnection con = new OleDbConnection(conString);
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    OleDbCommand cmd = new OleDbCommand(query, con);
                    OleDbDataAdapter da = new OleDbDataAdapter(cmd);

                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    da.Dispose();
                    con.Close();
                    con.Dispose();
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
                catch (Exception)
                {

                }
            }
        }

        protected void chkenablesearch_CheckedChanged(object sender, EventArgs e)
        {
            gridlot.Visible = true;
            GridView1.Visible = false;
            if (chkenablesearch.Checked)
            {
                lblpage.Visible = true;
                lblresult.Visible = true;
                lblshow.Visible = true;

                if (txttestname.Text == "" && txtcost.Text == "")
                {
                    //DataTable dt = new DataTable();
                    //dt = dal.SelectLoT();
                    //int i = int.Parse(dt.Rows.Count.ToString());
                    //lblresult.Text = i.ToString();
                    //lblpage.Text = (gridlot.PageIndex + 1).ToString();
                    //lblshow.Text = gridlot.Rows.Count.ToString();

                    lotid();
                }
                else
                {
                    if (txtcost.Text == "" && txttestname.Text != "")
                    {
                        //bal.Testgroupname = txttestname.Text;
                        //DataTable dt = dal.SearchLottname(bal);
                        //int i = int.Parse(dt.Rows.Count.ToString());
                        //lblresult.Text = i.ToString();
                        //lblpage.Text = (gridlot.PageIndex + 1).ToString();
                        //lblshow.Text = gridlot.Rows.Count.ToString();
                        tnamesearch();
                    }
                    else if (txttestname.Text == "" && txtcost.Text != "")
                    {
                        //bal.Testcost = txtcost.Text;
                        //DataTable dt = dal.SearchLotcost(bal);
                        //int i = int.Parse(dt.Rows.Count.ToString());
                        //lblresult.Text = i.ToString();
                        //lblpage.Text = (gridlot.PageIndex + 1).ToString();
                        //lblshow.Text = gridlot.Rows.Count.ToString();
                        tcostsearch();
                    }
                    else
                    {
                        //bal.Testgroupname = txttestname.Text;
                        //DataTable dt = dal.SearchLotboth(bal);
                        //int i = int.Parse(dt.Rows.Count.ToString());
                        //lblresult.Text = i.ToString();
                        //lblpage.Text = (gridlot.PageIndex + 1).ToString();
                        //lblshow.Text = gridlot.Rows.Count.ToString();
                        namecostserach();
                    }
                }

            }
            else
            {
                lblpage.Visible = false;
                lblresult.Visible = false;
                lblshow.Visible = false;

                txttestname.Enabled = false;
                txtcost.Enabled = false;
            }
        }

        protected void txttestname_TextChanged(object sender, EventArgs e)
        {
            gridlot.Visible = true;
            GridView1.Visible = false;
            if (txtcost.Text == "")
            {
                tnamesearch();
            }
            else
            {
                namecostserach();
            }
        }

        protected void txtcost_TextChanged(object sender, EventArgs e)
        {
            gridlot.Visible = true;
            GridView1.Visible = false;
            if (txttestname.Text == "")
            {
                tcostsearch();
            }
            else
            {
                namecostserach();
            }
        }
    }
}