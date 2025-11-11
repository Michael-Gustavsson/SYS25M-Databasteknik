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

        await ListProducts(connectionString);

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

    static async Task ListProducts(string connectionString)
    {
        using var connection = new MySqlConnection(connectionString);
        await connection.OpenAsync();

        using var query = connection.CreateCommand();
        query.CommandText = "SELECT ItemNumber,Name,Price FROM Products;";

        var reader = await query.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            Console.WriteLine("Getting data: {0}, {1}, {2}",
            reader.GetString(0), reader.GetString(1), reader.GetDouble(2));
        }
        // Nu är anslutningen stängd och även datareadern...
        // Returnera en lista med produkt objekt...
    }

    // Skapa en funktion som uppdaterar en vald produkts pris...
    static async Task UpdateProduct(string connectionString)
    {
        // query.CommandText = @"UPDATE Products SET Price = @price WHERE Id = @id;";
        // Inte returnerar ett resultat ifrån databas tabellen... 
    }

    // Skapa en funktion som tar bort en vald product...
    static async Task DeleteProduct(string connectionString)
    {

    }
}
