<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="completedreports.aspx.cs" Inherits="Elabs_Project.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui.min.js" type="text/javascript"></script>
    <link href="Styles/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="Styles/jquery-ui.structure.css" rel="stylesheet" type="text/css" />
    <link href="Styles/jquery-ui.theme.css" rel="stylesheet" type="text/css" />

 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        $(document).ready(function () {
            $('[id*="txtfromdate"]').datepicker({
                dateFormat: 'yy-mm-dd'
            });
        });

        $(document).ready(function () {
            $('[id*="txttodate"]').datepicker({
                dateFormat: 'yy-mm-dd'
            });
        });
    </script>

    <script type="text/javascript">
        function compl() {
            $("#div1").dialog({
                title: "Completed Reports",
                width: 400,
                resizable: false,
                buttons: {
                    Close: function () {
                        $(this).dialog('close');
                    }
                }
            });
        }
    </script>
    <div>
        <div class="container-fluid">

                <div class="row">
                    <div class="select-top">
                        COMPLETED REPORTS
                    </div>
                </div>

                <div class="row">
                    <div class="pad_form14">
                        <div class="form_group">
                            <div>
                               <%-- <label class="col2 col-sm-2 control-label">From Date:</label>
                                <asp:TextBox ID="txtfromdate" runat="server" CssClass="text_in17 form-control"></asp:TextBox>--%>
                                <%--<input type="date" class="text_in17 form-control">--%>

                               <%-- <label class="col2 col-sm-2 control-label">To Date:</label>
                                <asp:TextBox ID="txttodate" runat="server" CssClass="text_in17 form-control"></asp:TextBox>--%>
                                <%--<input type="date" class="text_in17 form-control">--%>
                               <%-- <asp:Button ID="btnok" runat="server" Text="Ok" CssClass="col-sm-1 btn btn-primary" />--%>
                                <%--<button class="col-sm-1 btn btn-primary">Ok</button>--%> 

                              <%--  <label class="col-sm-2 control-label">Parent Name:</label>
                                <asp:TextBox ID="txtparentname" runat="server" CssClass="text_in17 form-control"></asp:TextBox>
                                 <asp:Button ID="btnclose" runat="server" Text="Close" CssClass="col-sm-1 btn btn-primary" />
                            --%>
                                <%--<input type="date" class="text_in17 form-control">--%>

                                <%--<button class="col-sm-1 btn btn-primary">Close</button>--%>

                                 <asp:Label ID="lblfromdate" runat="server" Text="From Date:"></asp:Label>
                                <asp:TextBox ID="txtfromdate" runat="server"></asp:TextBox>
                                <asp:Label ID="lbltodate" runat="server" Text="To Date:"></asp:Label>
                                <asp:TextBox ID="txttodate" runat="server"></asp:TextBox>
                                <asp:Button ID="btnok" runat="server" Text="Ok" 
                                    CssClass="btn btn-primary br_mar" onclick="btnok_Click"  />
                                <asp:Label ID="patient" runat="server" Text="Patient Name:"></asp:Label>
                                <asp:DropDownList ID="drppatientname" runat="server" 
                                     AutoPostBack="true" 
                                    onselectedindexchanged="drppatientname_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:Button ID="btnclose" runat="server" Text="Close" 
                                    CssClass="btn btn-primary br_mar" onclick="btnclose_Click" />
                            </div>
                        </div>                        
                    </div>
                </div>

                <div class="row">
                    <div class="pad_form14">
                        <div class="form_group">
                           <%-- <label class="col-sm-2 control-label1">Patient Name :</label>
                            <label class="col-sm-2 control-label1">Age :</label>
                            <label class="col-sm-3 control-label1">Gender :</label>
                            <label class="col-sm-2 control-label">Select Result :</label>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="col-sm-3 form-control"></asp:DropDownList>--%>
                            <!-- <input type="text" class="col-sm-3 form-control"> -->
                            <%--<select class="col-sm-3 form-control">
                                <option></option>
                                <option></option>
                                <option></option>
                            </select>--%>

                            <asp:Label ID="lblpatient_name" runat="server" Text="Patient Name :"></asp:Label>
                             <asp:Label ID="lblpatientname" runat="server" Text=""></asp:Label>
                              &nbsp;
                              &nbsp;
                               &nbsp;
                             <asp:Label ID="lblage1" runat="server" Text="Age :"></asp:Label>
                             <asp:Label ID="lblage" runat="server" Text=""></asp:Label>
                              &nbsp;
                              &nbsp;
                               &nbsp;
                              <asp:Label ID="lblgen" runat="server" Text="Gender :"></asp:Label>
                             <asp:Label ID="lblgender" runat="server" Text=""></asp:Label>
                              &nbsp;
                              &nbsp;
                              &nbsp;
                             <asp:Label ID="lbleselect" runat="server" Text="Select Result :"></asp:Label>
                             <asp:DropDownList ID="drpselectresult" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-grid col_form">
                        <div class="table-responsive">
                              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  
                                 CssClass="table table-bordered table-striped-column" CellPadding="4" 
                                ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="true" />
                                </ItemTemplate>
                                </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sample Date" SortExpression="sample_date">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("sample_date") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("sample_date") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tset Name" SortExpression="test_name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("test_name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("test_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Test Group Name" 
                                        SortExpression="test_group_name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("test_group_name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("test_group_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Result" SortExpression="result">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("result") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("result") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Patient Id" SortExpression="patient_id">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("patient_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("patient_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
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
                            <%--<asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
                            <%--<table class="table table-bordered table-striped-column">
                              <thead>
                                <tr>
                                      <th>Sample Date</th>
                                      <th>Test Name</th>
                                      <th>Test Group Name</th>
                                      <th>Result</th>
                                </tr>
                              </thead>
                              <tbody>
                                  <tr>
                                      <td><h4>Grid System</h4></td>
                                      <td><h4>Grid System</h4></td>
                                      <td><h4>Grid System</h4></td>
                                      <td><h4>Grid System</h4></td>
                                  </tr>
                                                           
                              </tbody>
                            </table>--%>
                        </div>
                    </div>
                </div>
                  <div id="div1" style="display: none;">
                <p>Result Updated Successfully</p>
                </div>
            </div>
    </div>
</asp:Content>
