/* Retrieve first table row */  
SELECT TOP 1 * FROM [LogRhythm_Alarms].[dbo].[Alarm]

/* Retreive last table row - find a unique column, ideally an indexed value for speed*/
SELECT TOP 1 * FROM [LogRhythm_Alarms].[dbo].[Alarm] ORDER BY AlarmID DESC

/* Calculate total rows in table */
SELECT COUNT(*) FROM [LogRhythm_Alarms].[dbo].[Alarm]

/* Calcaulte difference between dates in seconds - change the start and finish date */
SELECT DATEDIFF(SECOND, '2016-03-07 02:15:09.690', '2016-06-10 14:45:18.007')

/* Calcaulte MPS (row count divided by total time in seconds) - change row count and time interval  */
SELECT  CAST(4628 AS float) / CAST(8253009 AS float)
