-- Find the number of users in the database

SELECT COUNT(*)
FROM (
(SELECT UserID from Sellers)
UNION 
(SELECT UserID from Bidders)
)A;


-- Find the number of items in "New York"

SELECT COUNT(Items.ItemID)
FROM Items
WHERE BINARY Location = 'New York';


-- Find the number of auctions belonging to exactly four categories

SELECT COUNT(*)
FROM (SELECT ItemID 
FROM Category
GROUP BY ItemID
HAVING COUNT(Category) = 4) as a;


-- Find the ID(s) of current (unsold) auction(s) with the highest bid

SELECT Bids.ItemID
FROM Bids INNER JOIN Items
ON Bids.ItemID = Items.ItemID
WHERE Ends > '2001-12-20 00:00:01'
AND Amount = (SELECT MAX(Amount) FROM Bids);


-- Find the number of sellers whose rating is higher than 1000

SELECT COUNT(distinct UserID)
FROM Sellers
WHERE SellRating > 1000;


-- Find the number of users who are both sellers and bidders

SELECT COUNT(DISTINCT Items.SellerID)
FROM Items INNER JOIN Bids
ON Items.SellerID = Bids.BidderID;


-- Find the number of categories that include at least one item with a bid of more than $100

SELECT COUNT(DISTINCT Category)
FROM Category INNER JOIN Bids
ON Category.ItemID = Bids.ItemID
WHERE Amount > 100;
