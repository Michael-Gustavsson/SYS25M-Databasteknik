# PostgreSQL Installations problem

Kolla detta!

1.	Kolla så att inga processer till någon komponent som är kopplad
	till postgreSQL körs
		- Services
		- Task Manager

2.	Kontrollera behörighet i katalogen som PostgreSQL ska installeras i
	- Inloggad användare måste ha full åtkomst till katalogen
	- Försök att placera postgreSQL i en egen katalog där åtkomst är satt
	  till full åtkomst för inloggad användare

3.	Försök att manuellt initiera databasen
	- initdb -D "Sökväg till data katalogen"

4.	Eventuellt kontrollera så att porten 5432 inte används av någon
	annan process