<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="patiententry.aspx.cs" Inherits="Elabs_Project.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
            $(document).ready(function () {

                $('[id*="txtdate"]').datepicker({
                    dateFormat: 'yy-mm-dd'
                });
            });

            function popup() {
                $(document).ready(function () {
                    $("#myModal").modal("show");

                });
                return false;
            }

    </script>

    <script type="text/javascript">
        $('[id*=btnse]').live("click", function () {
            $("#dialog").dialog({
                title: "Patient Search",

                width: 1250,
                resizable: false,
                modal: true
            });
            return false;
        });

        function pop() {
            $("#dialog").dialog({
                title: "Patient Search",
                resizable: false,
                width: 1250
            });
        }
    </script>
    <script type="text/javascript">
        function update() {
            $("#div1").dialog({
                title: "Patient Entry",
                width: 400,
                resizable: false,
                buttons: {
                    Close: function () {
                        $(this).dialog('close');
                    }
                }
            });
        }
        function del() {
            $("#div2").dialog({
                title: "Patient Entry",
                width: 400,
                resizable: false,
                buttons: {
                    Close: function () {
                        $(this).dialog('close');
                    }
                }
            });
        }
</script>

<style type="text/css">
.modal-dialog {
          width: 980px; /* New width for default modal */
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
                    <div class="container-fluid">
                <div class="row">
                    <div class="select-top">
                        PATIENT ENTRY
                    </div>
                </div>

                <div class="row pad_form15">
                  <div class="col-sm-12 cl12">
                    <div class="col-sm-2 cl2">
                      <div class="form-group text-center">
                          <label>Date</label>
                       <asp:TextBox ID="txtdate" runat="server" CssClass="form-control" ></asp:TextBox>

                          <%--<input type="date" class="form-control">--%>
                      </div>
                    </div>
                    <div class="col-sm-1 cl1">
                      <div class="form-group text-center">
                          <label>Lab No</label>
                                    <asp:TextBox ID="txtlabno" runat="server" CssClass="form-control" ></asp:TextBox>

                          <%--<input type="text" class="form-control">--%>
                      </div>
                    </div>
                    <div class="col-sm-1 cl1">
                      <div class="form-group text-center">
                          <label>Title</label>
                          <!-- <input type="text" class="form-control"> -->
                          <asp:DropDownList ID="drptitle" runat="server"></asp:DropDownList>
                          <%--<select class="form-control">
                            <option>1</option>
                          </select>--%>
                      </div>
                    </div>
                    <div class="col-sm-2 cl2">
                      <div class="form-group text-center">
                          <label>Patient Name</label>
                        <asp:TextBox ID="txtpatientname" runat="server" CssClass="form-control" ></asp:TextBox>

                          <%--<input type="text" class="form-control">--%>
                      </div>
                    </div>
                    <div class="col-sm-1 cl1">
                      <div class="form-group text-center">
                          <label>Age</label>
                    <asp:TextBox ID="txtage" runat="server" CssClass="form-control" ></asp:TextBox>

                          <%--<input type="text" class="form-control">--%>
                      </div>
                    </div>
                    <div class="col-sm-1 cl1">
                      <div class="form-group text-center">
                          <label>Gender</label>
                          <asp:DropDownList ID="drpgender" runat="server"></asp:DropDownList>
                          <%--<select class="form-control">
                            <option>Male</option>
                            <option>Male</option>
                          </select>--%>
                      </div>
                    </div>
                    <div class="col-sm-2 cl2">
                      <div class="form-group text-center">
                          <label class="">Ref By.</label>
                          <asp:DropDownList ID="drprefby" runat="server" 
                              onselectedindexchanged="drprefby_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                          <%--<select class="form-control">
                            <option>1</option>
                          </select>--%>
                      </div>
                    </div>
                    <div class="col-sm-1 cl1">
                      <div class="form-group">
                          <asp:Button ID="btnplus" runat="server" Text="+" 
                              CssClass="btn btn-primary br_mar" onclick="btnplus_Click" />
                        <%--<button class="btn btn-primary br_mar">+</button>--%>
                      </div>
                    </div>
                    <div class="col-sm-1 cl1">
                      <div class="form-group">
                     <asp:Button ID="btnnew" runat="server" Text="New" CssClass="btn btn-primary br_mar" 
                              onclick="btnnew_Click" />
                        <%--<button class="btn btn-primary br_mar">New</button>--%>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row top-but-pad-14">
                  <div class="col-sm-12">
                    <div class="col-sm-6 text-left">
                      <div class="form-group">
                        <label>No. of Tests:</label><asp:Label ID="lblnoof" runat="server" Text=""></asp:Label><span></span>
                      </div>
                    </div>
                    <div class="col-sm-6 text-right">
                      <div class="form-group">
                        <label>Press (F1) to Search</label><span>0</span>
                      </div>
                    </div>
                  </div>
                </div> 

                <div class="row">
                    <div class="form-grid col_form">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" Width="1014px" 
                                CssClass="table table-bordered table-striped-column" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                                GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                <asp:TemplateField HeaderText="Checkone">
                                 <ItemTemplate>
                                       <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                 </ItemTemplate>
                                </asp:TemplateField>
                                    <asp:BoundField DataField="test_id" HeaderText="Test Id" 
                                        SortExpression="test_id" />
                                    <asp:BoundField DataField="test_name" HeaderText="Test Name" 
                                        SortExpression="test_name" />
                                    <asp:BoundField DataField="cost" HeaderText="Cost" SortExpression="cost" />
                                    <asp:BoundField DataField="test_group_id" HeaderText="Test Group Id" 
                                        SortExpression="test_group_id" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <%--<table class="table table-bordered table-striped-column">
                              <thead>
                                <tr>
                                      <th>Check One</th>
                                      <th>Test Id</th>
                                      <th>Name of Test</th>
                                      <th>Cost</th>
                                </tr>
                              </thead>
                              <tbody>
                                  <tr>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                  </tr>                              
                              </tbody>
                            </table>--%>
                        </div>
                    </div>
                </div>

                <div class="row form-horizontal">
                    <div class="pad_form11">
                      <div class="col-sm-3">
                        <div class="form-group">
                            <label class="control-label">Total Cost</label>
                            <div class="in_pad">
                      <asp:TextBox ID="txttotalcost" runat="server" CssClass="form-control" ></asp:TextBox>

                              <%--<input type="text" class="form-control">--%>
                            </div>
                        </div>                        
                      </div>
                      <div class="col-sm-3">
                        <div class="form-group">
                            <label class="control-label">Discount (If Any)</label>
                            <div class="in_pad">
                         <asp:TextBox ID="txtdiscount" runat="server" CssClass="form-control" 
                                    ontextchanged="txtdiscount_TextChanged" AutoPostBack="true" ></asp:TextBox>

                              <%--<input type="text" class="form-control">--%>
                            </div>
                        </div>                       
                      </div>
                      <div class="col-sm-3">
                        <div class="form-group">
                            <label class="control-label">Advance (If Any)</label>
                            <div class="in_pad">
                     <asp:TextBox ID="txtadvance" runat="server" CssClass="form-control" 
                                    ontextchanged="txtadvance_TextChanged" AutoPostBack="true" ></asp:TextBox>

                              <%--<input type="text" class="form-control">--%>
                            </div>
                        </div>                       
                      </div>
                      <div class="col-sm-3">
                        <div class="form-group">
                            <label class="control-label">Net Balance</label>
                            <div class="in_pad">
                       <asp:TextBox ID="txtnetbalance" runat="server" CssClass="form-control" ></asp:TextBox>

                              <%--<input type="text" class="form-control">--%>
                            </div>
                        </div>                   
                      </div>
                    </div>
                </div> 

                <div class="row pad_but">
                  <div class="form-horizontal">
                    <div class="form-group col-sm-12">
                      <div class="col-sm-5">
                        <button class="btn btn-primary">&#10094;&#10094;</button>
                        <button class="btn btn-primary">&#10094;</button>
                        <button class="btn btn-primary">&#10095;</button>
                        <button class="btn btn-primary">&#10095;&#10095;</button>
                      </div> 
                      <div class="col-sm-7">
                            <asp:Button ID="btndelete" runat="server" Text="Delete" 
                                CssClass="btn btn-primary" onclick="btndelete_Click" />
                                <%--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Search</button>--%>
                          <asp:Button ID="btnsearch" runat="server" Text="Search" 
                                CssClass="btn btn-primary" OnClientClick="return popup();" 
                                onclick="btnsearch_Click"/>
                            <asp:Button ID="btnupdate" runat="server" Text="Update" 
                                CssClass="btn btn-primary" onclick="btnupdate_Click" />
                      <%--  <button class="btn btn-primary">Delete</button>
                        <button class="btn btn-primary">Search</button>
                        <button class="btn btn-primary">Update</button>--%>
                      </div>

                    </div>
                  </div>
                </div>  



<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Saerch Patients</h4>
      </div>
      <div class="modal-body">
        
    <div>
    <label> Name</label>
      <asp:TextBox ID="txtname" runat="server" AutoPostBack="true" ontextchanged="txtname_TextChanged" ></asp:TextBox>
  
  <label>Phone No</label> <asp:TextBox ID="txtphone" runat="server" AutoPostBack="true" OnTextChanged="txtphone_TextChanged"></asp:TextBox>

  <label>Address</label> <asp:TextBox ID="txtaddress" runat="server" AutoPostBack="true" OnTextChanged="txtaddress_TextChanged"></asp:TextBox>

   <label>City</label> <asp:TextBox ID="txtcity" runat="server" AutoPostBack="true" OnTextChanged="txtcity_TextChanged"></asp:TextBox>

            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" CssClass="table table-bordered table-striped-column" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                <asp:TemplateField HeaderText="Select">
                <ItemTemplate>
                <asp:CheckBox ID="chkselect" runat="server" AutoPostBack="true" OnCheckedChanged="chkselect_CheckedChanged" />
                </ItemTemplate>
                </asp:TemplateField>
                    <asp:TemplateField HeaderText="Lab No" SortExpression="lab_no">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("lab_no") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("lab_no") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Patient Id" SortExpression="patient_id">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("patient_id") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("patient_id") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Patient Name" SortExpression="patient_name">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("patient_name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("patient_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender" SortExpression="gender">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("gender") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Age" SortExpression="age">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("age") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("age") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ref By" SortExpression="ref_by">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("ref_by") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ref_by") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact No" SortExpression="contact_no">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("contact_no") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("contact_no") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email Id" SortExpression="email_id">
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("email_id") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("email_id") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sample Date" SortExpression="sample_date">
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("sample_date") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("sample_date") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Department" SortExpression="department">
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("department") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("department") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            
            </asp:GridView>

</div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" class="btn btn-info">Close</button>
      </div>
    </div>

  </div>
</div>





          <div id="div1" style="display:none;">
          <p>Data Updated Successfully</p>
          </div>
           <div id="div2" style="display:none;">
          <p>Data Deleted Successfully</p>
          </div>
            </div><!--container-fluid End-->
         
    </div>
</asp:Content>
