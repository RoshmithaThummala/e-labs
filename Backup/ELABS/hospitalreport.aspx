<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="hospitalreport.aspx.cs" Inherits="elabsproject.WebForm1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        
            <div class="container-fluid">
                <div class="row">
                    <div class="select-top">
                        LABORATORY REPORT
                    </div>
                </div>
                <asp:Panel ID="pnlcontents" runat="server">
                <div class="row">
                  <div class="pad_form13">
                        <div class="form-group">
                            <label class="col-sm-1 control-label">From</label>

                            <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>--%>
                            
                            <asp:ToolkitScriptManager ID="ToolkitScriptManager2" runat="server">
                            </asp:ToolkitScriptManager>

                            <%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                            </asp:ToolkitScriptManager>
--%>
                            <%--<div class="col-sm-3">
                              <input type="date" class="form-control">
                            </div>--%>
                           <div class="col-sm-3">
                             <asp:TextBox ID="txtfrom" runat="server" CssClass="form-control" 
                                   ></asp:TextBox>
                                 
                                   <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="txtfrom" runat="server">
                                   </asp:CalendarExtender>
                                       
                              <%-- <asp:Calendar ID="Calendar1" runat="server" 
                                   onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>--%>
                              
                             <%-- <asp:input type="date" class="form-control" ID="from"></asp:input>--%>
                            </div>
                            <label class="col-sm-1 control-label">To</label>
                           <%-- <div class="col-sm-3">
                              <input type="date" class="form-control">
                            </div>--%>
                            <div class="col-sm-3">
                             <asp:TextBox ID="txtto" runat="server" CssClass="form-control"></asp:TextBox>
                             
                             <asp:CalendarExtender ID="CalendarExtender2" TargetControlID="txtto" runat="server">
                             </asp:CalendarExtender>
                               <%-- <asp:Calendar ID="Calendar2" runat="server" 
                                    onselectionchanged="Calendar2_SelectionChanged"></asp:Calendar>--%>
                             
                           <%--   <input type="date" class="form-control" ID="to"/>--%>
                            </div>
                            <div class="col-sm-4 text-right" >
                                <asp:Button ID="btnok" runat="server" Text="Ok" CssClass="btn btn-primary" 
                                    onclick="btnok_Click" OnClientClick="return Validations();"  />
                                <%--<asp:Button ID="btnprint" runat="server" Text="Print"  
                                    CssClass="btn btn-primary" onclick="btnprint_Click"/>--%>
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
                                    CssClass="btn btn-primary" onclick="btnexcel_Click"/>
                                <asp:Button ID="btnclose" runat="server" Text="Close"  
                                    CssClass="btn btn-primary" onclick="btnclose_Click"/>
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
                              <asp:GridView ID="GridView1" runat="server" CellPadding="3" Width="1015px" 
                                  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
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


                    
                  <%--<select class="col-sm-2 form-control" >
                    <option>patient name</option>
                    <option></option>
                    <option></option>
                  </select>--%>
                  <asp:DropDownList ID="drppateintname" runat="server" CssClass="col-sm-2 form-control"> 
                       
                        <asp:ListItem>patient_name</asp:ListItem>
                        <asp:ListItem>address</asp:ListItem>
                        <asp:ListItem>villagecity</asp:ListItem>
                        <asp:ListItem>test_name</asp:ListItem>
                    </asp:DropDownList>

                    <asp:TextBox ID="TextBox1" runat="server" CssClass="col-sm-2 form-control" 
                        ontextchanged="TextBox1_TextChanged" AutoPostBack="true"></asp:TextBox>                
                  <%--<input type="text" class="col-sm-2 form-control">--%>
                    
                  <%--<select class="col-sm-2 form-control">
                    <option>Address</option>
                    <option></option>
                    <option></option>
                  </select>--%>
                  <asp:DropDownList ID="drpaddress" runat="server" CssClass="col-sm-2 form-control">
                        <asp:ListItem>patient_name</asp:ListItem>
                        <asp:ListItem>address</asp:ListItem>
                        <asp:ListItem>villagecity</asp:ListItem>
                        <asp:ListItem>test_name</asp:ListItem>
                        </asp:DropDownList>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="col-sm-2 form-control" 
                        ontextchanged="TextBox2_TextChanged" AutoPostBack="true"></asp:TextBox>
                  <%--<input type="text" class="col-sm-2 form-control">--%>

                <label class="col-sm-2 control-label">Total Amount</label>
              <asp:TextBox ID="txttotalamount" runat="server" CssClass="col-sm-2 form-control"></asp:TextBox>
                <%--<input type="text" class="col-sm-2 form-control">--%>
                </div>
              </div>
              </asp:Panel>  
            </div><!--container-fluid End-->
    </div>
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
