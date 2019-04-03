<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="newpatiententry.aspx.cs" Inherits="Elabs_Project.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%-- <script src="Scripts/jquery.min.js" type="text/javascript"></script>--%>
    <script src="Scripts/jquery-ui.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui.min.js" type="text/javascript"></script>
  
    <link href="Styles/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="Styles/jquery-ui.structure.css" rel="stylesheet" type="text/css" />
    <link href="Styles/jquery-ui.theme.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <%--<script src="Scripts/jquery-ui.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui.min.js" type="text/javascript"></script>--%>


     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
     <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
     <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />

     <script type="text/javascript">
         $(document).ready(function () {
             $('[id*="txtsampledate"]').datepicker({
                 dateFormat: 'yy-mm-dd'
             });
         });
</script>
    <script src="Scripts/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
    <link href="Styles/jquery-ui-timepicker-addon.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    $(document).ready(function () {
        $('[id*="txtreportingdate"]').datepicker({
            dateFormat: 'yy-mm-dd'
        });
    });
</script>
<script  type="text/javascript">
    $(document).ready(function () {
        $('[id*="txttime"]').timepicker({
            timeFormat: 'HH:mm:ss'
        });
    }); 
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('[id*="txtrpttime"]').timepicker({
            timeFormat: 'HH:mm:ss'
        });
    });
</script>
<script type="text/javascript">
    function insert() {
        $("#div1").dialog({
            title: "Patient Entry",
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="Scripts/notify.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function validations() {
            var contactno = $('[id*="txtcontactno"]').val();

            var emailid = $('[id*=txtemailidofpatient]').val();
            if (contactno == "") {
                $('[id*="txtcontactno"]').notify("Please Enter Contact Number", { position: "right", color: "Red" });
                $('[id*="txtcontactno"]').next().show();
                return false;
            }

            if (!(contactno.match(/^[789]\d{9}$/))) {
                $('[id*="txtcontactno"]').notify("Not a Valid Contact Number", { position: "right", color: "Red" });
                $('[id*="txtcontactno"]').next().show();
                return false;
            }
            if (emailid == "") {
                $('[id*=txtemailidofpatient]').notify("please enter Email", { position: "right", color: "Red" });
                $('[id*=txtemailidofpatient]').next().show();
                return false;
            }

            if (!(emailid.match(/^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/))) {
                $('[id*=txtemailidofpatient]').notify("please enter valid EmailId", { position: "right", color: "Red" });
                $('[id*=txtemailidofpatient]').next().show();
                return false;
            }
        }
    </script>

    <div>
                    <div class="container-fluid login_container">

                <div class="row">
                    <div class="select-top">
                        ENTER MORE INFORMATION
                    </div>
                </div>
                
                <div class="row">
                    <div class="pad_form">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Ref.No :</label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtrefno" runat="server" CssClass="form-control" ></asp:TextBox>

                                    <%--<input type="text" class="form-control" value="">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Account :</label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="drpaccount" runat="server"></asp:DropDownList>
                                    <%--<select class="form-control" id="sell">
                                      <option>&nbsp;</option>
                                      <option>&nbsp;</option>
                                      <option>&nbsp;</option>
                                    </select>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Address of Patient :</label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtaddressofpatient" runat="server" CssClass="form-control"  TextMode="MultiLine"></asp:TextBox>

                                    <%--<textarea class="form-control"></textarea>--%>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">City/Village :</label>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="txtcity" runat="server" CssClass="form-control" ></asp:TextBox>

                                    <%--<input type="text" class="form-control" value="">--%>
                                </div>
                                <label class="col-sm-2 control-label">Contact No.:</label>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="txtcontactno" runat="server"  CssClass="form-control" ></asp:TextBox>

                                    <%--<input type="text" class="form-control" value="">--%>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Email Id of Patient :</label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtemailidofpatient" runat="server" CssClass="form-control" ></asp:TextBox>

                                    <%--<input type="text" class="form-control" value="">--%>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Sample Date :</label>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="txtsampledate" runat="server" CssClass="form-control" ></asp:TextBox>

                                    <%--<input type="date" class="form-control" value="">--%>
                                </div>
                                <label class="col-sm-2 control-label">Time :</label>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="txttime" runat="server" CssClass="form-control" ></asp:TextBox>

                                    <%--<input type="time" class="form-control" value="">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Reporting Date :</label>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="txtreportingdate" runat="server" CssClass="form-control" ></asp:TextBox>

                                    <%--<input type="date" class="form-control" value="">--%>
                                </div>
                                <label class="col-sm-2 control-label">Time :</label>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="txtrpttime" runat="server" CssClass="form-control" ></asp:TextBox>

                                    <%--<input type="time" class="form-control" value="">--%>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Category :</label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="drpcategory" runat="server"></asp:DropDownList>
                                    <%--<select class="form-control" id="Select1">
                                      <option>&nbsp;</option>
                                      <option>&nbsp;</option>
                                      <option>&nbsp;</option>
                                    </select>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Department :</label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="drpdepartment" runat="server"></asp:DropDownList>
                                    <%--<select class="form-control" id="Select2">
                                      <option>&nbsp;</option>
                                      <option>&nbsp;</option>
                                      <option>&nbsp;</option>
                                    </select>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Remarks :</label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtremarks" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>

                                    <%--<textarea class="form-control"></textarea>--%>
                                </div>
                            </div>
                            <asp:Button ID="btnnext" runat="server" Text="Save" CssClass="btn btn-primary" 
                                onclick=" btnnext_Click " OnClientClick="return validations();" />
                            <asp:Button ID="btnprevious" runat="server" Text="Previous" 
                                CssClass="btn btn-primary" onclick="btnprevious_Click" />
                                <%--<button class="btn btn-primary">Next</button>--%>
                           

                        </div>
                    </div>
                </div> 
                
                <div id="div1" style="display: none;">
                <p>Data Inserted Successfully</p>
                </div>         

            </div><!--container-fluid End-->

    </div>
</asp:Content>
