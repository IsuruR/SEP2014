<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Uploader.aspx.cs" Inherits="Uploader" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:FileUpload ID="FileUpload1" runat="server" />
&nbsp;&nbsp;
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload WordNet File" />
    
    </div>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Upload Comments" />
    </form>
</body>
</html>
