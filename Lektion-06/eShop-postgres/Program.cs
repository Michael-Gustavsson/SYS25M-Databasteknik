using Npgsql;
namespace eShop_mysql;

class Program
{
    static async Task Main()
    {
        // Sätt upp en anslutningssträng till PostgreSQL....
        var connectionString = "Host=127.0.0.1;Username=postgres;Password=EWMnZS22!;Database=eShop";

        // Använd postgres klass NpgsqlDataSourceBuilder för att skapa ett objekt
        // som vi använder för att bygga en datakälla...
        var builder = new NpgsqlDataSourceBuilder(connectionString);
        var dataSource = builder.Build();

        Console.WriteLine("--- Opening connection to PostgreSQL ---");
        // Öppna anslutningen till vår postgreSQL databas...
        var connection = await dataSource.OpenConnectionAsync();

        // Skapa ett fråge objekt för att ställa frågor till vår databas...
        // Observera att man skickar med anslutningen som det andra argumentet
        // till NpgsqlCommand klassens konstruktor...
        await using var query = new NpgsqlCommand("SELECT * FROM Customers", connection);

        // Sedan är det bara att köra frågan😁
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
