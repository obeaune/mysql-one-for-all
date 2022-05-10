SELECT COUNT(SG.song_id) AS cancoes,
	COUNT(distinct SG.artist_id) AS artistas,
    COUNT(distinct SG.album_id) AS albuns
FROM SpotifyClone.song AS SG
INNER JOIN SpotifyClone.album AS AL
ON SG.album_id = AL.album_id;
