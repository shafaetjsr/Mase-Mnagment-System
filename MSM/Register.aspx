<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MSM.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/jquery-ui.css" rel="stylesheet" />
    <link href="css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <style>
        table.dataTable thead tr {
            background-color: #337ab7;
            color:white;
        }
    </style>
    <script>
        $(Document).ready(function () {
            $("#gdmembar").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand"><asp:Label ID="lbluser" runat="server" Text=""></asp:Label></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="Home.aspx">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Report <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="TotalMeal.aspx">Total Meal</a></li>
            <li><a href="TotalPayment.aspx">Total Payment</a></li>
            <li><a href="Result.aspx">Search By ID</a></li>
          </ul>
        </li>
        <li class="active"><a href="Register.aspx">Memebar</a></li>
        <li><a href="Payment.aspx">Add Payment</a></li>
          <li><a href="dailycost.aspx">Daily Cost</a></li>
          <li><a href="mealentry.aspx">Meal Entry</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
          <asp:Button ID="btnlogout" runat="server" Text="Log Out" OnClick="btnlogout_Click" />
      </ul>
    </div>
  </div>
</nav>
                <div class="row">
                    <div class="col-md-4">
                          <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                        <div class="panel panel-primary">
                  <div class="panel-heading">Add Membar</div>
                  <div class="panel-body">
                      <div class="form-group">
                        <label for="txtid">Membar Name:</label>
                          <asp:TextBox ID="txtname" runat="server" class="form-control"></asp:TextBox>
                      </div>
                      <div class="form-group">
                        <label for="txtid">Contact Number:</label>
                          <asp:TextBox ID="txtnumber" runat="server" class="form-control"></asp:TextBox>
                      </div>
                      <div class="form-group">
                        <label for="txtid">Address:</label>
                          <asp:TextBox ID="txtadd" runat="server" class="form-control"></asp:TextBox>
                      </div>
                      <asp:Button ID="btnpayment" class="btn btn-primary" runat="server" OnClick="btnsubmit_Click" Text="Save" />
                      
                  </div>
                </div>
                    </div>
                    <div class="col-md-8">
                        <asp:GridView ID="gdmembar" runat="server" AutoGenerateColumns="False" DataKeyNames="m_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="m_id" HeaderText="Membar ID" InsertVisible="False" ReadOnly="True" SortExpression="m_id" />
                                <asp:BoundField DataField="m_name" HeaderText="Membar Name" SortExpression="m_name" />
                                <asp:BoundField DataField="m_contact" HeaderText="Membar Contact" SortExpression="m_contact" />
                                <asp:BoundField DataField="m_address" HeaderText="Membar Address" SortExpression="m_address" />
                                <asp:TemplateField HeaderText="Action" ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" onClientClick=" return confirm('Are you sure you want to delete this Membar?')"  CommandName="Delete" Text="Delete"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [tbl_membar] WHERE [m_id] = @m_id" InsertCommand="INSERT INTO [tbl_membar] ([m_name], [m_contact], [m_address]) VALUES (@m_name, @m_contact, @m_address)" SelectCommand="SELECT * FROM [tbl_membar]" UpdateCommand="UPDATE [tbl_membar] SET [m_name] = @m_name, [m_contact] = @m_contact, [m_address] = @m_address WHERE [m_id] = @m_id">
                            <DeleteParameters>
                                <asp:Parameter Name="m_id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="m_name" Type="String" />
                                <asp:Parameter Name="m_contact" Type="String" />
                                <asp:Parameter Name="m_address" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="m_name" Type="String" />
                                <asp:Parameter Name="m_contact" Type="String" />
                                <asp:Parameter Name="m_address" Type="String" />
                                <asp:Parameter Name="m_id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                 </div>
         </div>
       </form>
</body>
</html>

