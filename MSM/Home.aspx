<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MSM.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
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
        <li class="active"><a href="#">Home</a></li>
        <li class="dropdown">
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
                <div class="panel panel-primary">
                  <div class="panel-heading">Mesh Summary </div>
                  <div class="panel-body">
                          Number Of Membar: <asp:Label ID="lbltotalmembar" runat="server" Text=""></asp:Label> <br />
                          Number Of Meal: <asp:Label ID="lbltotalmeal" runat="server" Text=""></asp:Label><br />
                          Total Collection : <asp:Label ID="lbltotalcollection" runat="server" Text=""></asp:Label> TK<br />
                          Total Cost : <asp:Label ID="lbltotalcost" runat="server" Text=""></asp:Label> TK<br /> 
                      <hr style="border:2px double; color:forestgreen;" />
                      Remain Amount : <asp:Label ID="netamount" runat="server" Text=""></asp:Label> TK<br /> 
                      Per Meal Cost : <asp:Label ID="permealcost" runat="server" Text=""></asp:Label> TK<br /> 
                     
                  </div>
                  </div>
            </div>
            </div>
    
        </form>
</body>
</html>
