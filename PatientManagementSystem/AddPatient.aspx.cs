using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Configuration;
using System.Web.Script.Serialization;

 

namespace PatientManagementSystem
{
    public partial class AddPatient : System.Web.UI.Page
    {
        [WebMethod]
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                string fname = Request.Form["fname"];
                string mname = Request.Form["mname"];
                string lname = Request.Form["lname"];
                string gender = Request.Form["gender"];
                string dob = Request.Form["dob"];
                string status = Request.Form["status"];
                string addr1 = Request.Form["addr1"];
                string addr2 = Request.Form["addr2"];
                string city = Request.Form["city"];
                string state = Request.Form["state"];
                string zip = Request.Form["zip"];
                string country = Request.Form["country"];
                string phone = Request.Form["phone"];
                string email = Request.Form["email"];
                string language = Request.Form["language"];
                string picURL = Request.Form["picURL"];

                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(cs))
                {
                    using (SqlCommand command = new SqlCommand("InsertPatient", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@FirstName", fname);
                        command.Parameters.AddWithValue("@MiddleName", mname);
                        command.Parameters.AddWithValue("@LastName", lname);
                        command.Parameters.AddWithValue("@Gender", gender);
                        command.Parameters.AddWithValue("@DateOfBirth", dob);
                        command.Parameters.AddWithValue("@Status", status);
                        command.Parameters.AddWithValue("@addr1", addr1);
                        command.Parameters.AddWithValue("@addr2", addr2);
                        command.Parameters.AddWithValue("@city", city);
                        command.Parameters.AddWithValue("@state", state);
                        command.Parameters.AddWithValue("@zip", zip);
                        command.Parameters.AddWithValue("@country", country);
                        command.Parameters.AddWithValue("@phone", phone);
                        command.Parameters.AddWithValue("@email", email); 
                        command.Parameters.AddWithValue("@language", language);
                        command.Parameters.AddWithValue("@Picture", picURL);
                        connection.Open();
                        try
                        {
                            command.ExecuteNonQuery();
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine("Invalid request");
                            Response.ContentType = "application/json";
                            Response.Write("{ \"success\": false, \"error\": \"" + ex.Message + "\" }");
                            return; 
                        }

                    }
                }
            }
        }

    }
}