<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="doctorsentry.aspx.cs" Inherits="ELABS.doctors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
              <div class="container-fluid">
                <div class="row">
                    <div class="select-top">
                        DOCTORS ENTRY
                    </div>
                </div>
                <br />
                  <script src="Scripts/jquery-1.12.0.min.js" type="text/javascript"></script>
                <script src="Scripts/notify.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function validations() {
            var contactno = $('[id*="txtcontactno"]').val();
            var docname = $('[id*="txtdoctorname"]').val();
            var emailid = $('[id*=txtemailid]').val();
            if (docname=="") {
                $('[id*="txtdoctorname"]').notify("Please Enter Doctor name", { position: "right", color: "Red" });
                $('[id*="txtdoctorname"]').next().show();
            }
            if (emailid == "") {
                $('[id*=txtemailid]').notify("please enter Email", { position: "right", color: "Red" });
                $('[id*=txtemailid]').next().show();
                return false;
            }

            if (!(emailid.match(/^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/))) {
                $('[id*=txtemailid]').notify("please enter valid EmailId", { position: "right", color: "Red" });
                $('[id*=txtemailid]').next().show();
                return false;
            }
            if (contactno == "") {
                $('[id*="txtcontactno"]').notify("Please Enter Contact Number", { position: "right", color: "Red" });
                $('[id*="txtcontactno"]').next().show();
                return false;
            }

            if (!(contactno.match(/^[789]\d{9}$/))) {
                $('[id*="txtcontactno"]').notify("Not a Valid Contact Number", { position: "right", color: "Red" });
                $('[id*="txtcontactno"]').next().show();
                return false;
            }
        }
    </script>          

                <div class="row">
                    <div class="col-sm-12 text-right">
                        <asp:Button ID="btnnew" runat="server" Text="New" CssClass="btn btn-primary" OnClientClick="return validations()"
                            onclick="btnnew_Click"/>
                        <asp:Button ID="btnupdate" runat="server" Text="Update" 
                            CssClass="btn btn-primary" onclick="btnupdate_Click" />
                        <asp:Button ID="btndelete" runat="server" Text="Delete" 
                            CssClass="btn btn-primary" onclick="btndelete_Click" />
                        <asp:Button ID="btnclose" runat="server" Text="Close" 
                            CssClass="btn btn-primary" onclick="btnclose_Click" />
                 
                    </div>
                </div><br>

                <div class="row form-horizontal">
                    <div class="pad_form11">
                      <div class="col-sm-3">
                        <div class="form-group">
                            <label class="control-label">Ref No.</label>
                            <div class="in_pad">
                             <asp:TextBox ID="txtrefno" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                                <%--<input type="text" class="form-control">--%>
                            </div>
                        </div>                        
                      </div>
                      <div class="col-sm-3">
                        <div class="form-group">
                            <label class="control-label">Doctor Name</label>
                            <div class="in_pad">
                                 <asp:TextBox ID="txtdoctorname" runat="server" CssClass="form-control" ></asp:TextBox>
                           
                            </div>
                        </div>                       
                      </div>
                      <div class="col-sm-3">
                        <div class="form-group">
                            <label class="control-label">E-mail ID</label>
                            <div class="in_pad">
                                 <asp:TextBox ID="txtemailid" runat="server" CssClass="form-control" ></asp:TextBox>
                            
                            </div>
                        </div>                       
                      </div>
                      <div class="col-sm-3">
                        <div class="form-group">
                            <label class="control-label">Contact No.</label>
                            <div class="in_pad">
                                 <asp:TextBox ID="txtcontactno" runat="server" CssClass="form-control" 
                                     MaxLength="10"></asp:TextBox>
                             
                                 <asp:TextBox ID="txttestlistid" runat="server" Visible="False" Width="64px"></asp:TextBox>
                             
                            </div>
                        </div>                   
                      </div>
                    </div>
                </div>
                <h5>No of Tests :<asp:Label ID="lblnooftests" runat="server" Text=""></asp:Label></h5>
                <div class="row">
                    <div class="form-grid col_form">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" Width="1010px" 
                                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                                GridLines="None" AllowPaging="True" PageSize="5">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Test Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("test_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("test_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cost">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("cost") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("cost") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Commission">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Commission") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="Label3" BorderStyle='None' BorderWidth='0px' runat="server" Text='<%# Bind("Commission") %>'></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerSettings NextPageText="&quot;Next&quot;" 
                                    PreviousPageText="&quot;Prev&quot;" Visible="False" 
                                    FirstPageText="&quot;first&quot;" LastPageText="&quot;last&quot;" 
                                    Mode="NextPreviousFirstLast" />
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
                </div>

                <div class="row pad_but">
                  <div class="form-horizontal">
                    <div class="formula form-group">
                      <div class="col-sm-12 text-left">
                      <asp:Button ID="first" runat="server" Text="<<" CssClass="btn btn-primary" 
                              onclick="first_Click" />
                      <asp:Button ID="prev" runat="server" Text="<" CssClass="btn btn-primary" 
                              onclick="prev_Click" />
                      <asp:Button ID="next" runat="server" Text=">" CssClass="btn btn-primary" 
                              onclick="next_Click" />
                      <asp:Button ID="last" runat="server" Text=">>" CssClass="btn btn-primary" 
                              onclick="last_Click" />
                        <%--<button class="btn btn-primary">&#10094;&#10094;</button>
                        <button class="btn btn-primary">&#10094;</button>
                        <button class="btn btn-primary">&#10095;</button>
                        <button class="btn btn-primary">&#10095;&#10095;</button>--%>
                      </div>                                                 
                    </div>
                  </div>
                </div>

            </div><!--container-fluid End-->
    </div>
</asp:Content>
