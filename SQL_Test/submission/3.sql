-- 1. Province
BULK INSERT Province
FROM 'C:\Users\phungnguyen\Documents\SQL Test\data\utf16\PROVINCE.csv'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',    
    FIRSTROW = 2
);

-- 2. City_District
BULK INSERT City_District
FROM 'C:\Users\phungnguyen\Documents\SQL Test\data\utf16\CITY_DISTRICT.csv'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',    
    FIRSTROW = 2
);

-- 3. Owner_Account
BULK INSERT Owner_Account
FROM 'C:\Users\phungnguyen\Documents\SQL Test\data\utf16\OWNER_ACCOUNT.csv'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',    
    FIRSTROW = 2
);

-- 4. Accommodation_Type
BULK INSERT Accommodation_Type
FROM 'C:\Users\phungnguyen\Documents\SQL Test\data\utf16\ACCOMMODATION_TYPE.csv'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',    
    FIRSTROW = 2
);

-- 5. Accommodation
BULK INSERT Accommodation
FROM 'C:\Users\phungnguyen\Documents\SQL Test\data\utf16\ACCOMMODATION.csv'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',    
    FIRSTROW = 2
);

-- 6. Guest_Account
BULK INSERT Guest_Account
FROM 'C:\Users\phungnguyen\Documents\SQL Test\data\utf16\GUEST_ACCOUNT.csv'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',    
    FIRSTROW = 2
);

-- 7. Amenities
BULK INSERT Amenities
FROM 'C:\Users\phungnguyen\Documents\SQL Test\data\utf16\AMENITIES.csv'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',    
    FIRSTROW = 2
);

-- 8. Amenities_Included
BULK INSERT Amenities_Included
FROM 'C:\Users\phungnguyen\Documents\SQL Test\data\utf16\AMENITIES_INCLUDED.csv'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',    
    FIRSTROW = 2
);

-- 9. Facilities
BULK INSERT Facilities
FROM 'C:\Users\phungnguyen\Documents\SQL Test\data\utf16\FACILITIES.csv'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',    
    FIRSTROW = 2
);

-- 10. Facilities_Included
BULK INSERT Facilities_Included
FROM 'C:\Users\phungnguyen\Documents\SQL Test\data\utf16\FACILITIES_INCLUDED.csv'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',    
    FIRSTROW = 2
);

-- 11. Voucher_Coupon
BULK INSERT Voucher_Coupon
FROM 'C:\Users\phungnguyen\Documents\SQL Test\data\utf16\VOUCHER_COUPON.csv'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',    
    FIRSTROW = 2
);

-- 12. Booking
BULK INSERT Booking
FROM 'C:\Users\phungnguyen\Documents\SQL Test\data\utf16\BOOKING.csv'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',    
    FIRSTROW = 2
);

-- 13. Payment
BULK INSERT Payment
FROM 'C:\Users\phungnguyen\Documents\SQL Test\data\utf16\PAYMENT.csv'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',    
    FIRSTROW = 2
);

-- 14. Feedback
BULK INSERT Feedback
FROM 'C:\Users\phungnguyen\Documents\SQL Test\data\utf16\FEEDBACK.csv'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',    
    FIRSTROW = 2
);
