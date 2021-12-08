namespace Project.Model
{
    public class ShipmentModel
    {
        public int ID { get; set; }
        public string SenderName { get; set; }
        public string Description { get; set; }
        public string RecipientAddress { get; set; }
        public bool Expedited { get; set; }
        public string ShipmentType { get; set; }
    }
}
