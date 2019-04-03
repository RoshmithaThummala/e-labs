<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="newaccountgroup.aspx.cs" Inherits="ELABS._new" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
                <div class="container-fluid">

                <div class="row">
                    <div class="select-top">
                        ACCOUNT GROUP
                    </div>
                </div>
                
               
                <div class="row">
                    <div class="col-sm-12 text-right">
                          <asp:Button ID="btnnew" runat="server" Text="New" CssClass="btn btn-primary" 
                              onclick="btnnew_Click" />
                          <asp:Button ID="btnedit" runat="server" Text="Edit" CssClass="btn btn-primary" 
                              onclick="btnedit_Click"/>
                          <asp:Button ID="btndelete" runat="server" Text="Delete" 
                              CssClass="btn btn-primary" onclick="btndelete_Click" />
                          <asp:Button ID="btnclose" runat="server" Text="Close" 
                              CssClass="btn btn-primary" onclick="btnclose_Click"/>
                          <%-- <button class="btn btn-primary">New</button>
                        <button class="btn btn-primary">Edit</button>
                        <button class="btn btn-primary">Delete</button>
                        <button class="btn btn-primary">Close</button>--%>
                    </div>
                </div>
                

                <div class="row pad-row12">
                    <div class="form-horizontal">
                        <div class="pad_form12">
                          <div class="col-md-12">
                            <div class="form-group">
                                <label class=" col-sm-4 control-label">Account Group Name</label>
                                <asp:TextBox ID="txtaccountgroupid" runat="server" Height="16px" 
                                    Visible="False" ontextchanged="txtaccountgroupid_TextChanged"></asp:TextBox>
                                <div class="col-sm-5">
                                    <asp:TextBox ID="txtacountgroupname" runat="server" CssClass="form-control" 
                                        ontextchanged="txtacountgroupname_TextChanged" ></asp:TextBox>
                                    <%--<input type="text" class="form-control" value="">--%>
                                </div>
                            </div>                        
                          </div>

                          <div class="col-md-12">
                            <div class="form-group">
                                <label class=" col-sm-4 control-label">Under Group</label>
                                <div class="col-sm-5">
                                    <asp:DropDownList ID="drpundegroup" runat="server">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>Group1</asp:ListItem>
                                        <asp:ListItem>Group2</asp:ListItem>
                                        <asp:ListItem>Group3</asp:ListItem>
                                    </asp:DropDownList>
                                    <%--<select class="form-control" id="sell">
                                    <option>&nbsp;</option>
                                    <option>&nbsp;</option>
                                    <option>&nbsp;</option>
                                  </select>--%>                                  
                                </div>
                            </div>                        
                          </div>
                        </div>
                    </div>                    
                </div>

                <div class="row">
                    <div class="form-grid col_form">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" 
                                onselectedindexchanged="GridView1_SelectedIndexChanged" Width="1009px" 
                                AutoGenerateColumns="False" AutoGenerateSelectButton="True" 
                                CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Group ID">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("account_group_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("account_group_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Group Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("acc_groupname") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("acc_groupname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sub Group Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("acc_subgroup") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("acc_subgroup") %>'></asp:Label>
                                        </ItemTemplate>
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
                            <%--     <table class="table table-bordered table-striped-column">
                              <thead>
                                <tr>
                                      <th>Accounts Group ID</th>
                                      <th>Accounts Group</th>
                                      <th>Under Group</th>
                                </tr>
                              </thead>
                              <tbody>
                                  <tr>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                  </tr>                              
                              </tbody>
                            </table>--%>
                        </div>
                    </div>
                </div>

            </div><!--container-fluid End-->
    </div>

</asp:Content>
