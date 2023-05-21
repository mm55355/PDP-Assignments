
-- Query 1
-- Select game name and recommendation count, sorted by count in descending order
SELECT responsename AS name, recommendationcount AS count 
FROM steam_games_features 
ORDER BY count DESC;



-- Query 2
-- Select game name and screenshot count for free games with more than 10 screenshots, sorted by name in ascending order
SELECT queryname AS name, screenshotcount AS screenshot 
FROM steam_games_features 
WHERE isfree=true AND screenshotcount>10
ORDER BY name ASC;



-- Query 3
-- Count the number of games in each genre for each platform
SELECT 
  CASE 
    WHEN PlatformWindows = 1 THEN 'Windows' 
    WHEN PlatformLinux = 1 THEN 'Linux' 
    WHEN PlatformMac = 1 THEN 'Mac' 
    ELSE 'Other' 
  END AS Platform,
  COUNT(CASE WHEN GenreIsNonGame = 1 THEN ResponseName END) AS NonGame, 
  COUNT(CASE WHEN GenreIsIndie = 1 THEN ResponseName END) AS Indie, 
  COUNT(CASE WHEN GenreIsAction = 1 THEN ResponseName END) AS Action, 
  COUNT(CASE WHEN GenreIsAdventure = 1 THEN ResponseName END) AS Adventure, 
  COUNT(CASE WHEN GenreIsCasual = 1 THEN ResponseName END) AS Casual, 
  COUNT(CASE WHEN GenreIsStrategy = 1 THEN ResponseName END) AS Strategy, 
  COUNT(CASE WHEN GenreIsRPG = 1 THEN ResponseName END) AS RPG, 
  COUNT(CASE WHEN GenreIsSimulation = 1 THEN ResponseName END) AS Simulation, 
  COUNT(CASE WHEN GenreIsEarlyAccess = 1 THEN ResponseName END) AS EarlyAccess, 
  COUNT(CASE WHEN GenreIsFreeToPlay = 1 THEN ResponseName END) AS FreeToPlay, 
  COUNT(CASE WHEN GenreIsSports = 1 THEN ResponseName END) AS Sports, 
  COUNT(CASE WHEN GenreIsRacing = 1 THEN ResponseName END) AS Racing, 
  COUNT(CASE WHEN GenreIsMassivelyMultiplayer = 1 THEN ResponseName END) AS MassivelyMultiplayer 
FROM steam_games_features 
GROUP BY 
  CASE 
    WHEN PlatformWindows = 1 THEN 'Windows' 
    WHEN PlatformLinux = 1 THEN 'Linux' 
    WHEN PlatformMac = 1 THEN 'Mac' 
    ELSE 'Other' 
  END;