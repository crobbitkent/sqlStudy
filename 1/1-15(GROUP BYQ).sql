SELECT AREA, MIN(BOSS_ID) AS MIN_BOSS
FROM TDEPT
GROUP BY AREA
ORDER BY 2;