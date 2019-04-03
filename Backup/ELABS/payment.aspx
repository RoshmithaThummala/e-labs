<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="WebElabsproject.WebForm1" %>

<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"rel="stylesheet" type="text/css" />

<script type="text/javascript" language="javascript">
    $(document).ready(function () {

        $('[id*=txtdate]').datepicker();
    });


</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <script language="javascript" type="text/javascript">

        function validations() {
            var txtvchno = document.getElementById('<%=txtvchno.ClientID %>').value;
            if (txtvchno == "") {
                alert("Voucher No should not be empty.Please click on select")
                return false;
            }
            var txtaccountname = document.getElementById('<%=txtaccountname.ClientID %>').value;
            if (txtaccountname == "") {
                alert("Account Name should not be empty.Please click on select");
                return false;
            }
        }

        function deletec()
        {
        if ($('[id*="GridView1"]').find('input[type=checkbox]:checked').length == 0) {
                alert("please Check the Checkbox");
                return false;
            }
        }
    </script>
    <asp:Panel ID="panel1" runat="server">
    <div>
        <div class="container-fluid">
                <div class="row">
                    <div class="select-top">
                        PAYMENT
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-12 text-right">
                          <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-primary" OnClientClick="return validations();" 
                              onclick="btnsave_Click" />
                          <asp:Button ID="btndelete" runat="server" Text="Delete" OnClientClick="return deletec();" 
                              CssClass="btn btn-primary" onclick="btndelete_Click" />
                          <asp:Button ID="btnupdate" runat="server" Text="Update" 
                              CssClass="btn btn-primary" onclick="btnupdate_Click" />
                               <script type="text/javascript">
                                   function PrintGridData() {
                                       var prtGrid = document.getElementById('<%=panel1.ClientID %>');
                                       prtGrid.border = 0;
                                       var prtwin = window.open('', 'PrintGridViewData', 'left=100,top=100,width=1000,height=1000,tollbar=0,scrollbars=1,status=0,resizable=1');
                                       prtwin.document.write(prtGrid.outerHTML);
                                       prtwin.document.close();
                                       prtwin.focus();
                                       prtwin.print();
                                       prtwin.close();
                                   }
                            </script>
                   <input type="button" id="Button1" value="Print" onclick="PrintGridData()" />
                         <%-- <asp:Button ID="btnprint" runat="server" Text="Print" CssClass="btn btn-primary" />--%>
                          <asp:Button ID="btnclose" runat="server" Text="Close" 
                              CssClass="btn btn-primary" onclick="btnclose_Click" />
                        <%--<button class="btn btn-primary">Save</button>
                        <button class="btn btn-primary">Delete</button>
                        <button class="btn btn-primary">Update</button>
                        <button class="btn btn-primary">Print</button>
                        <button class="btn btn-primary">Close</button>--%>
                    </div>
                </div><br/>

                <div class="row ">
                    <div class="pad_form11">
                      <div class="col-sm-3">
                        <div class="form-group">
                            <%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                            </asp:ToolkitScriptManager>--%>
                        
                            <label class="control-label">Date.</label>
                            <div class="in_pad">
                       <asp:TextBox ID="txtdate" runat="server" CssClass="form-control" 
                                    ontextchanged="txtdate_TextChanged" AutoPostBack="true" ></asp:TextBox>
                                <%--<asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtdate"  >
                                </asp:CalendarExtender>--%>

                              <%--<input type="date" class="form-control">--%>
                            </div>
                        </div>                        
                      </div>
                      <div class="col-sm-4">
                        <div class="form-group col-sm-3">
                            <label class="control-label">Patient Name</label>
                      <%-- <asp:TextBox ID="txtpatientname" runat="server" CssClass="form-control" ></asp:TextBox>--%>
                       <%--<asp:DropDownList ID="ddlpatientname" runat="server" CssClass="form-control" 
                                DataSourceID="SqlDataSource1"></asp:DropDownList>

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ElabsConnectionString2 %>" 
                                SelectCommand="SELECT [patient_name] FROM [payment] WHERE ([payment_date] = @payment_date)">
                                <SelectParameters>
                                    <asp:QueryStringParameter DbType="Date" DefaultValue="patient_name" 
                                        Name="payment_date" QueryStringField="patient_name" />
                                </SelectParameters>
                            </asp:SqlDataSource>--%>
                            <asp:DropDownList ID="ddlpatientname" runat="server" CssClass="form-control"  ></asp:DropDownList>
                            <!-- <div class="in_pad">
                              <input type="text" class="form-control">
                            </div> -->
                            <%--<select class="form-control in_pad">
                              <option></option>
                              <option></option>
                              <option></option>
                            </select>--%>                            
                            
                        </div> 
                        <div style="margin-top:32px;">
                            <asp:Button ID="btnok" runat="server" Text="Ok" CssClass="btn btn-primary" 
                                onclick="btnok_Click" />

                            <%--<button class="btn btn-primary">Ok</button>--%>

                        </div>                      
                      </div>
                      <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label">VCH No.</label>
                            <div class="in_pad">
                       <asp:TextBox ID="txtvchno" runat="server" CssClass="form-control" ></asp:TextBox>

                              <%--<input type="text" class="form-control">--%>
                            </div>
                        </div>                       
                      </div>
                      <div class="col-sm-3">
                        <div class="form-group">
                            <label class="control-label">Payment Mode</label>
                            <div class="in_pad">
                                   <%-- <asp:TextBox ID="txtpaymentmode" runat="server" CssClass="form-control" ></asp:TextBox>--%>
                                    <asp:DropDownList ID="ddlpaymentmode" runat="server" CssClass="form-control"  ></asp:DropDownList>
                              <%--<input type="text" class="form-control">--%>
                            </div>
                        </div>                   
                      </div>
                    </div>
                </div>

                <div class="row">
                  <div class="pad_form11">
                      <div class="form-group">
                        <div class="col-sm-2">
                          <label class="control-label">Account Name</label>
                          <div class="in_pad">
                                  <asp:TextBox ID="txtaccountname" runat="server" CssClass="form-control" ></asp:TextBox>
                            <%--<input type="date" class="form-control">--%>
                          </div>
                        </div>
                        <div class="col-sm-2">
                          <label class="control-label">Total Amount</label>
                          <div class="in_pad">
                                  <asp:TextBox ID="txttotalamountv" runat="server" CssClass="form-control" ></asp:TextBox>
                            <%--<input type="date" class="form-control">--%>
                          </div>
                        </div>
                        <div class="col-sm-2">
                          <label class="control-label">Discount(%)</label>
                          <div class="in_pad">
                                  <asp:TextBox ID="txtdiscount" runat="server" CssClass="form-control" ></asp:TextBox>
                            <%--<input type="date" class="form-control">--%>
                          </div>
                        </div>
                        <div class="col-sm-2">
                          <label class="control-label">Amount Paid</label>
                          <div class="in_pad">
                                  <asp:TextBox ID="txtamountpaid" runat="server" CssClass="form-control" ></asp:TextBox>
                            <%--<input type="date" class="form-control">--%>
                          </div>
                        </div>
                        <div class="col-sm-2">
                          <label class="control-label">Balance Amount</label>
                          <div class="in_pad">
                                  <asp:TextBox ID="txtbalanceamount" runat="server" CssClass="form-control" ></asp:TextBox>
                            <%--<input type="date" class="form-control">--%>
                          </div>
                        </div>
                        <div class="col-sm-2">
                          <label class="control-label">Short Narration</label>
                          <div class="in_pad">
                                  <asp:TextBox ID="txtshortnarration" runat="server" CssClass="form-control" ></asp:TextBox>
                            <%--<input type="date" class="form-control">--%>
                          </div>
                        </div>
                        <div class="col-sm-2">
                          <label class="control-label">Patient ID</label>
                          <div class="in_pad">
                                  <asp:TextBox ID="txtpatient" runat="server" CssClass="form-control" Visible="false" ></asp:TextBox>
                            <%--<input type="date" class="form-control">--%>
                          </div>
                        </div>

                      </div>                        
                  </div>  
                </div>


                <div class="row">
                    <div class="form-grid col_form">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                AutoGenerateSelectButton="True" 
                                onselectedindexchanged="GridView1_SelectedIndexChanged">
                                <Columns>
                               <asp:TemplateField HeaderText="Check">
                               <ItemTemplate>
                               <asp:CheckBox ID="chk" runat="server" AutoPostBack="true"/>
                               </ItemTemplate>
                               </asp:TemplateField>
                                    <asp:TemplateField HeaderText="payment_id" SortExpression="payment_id">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("payment_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("payment_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="payment_date" SortExpression="payment_date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("payment_date") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("payment_date") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="voucher_no" SortExpression="voucher_no">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("voucher_no") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("voucher_no") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="payment_mode" SortExpression="payment_mode">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("payment_mode") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("payment_mode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="amountPayed" SortExpression="amountPayed">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("amountPayed","{0:c2}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("amountPayed") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="short_narration" 
                                        SortExpression="short_narration">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("short_narration") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("short_narration") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="long_narration" SortExpression="long_narration">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("long_narration") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("long_narration") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="patient_id" SortExpression="patient_id">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("patient_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("patient_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="patient_name" SortExpression="patient_name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("patient_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("patient_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="account_id" SortExpression="account_id">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("account_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("account_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Totalcost" SortExpression="Totalcost">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Totalcost") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("Totalcost") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="netbalance" SortExpression="netbalance">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("netbalance") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("netbalance") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Discount" SortExpression="Discount">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("Discount") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("Discount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="account_name" SortExpression="account_name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("account_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label14" runat="server" Text='<%# Bind("account_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <%--<table class="table table-bordered table-striped-column">
                              <thead>
                                <tr>
                                      <th>Vocher No.</th>
                                      <th>Payment Date</th>
                                      <th>Patient Name</th>
                                      <th>Account Name</th>
                                      <th>Paid Amount</th>
                                      <th>Total Cost</th>
                                      <th>Discount(%)</th>
                                      <th>Net Balance</th>
                                      <th>Payment Mode</th>
                                      <th>Short Narration</th>
                                      <th>Long Narration</th>
                                </tr>
                              </thead>
                              <tbody>
                                  <tr>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
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

                <div class="row">
                  <div class="pad_form14 text-center">
                  <label class="col-sm-3 control-label">Long Narration</label>
                 <asp:TextBox ID="txtlonnarration" runat="server" CssClass="form-control" ></asp:TextBox>
                  <%--<input type="text" class="col-sm-3 form-control">--%>
                  <label class="col-sm-2 control-label">Total Amount</label>
                  <asp:TextBox ID="txttotalamtv" runat="server" CssClass="form-control" ></asp:TextBox>
                  <%--<input type="text" class="col-sm-3 form-control">--%>
                  </div>
                </div>
             <%--   <div id="div1" style="display:none">
                <p>Update Sucessfull</p>
                </div>--%>
            </div>
    </div>
    </asp:Panel>
</asp:Content>
