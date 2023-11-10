using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using MySql.Data.MySqlClient;

namespace login2
{

    public partial class formlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            string nombreUsuario = txtNombreUsuario.Text;
            string contraseña = txtContraseña.Text;


            // Verificar si el usuario ya existe en la base de datos
            if (!UsuarioExiste(nombreUsuario))
            {
                // El usuario no existe, agregarlo a la base de datos
                AgregarUsuario(nombreUsuario, contraseña);
                lblMensaje.Text = "Usuario registrado correctamente.";
            }

            
            else
            {
                // Verificar si el usuario ya existe en la base de datos
                if (UsuarioExiste(nombreUsuario))
                {
                    string contraseñaAlmacenada = ObtenerContraseñaAlmacenada(nombreUsuario);

                    // Desencriptar la contraseña almacenada
                    
                    string contraseñaDesencriptada = Decrypt(contraseñaAlmacenada);

                    // Verificar si la contraseña ingresada coincide con la contraseña almacenada
                    if (contraseña == contraseñaDesencriptada)
                    {
                        lblMensaje.Text = "Ingresó con éxito.";
                        Session.Add("usuario", nombreUsuario);
                        Response.Redirect("VerAlumnos.aspx"); // se redirige al usuario a la pagina de los datos de los alumnos
                    }
                    else
                    {
                        lblMensaje.Text = "Contraseña incorrecta.";
                    }
                }
                /*
                else
                {
                    lblMensaje.Text = "El usuario no existe en la base de datos.";
                }
                */
            }
        }
            private string ObtenerContraseñaAlmacenada(string nombreUsuario)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT contraseña FROM usuarios WHERE nombre = @nombre";
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@nombre", nombreUsuario);
                        return Convert.ToString(command.ExecuteScalar());
                    }
                }
            
            }

            
            private bool UsuarioExiste(string nombreUsuario)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT COUNT(*) FROM usuarios WHERE nombre = @nombre";
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@nombre", nombreUsuario);
                        int count = Convert.ToInt32(command.ExecuteScalar());
                        return count > 0;
                    }
                }
            }

            private void AgregarUsuario(string nombreUsuario, string contraseña)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO usuarios (nombre, contraseña) VALUES (@nombre, @contraseña)";
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        // Encriptar la contraseña antes de almacenarla en la base de datos
                        //string contraseñaEncriptada = EncriptarContraseña(contraseña);
                        string contraseñaEncriptada = Encrypt(contraseña);
                        command.Parameters.AddWithValue("@nombre", nombreUsuario);
                        command.Parameters.AddWithValue("@contraseña", contraseñaEncriptada);
                        command.ExecuteNonQuery();
                    }
                }
            }
                

            private string Encrypt(string password)
            {
                // Encode password
                byte[] passBytes = ASCIIEncoding.ASCII.GetBytes(password);
                return Convert.ToBase64String(passBytes);
            }
        
        private string Decrypt(string encryptedPassword)
        {
            try
            {
                byte[] passBytes = Convert.FromBase64String(encryptedPassword);
                return ASCIIEncoding.ASCII.GetString(passBytes);
            }
            catch (Exception ex)
            {
                // Manejo de errores, por ejemplo, si la cadena no está en formato Base64 válido
                return string.Empty; // O un valor predeterminado
            }
        }

    }
}
