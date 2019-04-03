<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="startingform.aspx.cs" Inherits="ELABS.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
       			<div class="container-fluid">

				<div class="row">
					<div class="col-md-12 select-top">
						Select Company
					</div>
				</div>

				<div class="row">
					<div class="pad_form">
						<div class="form-group">
					        <label for="name" class="col-sm-2 control-label">Link In Data Path</label>
					        <div class="col-sm-8">
                                 <asp:TextBox ID="txtlinkdatapath" runat="server" CssClass="form-control" ></asp:TextBox>

					            <%--<input type="text" class="form-control" id="name" name="name" value="">--%>
					        </div>
					      
					    </div>
					    <br>
					    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					        	<asp:Button ID="btnadd" runat="server" onclick="btnadd_Click" 
                                    Text="AddDetails" />
					    <br>
					    <div class="form-group text-center">
					        <label for="name" class="col-sm-12 "><span class="text-pad">[F2]-Change Data Path Manually</span><span> [F3]-Select Data Folder</span></label>
					    </div>
					</div>
				</div>

				<div class="row">
					<div class="form-grid">
						<div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" 
                                onselectedindexchanged="GridView1_SelectedIndexChanged" Width="1008px" 
                                AutoGenerateColumns="False">
                                <Columns>
                                    <asp:ButtonField CommandName="Select" Text="selected" />
                                    <asp:BoundField DataField="company_id" HeaderText="Company_id" />
                                    <asp:BoundField DataField="company_name" HeaderText="Company_name" />
                                    <asp:BoundField DataField="formation_year" HeaderText="Formation_year" />
                                    <asp:BoundField DataField="address" HeaderText="Address" />
                                    <asp:BoundField DataField="technician_name" HeaderText="Technician_name" />
                                    <asp:BoundField DataField="Contact_no" HeaderText="Contact_no" />
                                    <asp:BoundField DataField="uid" HeaderText="uid" />
                                </Columns>
                            </asp:GridView>


							<%--<table class="table table-bordered table-striped-column">
							  <thead>
							    <tr>
							          <th>Company ID</th>
							          <th>Company Name</th>
							          <th>Formation Year</th>
							          <th>Address</th>
							          <th>Technician Name</th>
							          <th>Contact No.</th>
							          <th>uid</th>
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
							      </tr>
							      <tr>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							      </tr>
						  		  <tr>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							      </tr>
						  		  <tr>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							      </tr>	
						  		  <tr>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							          <td>&nbsp;</td>
							      </tr>	
						  		  <tr>
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
					<div class="pad_form">
						<div class="form-group">
					        <div class="group-1">
                                <br>
						        <div class="col-sm-12">
                                 <asp:TextBox ID="txtname" runat="server" CssClass="form-control" ></asp:TextBox>

						            <%--<input type="text" class="form-control" id="name" name="name" value="">--%>
						        </div>
					            <br />
                                <br />
					        </div>
					    </div>
					</div>
				</div>

			</div><!--container-fluid End-->

    </div>
</asp:Content>
