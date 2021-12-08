using Microsoft.AspNetCore.Mvc;
using Project.Model;
using Project.Service;
using System.Collections.Generic;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Project.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ShipmentController : ControllerBase
    {
        IShipmentService _shipmentService;
        public ShipmentController(IShipmentService shipmentService)
        {
            _shipmentService = shipmentService;
        }
        // GET: api/<ShipmentController>
        [HttpGet]
        public async Task<IEnumerable<ShipmentModel>> Get()
        {
            return await _shipmentService.Get();
        }
        // GET api/<ShipmentController>/5
        [HttpGet("{id}")]
        public async Task<ShipmentModel> Get(int id)
        {
            return await _shipmentService.Get(id);
        }
        // POST api/<ShipmentController>
        [HttpPost]
        public async Task Post([FromBody] ShipmentModel shipmentModel)
        {
            await _shipmentService.Create(shipmentModel);
        }
        // DELETE api/<ShipmentController>/5
        [HttpDelete("{id}")]
        public async Task Delete(int id)
        {
            await _shipmentService.Delete(id);
        }
    }
}
