SELECT US.user_name AS usuario,
	COUNT(*) AS qtde_musicas_ouvidas,
	ROUND((SUM(SG.song_duration_seconds) / 60), 2) AS total_minutos
FROM SpotifyClone.user AS US
INNER JOIN SpotifyClone.reproduction_history AS REP
ON US.user_id = REP.user_id
INNER JOIN SpotifyClone.song AS SG
ON REP.song_id = SG.song_id
GROUP BY US.user_id
ORDER BY usuario;
