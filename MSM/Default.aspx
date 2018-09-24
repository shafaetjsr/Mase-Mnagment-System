<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MSM.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/style.css" rel="stylesheet" />
    <style>
        { margin: 0; padding: 0; }

    html { 
        background: url('images/background.jpg') no-repeat center center fixed; 
        background-size: cover;
    }
        .div{
            width: 298px; 
            margin: 0 auto;
            margin-top: 0px;
            background: #9b8888;
            color: #fff;
            margin-top: 10%;
            height: 190px;
        }
        .input{
            padding:10px;
            width:100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="div">
            <h3 style="text-align:center; color:#10057b;">Login Panel</h3>
            <table>
                <tr>
                    <td>UserName :</td>
                    <td>
                        <asp:TextBox ID="txtUser" CssClass="input" placeholder="Input User name" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Password :</td>
                    <td>
                        <asp:TextBox ID="txtpass" CssClass="input"  placeholder="Input Password" runat="server" TextMode="Password"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" Height="36px" Width="72px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center; color:red">
                        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
            
        </div>
    </form>
</body>
</html>
