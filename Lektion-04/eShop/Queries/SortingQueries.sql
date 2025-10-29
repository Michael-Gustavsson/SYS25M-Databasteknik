SELECT * FROM Customers
    ORDER BY LastName ASC; -- Ascending(ASC) är standard...

SELECT * FROM Customers
    ORDER BY LastName DESC;

SELECT * FROM Customers
    ORDER BY LastName, FirstName, Phone ASC;

SELECT * FROM Customers
    ORDER BY LastName, FirstName, Phone DESC;

-- INSERT INTO Customers(
--     FirstName,
--     LastName,
--     Email,
--     Phone
-- )VALUES(
--     'Annika',
--     'Gustafsson',
--     'annika@gmail.com',
--     '073-294567'
-- );