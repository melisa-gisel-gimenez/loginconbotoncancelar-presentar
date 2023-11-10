<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GrillaProfesores.aspx.cs" Inherits="login2.GrillaProfesores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
    <title>GrillaProfesores</title>

    <link href="css/AdmPropio.css" rel="stylesheet" type="text/css" />
    <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
        
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div class="form-group">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="div-1 text-center">
                                <asp:Label ID="lblTitulo" Font-Size="25px" ForeColor="White" Text="Profesores" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div id="divGrilla" runat="server" class="row">
                        <div class="col-lg-10 form-group form-group-inline">
                            <asp:GridView ID="gvProf" DataKeyNames="id" AllowPaging="false" runat="server"
                                HeaderStyle-BackColor="#c0c0c0"
                                AutoGenerateColumns="false" AllowSorting="true" style="font-size: 0.9em;"
                                CssClass="table table-bordered table-hover" ShowFooter="false" ShowHeaderWhenEmpty="false"
                                OnRowCommand="gvProf_RowCommand"
                                OnRowDataBound="gvProf_RowDataBound">                                
                                
                                <Columns>
                                    <asp:TemplateField HeaderText="Acciones">
                                        <ItemTemplate>
                                            <asp:Button ID="btnEditar" runat="server" CssClass="btn btn-warning" Whidth="75px"
                                                CommandName="Editando" 
                                                CommandArgument='<%#Eval("ID") %>'
                                                ToolTip="Editar Fila" Text="Editar" />
                                        </ItemTemplate>
                                        </asp:TemplateField>
                                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="true" />
                                    <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" ReadOnly="true" />
                                    <asp:BoundField DataField="APELLIDO" HeaderText="APELLIDO" ReadOnly="true" />        
                               </Columns>
                                </asp:GridView>
                            <asp:Label ID="lblMensaje" ForeColor="Red" Font-Bold="true" runat="server" Text=""></asp:Label>

                        </div>
                    </div>
                    <br />

                    <div id="divControl" runat="server" visible= "false">
                        <div class="row">
                        <div class="col-lg-2">
                            <asp:Label ID="lblId" runat="server" Text="Id: "></asp:Label>
                       </div>
                        <div class="col-lg-3">
                        <asp:TextBox ID="txtId" runat="server" Font-Bold="true" Enabled="false"></asp:TextBox>
                    </div>
                    </div>
                        <br />

                    <div class="row">
                        <div class="col-lg-2">
                            <asp:Label ID="lblNombre" runat="server" Text="Nombre: "></asp:Label>
                       </div>

                        <div class="col-lg-3">
                        <asp:TextBox ID="txtNombre" runat="server" Font-Bold="true"></asp:TextBox>
                    </div>
                    </div>

                        <br />

                    <div class="row">
                        <div class="col-lg-2">
                            <asp:Label ID="lblApellido" runat="server" Text="Apellido: "></asp:Label>
                       </div>

                        <div class="col-lg-3">
                        <asp:TextBox ID="txtApellido" runat="server" Font-Bold="true"></asp:TextBox>
                    </div>
                    </div>
                        
                        

                        <div class="btn btn-group">
                         <div class="col-lg-3">
                           <div class="col-md-6 d-flex flex-column align-items-start"> 
                               
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" class="btn btn-success mb-3" />
                                               
                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" class="btn btn-danger mb-3" />
                              
                               
                                                           
                               
                               <asp:Label ID="lblMensaje2" runat="server" Text="" ForeColor="Red"></asp:Label>
                           </div> 
                          </div>
                                </div>
                        </div>
                     
                    <div id="divBotonVolverGrilla" runat="server" class="row">
                         <div class="col-lg-2">
                       
                               <asp:Button ID="btnVolverGrilla" runat="server" Text="Volver a Grilla" OnClick="btnVolverGrilla_Click" class="btn btn-warning mb-3" />
                               </div>  
                        </div>
                      
                    
                    <div class="row">
                         <div class="col-lg-2">
                           <div id="divBotonVolver" runat="server" class="col-md-6 d-flex flex-column align-items-end">               
                            <asp:Button ID="btnVolverAlumnos" runat="server" Text="Volver a Alumnos" OnClick="btnVolverAlumnos_Click" class="btn btn-primary mb-3" />
                          </div>            
                        </div>        
                     </div>
                 </div>
                        
                    
         </div>
      </div>
    
        
    </form>
</body>
</html>
