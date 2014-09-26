<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Sentiment.aspx.cs" Inherits="Sentiment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Button ID="btnAnalyze" runat="server" OnClick="btnAnalyze_Click" Text="Analyze Comments" />
</asp:Content>

