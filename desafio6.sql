SELECT MIN(plann_value) AS faturamento_minimo,
	MAX(plann_value) AS faturamento_maximo,
	ROUND(AVG(plann_value), 2) AS faturamento_medio,
    SUM(plann_value) AS faturamento_total
FROM SpotifyClone.plann AS PLA
INNER JOIN SpotifyClone.user AS US
ON PLA.plann_id = US.plann_id;
