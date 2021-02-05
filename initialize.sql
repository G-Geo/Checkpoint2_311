CREATE TABLE Customers (
    customerID INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    DOB date,
    email VARCHAR(50),
    address VARCHAR(50),
    building VARCHAR(50),
    zip INT(10),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    phone1 VARCHAR(50),
    phone2 VARCHAR(50),
    password VARCHAR(50),
    creditCard VARCHAR(50),
    creditCardType VARCHAR(50),
    creditCardExp VARCHAR(50),
    billingAddress VARCHAR(50),
    billingCity VARCHAR(50),
    billingZip VARCHAR(50),
    billingCountry VARCHAR(50),
    shippingAddress VARCHAR(50),
    shippingCity VARCHAR(50),
    shippingState VARCHAR(50),
    shippingZip VARCHAR(50),
    shippingCountry VARCHAR(50),
    accountCreationDate VARCHAR(50),

    PRIMARY KEY (customerID)
);

CREATE TABLE Sellers (
    sellerID INT NOT NULL AUTO_INCREMENT,
    companyName VARCHAR(50),
    companyEmail VARCHAR(50),
    companyPhone VARCHAR(50),
    companyPhone2 VARCHAR(50),
    companyAddress VARCHAR(50),
    companyAddress2 VARCHAR(50),
    url VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    zip INT(10),
    country VARCHAR(50),
    Logo VARCHAR(100),   

    PRIMARY KEY (sellerID) 
);

CREATE TABLE ShipperInfo (
    shipperID INT NOT NULL AUTO_INCREMENT,
    shippingCompanyName VARCHAR(50),
    phone VARCHAR(50),
    address VARCHAR(50),

    PRIMARY KEY (shipperID)
);

CREATE TABLE Categories (
    categoryID INT NOT NULL AUTO_INCREMENT,
    categoryName VARCHAR(50) NOT NULL,
    description VARCHAR(50),

    PRIMARY KEY (categoryID)
);

CREATE TABLE Products (
    productID INT NOT NULL AUTO_INCREMENT,
    productName VARCHAR(50),
    productDescription VARCHAR(50),
    productColor VARCHAR(50),
    productSize VARCHAR(50),
    productWeight VARCHAR(50),
    productPictures VARCHAR(50),

    categoryID INT NOT NULL,

    unitPrice VARCHAR(50),
    unitsInStock VARCHAR(50),

    productURL VARCHAR(100),
    sellerID INT NOT NULL,
    SKU VARCHAR(50),
    
    PRIMARY KEY (productID),
    FOREIGN KEY (sellerID)
    REFERENCES Sellers (sellerID),
    FOREIGN KEY (categoryID)
    REFERENCES Categories (categoryID)
);

CREATE TABLE Orders (
    orderID INT NOT NULL AUTO_INCREMENT,
    orderNumber VARCHAR(50),
    customerID INT NOT NULL,
    paymentID VARCHAR(50) UNIQUE,
    orderDate VARCHAR(50),
    shipDate VARCHAR(50),
    shipperID INT NOT NULL,
    cancelled BOOLEAN,
    cancellationDate VARCHAR(50),
    fulfilled BOOLEAN,
    paid BOOLEAN,
    paymentDate VARCHAR(50),

    PRIMARY KEY (orderID),
    FOREIGN KEY (customerID)
    REFERENCES Customers (customerID),
    FOREIGN KEY (shipperID)
    REFERENCES ShipperInfo (shipperID)
);

CREATE TABLE OrderDetails (
    orderNumber INT NOT NULL AUTO_INCREMENT,
    orderID INT NOT NULL,
    productID INT NOT NULL,
    price VARCHAR(50),
    quantity INT(100),
    discount VARCHAR(50),
    total VARCHAR(50),
    size VARCHAR(50),
    weight VARCHAR(50),
    billDate VARCHAR(50),

    PRIMARY KEY (orderNumber),
    FOREIGN KEY (productID)
    REFERENCES Products(productID),
    FOREIGN KEY (orderID)
    REFERENCES Orders (orderID)
);

CREATE TABLE Payments (
    paymentNo INT NOT NULL AUTO_INCREMENT,
    paymentID VARCHAR(50) UNIQUE,
    paymentType VARCHAR(50),
    allowed BOOLEAN,

    PRIMARY KEY (paymentNo),
    FOREIGN KEY (paymentID)
    REFERENCES Orders (paymentID)
);