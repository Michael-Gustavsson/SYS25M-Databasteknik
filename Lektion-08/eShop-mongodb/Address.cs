
// using MongoDB.Bson;
// using MongoDB.Bson.Serialization.Attributes;

namespace eShop_mongodb;

public class Address
{
    // [BsonId]
    // [BsonRepresentation(BsonType.ObjectId)]
    // public string Id { get; set; } = "";
    public string AddressLine { get; set; } = "";
    public string PostalCode { get; set; } = "";
    public string City { get; set; } = "";
}
