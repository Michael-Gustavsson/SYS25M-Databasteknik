using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace eShop_mongodb;

public class Product
{
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string Id { get; set; } = "";
    public string ItemNumber { get; set; } = "";
    public string Name { get; set; } = "";
    public string? Description { get; set; }
    public decimal Price { get; set; }
}
