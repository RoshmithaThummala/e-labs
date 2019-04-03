<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="userinformation.aspx.cs" Inherits="Elabs_Asp_Project.userinformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div>
          <div class="container-fluid login_container">

                <div class="row">
                    <div class="select-top">
                        USER'S INFORMATION
                    </div>
                </div>

                <div class="row">
                    <div class="pad_form">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">User Name :</label>
                                <div class="col-sm-5">
                            <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" ></asp:TextBox>

                                    <%--<input type="text" class="form-control" placeholder="Enter Lab Name" value="">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-sm-3 control-label">Position :</label>
                                <div class="col-sm-5">
                                    <asp:DropDownList ID="drpposition" runat="server" CssClass="form-control" 
                                        BackColor="White" EnableTheming="True" 
                                        >
                                       <asp:ListItem Value=""></asp:ListItem>
                                        <asp:ListItem Value="Admin">Admin</asp:ListItem>
                                        <asp:ListItem Value="Technician">Technicion</asp:ListItem>
                                         <asp:ListItem Value="operation">operation</asp:ListItem>
                                    </asp:DropDownList>
                                    <%--<select class="form-control" id="sell">
                                            <option>&nbsp;</option>
                                            <option>&nbsp;</option>
                                            <option>&nbsp;</option>
                                        </select>--%>
                                </div>
                            </div>  
                             <div class="form-group">
                                <label class="col-sm-3 control-label">Password :</label>
                                <div class="col-sm-5">
                            <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control"  TextMode="Password"></asp:TextBox>

                                    <%--<input type="password" class="form-control" placeholder="Enter Lab Name" value="">--%>
                                </div>
                            </div> 
                            <br />                       
                            <div class="form-group">
                                <div class="form-btn"> 
                                    <br />
                                    <asp:Button ID="btnadd" runat="server" Text="Add" CssClass="btn btn-primary" 
                                        onclick="btnadd_Click" />                            
                                    <%--<button class="btn btn-primary" title="Go to Back page"> Add </button>--%>
                                </div>
                            </div> 
                        </form>
                    </div>
                </div>          

            </div><!--container-fluid End-->
    </div>
</asp:Content>
