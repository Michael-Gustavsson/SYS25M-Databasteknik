using MySqlConnector;
namespace eShop_mysql;

class Program
{
    static async Task Main()
    {
        // Sätt upp en anslutningssträng till MySQL...
        // Här använder vi vår installerade MySQL Server, därav syntaxen...
        var connectionString = "server=127.0.0.1;uid=root;pwd=EWMnZS22!;database=eShop";

        // Skapa en instans av klassen MySqlConnection och skicka med anslutningssträngen...
        using var connection = new MySqlConnection(connectionString);

        // I övrigt är detta samma syntax som att anropa en Sqlite databas...
        Console.WriteLine("--- Opening connection ---");
        await connection.OpenAsync();

        using var query = connection.CreateCommand();
        query.CommandText = "SELECT * FROM Customers";

        using var reader = await query.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            Console.WriteLine("Getting data: {0}, {1}, {2}", reader.GetInt32(0), reader.GetString(1), reader.GetString(2));
        }

        Console.WriteLine("--- Closing connection ---");

        Console.WriteLine("To Exit the application press Enter");
        Console.ReadLine();
    }
}
