-- 1. province
CREATE TABLE Province (
    provinceId INT PRIMARY KEY,
    provinceName NVARCHAR(255) NOT NULL
);

-- 2. city district
CREATE TABLE City_District (
    cityDistrictId INT PRIMARY KEY,
    cityDistrictName NVARCHAR(255) NOT NULL,
    provinceId INT FOREIGN KEY REFERENCES Province(provinceId)
);

-- 3. owner account
CREATE TABLE Owner_Account (
    ownerIdCardNumber NVARCHAR(20) PRIMARY KEY,
    userName NVARCHAR(100) NOT NULL,
    passWord NVARCHAR(100) NOT NULL,
    firstName NVARCHAR(100),
    lastName NVARCHAR(100),
    dob DATE,
    phoneNumber NVARCHAR(20),
    email NVARCHAR(255),
    bankAccountNumber NVARCHAR(50)
);

-- 4. accommodation type
CREATE TABLE Accommodation_Type (
    accommodationTypeId NVARCHAR(10) PRIMARY KEY,
    accommodationTypeName NVARCHAR(255)
);

-- 5. accommodation
CREATE TABLE Accommodation (
    accommodationId NVARCHAR(20) PRIMARY KEY,
    accommodationName NVARCHAR(255),
    ownerIdCardNumber NVARCHAR(20) FOREIGN KEY REFERENCES Owner_Account(ownerIdCardNumber),
    cityDistrictId INT FOREIGN KEY REFERENCES City_District(cityDistrictId),
    streetAddress NVARCHAR(255),
    accommodationTypeId NVARCHAR(10) FOREIGN KEY REFERENCES Accommodation_Type(accommodationTypeId),
    numberOfRooms INT,
    capacity INT,
    pricePerNight DECIMAL(10,2)
);

-- 6. guest Account
CREATE TABLE Guest_Account (
    guestIdCardNumber NVARCHAR(20) PRIMARY KEY,
    userName NVARCHAR(100) NOT NULL,
    passWord NVARCHAR(100) NOT NULL,
    firstName NVARCHAR(100),
    lastName NVARCHAR(100),
    dob DATE,
    phoneNumber NVARCHAR(20),
    email NVARCHAR(255)
);

-- 7. amenities
CREATE TABLE Amenities (
    amenityId NVARCHAR(10) PRIMARY KEY,
    amenityName NVARCHAR(255)
);

-- 8. amenity included
CREATE TABLE Amenities_Included (
    accommodationId NVARCHAR(20),
    amenityId NVARCHAR(10),
    PRIMARY KEY (accommodationId, amenityId),
    FOREIGN KEY (accommodationId) REFERENCES Accommodation(accommodationId),
    FOREIGN KEY (amenityId) REFERENCES AMENITIES(amenityId)
);

-- 9. facilities
CREATE TABLE Facilities (
    facilityId NVARCHAR(10) PRIMARY KEY,
    facilityName NVARCHAR(255)
);

-- 10. Facilities Include
CREATE TABLE Facilities_Included (
    accommodationId NVARCHAR(20),
    facilityId NVARCHAR(10),
    PRIMARY KEY (accommodationId, facilityId),
    FOREIGN KEY (accommodationId) REFERENCES Accommodation(accommodationId),
    FOREIGN KEY (facilityId) REFERENCES Facilities(facilityId)
);

-- 11. Voucher Coupon
CREATE TABLE Voucher_Coupon (
    vcCode NVARCHAR(20) PRIMARY KEY,
    discountValue DECIMAL(10,2) NOT NULL,
    discountUnit NVARCHAR(10),
    validFrom DATE,
    validTo DATE
);

-- 12. Booking
CREATE TABLE Booking (
    bookingId NVARCHAR(20) PRIMARY KEY,
    guestIdCardNumber NVARCHAR(20) FOREIGN KEY REFERENCES Guest_Account(guestIdCardNumber),
    accommodationId NVARCHAR(20) FOREIGN KEY REFERENCES Accommodation(accommodationId),
    reservedCheckInTime DATETIME,
    checkInTime DATETIME,
    checkOutTime DATETIME,
    vcCode NVARCHAR(20) FOREIGN KEY REFERENCES Voucher_Coupon(vcCode),
    dateTimeCancel DATETIME
);

-- 13. Payment
CREATE TABLE Payment (
    transactionId NVARCHAR(50) PRIMARY KEY,
    bookingId NVARCHAR(20) FOREIGN KEY REFERENCES Booking(bookingId),
    paymentType NVARCHAR(50),
    bankAccountNumber NVARCHAR(50)
);

-- 14. Feedback
CREATE TABLE Feedback (
    guestIdCardNumber NVARCHAR(20),
    accommodationId NVARCHAR(20),
    rating INT,
    comment NVARCHAR(1000),
    PRIMARY KEY (guestIdCardNumber, accommodationId),
    FOREIGN KEY (guestIdCardNumber) REFERENCES Guest_Account(guestIdCardNumber),
    FOREIGN KEY (accommodationId) REFERENCES Accommodation(accommodationId)
);
