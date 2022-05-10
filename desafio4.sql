SELECT US.user_name AS usuario,
	IF(MAX(YEAR(REP.date_reproduction)) = 2021, 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM SpotifyClone.user AS US
INNER JOIN SpotifyClone.reproduction_history AS REP
ON US.user_id = REP.user_id
GROUP BY usuario
ORDER BY usuario;
