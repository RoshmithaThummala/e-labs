<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="completingreports.aspx.cs" Inherits="DOCTORproject.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">

    $(document).ready(function () {
        $("input[id$='txtto']").datepicker();
    });

    $(document).ready(function () {
        $("input[id$='txtfrom']").datepicker();
    });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div>
           <div class="container-fluid">
                <div class="row">
                    <div class="select-top">
                        COMPLETING REPORTS
                    </div>
                </div>
                <div class="row">
                  <div class="pad_form13">
                        <div class="form-group">
                              <label class="col-sm-1 control-label">From</label>
                            <div class="col-sm-3">
                          
                               <asp:TextBox ID="txtto" runat="server" CssClass="form-control"></asp:TextBox>
                              <%--<input type="date" class="form-control">--%>
                            </div>
                             <label class="col-sm-1 control-label">To</label>
                         
                            <div class="col-sm-3">
                              <asp:TextBox ID="txtfrom" runat="server" CssClass="form-control" 
                                    ontextchanged="txtfrom_TextChanged"></asp:TextBox>
                           
                              <%--<input type="date" class="form-control">--%>
                            </div>
                            <div class="col-sm-4 text-right" >
                                <asp:Button ID="btnok" runat="server" Text="Ok"  CssClass="btn btn-primary" 
                                    onclick="btnok_Click" />
                                <asp:Button ID="btnexcel" runat="server" Text="Excel"  
                                    CssClass="btn btn-primary" onclick="btnexcel_Click"  />
                                <asp:Button ID="btnclose" runat="server" Text="Close"  
                                    CssClass="btn btn-primary" onclick="btnclose_Click" />
                              <%--<button class="btn btn-primary">Ok</button>
                              <button class="btn btn-primary">Excel</button>
                              <button class="btn btn-primary">Close</button>--%>
                            </div>
                        </div>
                    </div>                    
                </div>

                <div class="row ">
                    <div class="pad_form11">
                      <div class="col-sm-3">
                        <div class="form-group">
                            <label class="control-label">OPD No.</label>
                            <div class="in_pad">
                                <asp:TextBox ID="opdno" runat="server" CssClass="form-control" AutoPostBack="true"
                                    ontextchanged="opdno_TextChanged1"></asp:TextBox>
                              <%--<input type="date" class="form-control">--%>
                            </div>
                        </div>                        
                      </div>
                      <div class="col-sm-3">
                        <div class="form-group col-sm-3">
                            <label class="control-label">Patient Name</label>
                            <asp:DropDownList ID="drppateintname" runat="server" CssClass="form-control" AutoPostBack="true"
                                onselectedindexchanged="drppateintname_SelectedIndexChanged1"></asp:DropDownList>
                          <%--  <select class="form-control in_pad">
                              <option></option>
                              <option></option>
                              <option></option>
                            </select>--%>
                        </div> 
                      </div>
                      <div class="col-sm-3">
                        <div class="form-group">
                            <label class="control-label">Referred by</label>
                            <div class="in_pad">
                            <asp:TextBox ID="txtrefferdby" runat="server" CssClass="form-control" AutoPostBack="true"
                                    ontextchanged="txtrefferdby_TextChanged1"></asp:TextBox>
                              <%--<input type="text" class="form-control">--%>
                            </div>
                        </div>                       
                      </div>
                      <div class="col-sm-3">
                        <div class="form-group">
                            <label class="control-label">Contact No.</label>
                            <div class="in_pad">
                            <asp:TextBox ID="txtcontactno" runat="server" CssClass="form-control" AutoPostBack="true"
                                    ontextchanged="txtcontactno_TextChanged"></asp:TextBox>
                              <%--<input type="text" class="form-control">--%>
                            </div>
                        </div>                   
                      </div>
                      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                Width="934px" Height="28px" CellPadding="4" ForeColor="#333333" 
                            GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField HeaderText="OPD NO">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%#Bind("lab_no") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%#Bind("lab_no") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Patient Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%#Bind("patient_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%#Bind("patient_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Age">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%#Bind("age") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%#Bind("age") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sex">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%#Bind("gender") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%#Bind("gender") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ref By">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ref_by") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%#Bind("ref_by") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Address">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%#Bind("address") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%#Bind("address") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="City">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%#BInd("villagecity") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%#Bind("villagecity") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contact">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%#Bind("contact_no") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%#Bind("contact_no") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="result">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox9" runat="server" Text='<%#BInd("result") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%#Bind("result") %>'></asp:Label>
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
                    </div>
                </div>


                <div class="row">
                </div>
                
            </div><!--container-fluid End-->
    </div>
</asp:Content>
