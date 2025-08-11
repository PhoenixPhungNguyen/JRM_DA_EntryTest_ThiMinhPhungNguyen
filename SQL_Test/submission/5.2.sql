	--5.2
    -- Show accommodations with average rating above 4
	-- Include the number of reviews for each accommodation
	-- Calculate and show the average rating of the corresponding accommodation type
	-- Show how much each accommodation's rating deviates from its type's average
	-- Sort by average rating in descending order, difference from type average in descending order, accommodation ID in ascending order
	WITH avg_rating_overall AS 
	(
		SELECT CAST(AVG(LEN(f.rating)) AS FLOAT) AS avg_rating
		FROM [dbo].[Feedback] f 
	),
	accommodation_rating AS (
		SELECT  
			a.accommodationId, 
            a.accommodationName,
            a.accommodationTypeId,
			COUNT(f.comment) AS count_review,
			CAST(AVG(LEN(f.rating)) AS FLOAT) AS avg_rating
		FROM [dbo].[Accommodation] a
		JOIN [dbo].[Feedback] f ON a.accommodationId = f.accommodationId
		GROUP BY a.accommodationId,a.accommodationName,a.accommodationTypeId
	)
	SELECT 
		ar.accommodationId AS AcommodationID,
        ar.accommodationName AS AccommodationName,
        ar.accommodationTypeId AS AccommodationType,
		ar.avg_rating AS AverageRating,
        ar.count_review AS ReviewCount,
        aro.avg_rating AS TypeAverageRating,
		CAST((ar.avg_rating - aro.avg_rating) AS DECIMAL(5,2)) AS DifferenceFromTypeAverage
	FROM accommodation_rating ar
	CROSS JOIN avg_rating_overall aro
	WHERE ar.avg_rating > 4
	ORDER BY ar.avg_rating DESC, DifferenceFromTypeAverage DESC, ar.accommodationId ASC;