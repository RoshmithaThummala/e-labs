using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace elabs
{
    public class DAL
    {
        BAL bal = new BAL();
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=ELABS;User ID=sa;Password=abc");

        public void insertC(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spinsertc", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("@company_id", bal.Company_id);
            cmd.Parameters.AddWithValue("@company_name", bal.Company_name);
            cmd.Parameters.AddWithValue("@formation_year", bal.Formation_year);
            cmd.Parameters.AddWithValue("@address", bal.Address);
            cmd.Parameters.AddWithValue("@technician_name", bal.Technian_name1);
            cmd.Parameters.AddWithValue("@contact_no", bal.Contact_no);
            cmd.Parameters.AddWithValue("@uid", bal.Uid);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public DataTable baind()
        {
            SqlCommand cmd = new SqlCommand("spcompany", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable login(BAL bal)
        {
            SqlCommand cmd = new SqlCommand("splogin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Uid", bal.Uid);
            cmd.Parameters.AddWithValue("@username", bal.Username);
            cmd.Parameters.AddWithValue("@password", bal.Password);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public int autogenuid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_autogenuid", con);
            cmd.CommandType = CommandType.StoredProcedure;
            bal.Uid= Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            return bal.Uid;
        }
        public void register(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spregister", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", bal.Username);
            cmd.Parameters.AddWithValue("@position", bal.Position);
            cmd.Parameters.AddWithValue("@password", bal.Password);
            cmd.Parameters.AddWithValue("@uid", bal.Uid);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public DataTable Edit(BAL bal)
        {
            SqlCommand cmd = new SqlCommand("spuidedit", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@uid", bal.Uid);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public void upDatecompany_DETAILS(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spedit", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@uid", bal.Uid);
            cmd.Parameters.AddWithValue("@company_name", bal.Company_name);
            cmd.Parameters.AddWithValue("@address", bal.Address);
            cmd.Parameters.AddWithValue("@technician_name", bal.Technian_name1);
            cmd.Parameters.AddWithValue("@contact_no", bal.Contact_no);
            cmd.ExecuteNonQuery();
            con.Close();
        }


        //                TEST GROUP                     //


        public void InsertTestGroup(BAL bal)  //testgroup group_name insert

        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spinserttestgroup", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tgid", bal.Testgroupid);
            cmd.Parameters.AddWithValue("@tgname", bal.Testgroupname);
            //cmd.Parameters.AddWithValue("@tsgname", bal.Testsgname);
            cmd.Parameters.AddWithValue("@cost", bal.Testgroupcost);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void InsertTestSubGroup(BAL bal)  //testgroup subgroup_name insert  
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spinserttestsubgroup", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tgid", bal.Testgroupid);
            cmd.Parameters.AddWithValue("@tsgname", bal.Testgroupname);
            cmd.Parameters.AddWithValue("@cost", bal.Testgroupcost);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void UpdateTestGroup(BAL bal)  //testgroup group_name update
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spupdatetestgroup", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tgid", bal.Testgroupid);
            cmd.Parameters.AddWithValue("@tgname", bal.Testgroupname);
            cmd.Parameters.AddWithValue("@cost", bal.Testgroupcost);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void UpdateTestSubGroup(BAL bal)  //testgroup subgroup_name insert
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spupdatetestsubgroup", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tgid", bal.Testgroupid);
            cmd.Parameters.AddWithValue("@tsgname", bal.Testgroupname);
            cmd.Parameters.AddWithValue("@cost", bal.Testgroupcost);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void DeleteTestGroup(BAL bal)  //testgroup row delete
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spdeletetestgroup", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tgid", bal.Testgroupid);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public DataTable SelectTG()  // Selecting testgroup data at pageload
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spselecttg", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public DataTable SelectTestGroup(BAL bal)  // testgroup/subgroup Search
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spselecttestgroup", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tgname", bal.Testgroupname);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public DataTable IncTG()  //testgroup id 
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("incrementtestgroup", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }


        //                    TEST ENTRY FORM                          //

        public DataTable IncTest()  //test id
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("incrementtest", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public void SelectTestGroupId(BAL bal)  //binding testgroup_id to group in test
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sptestgrpid", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tgname", bal.Testgroupname);
            SqlDataReader da = cmd.ExecuteReader();
            if (da.HasRows)
            {
                while (da.Read())
                {
                    bal.Testgroupid = da["test_group_id"].ToString();
                }
            }

            con.Close();
        }

        public void SelectTestSubGroupId(BAL bal)  //binding testsubgroup_id to group in test
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sptestsubgrpid", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tsgname", bal.Testsubgroupname);
            SqlDataReader da = cmd.ExecuteReader();
            if (da.HasRows)
            {
                while (da.Read())
                {
                    bal.Testsubgroupid = da["test_group_id"].ToString();
                }
            }

            con.Close();
        }

        public void InsertTest(BAL bal)  //insert test data
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sptestinsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tid", bal.Testid);
            cmd.Parameters.AddWithValue("@tname", bal.Testname);
            cmd.Parameters.AddWithValue("@tgid", bal.Testgroupid);
            cmd.Parameters.AddWithValue("@unit", bal.Testunit);
            cmd.Parameters.AddWithValue("@dvalue", bal.Testdvalue);
            cmd.Parameters.AddWithValue("@cost", bal.Testcost);
            cmd.Parameters.AddWithValue("@nrange", bal.Testnrange);
            cmd.Parameters.AddWithValue("@lrange", bal.Testlrange);
            cmd.Parameters.AddWithValue("@urange", bal.Testurange);
            cmd.Parameters.AddWithValue("@notes", bal.Testnotes);
            cmd.Parameters.AddWithValue("@wtest", bal.Testwidal);
            cmd.Parameters.AddWithValue("@tsgid", bal.Testsubgroupid);
            cmd.Parameters.AddWithValue("@comm", bal.Testcomm);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void InsertTestS(BAL bal)  //insert test data exclude subgroup
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sptestinsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tid", bal.Testid);
            cmd.Parameters.AddWithValue("@tname", bal.Testname);
            cmd.Parameters.AddWithValue("@tgid", bal.Testgroupid);
            cmd.Parameters.AddWithValue("@unit", bal.Testunit);
            cmd.Parameters.AddWithValue("@dvalue", bal.Testdvalue);
            cmd.Parameters.AddWithValue("@cost", bal.Testcost);
            cmd.Parameters.AddWithValue("@nrange", bal.Testnrange);
            cmd.Parameters.AddWithValue("@lrange", bal.Testlrange);
            cmd.Parameters.AddWithValue("@urange", bal.Testurange);
            cmd.Parameters.AddWithValue("@notes", bal.Testnotes);
            cmd.Parameters.AddWithValue("@wtest", bal.Testwidal);
            //cmd.Parameters.AddWithValue("@tsgid", bal.Testsubgroupid);
            cmd.Parameters.AddWithValue("@comm", bal.Testcomm);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void UpdateTest(BAL bal)  //update test data
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sptestupdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tid", bal.Testid);
            cmd.Parameters.AddWithValue("@tname", bal.Testname);
            cmd.Parameters.AddWithValue("@tgid", bal.Testgroupid);
            cmd.Parameters.AddWithValue("@unit", bal.Testunit);
            cmd.Parameters.AddWithValue("@dvalue", bal.Testdvalue);
            cmd.Parameters.AddWithValue("@cost", bal.Testcost);
            cmd.Parameters.AddWithValue("@nrange", bal.Testnrange);
            cmd.Parameters.AddWithValue("@lrange", bal.Testlrange);
            cmd.Parameters.AddWithValue("@urange", bal.Testurange);
            cmd.Parameters.AddWithValue("@notes", bal.Testnotes);
            cmd.Parameters.AddWithValue("@wtest", bal.Testwidal);
            cmd.Parameters.AddWithValue("@tsgid", bal.Testsubgroupid);
            con.Close();
        }

        public void DeleteTest(BAL bal)  //delete test data
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sptestdelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tid", bal.Testid);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public DataTable SelectTest(BAL bal)  //select test data based on id
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sptestselect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tid", bal.Testid);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        //                      List Of Tests                     //

        public void InsertLoT(BAL bal)  //Insert LOT data
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spLotInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tid", bal.Testid);
            cmd.Parameters.AddWithValue("@tname", bal.Testname);
            cmd.Parameters.AddWithValue("@gname", bal.Testgroupname);
            cmd.Parameters.AddWithValue("@unit", bal.Testunit);
            cmd.Parameters.AddWithValue("@nrange", bal.Testnrange);
            cmd.Parameters.AddWithValue("@cost", bal.Testcost);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void UpdateLoT(BAL bal)  //Update LOT data
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spLotUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tid", bal.Testid);
            cmd.Parameters.AddWithValue("@tname", bal.Testname);
            cmd.Parameters.AddWithValue("@gname", bal.Testgroupname);
            cmd.Parameters.AddWithValue("@unit", bal.Testunit);
            cmd.Parameters.AddWithValue("@nrange", bal.Testnrange);
            cmd.Parameters.AddWithValue("@cost", bal.Testcost);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void DeleteLoT(BAL bal)  //Delete LOT Data
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spLotDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tid", bal.Testid);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public DataTable SelectLoT()  //getting LOT data 
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spLotSelectAll", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public DataTable SelectTest()  // Binding Test data
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spbindtest", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public DataTable SearchLottname(BAL bal)  // Name search in LOT
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spLoTtnamesearch", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name", bal.Testgroupname);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public DataTable SearchLotcost(BAL bal)  //Cost search in LOT
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spLoTCostSearch", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("@sno", bal.Testgroupname);
            cmd.Parameters.AddWithValue("@cost", bal.Testcost);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public DataTable SearchLotboth(BAL bal)  //Name & Cost search in LOT
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spLoTSearch", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@sno", bal.Testgroupname);
            cmd.Parameters.AddWithValue("@cost", bal.Testcost);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }


        //                     TEST FORMULA                    //

        public DataTable SelectTestFormula()  //Binding TestFormula at Pageload
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spSelectTestFormula", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public void DeleteTestFormula(BAL bal)  //Delete TestFormula
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spDeleteTestFormula", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@testname", bal.Testname);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void InsertTestFormula(BAL bal)   //Insert TestFormula
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spInsertTestFormula", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tgid", bal.Testgroupid);
            cmd.Parameters.AddWithValue("@formula", bal.Formula);
            cmd.Parameters.AddWithValue("@tname", bal.Testname);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        //public DataTable groupdrop()  
        //{
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("droupdrop", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    DataTable dt = new DataTable();
        //    da.Fill(dt);
        //    con.Close();
        //    return dt;
        //}

        public DataTable selectgname(BAL bal)  // Getting testgroupid in test based on the row selected in LOT
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("tgname", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", bal.Testgroupid);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public DataTable selectsgname(BAL bal)  // Getting testsubgroupid in test based on the row selected in LOT
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("tsgname", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", bal.Testgroupid);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }


        ////////////////////////////DOCTORS////////////////////////////////////////

        ////////////////////////////////////////////

        public int maxdocid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_docmaxid", con);
            cmd.CommandType = CommandType.StoredProcedure;
            int docid = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            return docid;
        }

        public void doctorinsert(BAL bal)
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("doctorinsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
          //  cmd.Parameters.AddWithValue("@doctorid", bal.doctorrefnumber);
            cmd.Parameters.AddWithValue("@doctorname", bal.doctorname);
            cmd.Parameters.AddWithValue("@emailid", bal.email);
            cmd.Parameters.AddWithValue("@contactnumber", bal.contactnumber);
            cmd.Parameters.AddWithValue("@testlistid", bal.testlistids);
            cmd.Parameters.AddWithValue("@numoftests", bal.numberoftests);
            cmd.Parameters.AddWithValue("@totalcost", bal.TotalCost);
            cmd.Parameters.AddWithValue("@totalcommission", bal.totalcommission);
            cmd.ExecuteNonQuery();
            con.Close();
        }


        public DataTable showtest(BAL bal)
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("showtest", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;

        }

        public DataTable testlistid(BAL bal)
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("testlistid", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@doctorname", bal.doctorname);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;

        }
        public DataTable totalcost(BAL bal)
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("totalcost", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@doctorname", bal.doctorname);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;

        }

        public void testlistidval(BAL bal)
        {
            int a;
            SqlCommand cmd = new SqlCommand("testlistidval", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                string val = dr[0].ToString();
                if (val == "")
                {
                    bal.testlistids = "1";
                }
                else
                {
                    a = Convert.ToInt32(dr[0].ToString());
                    a = a + 1;
                    bal.testlistids = a.ToString();
                }
            }
            con.Close();

        }

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        public DataTable getaddressbook(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("getaddressbook", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable accountnamesearch(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("accountnamesearch", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@accountname", bal.accountname);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public DataTable groupnamesearch(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("groupnamesearch", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@accountname", bal.accountname);
            cmd.Parameters.AddWithValue("@groupname", bal.groupname);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable mobilesearch(BAL bal)
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("mobilesearch", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@accountname", bal.accountname);
            cmd.Parameters.AddWithValue("@groupname", bal.groupname);
            cmd.Parameters.AddWithValue("@mobile_no", bal.mobile);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        //public DataTable groupnamesearch(BAL bal)
        //{
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("groupnamesearch", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@groupname", bal.groupname);
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    DataTable dt = new DataTable();
        //    da.Fill(dt);
        //    con.Close();
        //    return dt;
        //}
        //public DataTable mobilesearch(BAL bal)
        //{

        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("mobilesearch", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@mobile_no", bal.mobile);
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    DataTable dt = new DataTable();
        //    da.Fill(dt);
        //    con.Close();
        //    return dt;
        //}

        public DataTable selectaccountid(BAL bal)
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("selectaccountid", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@accountid", bal.accountid);

            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //da.Fill(dt);
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    bal.accountid = Convert.ToInt32(dr["account_id"].ToString());
                    bal.accountname = dr["account_name"].ToString();
                    bal.accountgroupname = dr["account_group_id"].ToString();
                    bal.openingbalance = dr["opening_balance"].ToString();
                    bal.Address = dr["address"].ToString();
                    bal.city = dr["city"].ToString();
                    bal.mobile = dr["mobile_no"].ToString();
                    bal.debitcredit = dr["Debit_Credit"].ToString();
                }
            }

            con.Close();
            return dt;
        }

        /// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        public DataTable accountgroupid(BAL bal)
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("accountgroupid", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public void accountinsert(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("accountinsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@accountname", bal.accountname);
            cmd.Parameters.AddWithValue("@accountgroupid", bal.groupname);
            cmd.Parameters.AddWithValue("@openingbalance", bal.openingbalance);
            cmd.Parameters.AddWithValue("@credit", bal.credit);
            cmd.Parameters.AddWithValue("@debit", bal.debit);
            cmd.Parameters.AddWithValue("@address", bal.Address);
            cmd.Parameters.AddWithValue("@city", bal.city);
            cmd.Parameters.AddWithValue("@mobile", bal.mobile);
            cmd.Parameters.AddWithValue("@debitcredit", bal.debitcredit);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void accountupdate(BAL bal)
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("accountupdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("@accountid", bal.accountid);
            cmd.Parameters.AddWithValue("@accountname", bal.accountname);
            cmd.Parameters.AddWithValue("@accountgroupid", bal.groupname);
            cmd.Parameters.AddWithValue("@openingbalance", bal.openingbalance);
            cmd.Parameters.AddWithValue("@credit", bal.credit);
            cmd.Parameters.AddWithValue("@debit", bal.debit);
            cmd.Parameters.AddWithValue("@address", bal.Address);
            cmd.Parameters.AddWithValue("@city", bal.city);
            cmd.Parameters.AddWithValue("@mobile", bal.mobile);
            cmd.Parameters.AddWithValue("@debitcredit", bal.debitcredit);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void accountdelete(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("accountdelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@accountname", bal.accountname);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        ///////////////////////////////////////////////////////////////////////////////////////////////

        public void groupinsert(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("groupinsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@accgroupname", bal.accountgroupname);
            cmd.Parameters.AddWithValue("@accsubgroup", bal.acsubgroupname);
            cmd.ExecuteNonQuery();
            con.Close();
        }


        public DataTable showaccountgroup(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("showaccountgroup", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@accgroupname", bal.accountgroupname);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            con.Close();
            return dt;
        }

        public DataTable selectaccountgroup(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("selectaccountgroup", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@accountgroupid", bal.accountid);
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    bal.accountgroupid = dr["account_group_id"].ToString();
                    bal.accountgroupname = dr["acc_groupname"].ToString();
                    bal.acsubgroupname = dr["acc_subgroup"].ToString();
                }
            }
            con.Close();
            return dt;
        }

        public void delaccountgroup(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("delaccountgroup", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@acgrpid", bal.accountgroupid);

            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void updateaccountgroup(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("updateaccountgroup", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@acgrpid", bal.accountgroupid);
            cmd.Parameters.AddWithValue("@accgrpname", bal.accountgroupname);
            cmd.Parameters.AddWithValue("@accsubgrp", bal.acsubgroupname);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        ///////////////////////////////D////////////////////////////////////////

        public void insertpatient(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insertpatient", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@present_date", bal.Present_date);
            cmd.Parameters.AddWithValue("@lab_no", bal.Lab_no);
            cmd.Parameters.AddWithValue("@title", bal.Title);
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            cmd.Parameters.AddWithValue("@age", bal.Age);
            cmd.Parameters.AddWithValue("@gender", bal.Gender);
            cmd.Parameters.AddWithValue("@ref_by", bal.Ref_by);
            cmd.Parameters.AddWithValue("@ref_no", bal.Ref_no);
            cmd.Parameters.AddWithValue("@account_id", bal.Account_id);
            cmd.Parameters.AddWithValue("@address", bal.Address);
            cmd.Parameters.AddWithValue("@villagecity", bal.Villagecity);
            cmd.Parameters.AddWithValue("@contact_no", bal.Contact_no);
            cmd.Parameters.AddWithValue("@email_id", bal.Email_id);
            cmd.Parameters.AddWithValue("@sample_date", bal.Sample_date);
            cmd.Parameters.AddWithValue("@sample_time", bal.Sample_time);
            cmd.Parameters.AddWithValue("@reporting_date", bal.Reporting_date);
            cmd.Parameters.AddWithValue("@reporting_time", bal.Reporting_time);
            cmd.Parameters.AddWithValue("@category", bal.Category);
            cmd.Parameters.AddWithValue("@department", bal.Department);
            cmd.Parameters.AddWithValue("@remarks", bal.Remarks);
            cmd.Parameters.AddWithValue("@totalcost", bal.Totalcost);
            cmd.Parameters.AddWithValue("@discount", bal.Discount);
            cmd.Parameters.AddWithValue("@advance", bal.Advance);
            cmd.Parameters.AddWithValue("@netbalance", bal.Netbalance);
            cmd.Parameters.AddWithValue("@nooftests", bal.Nooftests);
            cmd.Parameters.AddWithValue("@patient_id", bal.Patient_id);
            cmd.Parameters.AddWithValue("@testListId", bal.Testlistid);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void insertpatienttestlist(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insertpatienttestlist", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@testlist_id", bal.Testlistid);
            cmd.Parameters.AddWithValue("@patient_id", bal.Patient_id);
            cmd.Parameters.AddWithValue("@test_id", bal.Test_id);
            cmd.Parameters.AddWithValue("@test_group_id", bal.Test_group_id);
            cmd.Parameters.AddWithValue("@cost", bal.Cost);
            cmd.Parameters.AddWithValue("@result", DBNull.Value);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void updatepatient(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("updatepatient", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            cmd.Parameters.AddWithValue("present_date", bal.Present_date);
            cmd.Parameters.AddWithValue("@title", bal.Title);
            cmd.Parameters.AddWithValue("@age", bal.Age);
            cmd.Parameters.AddWithValue("@gender", bal.Gender);
            cmd.Parameters.AddWithValue("@ref_by", bal.Ref_by);
            cmd.Parameters.AddWithValue("@ref_no", bal.Ref_no);
            cmd.Parameters.AddWithValue("@account_id", bal.Account_id);
            cmd.Parameters.AddWithValue("@address", bal.Address);
            cmd.Parameters.AddWithValue("@villagecity", bal.Villagecity);
            cmd.Parameters.AddWithValue("@contact_no", bal.Contact_no);
            cmd.Parameters.AddWithValue("@email_id", bal.Email_id);
            cmd.Parameters.AddWithValue("@sample_date", bal.Sample_date);
            cmd.Parameters.AddWithValue("@sample_time", bal.Sample_time);
            cmd.Parameters.AddWithValue("@reporting_date", bal.Reporting_date);
            cmd.Parameters.AddWithValue("@reporting_time", bal.Reporting_time);
            cmd.Parameters.AddWithValue("@category", bal.Category);
            cmd.Parameters.AddWithValue("@department", bal.Department);
            cmd.Parameters.AddWithValue("@remarks", bal.Remarks);
            cmd.Parameters.AddWithValue("@totalcost", bal.Totalcost);
            cmd.Parameters.AddWithValue("@discount", bal.Discount);
            cmd.Parameters.AddWithValue("@advance", bal.Advance);
            cmd.Parameters.AddWithValue("@netbalance", bal.Netbalance);
            cmd.Parameters.AddWithValue("@nooftests", bal.Nooftests);
            cmd.Parameters.AddWithValue("@testListId", bal.Testlistid);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void updatepatienttest(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("updatepatienttest", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            cmd.Parameters.AddWithValue("@testlist_id", bal.Testlistid);
            cmd.Parameters.AddWithValue("@patient_id", bal.Patient_id);
            cmd.Parameters.AddWithValue("@test_id", bal.Test_id);
            cmd.Parameters.AddWithValue("@test_group_id", bal.Test_group_id);
            cmd.Parameters.AddWithValue("@cost", bal.Cost);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public DataTable selectdoctor()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("selectdoctor", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable selectdoctortest(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("selectdoctortest", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@doctor_name", bal.Doctor_name);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable selectaccount()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("selectaccount", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable selecttestgroupid(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("selecttestgroupid", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@cost", bal.Cost);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable selectrefno(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("selectrefno", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@doctor_name", bal.Doctor_name);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable incrementpatientid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("incrementpatientid", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable selectpatient(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("selectpatient", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            //cmd.Parameters.AddWithValue("@contact_no", bal.Contact_no);
            //cmd.Parameters.AddWithValue("@address", bal.Address);
            //cmd.Parameters.AddWithValue("@city", bal.Villagecity);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable selectpatient1(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("selectpatient1", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable selectpatientphone(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("selectpatientphone", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@contact_no", bal.Contact_no);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable selectpatientaddress(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("selectpatientaddress", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@address", bal.Address);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable selectpatientcity(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("selectpatientcity", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@city", bal.Villagecity);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable searchpatienttestlist(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("searchpatienttestlist", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable selectpatient_name(BAL bal)
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("selectpatient_name", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@date1", bal.Fromdate);
            cmd.Parameters.AddWithValue("@date2", bal.Todate);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable pendingreports(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("pendingreports", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@date1", bal.Fromdate);
            cmd.Parameters.AddWithValue("@date2", bal.Todate);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable pendingreport(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("pendingreport", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable selectpending(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("selectpending", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable completedreports(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("completedreports", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@date1", bal.Fromdate);
            cmd.Parameters.AddWithValue("@date2", bal.Todate);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable completedreport(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("completedreport", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable selectpatientname(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("selectpatientname", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@date1", bal.Fromdate);
            cmd.Parameters.AddWithValue("@date2", bal.Todate);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable selectcompleted(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("selectcompleted", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public void updatepatienttestlist(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("updatepatienttestlist", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@result", bal.Result);
            cmd.Parameters.AddWithValue("@patient_id", bal.Patient_id);
            cmd.Parameters.AddWithValue("@test_name", bal.Test_name);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void updatepatienttestli(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("updatepatienttestli", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@result", bal.Result);
            cmd.Parameters.AddWithValue("@patient_id", bal.Patient_id);
            cmd.Parameters.AddWithValue("@test_name", bal.Test_name);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void deletepatient(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("deletepatient", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void deletepatienttestlist(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("deletepatienttestlist", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        ///////////////////////////////V////////////////////////////////////////

        public DataTable selectpaymentdate(BAL bal)
        {

            SqlCommand cmd = new SqlCommand("patientname", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@payment_date", bal.Payment_date);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public DataTable selectspname(BAL bal)
        {
            SqlCommand cmd = new SqlCommand("spname", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable selectreceipt(BAL bal)
        {

            SqlCommand cmd = new SqlCommand("recipetname", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@payment_date", bal.Payment_date);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable selectrecipetname(BAL bal)
        {
            SqlCommand cmd = new SqlCommand("recipetname2", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public void payinsert(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spinsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@patient_id", bal.Patient_id);
            cmd.Parameters.AddWithValue("@voucher_no", bal.Voucher_no);
            cmd.Parameters.AddWithValue("@payment_date", bal.Payment_date);
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            cmd.Parameters.AddWithValue("@account_name", bal.Account_name);
            cmd.Parameters.AddWithValue("@amountpayed", bal.Amountpayed);
            cmd.Parameters.AddWithValue("@payment_mode", bal.Payment_mode);
            cmd.Parameters.AddWithValue("@totalcost", bal.TotalCost);
            cmd.Parameters.AddWithValue("@netbalance", bal.Netbalance);
            cmd.Parameters.AddWithValue("@discount", bal.Discount);
            cmd.ExecuteNonQuery();
            con.Close();

        }
        public DataTable payupdate(BAL bal)
        {
            SqlCommand cmd = new SqlCommand("spupdatev", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            cmd.Parameters.AddWithValue("@payment_mode", bal.Payment_mode);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable paydelete(BAL bal)
        {
            SqlCommand cmd = new SqlCommand("spdeletev", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }


        //////////////////////////////              REPORTS        ////////////////////////////////////
        public DataTable transactionRegister(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("transactionRegister", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@date1", bal.FromC);
            cmd.Parameters.AddWithValue("@date2", bal.ToC);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //SqlParameter prm = new SqlParameter("@date1", bal.FromC);
            //prm.Direction = ParameterDirection.Input;
            //cmd.Parameters.Add(prm);
            //SqlParameter prm1 = new SqlParameter("@date2", bal.ToC);
            //prm1.Direction = ParameterDirection.Input;
            //cmd.Parameters.Add(prm1);
            //DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        //*************************search based on patient name************************
        public DataTable ddlSearchName(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("ddlSearchName", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            SqlParameter prm = new SqlParameter("@patient_name", bal.Patientname);
            prm.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(prm);

            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        //*************************search based on testname************************
        public DataTable ddlSearchTest(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("ddlSearchTest", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            SqlParameter prm = new SqlParameter("@testname", bal.Testname);
            prm.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(prm);

            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        //*************************search based on address ************************
        public DataTable ddlSearchAddress(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("ddlSearchAddress", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            SqlParameter prm = new SqlParameter("@address", bal.Address);
            prm.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(prm);

            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        //*************************search based on villageCity ************************
        public DataTable ddlSearchVillagecity(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("ddlSearchVillagecity", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            SqlParameter prm = new SqlParameter("@villagecity", bal.Vilgcity);
            prm.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(prm);

            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }


        //*********************************commission report % wise***************************************************
        //*********************search based on from and to date**************************
        public DataTable commissionPerct(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("commissionPerct", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            SqlParameter prm = new SqlParameter("@from", bal.FromCP);
            prm.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(prm);
            SqlParameter prm1 = new SqlParameter("@to", bal.ToCP);
            prm1.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(prm1);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        //*************************************search based on from,to,doctor name***************
        public DataTable commissionPerDoctName(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("commissionPerDoctName", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            SqlParameter prm = new SqlParameter("@from", bal.FromCP);
            prm.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(prm);

            SqlParameter prm1 = new SqlParameter("@to", bal.ToCP);
            prm1.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(prm1);

            SqlParameter prm2 = new SqlParameter("@doctorName", bal.DoctName);
            prm2.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(prm2);

            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        //********************************commission report test wise*****************************
        //**************************search based on from and to date********************
        public DataTable commissionTestWise(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("commissionTestWise", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            SqlParameter prm = new SqlParameter("@from2", bal.FromCT);
            prm.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(prm);
            SqlParameter prm1 = new SqlParameter("@to2", bal.ToCT);
            prm1.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(prm1);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        //*************************************search based on from,to,doctor name***************
        public DataTable commissionTestDoctor(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("commissionTestDoctor", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            SqlParameter prm = new SqlParameter("@from2", bal.FromCT);
            prm.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(prm);
            SqlParameter prm1 = new SqlParameter("@to2", bal.ToCT);
            prm1.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(prm1);
            SqlParameter prm2 = new SqlParameter("@doctorname", bal.DoctNameCT);
            prm2.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(prm2);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }


        /////////////////////////////////////////////////////////////////////////

        public DataTable fromtodate__PENDINGREPORT(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("pendingfromtoDATE", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fromdate", bal.Fromdate);
            cmd.Parameters.AddWithValue("@todate", bal.Todate);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        //BIND THE PATIENT NAMES TO THE DROPDOWN--PATIENT
        public DataTable dropdown_PATIENT_name(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("dropdowenPATIENTNAME", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        //SEARCH DATA  BY  TXTOPD TEXTCHANGED IN PENDING REPORTS
        public DataTable opdno_seacrh_txtchanged(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("OPDNOsearch", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@lab_no", bal.Lab_no);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        //SEACRH THE DATA BY TXT-REFFERD TEXT CHANGED TO  BIND THE GRID IN PENDING REPORTS
        public DataTable REFERD_SEARCH(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("refBYserch", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ref_by", bal.Ref_by);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        //SEARCH THE DATA BY TXT--CONTACT NO TEXT CHANGED IN COMPLETING REPORTS
        public DataTable contactnu_serch(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("contactbysearch", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@contact_no", bal.Contact_no);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        //SEARCGH THE DATA BY TXT--REFFERD TEXT CHANGED TO BIND THE DATA TO GRID IN PENDING REPORTS
        public DataTable REFBY_SEARCH_COMPLLTINGFORM(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("REFBY_COMPLTINGTBL", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ref_by", bal.Ref_by);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        //SEARCH THE DATA BY TXT--CONTACT NO TEXT CHANGED IN COMPLETING REPORTS
        public DataTable contactno_search_COMPLETED(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("contact_search_COMPLTIED", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@contact_no", bal.Contact_no);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        //SEARCH THE DATA IN DAILY--REPORTS BY FROM DATE to TO--DATE BIND THE DATA TO FISRT TABLE
        public DataTable fromto_DAILY_LIST(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("DILY_LIST", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fromdate", bal.Fromdate);
            cmd.Parameters.AddWithValue("@todate", bal.Todate);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        //SEARCH THE DATA IN DAILY--REPORTS BY FROM DATE to TO--DATE  BIND THE DATA TO SECOND TABLE
        public DataTable DAILY_LIST_SECNDtbl(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("DAILY_LIST_SECONDTABLE", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fromdate", bal.Fromdate);
            cmd.Parameters.AddWithValue("@todate", bal.Todate);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        //SEARCH THE DATA BY DROP-DOWN-SELECTED CHANGED INDEX
        public DataTable patient_dropdown_bindTOGRID(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("patientDROPDOEWNbindTOgrid", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        //SEARCH THE DATA BY TXTOPD TEXT CHANGED IN COMPLETING REPORTS
        public DataTable OPD_NUM_SEARCH_COMPELITNG(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("OPDNOsearch_COMPELETINGTBL", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@lab_no", bal.Lab_no);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        //DISPLAY THE TOTAL COMMISSION VALUE IN TEXT BOX FROM GRIDVIEW TOTAL COMMISSION COLUMN 
        public DataTable totalcommisionOFDAIL_LIST_textboxcommission(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("totalcommisionOFDAIL_LIST", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fromdate", bal.Fromdate);
            cmd.Parameters.AddWithValue("@todate", bal.Todate);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        //DISPLAY THE BALANCE AND TOTAL COLLECTION VALUES IN RESCPECTIVE TEXT BOXES FROM GRIDVIEW BALANCE AND TOTAL COLLECTIONC COLUMNS
        public DataTable DAILYLIST_PENDING_TOTAL_textbox(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("DAILYLIST_PENDING_TOTAL", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fromdate", bal.Fromdate);
            cmd.Parameters.AddWithValue("@todate", bal.Todate);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }


        ////////////////////////////////////////////////////////////su

        public DataTable select()
        {
            SqlCommand cmd = new SqlCommand("spselecttable", con);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public DataTable selectdate(BAL bal)
        {
            SqlCommand cmd = new SqlCommand("spdates", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@date1", bal.Date1);
            cmd.Parameters.AddWithValue("@date2", bal.Date2);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public DataTable selectaccount(BAL bal)
        {
            SqlCommand cmd = new SqlCommand("spaccount", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@date1", bal.Date1);
            cmd.Parameters.AddWithValue("@date2", bal.Date2);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public void insert(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spreport", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@report_id", bal.Report_id);
            cmd.Parameters.AddWithValue("@Template_name", bal.Template_name1);
            cmd.Parameters.AddWithValue("@ApplyOn", bal.ApplyOn1);
            cmd.Parameters.AddWithValue("@Location", bal.Location1);
            cmd.ExecuteNonQuery();
            con.Close();

        }
        public DataTable selectbind()
        {
            SqlDataAdapter da = new SqlDataAdapter("spbind", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public void update(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spupdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Template_name", bal.Template_name1);
            cmd.Parameters.AddWithValue("@ApplyOn", bal.ApplyOn1);
            cmd.Parameters.AddWithValue("@Location", bal.Location1);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void delete(BAL bal)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spdelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Template_name", bal.Template_name1);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public DataTable search(BAL bal)
        {
            SqlCommand cmd = new SqlCommand("spsearch", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Template_name", bal.Template_name1);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable selectsearch(BAL bal)
        {
            SqlCommand cmd = new SqlCommand("sppatientsrch", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@patient_name", bal.Patient_name);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        ////////////////////////////////////////////G
        public DataTable timewise(BAL bal)
        {
            SqlCommand cmd = new SqlCommand("sp_testwise", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fdate", bal.Fromdate);
            cmd.Parameters.AddWithValue("@todate", bal.Todate);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public DataTable doctorwise(BAL bal)
        {
            SqlCommand cmd = new SqlCommand("sp_doctorwise", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fromdate", bal.Fromdate);
            cmd.Parameters.AddWithValue("@todate", bal.Todate);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable datewise(BAL bal)
        {
            SqlCommand cmd = new SqlCommand("sp_datewise", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fromdate", bal.Fromdate);
            cmd.Parameters.AddWithValue("@todate", bal.Todate);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable HomeTestwise(BAL bal)
        {
            SqlCommand cmd = new SqlCommand("sp_hometestwise", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fdate", bal.Fromdate);
            cmd.Parameters.AddWithValue("@todate", bal.Todate);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable Homedoctorwise(BAL bal)
        {
            SqlCommand cmd = new SqlCommand("sp_homedoctorwise", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fromdate", bal.Fromdate);
            cmd.Parameters.AddWithValue("@todate", bal.Todate);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable details(BAL bal)
        {
            SqlCommand cmd = new SqlCommand("sp_details", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fromdate", bal.Fromdate);
            cmd.Parameters.AddWithValue("@todate", bal.Todate);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
    }
}