<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="MSM.Result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
    <style>
        table{
           
        }
    </style>
</head>
<body>
    <form runat="server">
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
        <li><a href="#">Home</a></li>
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
        <div style="margin-right: auto; margin-left: auto; width: 300px;">
            Type your ID: <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click1" />
            <hr />
            <asp:GridView ID="gvsearch" runat="server" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found">

            </asp:GridView>
        </div>
            </div>
    </form>
</body>
</html>
