<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ELABS.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
        <div class="container-fluid login_container ">

				<div class="row">
					<div class="select-top">
						LOGIN
					</div>
				</div>

				<br>
				<div class="row">
					<div class="col-sm-4 enter-top" title="Select one Option">
							<h5>Step &nbsp;&nbsp;<a href="">[1]</a>&nbsp;&nbsp;<a href="">[2]</a>&nbsp;&nbsp; Enter Password</h5>
					</div>
				</div>
				<br>
				
				<div class="row">
					<div class="">

					</div>
				</div>

				<div class="row">
					<div class="pad_form">
						<div class="form-horizontal fh">
						    <div class="form-group">
						        <label for="name" class="col-sm-2 control-label">User Name :</label>
						        <div class="col-sm-4">
                                    <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" placeholder="Enter User Name"></asp:TextBox>
                                    <%--<input type="email" class="form-control" id="email" name="email" placeholder="Enter User Name" value="">--%>
						        </div>
						    </div>
						    <div class="form-group">
						        <label for="email" class="col-sm-2 control-label">Password :</label>
						        <div class="col-sm-4">
                                    <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" 
                                        placeholder="Type Password" TextMode="Password"></asp:TextBox>
                                    <%--<input type="password" class="form-control" id="password" name="password" placeholder="Type Password" value="">--%>
						        </div>
						    </div>	
                            <%-- <div class="form-group">						        
						        <div class="col-sm-6">
						            <input type="checkbox"> Remember My Name						            
						        </div>
						    </div>--%>						    
						    <div class="form-group">
						        <div class="col-sm-10">
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    <asp:Button ID="btnlogin" runat="server" Text="Login" 
                                        CssClass="btn btn-primary" onclick="btnlogin_Click" />
                                    <asp:Button ID="btnback" runat="server" Text="Back" CssClass="btn btn-primary" 
                                        onclick="btnback_Click"/>
						        	<%--<input type="button" class="btn btn-primary" value="Login">
						        	<input type="button" class="btn btn-primary" value="Back">
						        --%></div>
						    </div>				    
						</div>
					</div>
				</div>			

			</div><!--container-fluid End <i class="fa fa-angle-double-left"></i> -->

    </div>

</asp:Content>
