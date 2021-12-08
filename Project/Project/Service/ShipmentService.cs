using Project.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace Project.Service
{
    public class ShipmentService : IShipmentService
    {
        public string ConnectionString { get; set; }
        public ShipmentService()
        {
            ConnectionString = "Server=KUNAL-RANJAN\\SQLEXPRESS;Database=CrudProject;User Id=sa;Password=kunal@470;";
        }
        public async Task Delete(int Id)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("DeleteShipment", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", Id);
                con.Open();
                await cmd.ExecuteNonQueryAsync();
                con.Close();
            }
        }
        public async Task<List<ShipmentModel>> Get()
        {
            List<ShipmentModel> ShipmentList = new List<ShipmentModel>();
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("GetShipments", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = await cmd.ExecuteReaderAsync();
                while (rdr.Read())
                {
                    ShipmentList.Add(new ShipmentModel
                    {
                        ID = Convert.ToInt32(rdr["Id"]),
                        SenderName = rdr["SenderName"].ToString(),
                        Description = rdr["Description"].ToString(),
                        RecipientAddress = rdr["RecipientAddress"].ToString(),
                        Expedited = Convert.ToBoolean(rdr["Expedited"]),
                        ShipmentType = rdr["ShipmentType"].ToString()
                    });
                }
                con.Close();
            }
            return ShipmentList;
        }
        public async Task<ShipmentModel> Get(int ID)
        {
            ShipmentModel shipmentModel = new ShipmentModel();
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("GetShipment", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", ID);
                con.Open();
                SqlDataReader rdr = await cmd.ExecuteReaderAsync();
                while (rdr.Read())
                {
                    shipmentModel = new ShipmentModel
                    {
                        ID = Convert.ToInt32(rdr["Id"]),
                        SenderName = rdr["SenderName"].ToString(),
                        Description = rdr["Description"].ToString(),
                        RecipientAddress = rdr["RecipientAddress"].ToString(),
                        Expedited = Convert.ToBoolean(rdr["Expedited"]),
                        ShipmentType = rdr["ShipmentType"].ToString()
                    };
                }
                con.Close();
            }
            return shipmentModel;        }
        public async Task Create(ShipmentModel Obj)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("CreateShipment", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SenderName", Obj.SenderName);
                cmd.Parameters.AddWithValue("@Description", Obj.Description);
                cmd.Parameters.AddWithValue("@RecipientAddress", Obj.RecipientAddress);
                cmd.Parameters.AddWithValue("@Expedited", Obj.Expedited);
                cmd.Parameters.AddWithValue("@ShipmentType", Obj.ShipmentType);
                con.Open();
                await cmd.ExecuteNonQueryAsync();
                con.Close();
            }
        }
    }
    public interface IShipmentService
    {
        Task<List<ShipmentModel>> Get();
        Task<ShipmentModel> Get(int ID);
        Task Create(ShipmentModel Obj);
        Task Delete(int Id);
    }
}
