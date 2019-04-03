<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="testgroup.aspx.cs" Inherits="elabs.Testg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/Javascript" language="javascript">

    $(document).ready(function () {
        $('Content2').keypress(function (e) {
            if (e.which === 13) {
                e.preventDefault();
            }
        });
    });

    function tgupdate() {
        if (confirm("Are you sure you want to Update?")) {
            return true;
        }
        return false;
    }

    function tgdelete() {
        if (confirm("Are you sure you want to Delete?")) {
            return true;
        }
        return false;
    }

    function Validations() {
        var tname = document.getElementById('<%=txttestgrpname.ClientID %>').value;
        var cost = document.getElementById('<%=txttotalcost.ClientID %>').value;

        if (tname == "") {
            alert("please enter TestGroupName");
            return false;
        }

        if (cost == "") {
            alert("please enter Cost");
            return false;
        }
    }

    function validatenumerics(key) {
        var keycode = (key.which) ? key.which : key.keyCode;
        
        if (keycode > 31 && (keycode < 48 || keycode > 57)) {
            alert(" You can enter only characters 0 to 9 ");
            return false;
        }
        else return true;
    }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 select-top">
                        TEST GROUP
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-12 text-right">

                         <asp:Button ID="btnnew" runat="server" Text="New" CssClass="btn btn-primary" 
                             onclick="btnnew_Click" />
                        <asp:Button ID="btnadd" runat="server" Text="Add" CssClass="btn btn-primary" 
                             OnClientClick="return Validations()" onclick="btnadd_Click" 
                            Visible="False"/>
                        <%--<asp:Button ID="btnedit" runat="server" Text="Edit" CssClass="btn btn-primary" 
                             onclick="btnedit_Click"/>--%>
                        <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-primary" 
                             OnClientClick="return tgupdate()"
                             onclick="btnupdate_Click"/>
                        <asp:Button ID="btndelete" runat="server" Text="Delete" 
                             CssClass="btn btn-primary" onclick="btndelete_Click" OnClientClick="return tgdelete()"/>
                       <asp:Button ID="btncancel" runat="server" Text="Cancel" 
                             CssClass="btn btn-primary" onclick="btncancel_Click" />

                      <%--  <button class="btn btn-primary">New</button>
                        <button class="btn btn-primary">Edit</button>
                        <button class="btn btn-primary">Delete</button>
                        <button class="btn btn-primary">Cancel</button>--%>
                    </div>
                </div><br>
                <div class="row form-horizontal">
                    <div class="pad_form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Test Group Name</label>
                            <div class="col-sm-9">
                            <asp:TextBox ID="txttestgrpname" runat="server" CssClass="form-control" 
                                    ReadOnly="True" ></asp:TextBox>

                              <%--<input type="text" class="form-control">--%>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Serial Order No.</label>
                            <div class="col-sm-3">
                            <asp:TextBox ID="txtserialorderno" runat="server" CssClass="form-control" 
                                    ReadOnly="True" ></asp:TextBox>

                                <%--<input type="text" class="form-control" placeholder="" value="">--%>
                            </div>
                            <label class="col-sm-3 control-label">Total Cost</label>
                            <div class="col-sm-3">
                            <asp:TextBox ID="txttotalcost" runat="server" CssClass="form-control" 
                                    ReadOnly="True" onkeypress="return validatenumerics(event)"></asp:TextBox>

                                <%--<input type="text" class="form-control" placeholder="" value="">--%>
                            </div>                        
                        </div>
                        <div class="form-group">
                            <div class="col-sm-8">
                                <label><%--<input type="checkbox">This is a Sub Group--%>
                                    <asp:CheckBox ID="chksubgroup" runat="server" Text="This is a Subgroup" />
                                                 
                                     </label>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-grid col_form">
                        <div class="table-responsive">
                            <asp:GridView ID="gridTestGroup" runat="server" AutoGenerateColumns="False" Width="1004px" 
                                DataKeyNames="test_group_id" onrowupdating="gridTestGroup_RowUpdating" 
                                AutoPostBack="true" AllowPaging="True" PageSize="5" CellPadding="4" 
                                ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Action">
                                        <%--<EditItemTemplate>
                                            <asp:CheckBox ID="chktg" runat="server" OnCheckedChanged="chktg_CheckedChanged" AutoPostBack="True"/>
                                        </EditItemTemplate>--%>
                                        <ItemTemplate>
                                            <%--<asp:CheckBox ID="chktg" runat="server" />--%>
                                            <asp:CheckBox ID="chktg" runat="server" OnCheckedChanged="chktg_CheckedChanged" AutoPostBack="True"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="S.No">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtid" runat="server" Text='<%# Bind("test_group_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblid" runat="server" Text='<%# Bind("test_group_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Group">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtname" runat="server" Text='<%# Bind("test_group_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblname" runat="server" Text='<%# Bind("test_group_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SubGroup">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtsname" runat="server" 
                                                Text='<%# Bind("test_sub_groupname") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblsname" runat="server" Text='<%# Bind("test_sub_groupname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cost">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtcost" runat="server" Text='<%# Bind("cost") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblcost" runat="server" Text='<%# Bind("cost") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerSettings NextPageText="&quot;Next&quot;" 
                                    PreviousPageText="&quot;Prev&quot;" Visible="False" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <%--  <table class="table table-bordered table-striped-column">
                              <thead>
                                <tr>
                                      <th>Serial No.</th>
                                      <th>Group</th>
                                      <th>Sub Group</th>
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

                <div class="row pad_but1 pad_but">
                  <div class="form-horizontal">
                    <div class="form-group">
                        <div class="col-sm-2 pad_but1">
                               <asp:Button ID="btnprv" runat="server" Text="Prev" CssClass="btn btn-primary" 
                                   onclick="btnprv_Click" />
                              <asp:Button ID="btnnext" runat="server" Text="Next" CssClass="btn btn-primary" 
                                   onclick="btnnext_Click" />
               
                          <%--<button class="btn btn-primary">Prev</button>
                            <button class="btn btn-primary">Next</button>--%>
                              </div>
                            <label class="col-sm-4 control-label">Find Test Group/Sub Group Name :</label>
                          <div class="col-sm-6">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" 
                                  ontextchanged="txtSearch_TextChanged" ></asp:TextBox>

                        <%--<input type="text" class="form-control">--%>
                      </div>                        
                    </div>
                  </div>
                </div>

            </div><!--container-fluid End-->
    </div>
</asp:Content>
