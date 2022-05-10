SELECT ART.artist_name AS artista,
	ALB.album_name AS album,
	COUNT(FOL.user_id) AS seguidores
FROM SpotifyClone.artist AS ART
INNER JOIN SpotifyClone.following_schema AS FOL
ON FOL.artist_id = ART.artist_id
INNER JOIN SpotifyClone.album AS ALB
ON ALB.artist_id = ART.artist_id
GROUP BY album, artista
ORDER BY seguidores DESC, artista, album;
