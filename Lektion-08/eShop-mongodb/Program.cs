
using MongoDB.Driver;
namespace eShop_mongodb;

class Program
{
    static async Task Main(string[] args)
    {
        string connectionUrl = "mongodb://127.0.0.1:27017";
        string databaseName = "eShop";
        // string productsCollection = "products";
        string customersCollection = "customers";

        var client = new MongoClient(connectionUrl);
        var db = client.GetDatabase(databaseName);
        // var prodCollection = db.GetCollection<Product>(productsCollection);
        var custCollection = db.GetCollection<Customer>(customersCollection);

        // var product = new Product()
        // {
        //     ItemNumber = "AA-333",
        //     Name = "Handslägga",
        //     Description = "Testar igen och igen",
        //     Price = 350
        // };

        // await prodCollection.InsertOneAsync(product);

        // var results = await prodCollection.FindAsync(_ => true);

        // foreach (var item in results.ToList())
        // {
        //     Console.WriteLine($"{item.Id} {item.ItemNumber} {item.Name} {item.Price}");
        // }

        var customer = new Customer()
        {
            Name = "Bosse Kofot",
            Address = new Address()
            {
                AddressLine = "Gatan 1",
                PostalCode = "123 45",
                City = "Stora staden"
            }
        };

        await custCollection.InsertOneAsync(customer);

        var results = await custCollection.FindAsync(_ => true);

        foreach (var item in results.ToList())
        {
            Console.WriteLine($"{item.Name}, {item.Address.AddressLine} , {item.Address.PostalCode}, {item.Address.City}");
        }
    }
}
