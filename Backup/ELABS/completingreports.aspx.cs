﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using elabs;

namespace DOCTORproject
{
         partial class WebForm1 : System.Web.UI.Page
    {
        DAL dal = new DAL();
        BAL bal = new BAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                drppateintname.DataSource = dal.dropdown_PATIENT_name(bal);
                // drppateintname.DataBind();
                // drppateintname.DataSource = myReader;
                drppateintname.DataTextField = "patient_name";
                drppateintname.DataValueField = "patient_name";
                drppateintname.DataBind();
            }
        }
        protected void btnok_Click(object sender, EventArgs e)
        {
            bal.Fromdate = txtfrom.Text;
            bal.Todate = txtto.Text;
            GridView1.DataSource = dal.fromtodate__PENDINGREPORT(bal);
            GridView1.DataBind();
            drppateintname.DataSource = dal.dropdown_PATIENT_name(bal);
            drppateintname.DataBind();
        }
        protected void txtrefferdby_TextChanged1(object sender, EventArgs e)
        {
            bal.Ref_by = txtrefferdby.Text;
            GridView1.DataSource = dal.REFBY_SEARCH_COMPLLTINGFORM(bal);
            GridView1.DataBind();
        }
        protected void txtcontactno_TextChanged(object sender, EventArgs e)
        {
            bal.Contact_no = txtcontactno.Text;
            GridView1.DataSource = dal.contactno_search_COMPLETED(bal);
            GridView1.DataBind();
        }
        protected void drppateintname_SelectedIndexChanged1(object sender, EventArgs e)
        {
            bal.Patient_name = drppateintname.Text;
            DataTable dt = dal.patient_dropdown_bindTOGRID(bal);
            foreach (DataRow d in dt.Rows)
            {
                opdno.Text = d["lab_no"].ToString();
                txtrefferdby.Text = d["ref_by"].ToString();
                txtcontactno.Text = d["contact_no"].ToString();
            }
            GridView1.DataSource = dal.patient_dropdown_bindTOGRID(bal);
            GridView1.DataBind();
        }
        protected void opdno_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void opdno_TextChanged1(object sender, EventArgs e)
        {
            try
            {

                bal.Lab_no = Convert.ToInt32(opdno.Text);
                GridView1.DataSource = dal.OPD_NUM_SEARCH_COMPELITNG(bal);
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void btnexcel_Click(object sender, EventArgs e)
        {
          Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Vithal" + DateTime.Now + ".xls";
            System.IO.StringWriter strwritter = new System.IO.StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView1.GridLines = GridLines.Both;
            GridView1.HeaderStyle.Font.Bold = true;
            GridView1.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }

        protected void txtfrom_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("companymenulist.aspx");
        }
    }
}