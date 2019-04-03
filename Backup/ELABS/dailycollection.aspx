<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="dailycollection.aspx.cs" Inherits="DOCTORproject.WebForm3" %>
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
<script type="text/javascript">
    function printcontent() {

        var print = document.getElementById('print');
        var winprint = window.open("", '', 'left=100,top=100,width=1000,height=1000,tollbar=0,scrollbars=1,status=0,resizable=1');
        winprint.document.write(print.innerHTML);
        winprint.document.close();
        winprint.focus();
        winprint.print();
    }
</script>

 <div>
            <div class="container-fluid">
                <div class="row">
                    <div class="select-top">
                        DAILY COLLECTION
                    </div>
                </div>
                <div class="row">
                  <div class="pad_form14">
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
                              <asp:Button ID="btnprint" runat="server" Text="Print" CssClass="btn btn-primary" 
                                    onclick="btnprint_Click" OnClientClick="return printcontent()" />
                              <asp:Button ID="btnclose" runat="server" Text="Close" CssClass="btn btn-primary" 
                                    onclick="btnclose_Click" />
                             <%-- <button class="btn btn-primary">Ok</button>
                              <button class="btn btn-primary">Print</button>
                              <button class="btn btn-primary">Close</button>--%>
                            </div>
                        </div>
                    </div>                    
                </div>
                <div id="print">
                <div class="row pad_form15">
                  <div class="col-sm-6">
                    <div class="row">
                      <div class="form-grid col_form">
                          <div class="table-responsive">
                         &nbsp;<asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                                  GridLines="None">
                                  <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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

                  </div>
                  <div class="col-sm-6">
                    <div class="row">
                    <div class="form-grid col_form">
                        <div class="table-responsive">
                         &nbsp;<asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" 
                                GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
            </div>
          </div>
         <br />
            <div class="row">
              <div class="pad_form14 text-center">
              <label class="col-sm-2 control-label">Pending Balence</label>
              <asp:TextBox ID="txtpendingbalance" runat="server" CssClass="col-sm-2 form-control"></asp:TextBox>
              <%--<input type="text" class="col-sm-2 form-control">--%>
              <label class="col-sm-2 control-label">total Collection</label>
              <asp:TextBox ID="txttotalcollection" runat="server" CssClass="col-sm-2 form-control"></asp:TextBox>
              <%--<input type="text" class="col-sm-2 form-control">--%>
              <label class="col-sm-2 control-label">Total Commission</label>
               <asp:TextBox ID="txttotalcomission" runat="server" CssClass="col-sm-2 form-control"></asp:TextBox>
                </div>
              <%--<input type="text" class="col-sm-2 form-control">--%>
              </div>
            </div>
                
            </div><!--container-fluid End-->
    </div>
</asp:Content>
