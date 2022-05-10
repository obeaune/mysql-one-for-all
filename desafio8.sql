SELECT ART.artist_name AS artista,
	ALB.album_name AS album
FROM SpotifyClone.artist AS ART
INNER JOIN SpotifyClone.album AS ALB
ON ART.artist_id = ALB.artist_id
WHERE ART.artist_name = "Walter Phoenix"
ORDER BY album;
