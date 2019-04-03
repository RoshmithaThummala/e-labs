<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="listoftests.aspx.cs" Inherits="elabs.list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/Javascript" language="javascript">

    function PrintDivContent() {
        var printContent = document.getElementById('Print');
        var WinPrint = window.open('', '', 'left=100,top=100,width=1000,height=1000,tollbar=0,scrollbars=1,status=0,resizable=5');
        WinPrint.document.write(                                                            printContent.innerHTML);
        WinPrint.document.close();
        WinPrint.focus();
        WinPrint.print();
    }

    function isNumeric(keycode) {
        if (((keycode >= 48 && keycode <= 57) || keycode == 8 || (keycode >= 96 && keycode <= 105)))
            return true;
        else {
            alert('Enter Numerics');
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
                        List Of Tests
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-12 text-right">
                         <%-- <button class="btn btn-primary">Prev</button>
                            <button class="btn btn-primary">Next</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="btn btn-primary">Explor</button>   
                            <button class="btn btn-primary">Import</button>
                            <button class="btn btn-primary">&nbsp;Print&nbsp;</button>--%>
                    </div>
                </div>
                <asp:Button ID="btnNew" runat="server" CssClass="btn btn-primary" Text="New" 
                    onclick="btnNew_Click" />
                <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" 
                    Text="Update" onclick="btnUpdate_Click" />
                <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-primary" 
                    Text="Delete" onclick="btnDelete_Click" />
                <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-primary" 
                    Text="Cancel" onclick="btnCancel_Click" />
                <br>
                
    
    <div id="Print">
    <div class="row">
                    <div class="pad_form list-test">
                        <div class="form-group">
                            <div class="col-sm-3"><label>
                                <%--<input type="text" class="form-control" placeholder="" value="">--%>

                                <asp:CheckBox ID="chkenablesearch" runat="server" Text="Enablesearch" 
                                    AutoPostBack="True" oncheckedchanged="chkenablesearch_CheckedChanged" />
                                                  </label></div>
                            <div class="col-sm-3"><label>Results :</label><asp:Label ID="lblresult" 
                                    runat="server" Text="Label" Visible="False"></asp:Label>
                            </div>
                            <div class="col-sm-3"><label>Page :</label><asp:Label ID="lblpage" runat="server" 
                                    Text="Label" Visible="False"></asp:Label>
                            </div>
                            <div class="col-sm-3"><label>Showing :</label><asp:Label ID="lblshow" 
                                    runat="server" Text="Label" Visible="False"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                 <div class="row form-horizontal">
                    <div class="pad_form list-test">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Test Name / Group Search :</label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txttestname" runat="server" CssClass="form-control" 
                                    AutoPostBack="True" ontextchanged="txttestname_TextChanged"></asp:TextBox>
                                <%-- <button class="btn btn-primary">Prev</button>
                            <button class="btn btn-primary">Next</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="btn btn-primary">Explor</button>
                            <button class="btn btn-primary">Import</button>
                            <button class="btn btn-primary">&nbsp;Print&nbsp;</button>--%>
                            </div>
                            <label class="col-sm-1 control-label">Cost</label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtcost" runat="server" CssClass="form-control" 
                                    ontextchanged="txtcost_TextChanged" AutoPostBack="True" onkeypress="return validatenumerics(event)"></asp:TextBox>
                                <%--<input type="text" class="form-control" placeholder="" value="">--%>
                            </div>                        
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-grid col_form">
                        <div class="table-responsive">
                            <asp:GridView ID="gridlot" runat="server" AllowPaging="True" PageSize="5" 
                                AutoGenerateColumns="False" Width="1005px" CellPadding="4" 
                                ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>

                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:CheckBox ID="chklist" runat="server" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chklist" runat="server" />
                                        </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sr.No" HeaderStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtsrno" runat="server" Text='<%# Bind("SrNo") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblsrno" runat="server" Text='<%# Bind("SrNo") %>'></asp:Label>
                                        </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Test Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txttname" runat="server" Text='<%# Bind("TestName") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbltname" runat="server" Text='<%# Bind("TestName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Group Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtgname" runat="server" Text='<%# Bind("GroupName") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblgname" runat="server" Text='<%# Bind("GroupName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Unit">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtunit" runat="server" Text='<%# Bind("Unit") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblunit" runat="server" Text='<%# Bind("Unit") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Normal Range">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtnrange" runat="server" Text='<%# Bind("NormalRange") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblnrange" runat="server" Text='<%# Bind("NormalRange") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Cost">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtcost" runat="server" Text='<%# Bind("Cost") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblcost" runat="server" Text='<%# Bind("Cost") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                                <EditRowStyle BackColor="#999999" HorizontalAlign="Center" 
                                    VerticalAlign="Middle" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Center" VerticalAlign="Middle" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Center" VerticalAlign="Middle" />
                                <PagerSettings NextPageText="&quot;Next&quot;" 
                                    PreviousPageText="&quot;Prev&quot;" Visible="False" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" 
                                    VerticalAlign="Middle" />
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true" Visible="true">
        </asp:GridView>
                </div>                            

                <div class="row pad_but">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <asp:Button ID="btnprev" runat="server" Text="Prev" CssClass="btn btn-primary" 
                                onclick="btnprev_Click" />
                            <asp:Button ID="btnnext" runat="server" Text="Next" CssClass="btn btn-primary" 
                                onclick="btnnext_Click"/>
                            <asp:Button ID="btnexport" runat="server" Text="Export" 
                                CssClass="btn btn-primary" onclick="btnexport_Click"/>
                            <asp:Button ID="btnimport" runat="server" Text="Import" 
                                CssClass="btn btn-primary" onclick="btnimport_Click"/>
                                <asp:Button ID="btnprint" runat="server" Text="Print" CssClass="btn btn-primary" onclientclick="return PrintDivContent()" />
                                <asp:FileUpload ID="fileuploadExcel" runat="server" CssClass="btn btn-primary" />&nbsp;&nbsp;
                            
                            <%-- <button class="btn btn-primary">Prev</button>
                            <button class="btn btn-primary">Next</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="btn btn-primary">Explor</button>
                            <button class="btn btn-primary">Import</button>
                            <button class="btn btn-primary">&nbsp;Print&nbsp;</button>--%>
                        </div>
                    </div>
                </div>

            </div><!--container-fluid End-->
    </div>
</asp:Content>
