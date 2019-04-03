<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="balancelist.aspx.cs" Inherits="elabsproject.WebForm2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div>
          <div class="container-fluid">
                <div class="row">
                    <div class="select-top">
                            BALANCE LIST
                            
                    </div>
                </div>
                 <asp:Panel ID="pnlcontents" runat="server">
                <div class="row">
                  <div class="pad_form14">
                        <div class="form-group">
                           <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                            </asp:ToolkitScriptManager>
                           
                            <label class="col-sm-1 control-label">From</label>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtfrom" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="txtfrom" runat="server">
                                   </asp:CalendarExtender>
                                   </div>
                            <label class="col-sm-1 control-label">To</label>
                            <div class="col-sm-3">
                             <asp:TextBox ID="txtto" runat="server" CssClass="form-control"></asp:TextBox>
                              <asp:CalendarExtender ID="CalendarExtender2" TargetControlID="txtto" runat="server">
                             </asp:CalendarExtender>
                             </div>
                            <div class="col-sm-4 text-right" >
                                <asp:Button ID="btnok" runat="server" Text="Ok" CssClass="btn btn-primary" 
                                    onclick="btnok_Click" OnClientClick="return Validations();" />
                               <%-- <asp:Button ID="btnprint" runat="server" Text="Print" CssClass="btn btn-primary" />--%>
                                <input type="button" id="Print" value="Print" onclick="PrintGridData()" />
                                    <script type="text/javascript">
                                        function PrintGridData() {
                                            var prtGrid = document.getElementById('<%= pnlcontents.ClientID %>');
                                            prtGrid.border = 0;
                                            var prtwin = window.open('', 'PrintGridViewData', 'left=100,top=100,width=1000,height=1000,tollbar=0,scrollbars=1,status=0,resizable=1');
                                            prtwin.document.write(prtGrid.outerHTML);
                                            prtwin.document.close();
                                            prtwin.focus();
                                            prtwin.print();
                                            prtwin.close();
                                        }

                                    </script>
                                    
                                <asp:Button ID="btnexcel" runat="server" Text="Excel" 
                                    CssClass="btn btn-primary" onclick="btnexcel_Click" />
                                <asp:Button ID="btnclose" runat="server" Text="Close" 
                                    CssClass="btn btn-primary" onclick="btnclose_Click" />
                             <%-- <button class="btn btn-primary">Ok</button>
                              <button class="btn btn-primary">Print</button>
                              <button class="btn btn-primary">Excel</button>
                              <button class="btn btn-primary">Close</button>--%>
                            </div>
                        </div>
                    </div>                    
                </div>
                
                <div class="row">
                      <div class="form-grid col_form">
                          <div class="table-responsive">

                              <asp:GridView ID="GridView1" runat="server" 
                                  CellPadding="3" Width="1009px" BackColor="White" BorderColor="#CCCCCC" 
                                  BorderStyle="None" BorderWidth="1px">
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
                                        <th>OPD No.</th>
                                        <th>Patient name</th>
                                        <th>Age</th>
                                        <th>Sex</th>
                                        <th>Ref By.</th>
                                        <th>Address</th>
                                        <th>City</th>
                                        <th>Contact</th>
                                        <th>Result</th>
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
                                    </tr>                              
                                </tbody>
                              </table>--%>
                          </div>
                      </div>
                  </div>               

             <div class="row">
                <div class="pad_form14">
                <label class="col-sm-6 control-label">Total Amount</label>
                    <asp:TextBox ID="txttotalamount" runat="server" 
                        CssClass="col-sm-2 form-control" ></asp:TextBox>
                <%--<input type="text" class="col-sm-2 form-control">--%>
                </div>
              </div>
                  </asp:Panel>
            </div><!--container-fluid End-->
    </div>


 <script src="../../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="../../Scripts/notify.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function Validations() {
        var From = document.getElementById('<%=txtfrom.ClientID%>').value;
        var To = document.getElementById('<%=txtto.ClientID%>').value;
        if (From == "") 
        {
            alert("Please Enter From date");
            return false;
        }
        if (To == "")
         {
            alert("Please Enter To date");
            return false;
        }
      
    }
    </script>
  
</asp:Content>
