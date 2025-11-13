using MySqlConnector;
namespace eShop_mysql;

class Program
{
    static async Task Main()
    {
        // Sätt upp en anslutningssträng till MySQL...
        var connectionString = "server=127.0.0.1;uid=root;pwd=EWMnZS22!;database=eShop";

        // Lägg till ny produkt...
        // var result = await AddProduct(connectionString);
        // Console.WriteLine("Har lagt till en produkt, fick tillbaka detta: {0}", result);

        if (await UpdateProduct(connectionString)) Console.WriteLine("Produkt uppdaterad");

        if (await DeleteProduct(connectionString)) Console.WriteLine("Produkt borttagen");

        var products = await ListProducts(connectionString);

        foreach (var product in products)
        {
            Console.WriteLine($"{product.Id} - {product.ItemNumber}, {product.Name}, {product.Description}, {product.Price.ToString("N2")}");
        }

        Console.WriteLine("To Exit the application press Enter");
        Console.ReadLine();
    }

    static async Task<int> AddProduct(string connectionString)
    {
        using var connection = new MySqlConnection(connectionString);
        await connection.OpenAsync();

        using var query = connection.CreateCommand();
        query.CommandText = @"INSERT INTO Products(ItemNumber,Name,Description,Price) 
            VALUES(@itemNumber, @name, @description, @price);";

        query.Parameters.AddWithValue("@itemNumber", "HH-999666");
        query.Parameters.AddWithValue("@name", "Vedklyv");
        query.Parameters.AddWithValue("@description", "Testar");
        query.Parameters.AddWithValue("@price", 1095);

        int rowsAffected = await query.ExecuteNonQueryAsync();
        connection.Close();
        return rowsAffected;
    }

    static async Task<IList<Product>> ListProducts(string connectionString)
    {
        using var connection = new MySqlConnection(connectionString);
        await connection.OpenAsync();

        using var query = connection.CreateCommand();
        query.CommandText = "SELECT Id,ItemNumber,Name, Description,Price FROM Products;";

        var reader = await query.ExecuteReaderAsync();

        var products = new List<Product>();

        while (await reader.ReadAsync())
        {
            products.Add(new Product()
            {
                Id = reader.GetInt32(0),
                ItemNumber = reader.GetString(1),
                Name = reader.GetString(2),
                Description = reader.GetValue(3) == DBNull.Value ? "Saknas" : reader.GetString(3),
                Price = reader.GetDecimal(4)
            });
        }
        // Nu är anslutningen stängd och även datareadern...
        // Returnera en lista med produkt objekt...
        return products;
    }

    // Skapa en funktion som uppdaterar en vald produkts pris...
    static async Task<bool> UpdateProduct(string connectionString)
    {
        using var connection = new MySqlConnection(connectionString);
        await connection.OpenAsync();

        using var query = connection.CreateCommand();
        query.CommandText = @"UPDATE Products SET Price = @price WHERE Id = @id;";

        query.Parameters.AddWithValue("@price", 895);
        query.Parameters.AddWithValue("@id", 4);

        int rowsAffected = await query.ExecuteNonQueryAsync();
        if (rowsAffected > 0) return true;
        return false;
    }

    // Skapa en funktion som tar bort en vald product...
    static async Task<bool> DeleteProduct(string connectionString)
    {
        using var connection = new MySqlConnection(connectionString);
        await connection.OpenAsync();

        using var query = connection.CreateCommand();
        query.CommandText = @"DELETE FROM Products WHERE Id = @id;";

        query.Parameters.AddWithValue("@id", 9);

        int rowsAffected = await query.ExecuteNonQueryAsync();
        if (rowsAffected > 0) return true;
        return false;

    }
}
