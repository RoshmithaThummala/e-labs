<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="utilitiesreportbuilder.aspx.cs" Inherits="elabsproject.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
                <div class="container-fluid">
                <div class="row">
                    <div class="select-top">
                        INVOICE TEMPLATE BUILDER TOOL
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-sm-12 text-right">
                 <asp:Button ID="btninsert" runat="server" Text="Ok" CssClass="btn btn-primary" 
                            onclick="btninsert_Click" OnClientClick="return Validations();"/>                            
                 <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-primary" 
                            onclick="btnupdate_Click" />                            
                 <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="btn btn-primary" 
                            onclick="btndelete_Click" />                            
                 <asp:Button ID="btnclose" runat="server" Text="close" CssClass="btn btn-primary" 
                            onclick="btnclose_Click" />                            

                       <%-- <button class="btn btn-primary">Ok</button>
                        <button class="btn btn-primary">Print</button>
                        <button class="btn btn-primary">Excel</button>
                        <button class="btn btn-primary">Close</button>--%>
                    </div>
                </div><br/>

                <div class="row">
                  <h5 class="text-center"><b>Report Builder</b></h5>
                    <div class="pad_form">
                        <div class="form-group">
                        <label class="col-sm-2 control-label">Template Name</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txttemplatename" runat="server" CssClass="form-control"></asp:TextBox>  
                            
                         <%--<input type="date" class="form-control">--%>
                        </div> 
                        <label class="col-sm-2 control-label">Apply on</label>
                        <div class="col-sm-3">
                            <asp:DropDownList ID="applyon" runat="server" CssClass="form-control">                           
                                <asp:ListItem>--select--</asp:ListItem>
                                <asp:ListItem>Receipt</asp:ListItem>
                                <asp:ListItem>Test report</asp:ListItem>
                            </asp:DropDownList>
                           
                        <%-- <asp:TextBox ID="applyon" runat="server" CssClass="form-control" ></asp:TextBox>--%>

                          <%--<input type="date" class="form-control">--%>
                        </div>
                        <%--<input type="checkbox" class="control-label">--%>
                            <asp:CheckBox ID="chkdefaulttemplate" runat="server"/>
                            <b>Set as Default Template</b>   
                      </div>

                      <div class="form-group">
                        <div class="form-group text-left">
                        <label class="col-sm-2 control-label">Map Location</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtmaploc" runat="server" CssClass="form-control" ></asp:TextBox>

                          <%--<input type="date" class="form-control">--%><asp:FileUpload ID="FileUpload1"
                             runat="server" />
                        </div>
                                   <%-- <asp:Button ID="btnbrowse" runat="server" Text="Browse" CssClass="btn btn-primary" />  --%>                          

                        <%--<button class="btn btn-primary">Browse</button>--%>                        
                        </div> 
                      </div>
                    </div>
                  <h5 class="text-center"><b>Search</b></h5>
                    <div class="pad_form">
                        <div class="form-group text-left">
                        <label class="col-sm-2 control-label">Report</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtreport" runat="server" CssClass="form-control" 
                                ontextchanged="txtreport_TextChanged" AutoPostBack="true" ></asp:TextBox>

                          <%--<input type="date" class="form-control">--%>
                        </div>
                                    <asp:Button ID="btnrefresh" runat="server" Text="Refresh" 
                                CssClass="btn btn-primary" onclick="btnrefresh_Click" />                            

                        <%--<button class="btn btn-primary">Refresh</button>--%>
                    </div>
                </div>                

              </div>
              <div class="row">
                      <div class="form-grid col_form">
                          <div class="table-responsive">
                              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                  CellPadding="3" 
                                   Width="1012px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
                                  BorderWidth="1px" onselectedindexchanged="GridView1_SelectedIndexChanged">
                                  <Columns>
                                  <asp:TemplateField>
                                  <ItemTemplate>
                                  <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="true" />
                                  </ItemTemplate>
                                  </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Template_name" SortExpression="Template_name">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Template_name") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label1" runat="server" Text='<%# Bind("Template_name") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="ApplyOn" SortExpression="ApplyOn">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ApplyOn") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label2" runat="server" Text='<%# Bind("ApplyOn") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Location" SortExpression="Location">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Location") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label3" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                  </Columns>
                                  <FooterStyle BackColor="White" ForeColor="#000066" />
                                  <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                  <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                  <RowStyle ForeColor="#000066" />
                                  <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                  <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                  <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                  <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                  <SortedDescendingHeaderStyle BackColor="#00547E" />
                              </asp:GridView>
                              <%--<table class="table table-bordered table-striped-column">
                                <thead>
                                  <tr>
                                        <th>Report No.</th>
                                        <th>Apply on</th>
                                        <th>Location</th>
                                  </tr>
                                </thead>
                                <tbody>
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
   <script src="../../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="../../Scripts/notify.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function Validations() {
        var Templatename = document.getElementById('<%=txttemplatename.ClientID%>').value;
        var applyon = document.getElementById('<%=applyon.ClientID%>').value;
        var fileupload = document.getElementById('<%=FileUpload1.ClientID%>').value;
        if (Templatename == "")
         {
            alert("Please Enter Templatename");
            return false;
        }
        if (applyon == "--select--")
         {
            alert("Please Select applyon");
            return false;
        }
        if (fileupload == "") 
        {
            alert("Please Choose file");
            return false;
        }
    }
    </script>
    
</asp:Content>

