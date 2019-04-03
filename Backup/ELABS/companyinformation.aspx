<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="companyinformation.aspx.cs" Inherits="Elabs_Asp_Project.companyinformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div>
        <div class="container-fluid login_container">

                <div class="row">
                    <div class="select-top">
                        LAB INFO
                    </div>
                </div>
                
                <br>
                <div class="row">
                    <div class="col-md-6 col-sm-offset-7">
                        <asp:Button ID="btnregisternow" runat="server" Text="Register Now" 
                            CssClass="btn btn-primary" onclick="btnregisternow_Click" />
                        <asp:Button ID="btnupdate" runat="server" Text="Update" 
                            CssClass="btn btn-primary" onclick="btnupdate_Click"/>
                        <asp:Button ID="btnclose" runat="server" Text="Close" 
                            CssClass="btn btn-primary" onclick="btnclose_Click"/>
                        <%--<button class="btn btn-primary">Register Now</button>
                        <button class="btn btn-primary">Update</button>
                        <button class="btn btn-primary">Close</button>--%>
                        <br />
                    </div> 
                </div>
                <br>

                <div class="row">
                    <div class="pdform">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="name" class="col-sm-3 control-label">Company Name :</label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtlabname" runat="server" CssClass="form-control"></asp:TextBox>
                                    <%--<input type="text" class="form-control" placeholder="Enter Lab Name" value="">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-sm-3 control-label">Address :</label>
                                <div class="col-sm-6">
                                     <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control"></asp:TextBox>
                                     <%--<input type="address" class="form-control"placeholder="Enter Present Address" value="">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="name" class="col-sm-3 control-label">Technician Name :</label>
                                <div class="col-sm-6">
                                     <asp:TextBox ID="txttechnicianname" runat="server" CssClass="form-control"></asp:TextBox>
                                     <%--<input type="text" class="form-control" id="email" name="email" placeholder="Enter Technician Name" value="">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-sm-3 control-label">Contact No :</label>
                                <div class="col-sm-6">
                                     <asp:TextBox ID="txtcontactno" runat="server" CssClass="form-control"></asp:TextBox>
                                     <%--<input type="number" class="form-control" placeholder="Enter Your Mobile Number" value="">--%>
                                </div>
                                <br />
                            </div> 
                        </form>
                    </div>
                </div>          

            </div><!--container-fluid End-->
    </div>
</asp:Content>
