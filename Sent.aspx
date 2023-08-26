<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sent.aspx.cs" Inherits="Sent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <!-- Navbar Start -->
    <div class="container-fluid p-0">
        <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0 px-lg-5">
            <a href="index.html" class="navbar-brand ml-lg-3">
                <h1 class="m-0 text-uppercase text-primary"><i class="fa fa-book-reader mr-3"></i>Email</h1>
            </a>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between px-lg-3" id="navbarCollapse">
                <div class="navbar-nav mx-auto py-0">
                    <a href="Inbox.aspx" class="nav-item nav-link ">Inbox</a>
                    <a href="Compose.aspx" class="nav-item nav-link ">Compose</a>
                    <a href="Sent.aspx" class="nav-item nav-link active">Sent</a>
                    <a href="Profile.aspx" class="nav-item nav-link ">Profile</a>
                </div>
                <a href="login.aspx" class="btn btn-primary py-2 px-4 d-none d-lg-block">Log Out</a>
            </div>
        </nav>
    </div>
    <!-- Navbar End -->

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <center>  
            <div class="mx-auto mb-5" style="width: 100%; max-width: 900px;">
                <div class="input-group">
                    <input type="text" class="form-control border-light" style="padding: 30px 25px;" placeholder="Keyword">
                    <div class="input-group-append">
                        <button class="btn btn-secondary px-4 px-lg-5">Search</button>
                    </div>
                </div>
            </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" Width="1000px">
        <Columns>
            <asp:BoundField DataField="Email_To" HeaderText="Email_To" SortExpression="Email_To" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
            <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" ProviderName="<%$ ConnectionStrings:connect.ProviderName %>" SelectCommand="SELECT [Email_To], [Subject], [Message], [Date] FROM [Email_Data] WHERE ([Email_From] = @Email_From)">
        <SelectParameters>
            <asp:SessionParameter Name="Email_From" SessionField="from" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </center>
    <div class="container text-center my-4 py-4">
    </div>

</asp:Content>

