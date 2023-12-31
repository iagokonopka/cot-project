USE [projetos]
GO
/****** Object:  StoredProcedure [dbo].[ANNUAL]    Script Date: 13/11/2023 18:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ANNUAL]
AS
BEGIN

	  -- Truncate the COTData table before inserting data
		TRUNCATE TABLE COTAnnual;

        -- Insert data into the COTAnnual table for 2022
        INSERT INTO COTAnnual (Currency, Indice, Date, Non_Comm_Long, Non_Comm_Short)
        SELECT 
            CASE
                WHEN Market_and_Exchange_Names = 'CANADIAN DOLLAR - CHICAGO MERCANTILE EXCHANGE' THEN 'CANADIAN DOLLAR - CAD'
                WHEN Market_and_Exchange_Names = 'SWISS FRANC - CHICAGO MERCANTILE EXCHANGE' THEN 'SWISS FRANC - CHF'
                WHEN Market_and_Exchange_Names = 'BRITISH POUND - CHICAGO MERCANTILE EXCHANGE' THEN 'BRITISH POUND - GBP'
                WHEN Market_and_Exchange_Names = 'JAPANESE YEN - CHICAGO MERCANTILE EXCHANGE' THEN 'JAPANESE YEN - JPY'
                WHEN Market_and_Exchange_Names = 'EURO FX - CHICAGO MERCANTILE EXCHANGE' THEN 'EURO FX - EUR'
                WHEN Market_and_Exchange_Names = 'AUSTRALIAN DOLLAR - CHICAGO MERCANTILE EXCHANGE' THEN 'AUSTRALIAN DOLLAR - AUD'
                WHEN Market_and_Exchange_Names = 'NZ DOLLAR - CHICAGO MERCANTILE EXCHANGE' THEN 'NZ DOLLAR - NZD'
                WHEN Market_and_Exchange_Names = 'USD INDEX - ICE FUTURES U.S.' THEN 'USD INDEX - USD'
            END AS Currency,
            CONCAT(Market_and_Exchange_Names, ' - ', CAST([Report_Date_as_MM_DD_YYYY] as DATE)) AS Indice,
            CAST([Report_Date_as_MM_DD_YYYY] AS Date) AS Date,
            NonComm_Positions_Long_All AS Non_Comm_Long,
            NonComm_Positions_Short_All AS Non_Comm_Short
        FROM dbo.COTAnnualData2022
        WHERE Market_and_Exchange_Names IN ('BRITISH POUND - CHICAGO MERCANTILE EXCHANGE', 'USD INDEX - ICE FUTURES U.S.', 'NZ DOLLAR - CHICAGO MERCANTILE EXCHANGE', 'AUSTRALIAN DOLLAR - CHICAGO MERCANTILE EXCHANGE', 
		'EURO FX - CHICAGO MERCANTILE EXCHANGE', 'JAPANESE YEN - CHICAGO MERCANTILE EXCHANGE', 'CANADIAN DOLLAR - CHICAGO MERCANTILE EXCHANGE', 'SWISS FRANC - CHICAGO MERCANTILE EXCHANGE');

        -- Insert data into the COTAnnual table for 2023
        INSERT INTO COTAnnual (Currency, Indice, Date, Non_Comm_Long, Non_Comm_Short)
        SELECT 
            CASE
                WHEN Market_and_Exchange_Names = 'CANADIAN DOLLAR - CHICAGO MERCANTILE EXCHANGE' THEN 'CANADIAN DOLLAR - CAD'
                WHEN Market_and_Exchange_Names = 'SWISS FRANC - CHICAGO MERCANTILE EXCHANGE' THEN 'SWISS FRANC - CHF'
                WHEN Market_and_Exchange_Names = 'BRITISH POUND - CHICAGO MERCANTILE EXCHANGE' THEN 'BRITISH POUND - GBP'
                WHEN Market_and_Exchange_Names = 'JAPANESE YEN - CHICAGO MERCANTILE EXCHANGE' THEN 'JAPANESE YEN - JPY'
                WHEN Market_and_Exchange_Names = 'EURO FX - CHICAGO MERCANTILE EXCHANGE' THEN 'EURO FX - EUR'
                WHEN Market_and_Exchange_Names = 'AUSTRALIAN DOLLAR - CHICAGO MERCANTILE EXCHANGE' THEN 'AUSTRALIAN DOLLAR - AUD'
                WHEN Market_and_Exchange_Names = 'NZ DOLLAR - CHICAGO MERCANTILE EXCHANGE' THEN 'NZ DOLLAR - NZD'
                WHEN Market_and_Exchange_Names = 'USD INDEX - ICE FUTURES U.S.' THEN 'USD INDEX - USD'
            END AS Currency,
            CONCAT(Market_and_Exchange_Names, ' - ', CAST([Report_Date_as_MM_DD_YYYY] as DATE)) AS Indice,
            CAST([Report_Date_as_MM_DD_YYYY] AS Date) AS Date,
            NonComm_Positions_Long_All AS Non_Comm_Long,
            NonComm_Positions_Short_All AS Non_Comm_Short
        FROM dbo.COTAnnualData2023
        WHERE Market_and_Exchange_Names IN ('BRITISH POUND - CHICAGO MERCANTILE EXCHANGE', 'USD INDEX - ICE FUTURES U.S.', 'NZ DOLLAR - CHICAGO MERCANTILE EXCHANGE', 'AUSTRALIAN DOLLAR - CHICAGO MERCANTILE EXCHANGE', 
		'EURO FX - CHICAGO MERCANTILE EXCHANGE', 'JAPANESE YEN - CHICAGO MERCANTILE EXCHANGE', 'CANADIAN DOLLAR - CHICAGO MERCANTILE EXCHANGE', 'SWISS FRANC - CHICAGO MERCANTILE EXCHANGE');
END
