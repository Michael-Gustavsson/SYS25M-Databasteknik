# postgreSQL

För att kunna använda postgreSQL i våra applikationer behöver vi installera en drivrutan eller paket som hjälper oss att kommunicera med postgres databaser.

I terminalfönstret kör följande kommando för att installera paketet
``` dotnet add package Npgsql ```

I program.cs importera paketet genom att högst upp i filen skriva följande kommando
``` using Npgsql; ```