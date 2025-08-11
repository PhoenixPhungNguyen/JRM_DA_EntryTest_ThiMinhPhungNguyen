--5.3
-- List the number of accommodations for each accommodation type as well as the total number of accommodations in each province
-- Show the province name, accommodation types as column names (Homestay, Villa, etc.), and the total number of accommodations
-- Sort by the total number of accommodations in descending order
SELECT DISTINCT
    p.provinceName AS ProvinceName,
    --at.accommodationTypeName,
    --COUNT(*) AS count_accommodation,
	SUM(CASE WHEN accommodationTypeName = 'Bungalow' THEN 1 ELSE 0 END) AS Bungalow,
    SUM(CASE WHEN accommodationTypeName = 'Condotel' THEN 1 ELSE 0 END) AS Condotel,
	SUM(CASE WHEN accommodationTypeName = 'Duplex' THEN 1 ELSE 0 END) AS Duplex,
	SUM(CASE WHEN accommodationTypeName = 'Farmstay' THEN 1 ELSE 0 END) AS Farmstay,
    SUM(CASE WHEN accommodationTypeName = 'Homestay' THEN 1 ELSE 0 END) AS Homestay,
	SUM(CASE WHEN accommodationTypeName = 'Penthouse' THEN 1 ELSE 0 END) AS Penthouse,
    SUM(CASE WHEN accommodationTypeName = 'Resort' THEN 1 ELSE 0 END) AS Resort,
	SUM(CASE WHEN accommodationTypeName = 'Studio' THEN 1 ELSE 0 END) AS Studio,
	SUM(CASE WHEN accommodationTypeName = 'Treehouse' THEN 1 ELSE 0 END) AS Treehouse,
	SUM(CASE WHEN accommodationTypeName = 'Villa' THEN 1 ELSE 0 END) AS Villa,
	COUNT(*) AS TotalAccommodation
	FROM Accommodation a
	JOIN Accommodation_Type at ON a.accommodationTypeId = at.accommodationTypeId
	JOIN City_District cd ON a.cityDistrictId = cd.cityDistrictId
	JOIN Province p ON cd.provinceId = p.provinceId
	GROUP BY p.provinceName
	ORDER BY TotalAccommodation DESC;