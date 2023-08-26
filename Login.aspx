<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                    <a href="Register.aspx" class="nav-item nav-link">Register</a>
                </div>
                <a href="login.aspx" class="btn btn-primary py-2 px-4 d-none d-lg-block">Log In</a>
            </div>
        </nav>
    </div>
    <!-- Navbar End -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row justify-content-center bg-image mx-0 mb-5">
        <div class="col-lg-6 py-5">
            <div class="bg-white p-5 my-3">
                <h2 class="text-center mb-4">Login!!!</h2>
                <form>
                    <div class="form-row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <h6 class="mb-2">Your Email Address :</h6>
                                <asp:TextBox ID="TextBox1" runat="server" type="email" class="form-control bg-light border-0" placeholder="xyz@gmail.com" Style="padding: 30px 20px;"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <h6 class="mb-2">Password:</h6>
                               <asp:TextBox ID="TextBox2" runat="server" type="password" class="form-control bg-light border-0" placeholder="password" Style="padding: 30px 20px;"></asp:TextBox>
                            </div>
                        </div>
                    </div> 
                    <center>
                        <div class="col-sm-5">
                        <asp:Button ID="Button1" runat="server" Text="Login" class="btn btn-primary btn-block" type="submit" Style="height: 60px;" OnClick="Button1_Click" />
                    </div>
                    </center>
                     
                </form>
            </div>
        </div>
    </div>
</asp:Content>

