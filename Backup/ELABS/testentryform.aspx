<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="testentryform.aspx.cs" Inherits="elabs.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/notify.min.js" type="text/javascript"></script>
<script type="text/Javascript" language="javascript">
    function teupdate() {
        if (confirm("Are you sure you want to Update?")) {
            return true;
        }
        return false;
    }

    function tedelete() {
        if (confirm("Are you sure you want to Delete?")) {
            return true;
        }
        return false;
    }
    //    function Validations() {
    //        var name = $("#txttestname").val();
    //        if (name = " ") {
    //            // alert("please enter the username");
    //            $('#txttestname').notify("please enter Test Name", { position: "right" });
    //            $('#txttestname').next().show();
    //            return false;
    //        }
    //        }

    //    function alertWithoutNotice(message) {
    //        setTimeout(function () {
    //            alert(message);
    //        }, 1000);
    //    }

    function Validations() {
        var tname = document.getElementById('<%=txttestname.ClientID %>').value;
        var unit = document.getElementById('<%=txtunit.ClientID %>').value;
        var dvalue = document.getElementById('<%=txtdefaultvalue.ClientID %>').value;
        var cost = document.getElementById('<%=txtcost.ClientID %>').value;
        var nrange = document.getElementById('<%=txtnormalrange.ClientID %>').value;
        var lrange = document.getElementById('<%=txtlowerrange.ClientID %>').value;
        var urange = document.getElementById('<%=txtupperrange.ClientID %>').value;

        if (tname == "") {
            alert("please enter Test Name");
            return false;
        }
        //        var pgng = document.getElementById("<%=txtunit.ClientID%>").value.trim();
        //        if (pgnd = " ") {
        //            dialog("The textbox should not be empty...");
        //            return false;
        //        }
        else if (unit == "") {
            alert("please enter Unit");
            return false;
        }
        else if (dvalue == "") {
            alert("please enter Default Value");
            return false;
        }
        else if (cost == "") {
            alert("please enter Cost");
            return false;
        }
        else if (nrange == "") {
            alert("please enter Normal Range");
            return false;
        }
        else if (lrange == "") {
            alert("please enter Lower Range");
            return false;
        }
        else if (urange == "") {
            alert("please enter Upper Range");
            return false;
        }

        //        var name = $("txtnotes").val();
        //        if (namr = " ") {
        //            alert("please enter Test Name");
        //            return false;
        //        }

    }
    function validatenumerics(key) {
        //getting key code of pressed key
        var keycode = (key.which) ? key.which : key.keyCode;
        //comparing pressed keycodes

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
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 select-top">
                        Test Entry Form
                    </div>
                </div>

                <div class="row form-horizontal">
                    <div class="">
                        <div class="pad_form">
                            <div class="row row-mar">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Test Name :</label>
                                    <div class="col-sm-3">
                                 <asp:TextBox ID="txttestname" runat="server" CssClass="form-control" 
                                            AutoPostBack="True" ></asp:TextBox>
                                        <%--<input type="text" class="form-control" placeholder="" value="">--%>
                                    </div>
                                    <label class="col-sm-3 control-label">Serial Order No :</label>
                                    <div class="col-sm-3">
                                 <asp:TextBox ID="txtserialorderno" runat="server" CssClass="form-control" 
                                            ReadOnly="True" ></asp:TextBox>
                                        <%--<input type="text" class="form-control" placeholder="" value="">--%>
                                    </div>                        
                                </div>
                            </div>
                            <div class="row row-mar">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Group :</label>
                                    <div class="col-sm-9">
                                        <asp:DropDownList ID="drpgroup" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ELABSConnectionString %>" 
                                            SelectCommand="SELECT [test_group_name] FROM [testgroup]">
                                        </asp:SqlDataSource>--%>
                                        <%--<select class="form-control" id="sell">
                                            <option>&nbsp;</option>
                                            <option>&nbsp;</option>
                                            <option>&nbsp;</option>
                                        </select>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="row row-mar">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        <asp:CheckBox ID="chkundersubgroup" runat="server" Text="Under subgroup" 
                                        oncheckedchanged="chkundersubgroup_CheckedChanged" AutoPostBack="True" />
                                    <%--<input type="checkbox">Under Subgroup :--%>

                                    </label>
                                    <div class="col-sm-9">
                                        <asp:DropDownList ID="drpsubgroup" runat="server" CssClass="form-control"></asp:DropDownList>
                                        <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ELABSConnectionString2 %>" 
                                            SelectCommand="SELECT [test_sub_groupname] FROM [testgroup]">
                                        </asp:SqlDataSource>--%>
                                        <%--<select class="form-control" id="Select1">
                                            <option>&nbsp;</option>
                                            <option>&nbsp;</option>
                                            <option>&nbsp;</option>
                                        </select>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="row row-mar">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Unit :</label>
                                    <div class="col-sm-2">
                                 <asp:TextBox ID="txtunit" runat="server" CssClass="form-control" ></asp:TextBox>

                                        <%--<input type="text" class="form-control" placeholder="" value="">--%>
                                    </div>
                                    <label class="col-sm-2 control-label">Default Value :</label>
                                    <div class="col-sm-2">
                                 <asp:TextBox ID="txtdefaultvalue" runat="server" CssClass="form-control" ></asp:TextBox>

                                        <%--<input type="text" class="form-control" placeholder="" value="">--%>
                                    </div>
                                    <label class="col-sm-1 control-label">Cost :</label>
                                    <div class="col-sm-2">
                                 <asp:TextBox ID="txtcost" runat="server" CssClass="form-control" onkeypress="return validatenumerics(event)"></asp:TextBox>

                                        <%--<input type="text" class="form-control" placeholder="" value="">--%>
                                    </div>                        
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row row-mar">
                                    <div class="col-sm-3 pad-col">
                                        <label class="col-sm-12 control-label top-pad">Normal Range :</label>
                                    </div>
                                    <div class="col-sm-3">
                                 <asp:TextBox ID="txtnormalrange" runat="server" CssClass="form-control" ></asp:TextBox>

                                        <%--<input type="text" class="form-control top-hit" value="">--%>
                                    </div>
                                     

                                    <div class="col-sm-6">
                                        <div class="row">
                                            <label class="col-sm-2 control-label">Lower Range :</label>
                                            <div class="col-sm-4 ">
                                 <asp:TextBox ID="txtlowerrange" runat="server" CssClass="form-control" ></asp:TextBox>

                                                <%--<input type="text" class="form-control" value="">--%>
                                            </div>
                                        </div><br />
                                        <div class="row">
                                            <label class="col-sm-2 control-label">upper Range :</label>
                                            <div class="col-sm-4 ">
                                 <asp:TextBox ID="txtupperrange" runat="server" CssClass="form-control" ></asp:TextBox>

                                                <%--<input type="text" class="form-control" value="">--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                
                            </div>

                            <div class="row row-mar">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Notes :</label>
                                    <div class="col-sm-9">

                                 <asp:TextBox ID="txtnotes" runat="server" CssClass="form-control" TextMode="MultiLine" ></asp:TextBox>

                                        <%--<textarea class="form-control"></textarea>--%>
                                    </div>
                                </div>
                            </div>

                            <div class="row row-mar">
                                <div class="form-group">
                                    <div class="col-sm-3 control-label">
                                        <label>
                                            <asp:CheckBox ID="chkwildtest" runat="server" Text="Wildtest" />

                                        </label>
                                    </div>
                                    <div class="col-sm-9">
                                    </div>
                                </div>
                            </div>

                            <div class="row row-mar">
                                <div class="form-group">
                                    <div class="col-sm-12 col-offset-6">
                       ,,,,,,,,,,,,,,                <asp:Button ID="btnadd" runat="server" Text="Add" CssClass="btn btn-primary" 
                                            onclick="btnadd_Click" />
                                       <asp:Button ID="btnupdate" runat="server" Text="Update" 
                                            CssClass="btn btn-primary" onclick="btnupdate_Click" OnClientClick="return teupdate()" />
                                       <asp:Button ID="btndelete" runat="server" Text="Delete" 
                                            CssClass="btn btn-primary" onclick="btndelete_Click" OnClientClick="return tedelete()" />
                                       <asp:Button ID="btncancel" runat="server" Text="Cancel" 
                                            CssClass="btn btn-primary" onclick="btncancel_Click" />

                                        <%--<button class="btn btn-primary">Add</button>
                                        <button class="btn btn-primary">Update</button>
                                        <button class="btn btn-primary">Delete</button>
                                        <button class="btn btn-primary">Cancel</button>--%>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div><!--container-fluid End-->
    </div>
</asp:Content>
