CREATE OR ALTER PROCEDURE search_accommodations
    @capacity INT,                -- Required capacity (number of guests)
    @amenities NVARCHAR(MAX),     -- Optional: Comma-separated list of amenity IDs
    @facilities NVARCHAR(MAX)     -- Optional: Comma-separated list of facility IDs
AS
BEGIN
    -- Main query to search accommodations
    SELECT 
        a.accommodationId, 
        a.accommodationName,
        at.accommodationTypeName,
        a.pricePerNight,
        a.capacity,
        a.numberOfRooms,
		--list of amenities
		(
        SELECT STRING_AGG(am.amenityName, ', ')
        FROM Amenities_Included ai2
        JOIN Amenities am ON ai2.amenityId = am.amenityId
        WHERE ai2.accommodationId = a.accommodationId
		) AS listAmenities,
    
		-- list of  facilities
		(
			SELECT STRING_AGG(fa.facilityName, ', ')
			FROM Facilities_Included fi2
			JOIN Facilities fa ON fi2.facilityId = fa.facilityId
			WHERE fi2.accommodationId = a.accommodationId
		) AS listFacilities
	
    FROM Accommodation a
    -- Join accommodation types
    INNER JOIN Accommodation_Type at ON a.accommodationTypeId = at.accommodationTypeId
    -- Filter by capacity
    WHERE a.capacity >= @capacity
    
    -- Filter by amenities if provided
    AND EXISTS (
        SELECT 1
        FROM Amenities_Included ai
        WHERE ai.accommodationId = a.accommodationId
        AND ai.amenityId IN (SELECT value FROM STRING_SPLIT(@amenities, ','))
    )
  
    -- Filter by facilities if provided
    AND EXISTS (
        SELECT 1
        FROM Facilities_Included fi
        WHERE fi.accommodationId = a.accommodationId
        AND fi.facilityId IN (SELECT value FROM STRING_SPLIT(@facilities, ','))
    );
END;