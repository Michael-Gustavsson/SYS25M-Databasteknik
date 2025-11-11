using Microsoft.Data.Sqlite;

namespace eShop_mysql;

class Program
{
    static async Task Main()
    {
        // Sätt upp en anslutningssträng till Sqlite...
        var connectionString = "Data Source=eShop.db";

        // Skapa en instans av klassen SqliteConnection och skicka med anslutningssträngen...
        using var connection = new SqliteConnection(connectionString);

        Console.WriteLine("--- Opening connection ---");
        // Öppna anslutningen
        // Vi använder en metod som ser till att vi inte går vidare i koden
        // förrän anslutning till databasen är öppen...
        await connection.OpenAsync();

        // Här skapar vi ett objekt för att kunna skicka en fråga till databasen...
        using var query = connection.CreateCommand();
        // Vi använder egenskapen CommandText för att ange vad vi vill hämta
        // med hjälp av ett SQL uttryck...
        query.CommandText = "SELECT * FROM Customers";

        // Här kör vi frågan med hjälp av metoden ExecuteReaderAsync på vårt
        // query objekt.
        // Resultatet som kommer tillbaka kallas för ett reader objekt.
        // Enkelt uttryckt är en reader resultatet som vi får tillbaka
        // ifrån frågan med samma kolumner som finns i tabellen vi frågar efter...
        using var reader = await query.ExecuteReaderAsync();

        // Slutligen så itererar(loopar) vi igenom resultatet
        // Så länger som metoden ReadAsync returnerar en rad ur resultatet
        // så fortsätter while loopen.
        while (await reader.ReadAsync())
        {
            // Här skriver vi ut resultatet
            // resultatet har samma uppbyggnad som tabellen vi byggt ihop
            // 1:a kolumnen innehåller kund id av typen INTEGER
            // 2:a kolumnen innehåller förnamn av typen VARCHAR = string
            // 3:e kolumnen innehåller efternamn av typen VARCHAR = string
            Console.WriteLine("Getting data: {0}, {1}, {2}", reader.GetInt32(0), reader.GetString(1), reader.GetString(2));
        }

        Console.WriteLine("--- Closing connection ---");

        Console.WriteLine("To Exit the application press Enter");
        Console.ReadLine();
    }
}
