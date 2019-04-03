<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="homescreen.aspx.cs" Inherits="ELabs.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(function () {
        $('[id*="txtfrom"]').datepicker();
    });
  </script>
   <script type="text/javascript">
       $(function () {
           $('[id*="txtto"]').datepicker();
       });
  </script>
    <script type="text/javascript">
        $(function () {
            $('[id*="TextBox6"]').datepicker();
        });
  </script>
    <script type="text/javascript">
        $(function () {
            $('[id*="TextBox7"]').datepicker();
        });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
           <div class="container-fluid">

              <ul class="nav nav-tabs nav-justified">
    <li class="active"><a data-toggle="tab" href="#home">Daily Summary</a></li>
    <li><a data-toggle="tab" href="#menu1">Test Wise Comparision</a></li>
    <li><a data-toggle="tab" href="#menu2">Doctor Wise Comparision</a></li>
    <li><a data-toggle="tab" href="#menu3">Date Wise Comparision</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <div class="row">
        <div class="pad_form13">
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
                <asp:Button ID="btnclose" runat="server" Text="Close" 
                    CssClass="btn btn-primary" onclick="btnclose_Click1" />
             <%-- <button class="btn btn-primary">Ok</button>
              <button class="btn btn-primary">Close</button>--%>
            </div>
          </div>
</div></div>
<%--<div class="row pad_form15">
                  <div class="col-sm-6">
                    <div class="row">
                      <div class="form-grid col_form">
                          <div class="table-responsive">--%>  
                          
                          <div style="background-color:Gray;">
                          <div style="position:absolute;">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                                  <Columns>
                                      <asp:TemplateField HeaderText="Test Name">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("test_name") %>'></asp:TextBox></EditItemTemplate><ItemTemplate>
                                              <asp:Label ID="Label1" runat="server" Text='<%# Bind("test_name") %>'>></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="No.Of Tests">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("nooftests") %>'>></asp:TextBox></EditItemTemplate><ItemTemplate>
                                              <asp:Label ID="Label2" runat="server" Text='<%# Bind("nooftests") %>'>></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Cost">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("cost") %>'>></asp:TextBox></EditItemTemplate><ItemTemplate>
                                              <asp:Label ID="Label3" runat="server" Text='<%# Bind("cost") %>'>></asp:Label></ItemTemplate></asp:TemplateField></Columns></asp:GridView><%--<table class="table table-bordered table-striped-column">
                                <thead>
                                  <tr>
                                        <th>Date</th>
                                        <th>Number of Tests</th>
                                  </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>                              
                                </tbody>
                              </table>--%>
                              </div>
                              <%--</div></div></div>--%>
                              <%--<div class="col-sm-6">
                    <div class="row">
                      <div class="form-grid col_form">
                          <div class="table-responsive">--%>
                          <div style="position:absolute;left:400px;margin-top:0px;">
                              <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="266px">
                              <HeaderTemplate>
                              <table>
                              <tr>
                              <th><span>Particulars </span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<span>Values</span></th>
                              </tr>
                     
                              </table>
                              </HeaderTemplate>
                         
                              </asp:DetailsView>
                             <%-- <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False">
                                  <Columns>
                                      <asp:TemplateField HeaderText="Perticulars"><EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("test_name") %>'></asp:TextBox></EditItemTemplate><ItemTemplate>
                                              <asp:Label ID="Label1" runat="server" Text='<%# Bind("test_name") %>'>></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField 
                                                                  HeaderText="Value"><EditItemTemplate>
                                              <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("nooftests") %>'>></asp:TextBox></EditItemTemplate><ItemTemplate>
                                              <asp:Label ID="Label2" runat="server" Text='<%# Bind("nooftests") %>'>></asp:Label></ItemTemplate></asp:TemplateField></Columns></asp:GridView><table class="table table-bordered table-striped-column">
                                <thead>
                                  <tr>
                                        <th>Date</th>
                                        <th>Number of Tests</th>
                                  </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>                              
                                </tbody>
                              </table>--%></div>
                              
                              <%--</div></div></div>--%>
                              
                              <%--<div class="col-sm-6">
                    <div class="row">
                    <div class="form-grid col_form">
                        <div class="table-responsive">--%>
                        <div style="position:absolute;margin-left:575px;margin-top:0px">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="Doctor Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ref_by") %>'></asp:TextBox></EditItemTemplate><ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ref_by") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Test Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("test_name") %>'></asp:TextBox></EditItemTemplate><ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("test_name") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Total Cost">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("cost") %>'></asp:TextBox></EditItemTemplate><ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("cost") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Comission">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Commission") %>'></asp:TextBox></EditItemTemplate><ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Commission") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Patient Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("patient_name") %>'></asp:TextBox></EditItemTemplate><ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("patient_name") %>'></asp:Label></ItemTemplate></asp:TemplateField></Columns></asp:GridView><%--<table class="table table-bordered table-striped-column">
                              <thead>
                                <tr>
                                      <th>Daily Summary</th>
                              </thead>
                              <tbody>
                                  <tr>
                                      <td>&nbsp;</td>
                                  </tr>                              
                              </tbody>
                            </table>--%></div>
                            <%--</div></div>
                            
                            </div>
                            --%>
                            <%--<div class="col-sm-6">
                    <div class="row">
                      <div class="form-grid col_form">
                          <div class="table-responsive">--%>
                          <div style="position:absolute;margin-top:150px;margin-left:20%;">
                              <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False">
                                  <Columns>
                                      <asp:TemplateField HeaderText="Date">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("reporting_date") %>'></asp:TextBox></EditItemTemplate><ItemTemplate>
                                              <asp:Label ID="Label2" runat="server" Text='<%# Bind("reporting_date") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Noof Tests">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nooftests") %>'></asp:TextBox></EditItemTemplate><ItemTemplate>
                                              <asp:Label ID="Label1" runat="server" Text='<%# Bind("nooftests") %>'></asp:Label></ItemTemplate></asp:TemplateField></Columns></asp:GridView><%--<table class="table table-bordered table-striped-column">
                                <thead>
                                  <tr>
                                        <th>Date</th>
                                        <th>Number of Tests</th>
                                  </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>                              
                                </tbody>
                              </table>--%></div><%--</div></div></div></div>--%><%--  <div class="table-responsive">
                              <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False">
                                  <Columns>
                                      <asp:TemplateField HeaderText="Date">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("reporting_date") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label1" runat="server" '<%# Bind("reporting_date") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Noof Tests">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox2" runat="server" '<%# Bind("nooftests") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label2" runat="server" '<%# Bind("nooftests") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                  </Columns>
                              </asp:GridView>
                              </div>--%>
                              
                              </div>
                              </div>
                              <div id="menu1" class="tab-pane fade">
      <div class="row">
        <div class="pad_form14">
          <div class="form-group">
            <label class="col-sm-1 control-label">From</label>
              <div class="col-sm-3">
                 <asp:TextBox ID="txtfromtestwise" runat="server" CssClass="form-control"></asp:TextBox>
                <%--<input type="date" class="form-control">--%>
              </div>
            <label class="col-sm-1 control-label">To</label>
            <div class="col-sm-3">
                 <asp:TextBox ID="txttotestwise" runat="server" CssClass="form-control"></asp:TextBox>
              <%--<input type="date" class="form-control">--%>
            </div>
            <div class="col-sm-4 text-right" >
                <asp:Button ID="btnoktestwise" runat="server" Text="Ok" CssClass="btn btn-primary" OnClick="btnoktestwise_Click" />
                <asp:Button ID="btnclosetestewise" runat="server" CssClass="btn btn-primary" 
                    Text="Close" onclick="btnclosetestewise_Click" />
             <%-- <button class="btn btn-primary">Ok</button>
              <button class="btn btn-primary">Close</button>--%>
            </div>
          </div>
        </div>                    
      </div>
      <div class="row pad_form15">
                  <div class="col-sm-6">
                    <div class="row">
                      <div class="form-grid col_form">
                          <div class="table-responsive">
                              <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false" Width="472">
                              
                                <Columns>
                                      <asp:TemplateField HeaderText="Test Name">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("test_name")%>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label1" runat="server" Text='<%# Bind("test_name")%>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="No.of Tests">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("nooftests")%>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label2" runat="server"  Text='<%# Bind("nooftests") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                  </Columns>
                              <EditRowStyle BackColor="#999999" HorizontalAlign="Center" 
                                    VerticalAlign="Middle" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Center" VerticalAlign="Middle" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Center" VerticalAlign="Middle" />
                                <PagerSettings NextPageText="&quot;Next&quot;" 
                                    PreviousPageText="&quot;Prev&quot;" Visible="False" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" 
                                    VerticalAlign="Middle" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                              </asp:GridView>
                              <%--<table class="table table-bordered table-striped-column">
                                <thead>
                                  <tr>
                                        <th>Test Name</th>
                                        <th>Number of Tests</th>
                                  </tr>
                                </thead>
                                <tbody>
                                    <tr>
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

                            <asp:Chart ID="Chart1" runat="server">
                                <Series>
                                    <asp:Series Name="Series1">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>

                         <%--   <asp:GridView ID="GridView4" runat="server"></asp:GridView>--%>
                            <%--<table class="table table-bordered table-striped-column">
                              <thead>
                                <tr>
                                      <th>Test wise Comparision Graph Here</th>
                              </thead>
                              <tbody>
                                  <tr>
                                      <td>&nbsp;</td>
                                  </tr>                              
                              </tbody>
                            </table>--%>
                        </div>
                    </div>
                </div>
            </div>
          </div>
    </div>
    <div id="menu2" class="tab-pane fade">
   <div class="container-fluid">
              
               
                <div class="row">
                  <div class="pad_form13">
                        <div class="form-group">
                            <label class="col-sm-1 control-label">From</label>
                            <div class="col-sm-3">
                          <%--      <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                                </asp:ToolkitScriptManager>--%>
                            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>
                              <%--  <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtfrom">
                                </asp:CalendarExtender>--%>
                              <%--<input type="date" class="form-control">--%>
                            </div>
                            <label class="col-sm-1 control-label">To</label>
                            <div class="col-sm-3">
                            <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" ></asp:TextBox>
                             <%--   <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtto">
                                </asp:CalendarExtender>--%>
                              <%--<input type="date" class="form-control">--%>
                            </div>
                            <div class="col-sm-4 text-right" >
                                  <asp:Button ID="Button1" runat="server" Text="Ok" CssClass="btn btn-primary" 
                                      onclick="Button1_Click" />
                                  <asp:Button ID="Button2" runat="server" Text="Close" CssClass="btn btn-primary" 
                                      onclick="Button2_Click" />
                 
                            <%--  <button class="btn btn-primary">Ok</button>
                              <button class="btn btn-primary">Close</button>--%>
                            </div>
                        </div>
                    </div>                    
                </div> 

                <div class="row pad_form15">
                  <div class="col-sm-6">
                    <div class="row">
                      <div class="form-grid col_form">
                          <div class="table-responsive">
                          
                              <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" Width="472">
                                  <Columns>
                                      <asp:TemplateField HeaderText="Doctor">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ref_by") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label1" runat="server" Text='<%# Bind("ref_by") %>'>></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="No of Tests">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("nooftests") %>'>></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label2" runat="server" Text='<%# Bind("nooftests") %>'>></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                  </Columns>
                                  <EditRowStyle BackColor="#999999" HorizontalAlign="Center" 
                                    VerticalAlign="Middle" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Center" VerticalAlign="Middle" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Center" VerticalAlign="Middle" />
                                <PagerSettings NextPageText="&quot;Next&quot;" 
                                    PreviousPageText="&quot;Prev&quot;" Visible="False" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" 
                                    VerticalAlign="Middle" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                              </asp:GridView>
                              <%--<table class="table table-bordered table-striped-column">
                                <thead>
                                  <tr>
                                        <th>Test Name</th>
                                        <th>Number of Tests</th>
                                  </tr>
                                </thead>
                                <tbody>
                                    <tr>
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

                            <asp:Chart ID="Chart2" runat="server">
                                <Series>
                                    <asp:Series Name="Series1">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>

                           <%-- <asp:GridView ID="GridView6" runat="server"></asp:GridView>--%>
                            <%--<table class="table table-bordered table-striped-column">
                              <thead>
                                <tr>
                                      <th>Test wise Comparision Graph Here</th>
                              </thead>
                              <tbody>
                                  <tr>
                                      <td>&nbsp;</td>
                                  </tr>                              
                              </tbody>
                            </table>--%>
                        </div>
                    </div>
                </div>
            </div>
          </div>  
                
            </div>
    </div>
    <div id="menu3" class="tab-pane fade">
      <div class="row">
        <div class="pad_form14">
          <div class="form-group">
            <label class="col-sm-1 control-label">From</label>
              <div class="col-sm-3">
              <asp:TextBox ID="txtfromdatewise" runat="server" CssClass="form-control"></asp:TextBox>
                <%--<input type="date" class="form-control">--%>
              </div>
            <label class="col-sm-1 control-label">To</label>
            <div class="col-sm-3">
             <asp:TextBox ID="txttodatewise" runat="server" CssClass="form-control"></asp:TextBox>
              <%--<input type="date" class="form-control">--%>
            </div>
            <div class="col-sm-4 text-right" >
                <asp:Button ID="btnokdatewise" runat="server" Text="Ok" CssClass="btn btn-primary" onclick="btnokdatewise_Click" />
                <asp:Button ID="btnclosedatewise" runat="server" Text="Close" 
                    CssClass="btn btn-primary" onclick="btnclosedatewise_Click" />
            <%--  <button class="btn btn-primary">Ok</button>
              <button class="btn btn-primary">Close</button>--%>
            </div>
          </div>
        </div>                    
      </div>
      <div class="row pad_form15">
                  <div class="col-sm-6">
                    <div class="row">
                      <div class="form-grid col_form">
                          <div class="table-responsive">
                              <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="false" Width="472">
                              
                                <Columns>
                                      <asp:TemplateField HeaderText="Date">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("reporting_date") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label1" runat="server" Text='<%# Bind("reporting_date") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="No of Tests">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("nooftests") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label2" runat="server" Text='<%# Bind("nooftests") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                  </Columns>
                              
                              <EditRowStyle BackColor="#999999" HorizontalAlign="Center" 
                                    VerticalAlign="Middle" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Center" VerticalAlign="Middle" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Center" VerticalAlign="Middle" />
                                <PagerSettings NextPageText="&quot;Next&quot;" 
                                    PreviousPageText="&quot;Prev&quot;" Visible="False" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" 
                                    VerticalAlign="Middle" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                              
                              </asp:GridView>
                              <%--<table class="table table-bordered table-striped-column">
                                <thead>
                                  <tr>
                                        <th>Date</th>
                                        <th>Number of Tests</th>
                                  </tr>
                                </thead>
                                <tbody>
                                    <tr>
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
                            <asp:Chart ID="Chart3" runat="server">
                                <Series>
                                    <asp:Series Name="Series1">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                         <%--   <asp:GridView ID="GridView8" runat="server"></asp:GridView>--%>
                            <%--<table class="table table-bordered table-striped-column">
                              <thead>
                                <tr>
                                      <th>Date wise Comparision Graph Here</th>
                              </thead>
                              <tbody>
                                  <tr>
                                      <td>&nbsp;</td>
                                  </tr>                              
                              </tbody>
                            </table>--%>
                        </div>
                    </div>
                </div>
            </div>
          </div>
    </div>
  </div>
                
                
            </div><!--container-fluid End-->
    </div>
</asp:Content>
