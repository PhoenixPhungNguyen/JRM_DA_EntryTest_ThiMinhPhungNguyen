	--5.2
    -- Show accommodations with average rating above 4
	-- Include the number of reviews for each accommodation
	-- Calculate and show the average rating of the corresponding accommodation type
	-- Show how much each accommodation's rating deviates from its type's average
	-- Sort by average rating in descending order, difference from type average in descending order, accommodation ID in ascending order
	WITH type_avg_rating AS 
    (
        SELECT 
            a.accommodationTypeId,
            CAST(AVG(CAST(LEN(f.rating) AS DECIMAL(5,2))) AS DECIMAL(5,2)) AS type_avg_rating
        FROM Accommodation a
        JOIN Feedback f ON a.accommodationId = f.accommodationId
        GROUP BY a.accommodationTypeId
    ),
    accommodation_rating AS (
        SELECT  
            a.accommodationId, 
            a.accommodationName,
            a.accommodationTypeId,
            at.accommodationTypeName,
            COUNT(f.comment) AS count_review,
            CAST(AVG(CAST(LEN(f.rating) AS DECIMAL(5,2))) AS DECIMAL(5,2)) AS avg_rating
        FROM Accommodation a
        JOIN Feedback f ON a.accommodationId = f.accommodationId
        JOIN Accommodation_Type at ON a.accommodationTypeId = at.accommodationTypeId
        GROUP BY a.accommodationId, a.accommodationName, a.accommodationTypeId,at.accommodationTypeName
    )
    SELECT 
        ar.accommodationId AS AccommodationID,
        ar.accommodationName AS AccommodationName,
        ar.accommodationTypeName AS AccommodationType,
        ar.avg_rating AS AverageRating,
        ar.count_review AS ReviewCount,
        tar.type_avg_rating AS TypeAverageRating,
        CAST(ar.avg_rating - tar.type_avg_rating AS DECIMAL(5,2)) AS DifferenceFromTypeAverage
    FROM accommodation_rating ar
    JOIN type_avg_rating tar 
        ON ar.accommodationTypeId = tar.accommodationTypeId
    WHERE ar.avg_rating > 4
    ORDER BY ar.avg_rating DESC, DifferenceFromTypeAverage DESC, ar.accommodationId ASC;
