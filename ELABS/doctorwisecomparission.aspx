<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="doctorwisecomparission.aspx.cs" Inherits="ELabs.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(function () {
        $('[id*="txtfrom"]').datepicker();
    });
  </script>
   <script type="text/javascript">
       $(function () {
           $('[id*="txtto"]').datepicker();
       });
  </script>
    <script type="text/javascript">
        $(function () {
            $('[id*="TextBox6"]').datepicker();
        });
  </script>
    <script type="text/javascript">
        $(function () {
            $('[id*="TextBox7"]').datepicker();
        });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div>
         <div class="container-fluid">
                <div class="row">
                    <div class="select-top">
                        DOCTOR WISE COMPARISION
                    </div>
                </div>
                <div class="row">
                  <div class="pad_form13">
                        <div class="form-group">
                            <label class="col-sm-1 control-label">From</label>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtfrom" runat="server" CssClass="form-control"></asp:TextBox>
                              <%--<input type="date" class="form-control">--%>
                            </div>
                            <label class="col-sm-1 control-label">To</label>
                            <div class="col-sm-3">
                              <asp:TextBox ID="txtto" runat="server" CssClass="form-control"></asp:TextBox>
                              <%--<input type="date" class="form-control">--%>
                            </div>
                            <div class="col-sm-4 text-right" >
                                <asp:Button ID="btnok" runat="server" Text="Ok" CssClass="btn btn-primary" 
                                    onclick="btnok_Click" />
                                <asp:Button ID="btnclose" runat="server" Text="Close" 
                                    CssClass="btn btn-primary" onclick="btnclose_Click"/>
                              <%--<button class="btn btn-primary">Ok</button>
                              <button class="btn btn-primary">Close</button>--%>
                            </div>
                        </div>
                    </div>                    
                </div> 

                <div class="row pad_form15">
                  <div class="col-sm-6">
                    <div class="row">
                      <div class="form-grid col_form">
                          <div class="table-responsive">
                              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                  CellPadding="4" ForeColor="#333333" GridLines="None" Width="472px">
                                  <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                  <Columns>
                                      <asp:TemplateField HeaderText="Doctor">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ref_by") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label1" runat="server" Text='<%# Bind("ref_by") %>'>></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="No of Tests">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("nooftests") %>'>></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label2" runat="server" Text='<%# Bind("nooftests") %>'>></asp:Label>
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
                              <%--<table class="table table-bordered table-striped-column">
                                <thead>
                                  <tr>
                                        <th>Doctor</th>
                                        <th>Number of Tests</th>
                                  </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>                              
                                </tbody>
                              </table>--%>
                          </div>
                      </div>
                  </div>

                  </div>
                  <div class="col-sm-6">
                    <div class="row">
                    <div class="form-grid col_form">
                        <div class="table-responsive">
                            <asp:Chart ID="Chart1" runat="server" Height="371px" Width="460px">
                                <Series>
                                    <asp:Series Name="Series1">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                          <%--  <asp:GridView ID="GridView2" runat="server"></asp:GridView>--%>
                            <%--<table class="table table-bordered table-striped-column">
                              <thead>
                                <tr>
                                      <th>Doctor wise Comparision Graph Here</th>
                              </thead>
                              <tbody>
                                  <tr>
                                      <td>&nbsp;</td>
                                  </tr>                              
                              </tbody>
                            </table>--%>
                        </div>
                    </div>
                </div>
            </div>
          </div>  
                
            </div><!--container-fluid End-->
    </div>
</asp:Content>
