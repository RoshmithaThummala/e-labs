<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="addressbook.aspx.cs" Inherits="ELABS.add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/notify.min.js" type="text/javascript"></script>
    <script src="js/jquery.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">
    function PrintPage() {
        var printContent = document.getElementById('print');
        var printWindow = window.open("All Records", "Print Panel", 'left=50000,top=50000,width=0,height=0');
        printWindow.document.write(printContent.innerHTML);
        printWindow.document.close();
        printWindow.focus();
        printWindow.print();
    }

//    function Validations() {
//        var mobile = document.getElementById('<%=txtmobile.ClientID %>').value;

//            if (mobile == "") {
//                alert("please enter Mobile");
//                return false;
//            }

//            if (!(mobile.match(/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/))) {
//                alert("Enter valid phone number");
//                return false;
//            }   
//    }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
               <div class="container-fluid">
                <div class="row">
                    <div class="select-top">
                        ADDRESS BOOK
                    </div>
                </div>

                <div class="row">
                    <div class="pad_form list-test">
                        <div class="form-group">
                            <div class="col-sm-3"><label>
                                <asp:CheckBox ID="chakfastsearch" runat="server" Text="Enable fast Search" 
                                    oncheckedchanged="chakfastsearch_CheckedChanged" AutoPostBack="true" />
                                <%--<input type="checkbox">Enable Fast Search--%></label></div>
                            <div class="col-sm-3">
                                 <label>Results :</label>
                                <asp:Label ID="lblresults" runat="server" Text=""></asp:Label>
                               

                            </div>
                            <div class="col-sm-3">
                                 <label>Watch windows No :</label>
                                <asp:Label ID="lblwatchwindowsno" runat="server" Text=""></asp:Label>
                               
                            </div>
                            <div class="col-sm-3">
                                     <label>Showing :</label>
                                <asp:Label ID="lblshowing" runat="server" Text=""></asp:Label>
                           

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12 top-but-pad-14">
                        <asp:Button ID="btnprint" runat="server" Text="Print" 
                            CssClass="btn btn-primary" OnClientClick="return PrintPage()" />
                        <asp:Button ID="btnclose" runat="server" Text="Close" 
                            CssClass="btn btn-primary" onclick="btnclose_Click" />
                       <%-- <button class="btn btn-primary">Print</button>
                        <button class="btn btn-primary">Close</button>--%>
                    </div>
                </div>

                <div class="row form-horizontal">
                    <div class="pad_form11">
                      <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label">Accounts</label>
                            <div class="in_pad">
                            <asp:TextBox ID="txtaccounts" runat="server" 
                                    ontextchanged="txtaccounts_TextChanged" AutoPostBack="true" ></asp:TextBox>
                              <%--<input type="text" class="form-control">--%>
                            </div>
                        </div>                        
                      </div>
                      <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label">Group</label>
                            <div class="in_pad">
                             <asp:TextBox ID="txtgroup" runat="server" ontextchanged="txtgroup_TextChanged" AutoPostBack="true"></asp:TextBox>
                              <%--<input type="text" class="form-control">--%>
                            </div>
                        </div>                       
                      </div>
                      <div class="col-sm-4">
                        <div class="form-group ">
                            <label class="control-label">Mobile</label>
                            <div class="in_pad">
                                <asp:TextBox ID="txtmobile" runat="server" 
                                    ontextchanged="txtmobile_TextChanged" AutoPostBack="true" ></asp:TextBox>
                              <%--<input type="text" class="form-control">--%>
                            </div>
                        </div>                       
                      </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="form-grid col_form">
                        <div class="table-responsive">

                        <div id="print">

                            <asp:GridView ID="GridView1" runat="server" 
                                onselectedindexchanged="GridView1_SelectedIndexChanged" Width="1013px"
                                AutoGenerateColumns="False" AutoGenerateSelectButton="True" 
                                CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" 
                                PageSize="5" >
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                   
                                   
                                    <asp:TemplateField HeaderText="Account Id">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("account_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("account_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                    <asp:TemplateField HeaderText="Account Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("account_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("account_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--<asp:TemplateField HeaderText="Group Name" SortExpression="acc_groupname">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("acc_groupname") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("acc_groupname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="Group Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("acc_groupname") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("acc_groupname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Opening Balance">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("opening_balance") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("opening_balance") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Address">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="City ">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mobile">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("mobile_no") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("mobile_no") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Credit OR Debit">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Debit_Credit") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Debit_Credit") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerSettings NextPageText="&quot;Next&quot;" 
                                    PreviousPageText="&quot;Prev&quot;" Visible="False" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            </div>
                            ..</div>
                    </div>
                </div>

                <div class="row pad_but">
                  <div class="form-horizontal">
                    <div class="form-group">
                      <div class="col-sm-12 text-center">
                          <asp:Button ID="btnprev" runat="server" Text="Prev" CssClass="btn btn-primary" 
                              onclick="btnprev_Click" />
                          <asp:Button ID="btnnext" runat="server" Text="Next" CssClass="btn btn-primary" 
                              onclick="btnnext_Click" />
            
                      </div>                                                 
                    </div>
                  </div>
                </div>

            </div><!--container-fluid End-->
    </div>

</asp:Content>
