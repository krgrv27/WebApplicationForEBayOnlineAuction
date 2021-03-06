CREATE TABLE Sellers(
UserID VARCHAR(100),
SellRating INT,
PRIMARY KEY(UserID)
);

CREATE TABLE Bidders(
UserID VARCHAR(100),
BidRating INT,
Location VARCHAR(100),
Country VARCHAR(100),
PRIMARY KEY(UserID)
);

CREATE TABLE Items(
ItemID INT,
SellerID VARCHAR(100),
Name VARCHAR(100),
Buy_Price DECIMAL(8,2),
First_Bid DECIMAL(8,2),
Started TIMESTAMP,
Ends TIMESTAMP,
Latitude DECIMAL(13,10),
Longitude DECIMAL(13,10),
Location VARCHAR(100),
Country VARCHAR(100),
Description VARCHAR(4000),
PRIMARY KEY(ItemID),
FOREIGN KEY(SellerID) REFERENCES Sellers(UserID)
);

CREATE TABLE Category(
ItemID INT,
Category VARCHAR(100),
PRIMARY KEY(ItemID, Category),
FOREIGN KEY(ItemID) REFERENCES Items(ItemID)
);

CREATE TABLE Bids(
ItemID INT,
BidderID VARCHAR(100),
Time TIMESTAMP,
Amount DECIMAL(8,2),
PRIMARY KEY(ItemID, BidderID, Time),
FOREIGN KEY(ItemID) REFERENCES Items(ItemID),
FOREIGN KEY(BidderID) REFERENCES Bidders(UserID)
);
