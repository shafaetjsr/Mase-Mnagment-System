<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="MSM.Payment" %>

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
            $("#txtdate").datepicker({
                dateFormat:'yy-mm-dd'
            });
        });
    </script>
    <script>
        $(Document).ready(function () {
            $("#Gvpayment").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
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
        <li><a href="Register.aspx">Memebar</a></li>
        <li class="active"><a href="Payment.aspx">Add Payment</a></li>
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
                    <div style="margin-right: auto; margin-left: auto; width: 300px; ">
                          <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                <div class="panel panel-primary">
                  <div class="panel-heading">Membar Payment</div>
                  <div class="panel-body">
                      <div class="form-group">
                        <label for="txtdate">Date:</label>
                          <asp:TextBox ID="txtdate" runat="server" class="form-control"></asp:TextBox>
                      </div>
                      <div class="form-group">
                        <label for="txtid">Membar ID:</label>
                          <asp:TextBox ID="txtid" runat="server" class="form-control"></asp:TextBox>
                      </div>
                      <div class="form-group">
                        <label for="txtid">Amount:</label>
                          <asp:TextBox ID="txttk" runat="server" class="form-control"></asp:TextBox>
                      </div>
                      <asp:Button ID="btnpayment" class="btn btn-primary" runat="server" Text="Save" OnClick="btnpayment_Click" />
                      
                  </div>
                </div>
            </div>
                </div>
                <div class="col-md-8">
                    <asp:GridView ID="Gvpayment" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="membar_id" HeaderText="Member ID" SortExpression="membar_id" />
                            <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                            <asp:BoundField DataField="pay_date" HeaderText="Payment Date" SortExpression="pay_date" DataFormatString="{0:dd/MM/yyyy}" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT * FROM [tbl_paymnet]"></asp:SqlDataSource>
                </div>
            </div>
            </div>
    </form>
</body>
</html>
