SELECT SG.song_name AS cancao, COUNT(*) AS reproducoes
FROM SpotifyClone.song AS SG
INNER JOIN SpotifyClone.reproduction_history AS REP
ON SG.song_id = REP.song_id
GROUP BY REP.song_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;
