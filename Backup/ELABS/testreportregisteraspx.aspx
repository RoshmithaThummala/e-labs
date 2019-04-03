<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="testreportregisteraspx.aspx.cs" Inherits="elabReports.WebForm1" %>

<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<link href="css/jquery-ui-1.8.19.custom.css" rel="stylesheet" type="text/css" />
<script src="Scripts/jquery-1.7.2.js" type="text/javascript"></script>
<script src="Scripts/jquery-ui-1.8.19.custom.min.js" type="text/javascript"></script>

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/ui-lightness/jquery-ui.css"><script src="Scripts/jquery-ui-1.8.19.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


<script type="text/javascript">

    $(document).ready(function () {
        $("input[id$='txtfrom']").datepicker();
    });

    $(document).ready(function () {
        $("input[id$='txtto']").datepicker();
    });

    $('.row').keypress(function (e) {
        if (e.which == 13) {
            e.preventDefault(); //stops default action: submitting form
            $(this).blur();
            $('#txtsearch1').focus().click();
        }
    });

    function validations() {
        var from = document.getElementById('<%=txtfrom.ClientID %>').value
        var to = document.getElementById('<%=txtto.ClientID %>').value

        if (from == "") {
            alert("please enter the From");
            return false;
        }
        if (to == "") {
            alert("please enter the To");
            return false;
        }
    }

    function isAlpha(e, t) {
        try {
            if (window.event) {
                var charCode = window.event.keyCode;
            }
            else if (e) {
                var charCode = e.which;
            }
            else { return true; }
            if ((charCode > 64 && charCode <= 91) || (charCode >= 96 && charCode <= 123) || (charCode==13))
                return true;
            else
                alert('Please Enter Only Characters');
            return false;
        }
        catch (err) {
            alert(err.Description);
        }
    }


</script>

<style type="text/css">
.ui-datepicker { font-size:8pt !important}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div>
           <div class="container-fluid">
                <div class="row">
                    <div class="select-top">
                        TEST REPORTS REGISTER
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-12 text-right">
             
                             <asp:Button ID="btnok" runat="server" Text="Ok" CssClass="btn btn-primary" 
                                 onclick="btnok_Click" OnClientClick="return validations()" />
                              <asp:Button ID="btnexcel" runat="server" Text="Excel" 
                                 CssClass="btn btn-primary" onclick="btnexcel_Click" />
                               <asp:Button ID="btnclose" runat="server" Text="Close" 
                                 CssClass="btn btn-primary" onclick="btnclose_Click" />
                    </div>
                </div><br>

               
                <div class="row">
                    <div class="pad_form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">From</label>
                            <div class="col-sm-3">
                           <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
                           <asp:TextBox ID="txtfrom" runat="server" CssClass="form-control" ></asp:TextBox>
                           <%--<cc1:CalendarExtender ID="CalendarExtender1" TargetControlID="txtfrom" runat="server" />--%>
                              <%--<input type="date" class="form-control">--%>
                            </div>
                            <label class="col-sm-2 control-label">To</label>
                            <div class="col-sm-3">
                            <asp:TextBox ID="txtto" runat="server" CssClass="form-control" ></asp:TextBox>
                            <%-- <cc1:CalendarExtender ID="CalendarExtender2" TargetControlID="txtto" runat="server" />--%>
                              <%--<input type="date" class="form-control">--%>
                            </div>                      
                        </div>
                    </div>
                </div>
              
                <div class="row">
                    <div class="form-grid col_form">
                        <div class="table-responsive">
                            <asp:GridView ID="gvTransactionReg" runat="server" BackColor="White" 
                                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                                Width="1000px">
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
                                      <th>Ref. By</th>
                                      <th>Address</th>
                                      <th>City</th>
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
                  <div class="pad_form14">
                      <asp:DropDownList ID="ddlsearch1" runat="server" 
                          CssClass="col-sm-2 form-control">
                          
                           <asp:ListItem>------select-------</asp:ListItem>
                          <asp:ListItem>patient_name</asp:ListItem>
                          <asp:ListItem>test_name</asp:ListItem>
                          <asp:ListItem>address</asp:ListItem>
                          <asp:ListItem>villagecity</asp:ListItem>
                         
                          </asp:DropDownList>
                      <%--<select class="col-sm-2 form-control" >
                      <option>patient name</option>
                      <option></option>
                      <option></option>
                    </select>--%>
                            <asp:TextBox ID="txtsearch1" runat="server" CssClass="form-control" 
                          ontextchanged="txtsearch1_TextChanged" AutoPostBack="true" 
                          onkeypress="return isAlpha(event,this);" Width="160px" ></asp:TextBox>
                      <asp:DropDownList ID="ddlsearch2" runat="server" 
                          CssClass="col-sm-2 form-control">
                          
                           <asp:ListItem>------Select-------</asp:ListItem>
                          <asp:ListItem>patient_name</asp:ListItem>
                          <asp:ListItem>test_name</asp:ListItem>
                          <asp:ListItem>address</asp:ListItem>
                          <asp:ListItem>villagecity</asp:ListItem>
                          
                          </asp:DropDownList>

                      <%--<input type="text" class="col-sm-2 form-control">--%> 
                       <%--<select class="col-sm-2 form-control">
                      <option>Village/City</option>
                      <option></option>
                      <option></option>
                    </select>--%>

                    <asp:TextBox ID="txtsearch2" runat="server" CssClass="form-control" 
                          ontextchanged="txtsearch2_TextChanged1" Height="26px" Width="159px" onkeypress="return isAlpha(event,this);" ></asp:TextBox>

                    <%--<input type="text" class="col-sm-2 form-control" id="txtsearch2" >--%>

                  <label class="col-sm-2 control-label">Total Amount</label>
                   <asp:TextBox ID="txttotalamount" runat="server" CssClass="col-sm-2 form-control" ></asp:TextBox>

                  <%--<input type="text" class="col-sm-2 form-control">--%>
                  </div>
                </div>
            </div><!--container-fluid End-->
    </div>



</asp:Content>
