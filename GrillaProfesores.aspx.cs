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
    public partial class GrillaProfesores : System.Web.UI.Page
    {
        int IdCancelar;
       

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["usuario"] == null) return;
                cargarGrilla();
                divBotonVolverGrilla.Visible = false;
            }           
            
        }

        protected void cargarGrilla()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();
                string pSQL = "SELECT * from baseusuarios.profesores"; 
                using (MySqlCommand command = new MySqlCommand(pSQL, connection))
                {
                    using (MySqlDataAdapter adapter = new MySqlDataAdapter(command))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            ViewState.Add("tablaTot", dt);
                            gvProf.DataSource = dt;
                            gvProf.DataBind();
                            
                        }
                        else
                        {
                            lblMensaje.Text = "No se encontraron registros en la tabla Profesores";

                        }
                    }
                }
            }           
           
        }

        protected void btnVolverAlumnos_Click(object sender, EventArgs e)
        {
            Response.Redirect("VerAlumnos.aspx");
        }

        protected void gvProf_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string nId = e.CommandArgument.ToString();

            if (e.CommandName.Equals("Editando"))
            {
                DataTable dt = (DataTable)ViewState["tablaTot"];
                DataView dv = dt.AsDataView();
                dv.RowFilter = "ID = " + nId;

                divGrilla.Visible = false;
                divControl.Visible = true;

                txtId.Text = nId;
                txtNombre.Text = dv[0].Row[1].ToString();
                txtApellido.Text = dv[0].Row[2].ToString();

                divBotonVolver.Visible = false;
                divBotonVolverGrilla.Visible = true;



            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string nombreE = txtNombre.Text;
            string apellidoE = txtApellido.Text;
            int ID = int.Parse(txtId.Text);
             

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                string sentencia = "UPDATE profesores SET nombre= @nombreE, apellido= @apellidoE WHERE ID = @ID";
                using (MySqlCommand command = new MySqlCommand(sentencia, connection))
                {
                    command.Parameters.AddWithValue("@nombreE", nombreE);
                    command.Parameters.AddWithValue("@apellidoE", apellidoE);
                    command.Parameters.AddWithValue("@ID", ID);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected == 1)
                    {
                        // mensaje de éxito
                        lblMensaje2.Text = "Se actualizaron los cambios con exito";
                    }

                    else
                    {
                        // mensaje de error
                        lblMensaje2.Text = "No se pudieron guardar los cambios";
                    }
                }
            }
        }
        
            protected void btnVolverGrilla_Click(object sender, EventArgs e)
            {
              cargarGrilla();
              divGrilla.Visible = true;
              divControl.Visible = false;
              divBotonVolver.Visible = true;
              divBotonVolverGrilla.Visible = false;
            }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            IdCancelar = int.Parse(txtId.Text);

            DataTable dt = (DataTable)ViewState["tablaTot"];
            DataView dv = dt.AsDataView();            
            dv.RowFilter = "ID = " + IdCancelar;

            divGrilla.Visible = false;
            divControl.Visible = true;

            txtId.Text = IdCancelar.ToString();
            txtNombre.Text = dv[0].Row[1].ToString();
            txtApellido.Text = dv[0].Row[2].ToString();

            divBotonVolver.Visible = false;

        }

        protected void gvProf_RowDataBound(object sender, GridViewRowEventArgs e)
            {

            }
    }
}