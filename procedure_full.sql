USE [projetos]
GO
/****** Object:  StoredProcedure [dbo].[FULL]    Script Date: 13/11/2023 18:56:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[FULL]
AS
BEGIN

  -- Truncate the COTData table before inserting data
    TRUNCATE TABLE COTFull;

    -- Insert data into the COTData table for 2022
    INSERT INTO COTFull (Currency, Indice, Date, Open_Interest_All, Lev_Money_Long, Lev_Money_Short, Change_Lev_Long, Change_Lev_Short, OI_Lev_Long, OI_Lev_Short, Non_Comm_Long, Non_Comm_Short)
    SELECT 
        d.Currency,
		d.Indice,
		d.Date,
		d.Open_Interest_All,
		d.Lev_Money_Long,
		d.Lev_Money_Short,
		d.Change_Lev_Long,
		d.Change_Lev_Short,
		d.OI_Lev_Long,
		d.OI_Lev_Short,
		a.Non_Comm_Long,
		a.Non_Comm_Short

	FROM dbo.COTData d
	LEFT JOIN dbo.COTAnnual a
	ON d.Indice = a.Indice;
END