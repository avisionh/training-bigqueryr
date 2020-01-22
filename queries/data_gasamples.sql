SELECT visitNumber
  ,visitStartTime
  ,date
  ,device.deviceCategory
  ,channelGrouping
  ,hits
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
CROSS JOIN
  -- bring out columns from this 'array' so can SELECT them
  UNNEST(hits) AS hits
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
