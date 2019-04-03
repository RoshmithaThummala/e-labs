<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="commisionreporttestwise.aspx.cs" Inherits="elabReports.WebForm3" %>

<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/notify.js" type="text/javascript"></script>

<link href="css/jquery-ui-1.8.19.custom.css" rel="stylesheet" type="text/css" />
<script src="Scripts/jquery-1.7.2.js" type="text/javascript"></script>
<script src="Scripts/jquery-ui-1.8.19.custom.min.js" type="text/javascript"></script>

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/ui-lightness/jquery-ui.css"><script src="Scripts/jquery-ui-1.8.19.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


<script type="text/javascript">

    $(document).ready(function () {
        $("input[id$='txtfromCT']").datepicker();
    });
    $(document).ready(function () {
        $("input[id$='txttoCT']").datepicker();
    });

    function isAlpha(e, t) {
        try {
            if (window.event) {
                var charCode = window.event.keyCode;
            }
            else if (e) {
                var charCode = e.which;
            }
            else { return true; }
            if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123))
                return true;
            else
                alert('Please Enter Only Characters');
            return false;
        }
        catch (err) {
            alert(err.Description);
        }
    }
    function validations() {
        var from = document.getElementById('<%=txtfromCT.ClientID %>').value
        var to = document.getElementById('<%=txttoCT.ClientID %>').value

        if (from == "") {
             alert("fromDate should not be empty");
//            $('#txtfromCT').notify("please enter from date", { position: "right" });
//            $('#txtfromCT').next().show();
            return false;
        }
        if (to == "") {
            alert("ToDate should not be empty");
//            $('#txttoCT').notify("please enter to date", { position: "right" });
//            $('#txttoCT').next().show();
            return false;
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
           <div class="container-fluid">
                <div class="row">
                    <div class="select-top">
                        COMMISSION REPORT TEST WISE
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-12 text-right">
                        <asp:Button ID="btnok" runat="server" Text="Ok" CssClass="btn btn-primary" 
                            onclick="btnok_Click" onclientclick="return validations()" />
                      <%--  <asp:Button ID="btnprint" runat="server" Text="Print" CssClass="btn btn-primary"  />--%>
                      <input id="btnprint" type="button" value="Print" 
                            style="background-color:#0077b3; height: 33px;" onclick = "PrintGridData()"/>

                         <script type="text/javascript">
                             function PrintGridData() {
                                 var prtGrid = document.getElementById('<%=pnlContents.ClientID %>');
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
                      <%--  <button class="btn btn-primary">Ok</button>
                        <button class="btn btn-primary">Print</button>
                        <button class="btn btn-primary">Excel</button>
                        <button class="btn btn-primary">Close</button>--%>
                    </div>
                </div><br>

                <asp:Panel id="pnlContents" runat = "server">
                <div class="row">
                    <div class="pad_form14"><div class="formula">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Doctor Name</label>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtdoctornameCT" runat="server" CssClass="form-control" onkeypress="return isAlpha(event,this);"></asp:TextBox>
                              <%--<input type="date" class="form-control">--%>
                            </div>
                            <label class="col-sm-1 control-label">From</label>
                            <div class="col-sm-2">
                                <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
                                <asp:TextBox ID="txtfromCT" runat="server" CssClass="form-control" onclick="return ValidateForm()" maxlength="10" ></asp:TextBox>
                               <%--<cc1:CalendarExtender ID="CalendarExtender1" TargetControlID="txtfromCT" runat="server" />--%>
                              <%--<input type="date" class="form-control">--%>
                            </div>
                            <label class="col-sm-1 control-label">To</label>
                            <div class="col-sm-2">
                                <asp:TextBox ID="txttoCT" runat="server" CssClass="form-control"></asp:TextBox>
                                <%--<cc1:CalendarExtender ID="CalendarExtender2" TargetControlID="txttoCT" runat="server" />--%>
                              <%--<input type="date" class="form-control">--%>
                            </div>                      
                        </div>
                    </div></div>
                </div>

                <div class="row">
                    <div class="form-grid col_form">
                        <div class="table-responsive">

                            <asp:GridView ID="gvComnTestWise" runat="server" CellPadding="3" 
                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                                Width="1010px">
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
                                      <th>Date</th>
                                      <th>OPD</th>
                                      <th>Patient Name</th>
                                      <th>Group</th>
                                      <th>Test</th>
                                      <th>Result</th>
                                      <th>Units</th>
                                      <th>Cost</th>
                                      <th>Commission</th>
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
                  <div class="pad_form14 text-center">
                  <label class="col-sm-3 control-label">total Cost</label>
                      <asp:TextBox ID="txttotalcostCT" runat="server" CssClass="form-control" 
                          Width="164px"></asp:TextBox>
                  <%--<input type="text" class="col-sm-3 form-control">--%>
                  <label class="col-sm-2 control-label">Total Commission</label>
                   <asp:TextBox ID="txttotalcommisssionCT" runat="server" CssClass="form-control" 
                          Width="163px"></asp:TextBox>
          <%--        <input type="text" class="col-sm-3 form-control">--%>
                  </div>
                </div>
                </asp:Panel>
            </div><!--container-fluid End-->
    </div>
</asp:Content>
