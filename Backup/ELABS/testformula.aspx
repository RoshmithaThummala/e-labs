<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="testformula.aspx.cs" Inherits="elabs.formula" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/Javascript" language="javascript">

function tfdelete() {
        if (confirm("Are you sure you want to Delete?")) {
            return true;
        }
        return false;
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
           <div class="container-fluid">
                <div class="row">
                    <div class="select-top">
                        TEST FORMULA
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-12 text-right">
                   <asp:Button ID="btnadd" runat="server" Text="Add" CssClass="btn btn-primary" 
                            onclick="btnadd_Click" />
                   <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="btn btn-primary" 
                            OnClientClick="return tfdelete()" onclick="btndelete_Click"/>
                   <asp:Button ID="btnclose" runat="server" Text="Close" CssClass="btn btn-primary" 
                            onclick="btnclose_Click" />
                      <%--  <button class="btn btn-primary">Add</button>
                        <button class="btn btn-primary">Delete</button>
                        <button class="btn btn-primary">Close</button>--%>
                    </div>
                </div><br>

                <div class="row">
                  <div class="col-sm-8"><!-- col-md-8 Start-->
                    <div class="row form-horizontal">
                      <div class="pad_form pad_form10A">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Select Group:</label>
                            <div class="col-sm-5">
                                <asp:DropDownList ID="drpselectgroup" runat="server" CssClass="form-control" 
                                    onselectedindexchanged="drpselectgroup_SelectedIndexChanged" 
                                    AutoPostBack="True"></asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Select Test to Make Formula:</label>
                            <div class="col-sm-5">
                                <asp:DropDownList ID="drpmakeformula" runat="server" CssClass="form-control" 
                                    AutoPostBack="True"></asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group">
                            <!-- <div class="col-sm-3">
                              &nbsp;
                            </div> -->
                            <div class="text-alignment">
                              <p>In laboratory a test formula to precede automatic results based on other test results (basic theory).
e.g. Serum Globulin ={Total serum Proteins}-{Serum Albumin}<br>
Select name of the resulting test from the box above and make formula expression with the help of tests given on the right side and tools given on the bottom.
</p>
                            </div>
                        </div>
                        <div class="form-group text-left">
                        <div class="col-sm-8 formula">
                          <b>Formula Expression:</b>
                            <asp:TextBox ID="txtformulaexp" runat="server" CssClass="form-control" ></asp:TextBox>
                          <%--<input type="text" class="form-control textbox10">--%>
                          Be carefull while entering Formula Expression; No part of this expressin can be edited; You can only delete and recreate any formula.                          
                        </div>
                        <div class="col-sm-8">
                          <div class="col-sm-2">
                          <asp:TextBox ID="txtinclude" runat="server" CssClass="form-control" ></asp:TextBox>
                          </div>
                        <asp:Button ID="btnincludethis" runat="server" Text="Include This" 
                                CssClass="btn btn-default" onclick="btnincludethis_Click" />
                        <asp:Button ID="btnplus" runat="server" Text="+" CssClass="btn btn-default" 
                                onclick="btnplus_Click" />
                        <asp:Button ID="btnminus" runat="server" Text="-" CssClass="btn btn-default" 
                                onclick="btnminus_Click" />
                       <asp:Button ID="btnquotes" runat="server" Text='"' CssClass="btn btn-default" 
                                onclick="btnquotes_Click" />
                       <asp:Button ID="btndivision" runat="server" Text='/' CssClass="btn btn-default" 
                                onclick="btndivision_Click" />
                       <asp:Button ID="btnleftbrace" runat="server" Text='(' CssClass="btn btn-default" 
                                onclick="btnleftbrace_Click" />
                        <asp:Button ID="btnrightbrace" runat="server" Text=')' CssClass="btn btn-default" 
                                onclick="btnrightbrace_Click" /> 
                        <asp:Button ID="btnpower" runat="server" Text='power' CssClass="btn btn-default" 
                                onclick="btnpower_Click" />   
                        <asp:Button ID="btnperc" runat="server" Text='%' CssClass="btn btn-default" 
                                onclick="btnperc_Click" />
                        </div>

                        </div>
                      </div>
                    </div>
                  </div><!-- col-md-8 End--> 

                  <div style="background-color:#e1f4fd;margin-left:638px;height:534px;position:absolute;width:382px;border:0.01px solid black;top:309px">
                  <div style="text-align:center">
                  <h6><b>Double Click a Test to include in Formula expression:</b></h6>
                  <div>
                  <asp:GridView ID="gridTest" runat="server" Width="379px" CellPadding="4" 
                          ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                      <EditRowStyle BackColor="#999999" />
                      <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                      <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                      <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                      <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
                      <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                      <SortedAscendingCellStyle BackColor="#E9E7E2" />
                      <SortedAscendingHeaderStyle BackColor="#506C8C" />
                      <SortedDescendingCellStyle BackColor="#FFFDF8" />
                      <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                      </asp:GridView>
                  </div>
                  </div>
                  </div>

                </div>
                <h5>List of formulas alredy defined</h5>
                <%--<div class="row">
                    <div class="form-grid col_form">
                        <div class="table-responsive">--%>
                        <div style="background-color:#e1f4fd">
                            <asp:GridView ID="gridTestFormula" runat="server" AutoGenerateColumns="False" 
                                Width="1004px" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="test_name" SortExpression="test_name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("test_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("test_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="formula" SortExpression="formula">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("formula") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("formula") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            
                        </div>
                    <%--</div>
                </div>

            </div><!--container-fluid end-->--%>
    </div>

</asp:Content>
