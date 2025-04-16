CREATE OR ALTER PROCEDURE price_change
		@accommodationId	NVARCHAR(20),
		@priceChange		FLOAT
	AS
	BEGIN
		--Check exists accommodationId
		IF (SELECT COUNT(*) FROM [dbo].[Accommodation] WHERE [dbo].[Accommodation].[accommodationId] = @accommodationId) = 0 
		BEGIN
			RAISERROR('Accommodation ID does not exist!', 16, 1);
			RETURN;
		END
		--Update price
		UPDATE 	[dbo].[Accommodation]
		SET 	pricePerNight = pricePerNight + @priceChange
		WHERE 	accommodationId = @accommodationId;
	END
	
