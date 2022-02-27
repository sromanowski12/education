USE vrg;
CREATE OR REPLACE VIEW ArtistPopularityRank AS
SELECT FirstName, LastName, Nationality,
    DENSE_RANK() OVER (ORDER BY f.CustomerID DESC) AS fan_count
	FROM customer_artist_int f JOIN artist a ON f.ArtistID = a.ArtistID
;