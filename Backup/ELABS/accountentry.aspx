<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="accountentry.aspx.cs" Inherits="ELABS.accounte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
        .pdform {
                padding: 30px 0px;
                text-align: center;
                background: #E1F4FD;
                border: 1px solid #A9A3A1;
                margin: 4px;
                height:300px;
        }

    </style>

    <script type="text/javascript" language="javascript">
        function Validations() {
            var aname = document.getElementById('<%=txtaccountname.ClientID %>').value;
            var bal = document.getElementById('<%=txtopbal.ClientID %>').value;
            var address = document.getElementById('<%=txtaddress.ClientID %>').value;
            var city = document.getElementById('<%=txtcity.ClientID %>').value;
            var mobile = document.getElementById('<%=txtmobile.ClientID %>').value;

            if(aname =="") {
                alert("please enter Account Name");
                return false;
            }

            else if (bal == "") {
                alert("please enter Balance");
                return false;
            }

            else if (address == "") {
                alert("please enter Address");
                return false;
            }

            else if (city == "") {
                alert("please enter City");
                return false;
            }

            else if (mobile == "") {
                alert("please enter Mobile");
                return false;
            }

            else if (!(mobile.match(/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/))) {
                alert("Enter valid phone number");
                return false;
            }
        }

        function validatenumerics(key) {
            var keycode = (key.which) ? key.which : key.keyCode;

            if (keycode > 31 && (keycode < 48 || keycode > 57)) {
                alert(" You can enter only characters 0 to 9 ");
                return false;
            }
            else return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
           <div class="container-fluid login_container">

                <div class="row">
                    <div class="select-top">
                        ACCOUNT ENTRY FORM
                    </div>
                </div>
                
               
                <div class="row">
                    <div class="col-sm-9 text-right">
                        <asp:Button ID="btnadd" runat="server" Text="Add" CssClass="btn btn-primary" 
                            onclick="btnadd_Click" OnClientClick="return Validations();"/>
                        <asp:Button ID="btnedit" runat="server" Text="Edit" CssClass="btn btn-primary" 
                            onclick="btnedit_Click" OnClientClick="return Validations();"/>
                        <asp:Button ID="btndelete" runat="server" Text="Delete" 
                            CssClass="btn btn-primary" onclick="btndelete_Click"/>
                        <asp:Button ID="btnclose" runat="server" Text="Close" 
                            CssClass="btn btn-primary" onclick="btnclose_Click"/>
                      <%--  <button class="btn btn-primary">Add</button>
                        <button class="btn btn-primary">Edit</button>
                        <button class="btn btn-primary">Delete</button>
                        <button class="btn btn-primary">Close</button>--%>
                    </div>
                </div>
            

                <div class="row">
                    <div class="pdform">
                     
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Account Name :</label>
                                <div class="col-sm-7">
                                    <asp:TextBox ID="txtaccountname" runat="server" CssClass="form-control"></asp:TextBox>
                                    <%--<input type="text" class="form-control" value="">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Group :</label>
                                <div class="col-sm-7">
                                    <asp:DropDownList ID="drpgroup" runat="server" CssClass="form-control">
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                  <%--  <select class="form-control" id="sell">
                                      <option>&nbsp;</option>
                                      <option>&nbsp;</option>
                                      <option>&nbsp;</option>
                                    </select>
                                </div>--%>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">OP Bal :</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="txtopbal" runat="server" CssClass="form-control" onkeypress="return validatenumerics(event);"></asp:TextBox>
                                    <%--<input type="text" class="form-control" value="">--%>
                                </div>
                                <label class="col-sm-1 control-label">Dr/Cr:</label>
                                <div class="col-sm-3">
                                    <asp:DropDownList ID="drpdebitorcredit" runat="server" CssClass="form-control">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>Cr.</asp:ListItem>
                                        <asp:ListItem>Dr.</asp:ListItem>
                                    </asp:DropDownList>
                                    <%--<select class="form-control" id="Select1">
                                      <option>&nbsp;</option>
                                      <option>&nbsp;</option>
                                      <option>&nbsp;</option>
                                    </select>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Address :</label>
                                <div class="col-sm-7">
                                    <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control"></asp:TextBox>
                                    <%--<input type="text" class="form-control" value="">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">City :</label>
                                <div class="col-sm-7">
                                      <asp:TextBox ID="txtcity" runat="server" CssClass="form-control"></asp:TextBox>
                                    <%--<input type="text" class="form-control" value="">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Mobile :</label>
                                <div class="col-sm-7">
                                      <asp:TextBox ID="txtmobile" runat="server" CssClass="form-control" 
                                          MaxLength="10"></asp:TextBox>
                                    <%--<input type="text" class="form-control" value="">--%>
                                </div>
                            </div> 
                      
                    </div>
                </div>          
                </div>
            </div><!--container-fluid End-->
    </div>
</asp:Content>
