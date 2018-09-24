<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TotalMeal.aspx.cs" Inherits="MSM.report.TotalMeal" %>

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
            $("#gvtotalmeal").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
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
        <li class="dropdown active">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Report <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="TotalMeal.aspx">Total Meal</a></li>
            <li><a href="TotalPayment.aspx">Total Payment</a></li>
            <li><a href="Result.aspx">Search By ID</a></li>
          </ul>
        </li>
        <li><a href="Register.aspx">Memebar</a></li>
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
        <div style="margin-right: auto; margin-left: auto; width: 400px; ">
            <h3>Total Membar Meal</h3>
            <asp:GridView ID="gvtotalmeal" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="m_id" HeaderText="Membar ID" SortExpression="m_id" />
                    <asp:BoundField DataField="m_name" HeaderText="Membar Name" SortExpression="m_name" />
                    <asp:BoundField DataField="Column1" HeaderText="Total Meal" ReadOnly="True" SortExpression="Column1" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="sp_total_meal" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
