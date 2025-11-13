using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace eShop_mongodb;

public class Customer
{
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string Id { get; set; } = "";
    public string Name { get; set; } = "";
    public Address Address { get; set; } = new();
}
