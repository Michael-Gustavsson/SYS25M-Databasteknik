SELECT 
    ItemNumber,
    Name,
    CategoryName,
    Price
FROM Products INNER JOIN ProductsCategory
    ON Products.Id = ProductsCategory.ProductId INNER JOIN Categories
    ON ProductsCategory.CategoryId = Categories.Id