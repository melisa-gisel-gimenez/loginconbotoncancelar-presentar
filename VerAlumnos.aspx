<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerAlumnos.aspx.cs" Inherits="login2.VerAlumnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Acceso</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

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
                                <asp:Label ID="lblTitulo" Font-Size="25px" ForeColor="White" Text="Alumnos" 
                                    runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <br />

                    <div id="divId" runat="server" class="row">
                        <div class="col-lg-2">
                            <asp:Label ID="lblId" runat="server" Text="Id : "></asp:Label>
                        </div>
                        <div class="col-lg-3">
                            <asp:TextBox ID="txtId" Font-Bold="true" runat="server" ></asp:TextBox>
                        </div>
                       
                    </div>

                    <div id="divDatos" runat="server">
                    <div class="row">
                        <div class="col-lg-2">
                            <asp:Label ID="lblNombre" runat="server" Text="Nombre : "></asp:Label>
                        </div>
                        <div class="col-lg-3">
                            <asp:TextBox ID="txtNombreUsuario" Font-Bold="true" runat="server" ></asp:TextBox>
                        </div>
                       
                    </div>

                    <br />

                    <div class="row">
                        <div class="col-lg-2">
                            <asp:Label ID="lblDNI" runat="server" Text="DNI : "></asp:Label>
                        </div>
                        <div class="col-lg-3">
                            <asp:TextBox ID="txtDNI" Text="" Font-Bold="true"  runat="server"></asp:TextBox>
                        </div>
                    </div>
                        </div>
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-lg-2">
                            <asp:Label ID="lblSexo" runat="server" Text="Sexo : " Visible="false"></asp:Label>
                        </div>
                        <div class="col-lg-3">
                            <asp:DropDownList  ID="ddlSexo" runat="server" AutoPostBack="true" Height="16px" whidt="177px" visible="false">
                            <asp:ListItem Text="Mujer" Value="F" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Hombre" Value="M" ></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        
                    </div>

                    <div id="divBotones" runat="server" class= "row">
                        <div class="btn-group">                            
                        <div class="col-lg-12">
                        <div class="col-lg-3">
                            <asp:Button class="btn btn-primary" ID="btnFirst" ToolTip="primero" Font-Italic="true" runat="server" Text="Primero" Width="80px" OnClick="btnFirst_Click"  />
                        </div>
                        <div class="col-lg-3">
                            <asp:Button class="btn btn-warning" ID="btnSiguiente" Tooltip="siguiente" Font-Italic="true"  ForeColor="White" runat="server" Text="Siguiente" Width="80px" OnClick="btnSiguiente_Click" />
                        </div>
                        <div class="col-lg-3">
                            <asp:Button class="btn btn-success" ID="btnAnterior" ToolTip="anterior" Font-Italic="true"  ForeColor="White" runat="server" Text="Anterior" Width="80px" OnClick="btnAnterior_Click" />
                        </div>
                        <div class="col-lg-3">
                            <asp:Button class="btn btn-primary" ID="btnLast" ToolTip="ultimo" Font-Italic="true"  runat="server" Text="Ultimo" Width="80px" OnClick="btnLast_Click" />
                        </div>
                    </div>
                            </div>

                </div>
            
            <div />
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

        <div class="container">
        <div class="row">
            <div class="col-md-6">
                <!-- Contenido principal -->
            </div>
            <div class="col-md-6 d-flex flex-column align-items-end">               
                <asp:Button ID="btnVolver" runat="server" Text="Volver al login" OnClick="btnVolver_Click" class="btn btn-primary mb-3" />
                <asp:Button ID="btnGrilla" runat="server" Text="Grilla de profesores" OnClick="btnGrilla_Click" class="btn btn-primary mb-3" />              
            </div>
        </div>
    </div>

        <div id="divGrilla" runat="server">
        <asp:GridView ID="GridViewAlumnos" runat="server" AutoGenerateColumns="False">
    <Columns>        
        <asp:BoundField DataField="idalumno" HeaderText="Id Alumno" />
        <asp:BoundField DataField="nombre" HeaderText="Nombre" />
        <asp:BoundField DataField="DNI" HeaderText="DNI" />
    </Columns>
       </asp:GridView>
            </div>
   
  </form>
   
</body>
</html>
