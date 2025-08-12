--5.4
-- Write a stored procedure for an accommodation search system:
-- Create a stored procedure `search_accommodations` that takes these parameters:
-- Required capacity (number of guests)
-- * Required amenities (optional, comma-separated amenity IDs)
-- * Required facilities (optional, comma-separated facility IDs)
-- - The procedure should return:
--  * Accommodation details (AccommodationID, AccommodationName, AccommodationType, PricePerNight, Capacity, NumberOfRooms)
-- - Execute the procedure with:
--  * Required capacity: 18
--  * Required facilities: 'F10,F02' (Facilities for disabled guests, Airport Transfer)
--  * Required amenities: 'A12' (Pets allowed in room)

CREATE OR ALTER PROCEDURE search_accommodations
    @capacity INT,                
    @amenities NVARCHAR(MAX) = NULL,     
    @facilities NVARCHAR(MAX) = NULL     
AS
BEGIN
    SELECT 
        a.accommodationId AS AccommodationID, 
        a.accommodationName AS AccommodationName,
        at.accommodationTypeName AS AccommodationType,
        a.pricePerNight AS PricePerNight,
        a.capacity AS Capacity,
        a.numberOfRooms AS NumberOfRooms,
        (
            SELECT STRING_AGG(fa.facilityName, ', ')
            FROM Facilities_Included fi2
            JOIN Facilities fa ON fi2.facilityId = fa.facilityId
            WHERE fi2.accommodationId = a.accommodationId
        ) AS Facilities,
        (
            SELECT STRING_AGG(am.amenityName, ', ')
            FROM Amenities_Included ai2
            JOIN Amenities am ON ai2.amenityId = am.amenityId
            WHERE ai2.accommodationId = a.accommodationId
        ) AS Amenities
    FROM Accommodation a
    INNER JOIN Accommodation_Type at ON a.accommodationTypeId = at.accommodationTypeId
    WHERE a.capacity = @capacity
    AND (
        @facilities IS NULL OR @facilities = '' 
        OR EXISTS (
            SELECT 1
            FROM Facilities_Included fi
            WHERE fi.accommodationId = a.accommodationId
            AND fi.facilityId IN (SELECT TRIM(value) FROM STRING_SPLIT(@facilities, ','))
        )
    )
    AND (
        @amenities IS NULL OR @amenities = '' 
        OR EXISTS (
            SELECT 1
            FROM Amenities_Included ai
            WHERE ai.accommodationId = a.accommodationId
            AND ai.amenityId IN (SELECT TRIM(value) FROM STRING_SPLIT(@amenities, ','))
        )
    );
END;

--TEST
/*EXEC search_accommodations 
    @capacity = 18, 
    @amenities = 'A12',
    @facilities = 'F10,F02';

EXEC search_accommodations 
    @capacity = 18,
    @amenities = NULL,
    @facilities = NULL;*/