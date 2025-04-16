-- List the number of accommodations for each accommodation type as well as the total number of accommodations in each province
-- Show the province name, accommodation types as column names (Homestay, Villa, etc.), and the total number of accommodations
-- Sort by the total number of accommodations in descending order
SELECT 
    p.provinceName,
    at.accommodationTypeName,
    COUNT(*) AS count_accommodation,
	SUM(CASE WHEN accommodationTypeName = 'Bungalow' THEN 1 ELSE 0 END) AS bungalow,
    SUM(CASE WHEN accommodationTypeName = 'Condotel' THEN 1 ELSE 0 END) AS condotel,
	SUM(CASE WHEN accommodationTypeName = 'Duplex' THEN 1 ELSE 0 END) AS duplex,
	SUM(CASE WHEN accommodationTypeName = 'Farmstay' THEN 1 ELSE 0 END) AS farmstay,
    SUM(CASE WHEN accommodationTypeName = 'Homestay' THEN 1 ELSE 0 END) AS homestay,
	SUM(CASE WHEN accommodationTypeName = 'Penthouse' THEN 1 ELSE 0 END) AS penthouse,
    SUM(CASE WHEN accommodationTypeName = 'Resort' THEN 1 ELSE 0 END) AS resort,
	SUM(CASE WHEN accommodationTypeName = 'Studio' THEN 1 ELSE 0 END) AS studio,
	SUM(CASE WHEN accommodationTypeName = 'Treehouse' THEN 1 ELSE 0 END) AS treehouse,
	SUM(CASE WHEN accommodationTypeName = 'Villa' THEN 1 ELSE 0 END) AS villa,
	COUNT(*) AS total_accommodation
	FROM Accommodation a
	JOIN Accommodation_Type at ON a.accommodationTypeId = at.accommodationTypeId
	JOIN City_District cd ON a.cityDistrictId = cd.cityDistrictId
	JOIN Province p ON cd.provinceId = p.provinceId
	GROUP BY p.provinceName, at.accommodationTypeName
	ORDER BY total_accommodation DESC;