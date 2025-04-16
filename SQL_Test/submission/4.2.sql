	-- Create AccommodationPriceHistory table
	CREATE TABLE AccommodationPriceHistory (
		historyId       INT IDENTITY(1,1) PRIMARY KEY,   -- Auto-incrementing Primary Key
		accommodationID NVARCHAR(20) NOT NULL,           
		oldPrice        FLOAT NOT NULL,                  
		newPrice        FLOAT NOT NULL,                  
		changeDate      DATETIME DEFAULT GETDATE(),      
		changedBy       NVARCHAR(128) NOT NULL           
	);

	-- Create trigger to track price change
	CREATE TRIGGER tr_price_change
	ON [dbo].[Accommodation] 
	AFTER UPDATE
	AS
	BEGIN
		-- Insert into AccommodationPriceHistory table
		INSERT INTO AccommodationPriceHistory(
			accommodationId, 
			oldPrice, 
			newPrice, 
			changeDate, 
			changedBy
		)
		SELECT
			af.accommodationId,         
			bef.PricePerNight,          
			af.PricePerNight,           
			GETDATE(),                  
			SYSTEM_USER                 
		FROM inserted af
		JOIN deleted bef ON 
			af.accommodationId = bef.accommodationId
		WHERE af.PricePerNight <> bef.PricePerNight;  -- only insert if price changes
	END