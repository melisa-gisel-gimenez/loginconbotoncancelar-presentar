<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="formlogin.aspx.cs" Inherits="login2.formlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Acceso</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%--    <link href="//maxcdn.boostrapcdn.com/boostrap/3.2.0/css/boostrap.min.css" rel="stylesheet" type="text/css" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />--%>

    <link href="css/AdmPropio.css" rel="stylesheet" type="text/css" />
    <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .div-1 {
            background-color: #50806b;
            height: 45px;
        }
    </style>
</head>
<body>   
    
    <form runat="server">
        
        <div>
            <div class="form-group">
                <div class="container">

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="div-1 text-center">
                                <asp:Label class="h3 mb-3 fw-normal" ID="lblTitulo" Font-Size="25px" ForeColor="White" Text="Iniciar Sesion" 
                                    runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <br />

                    <div class="row">
                        <div class="col-lg-2" >
                            <asp:Label ID="lblNombre" runat="server" Text="Nombre : "></asp:Label>
                        </div>
                        <div class="col-lg-3">
                            <asp:TextBox ID="txtNombreUsuario" Font-Bold="true" runat="server" ></asp:TextBox>
                        </div>                       
                    </div>

                    <br />

                    <div class="row">
                        <div class="col-lg-2">
                            <asp:Label ID="lblPass" runat="server" Text="Clave : "></asp:Label>
                        </div>
                        <div class="col-lg-3">
                            <asp:TextBox ID="txtContraseña" Text="Hola" Font-Bold="true" TextMode="Password" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <br />
                    <br />

                    <div class="row">
                        <div class="col-lg-2">
                            &nbsp;
                        </div>
                        <div class="col-lg-3">
                            <asp:Button class="btn btn-primary w-100 py-2" ID="btnConfirm" Font-Italic="true"  runat="server" Text="Confirmar" OnClick="btnConfirm_Click" />
                        </div>
                    </div>

                </div>
            </div>

            <br />
            <br />

            <div class="row">
                <div class="col-lg-3">
                    <asp:Label ID="lblMensaje" ForeColor="Red" Font-Bold="true" runat="server" Text=""></asp:Label>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
