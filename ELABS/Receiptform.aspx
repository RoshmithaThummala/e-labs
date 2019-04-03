<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="Receiptform.aspx.cs" Inherits="WebElabsproject.WebForm2" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(document).ready(function () {

        $('[id*=txtdate]').datepicker();
    });
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Panel ID="panel1" runat="server">
    <div>
         <div class="container-fluid">
                <div class="row">
                    <div class="select-top">
                        RECEIPT TO THE PATIENT
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-12 text-right">
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
                   <input type="button" id="btnPrint" value="Print" onclick="PrintGridData()" />
                   <asp:Button ID="btnclose" runat="server" Text="Close" CssClass="btn btn-primary" onclick="btnclose_Click" 
                             />
                        <%--<button class="btn btn-primary">Print</button>--%>
                        <%--<button class="btn btn-primary">Close</button>--%>
                    </div>
                </div><br>

                <div class="row ">
                    <div class="pad_form11">
                      <div class="col-sm-3">
                        <div class="form-group">
                        <%-- <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                            </asp:ToolkitScriptManager>--%>
                            
                            <label class="control-label">Date.</label>
                            <div class="in_pad">
                                 <asp:TextBox ID="txtdate" runat="server" CssClass="form-control" ontextchanged="txtdate_TextChanged" AutoPostBack="true"></asp:TextBox>
                                      <%--<asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtdate">
                                </asp:CalendarExtender>--%>

                              <%--<input type="date" class="form-control">--%>
                            </div>
                        </div>                        
                      </div>
                      <div class="col-sm-4">
                        <div class="form-group col-sm-3">
                            <label class="control-label">Patient Name</label>
                            <asp:DropDownList ID="drppatientname" runat="server"></asp:DropDownList>
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
                    </div>
                </div>                

                <div class="row">
                    <div class="form-grid col_form">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                AutoGenerateSelectButton="True" 
                                onselectedindexchanged="GridView1_SelectedIndexChanged">
                                <Columns>
                                    <asp:TemplateField HeaderText="patient_id" SortExpression="patient_id">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("patient_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("patient_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="voucher_no" SortExpression="voucher_no">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("voucher_no") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("voucher_no") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="payment_date" SortExpression="payment_date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("payment_date") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("payment_date") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Patient_name" SortExpression="Patient_name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Patient_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Patient_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="account_name" SortExpression="account_name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("account_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("account_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="amountpayed" SortExpression="amountpayed">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("amountpayed") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("amountpayed") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="payment_mode" SortExpression="payment_mode">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("payment_mode") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("payment_mode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="sex" SortExpression="sex">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("sex") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("sex") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="doctor" SortExpression="doctor">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("doctor") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("doctor") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="age" SortExpression="age">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("age") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("age") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="discount" SortExpression="discount">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("discount") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("discount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="totalcost" SortExpression="totalcost">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("totalcost") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("totalcost") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="netbalance" SortExpression="netbalance">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("netbalance") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("netbalance") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="recieptid" SortExpression="recieptid">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("recieptid") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label14" runat="server" Text='<%# Bind("recieptid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="test_name" SortExpression="test_name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("test_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label15" runat="server" Text='<%# Bind("test_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="long_narration" SortExpression="long_narration">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("long_narration") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label16" runat="server" Text='<%# Bind("long_narration") %>'></asp:Label>
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
                                      <th>Doctor</th>
                                      <th>Account Name</th>
                                      <th>Paid Amount</th>
                                      <th>Total Cost</th>
                                      <th>Discount(%)</th>
                                      <th>Net Balance</th>
                                      <th>Payment Mode</th>
                                      <th>Sex</th>
                                      <th>Age</th>
                                      <th>Test Name</th>
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
                <asp:TextBox ID="txtlongnarration" runat="server" CssClass="form-control" ></asp:TextBox>

                  <%--<input type="text" class="col-sm-3 form-control">--%>
                  <label class="col-sm-2 control-label">Total Amount</label>
                  <asp:TextBox ID="txttotalamount" runat="server" CssClass="form-control" ></asp:TextBox>
                  
                  <%--<input type="text" class="col-sm-3 form-control">--%>
                  </div>
                </div>
            </div><!--container-fluid End-->
    </div>
    </asp:Panel>
</asp:Content>
