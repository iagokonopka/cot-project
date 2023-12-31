USE [projetos]
GO
/****** Object:  StoredProcedure [dbo].[DATA]    Script Date: 03/11/2023 15:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[DATA]
AS
BEGIN

  -- Truncate the COTData table before inserting data
    TRUNCATE TABLE COTData;

    -- Insert data into the COTData table for 2022
    INSERT INTO COTData (Currency, Indice, Date, Open_Interest_All, Lev_Money_Long, Lev_Money_Short, Change_Lev_Long, Change_Lev_Short, OI_Lev_Long, OI_Lev_Short)
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
	CONCAT(Market_and_Exchange_Names, ' - ', [Report_Date_as_YYYY-MM-DD]) AS Indice,
    [Report_Date_as_YYYY-MM-DD] AS Date,
	Open_Interest_All as Open_Interest_All,
    Lev_Money_Positions_Long_All AS Lev_Money_Long,
    Lev_Money_Positions_Short_All AS Lev_Money_Short,
    Change_in_Lev_Money_Long_All AS Change_Lev_Long,
    Change_in_Lev_Money_Short_All AS Change_Lev_Short,
    Pct_of_OI_Lev_Money_Long_All AS OI_Lev_Long,
    Pct_of_OI_Lev_Money_Short_All AS OI_Lev_Short
FROM dbo.COTData2022
WHERE Market_and_Exchange_Names IN ('BRITISH POUND - CHICAGO MERCANTILE EXCHANGE', 'USD INDEX - ICE FUTURES U.S.', 'NZ DOLLAR - CHICAGO MERCANTILE EXCHANGE', 'AUSTRALIAN DOLLAR - CHICAGO MERCANTILE EXCHANGE', 
    'EURO FX - CHICAGO MERCANTILE EXCHANGE', 'JAPANESE YEN - CHICAGO MERCANTILE EXCHANGE', 'CANADIAN DOLLAR - CHICAGO MERCANTILE EXCHANGE', 'SWISS FRANC - CHICAGO MERCANTILE EXCHANGE');

    -- Insert data into the COTData table for 2023
    INSERT INTO COTData (Currency, Indice, Date, Open_Interest_All, Lev_Money_Long, Lev_Money_Short, Change_Lev_Long, Change_Lev_Short, OI_Lev_Long, OI_Lev_Short)
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
	CONCAT(Market_and_Exchange_Names, ' - ', [Report_Date_as_YYYY-MM-DD]) AS Indice,
    [Report_Date_as_YYYY-MM-DD] AS Date,
	Open_Interest_All as Open_Interest_All,
    Lev_Money_Positions_Long_All AS Lev_Money_Long,
    Lev_Money_Positions_Short_All AS Lev_Money_Short,
    Change_in_Lev_Money_Long_All AS Change_Lev_Long,
    Change_in_Lev_Money_Short_All AS Change_Lev_Short,
    Pct_of_OI_Lev_Money_Long_All AS OI_Lev_Long,
    Pct_of_OI_Lev_Money_Short_All AS OI_Lev_Short
FROM dbo.COTData2023
WHERE Market_and_Exchange_Names IN ('BRITISH POUND - CHICAGO MERCANTILE EXCHANGE', 'USD INDEX - ICE FUTURES U.S.', 'NZ DOLLAR - CHICAGO MERCANTILE EXCHANGE', 'AUSTRALIAN DOLLAR - CHICAGO MERCANTILE EXCHANGE', 
    'EURO FX - CHICAGO MERCANTILE EXCHANGE', 'JAPANESE YEN - CHICAGO MERCANTILE EXCHANGE', 'CANADIAN DOLLAR - CHICAGO MERCANTILE EXCHANGE', 'SWISS FRANC - CHICAGO MERCANTILE EXCHANGE');
END
