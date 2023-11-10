using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace login2
{
    public partial class VerAlumnos : System.Web.UI.Page

    {
        
        private int ultimoIndice; 


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["usuario"] == null) return;           
                CargarAlumnos();
                
                DataTable dt = (DataTable)ViewState["tablaAlumnos"];
                DataView dv = dt.AsDataView();
                txtId.Text = dv[0].Row[0].ToString();
                txtNombreUsuario.Text = dv[0].Row[1].ToString();
                txtDNI.Text = dv[0].Row[2].ToString();

                divGrilla.Visible = false;
                divId.Visible = false;
                                
            }
        }

        private void CargarAlumnos()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();
                string pSQL = "SELECT * from baseusuarios.alumnos";
                using (MySqlCommand command = new MySqlCommand(pSQL, connection))
                {
                    using (MySqlDataAdapter adapter = new MySqlDataAdapter(command))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            ViewState.Add("tablaAlumnos", dt);
                            GridViewAlumnos.DataSource = dt;
                            GridViewAlumnos.DataBind();

                        }
                        else
                        {
                            lblMensaje.Text = "No se encontraron registros en la tabla Profesores";

                        }
                    }
                }
            }
        }

        protected void btnFirst_Click(object sender, EventArgs e)
        {           
            
            DataTable dt = (DataTable)ViewState["tablaAlumnos"];
            DataView dv = dt.AsDataView();
            txtId.Text = dv[0].Row[0].ToString();
            txtNombreUsuario.Text = dv[0].Row[1].ToString();
            txtDNI.Text = dv[0].Row[2].ToString();

            ultimoIndice = int.Parse(txtId.Text);
            lblMensaje.Text = "";

        }

        protected void btnAnterior_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "";
            
            DataTable dt = (DataTable)ViewState["tablaAlumnos"];
            DataView dv = dt.AsDataView();

            ultimoIndice= int.Parse(txtId.Text);

            if (ultimoIndice >=2)
            {
                ultimoIndice--;   
                txtId.Text = dv[ultimoIndice-1].Row[0].ToString();
                txtNombreUsuario.Text = dv[ultimoIndice-1].Row[1].ToString();
                txtDNI.Text = dv[ultimoIndice-1].Row[2].ToString();
            }
            else
            {
                lblMensaje.Text = "Este es el primer registro de la tabla. No hay registros anteriores";
                
            }

            
        }

        protected void btnSiguiente_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "";

            DataTable dt = (DataTable)ViewState["tablaAlumnos"];
            DataView dv = dt.AsDataView();

            ultimoIndice = int.Parse(txtId.Text);

            if (ultimoIndice < dt.Rows.Count)
            {
                ultimoIndice = ultimoIndice +1;
                txtId.Text= dv[ultimoIndice-1].Row[0].ToString();
                txtNombreUsuario.Text = dv[ultimoIndice-1].Row[1].ToString();
                txtDNI.Text = dv[ultimoIndice-1].Row[2].ToString();
                
            }
            else
            {
                // Aquí puedes manejar el caso de que ya estés en el último registro.
                lblMensaje.Text = "Este es el ultimo registro de la tabla. No hay más registros siguientes para mostrar";
                
            }          
            
            
        }

        protected void btnLast_Click(object sender, EventArgs e)
        {
            int ultimoIndice2 = GridViewAlumnos.Rows.Count - 1;
            DataTable dt = (DataTable)ViewState["tablaAlumnos"];
            DataView dv = dt.AsDataView();
            txtId.Text = dv[ultimoIndice2].Row[0].ToString();
            txtNombreUsuario.Text = dv[ultimoIndice2].Row[1].ToString();
            txtDNI.Text = dv[ultimoIndice2].Row[2].ToString();

            ultimoIndice = ultimoIndice2;

            lblMensaje.Text = "";

        }


        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("formlogin.aspx");
        }

        protected void btnGrilla_Click(object sender, EventArgs e)
        {
            Response.Redirect("GrillaProfesores.aspx");
        }
    }
    
}
    

























































