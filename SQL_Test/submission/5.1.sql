	--Calculate the total number of bookings (non-cancelled) for each accommodation type
	--Show the percentage of total bookings for each type
	--Include average length of stay
	--Calculate total revenue for each type (TotalRevenue = PricePerNight * NumberOfNights - DiscountAmount)
		count_booking AS
		 (	
			SELECT 	a.accommodationTypeId,
					act.accommodationTypeName,
					COUNT(b.bookingId) AS count_booking,
					CAST(COUNT(b.bookingId) AS FLOAT) / ctb.count_total_booking*100 AS percent_booking,
					SUM(DATEDIFF(DAY, b.reservedCheckInTime, b.checkOutTime)) AS num_of_night,
					AVG(DATEDIFF(DAY, b.reservedCheckInTime, b.checkOutTime)) AS avg_length_of_stay,
					SUM(DATEDIFF(DAY, b.reservedCheckInTime, b.checkOutTime) * a.pricePerNight - COALESCE(vc.discountValue, 0)) AS total_revenue
			FROM [dbo].[Booking] b
			JOIN 	countTotalBooking ctb ON  1=1
			INNER JOIN Accommodation a ON b.accommodationId = a.accommodationId
			LEFT JOIN Voucher_Coupon vc ON b.vcCode = vc.vcCode
			JOIN 	Accommodation_Type act ON act.accommodationTypeId = a.accommodationTypeId 
			WHERE 	b.checkOutTime IS NOT NULL
			GROUP BY a.accommodationTypeId , act.accommodationTypeName,ctb.count_total_booking
		),
		--Show if the revenue is above or below the overall average
		revenue_compare AS (
		SELECT *,
			AVG(total_revenue) OVER () AS avg_revenue
		FROM count_booking
		)
		
		SELECT 
			accommodationTypeId as acommodation_type_id,
			accommodationTypeName as acommodation_type_name,	
			count_booking,
			percent_booking,
			num_of_night,
			avg_length_of_stay,
			total_revenue,
			avg_revenue,
		CASE 
			WHEN total_revenue > avg_revenue THEN 'Above Average'
			WHEN total_revenue < avg_revenue THEN 'Below Average'
			ELSE 'Average'
		END AS revenue_comparison
		FROM revenue_compare 
		ORDER BY total_revenue DESC;