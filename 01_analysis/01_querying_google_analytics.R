library(googleAnalyticsR)

# authorize google analytics to get data
ga_auth()

# Generate a list of all the Google Analytics accounts you have access to

ga_accounts <- ga_account_list()
# View(ga_accounts)

# Date range
start_date <- '2018-01-01'
end_date <- Sys.Date()-1

# Download the data and store them in a dataframe
user_results <-google_analytics(Sys.getenv("google_analytics_id"),
                                date_range = c(start_date, end_date),
                                metrics = c("users",'newUsers','percentNewSessions','sessionsPerUser'),
                                dimensions = c("date",'userType','sessionCount','daysSinceLastSession',
                                               'userDefinedValue','userBucket'),
                                max = -1,
                                anti_sample = TRUE)

session_results <- google_analytics(Sys.getenv("google_analytics_id"),
                                    date_range = c(start_date, end_date),
                                    metrics = c("sessions",'bounces','bounceRate','sessionDuration',
                                                'avgSessionDuration','uniqueDimensionCombinations','hits'),
                                    dimensions = c('date',"sessionDurationBucket"),
                                    max = -1,
                                    anti_sample = TRUE)

traffic_sources_results <- google_analytics(Sys.getenv("google_analytics_id"),
                                             date_range = c(start_date, end_date),
                                             metrics = c("organicSearches"),
                                             dimensions = c('date',"referralPath",'fullReferrer','source',
                                                            'medium','sourceMedium','keyword',
                                                            'socialNetwork','hasSocialSourceReferral'),
                                             max = -1,
                                             anti_sample = TRUE)

# geo_network_results1 <- google_analytics(Sys.getenv("google_analytics_id"),
#                                         date_range = c(start_date, end_date),
#                                         metrics = c('users','newUsers'),
#                                         dimensions = c('date',"continent",'subContinent','country',
#                                                        'region','metro','city','latitude','longitude'),
#                                         max = -1,
#                                         anti_sample = TRUE)
# 
# geo_network_results2 <- google_analytics(Sys.getenv("google_analytics_id"),
#                                          date_range = c(start_date, end_date),
#                                          metrics = c('users','newUsers'),
#                                          dimensions = c('date','networkDomain','networkLocation','cityId',
#                                                         'continentId','countryIsoCode',
#                                                         'metroId','regionId','regionIsoCode'),
#                                          max = -1,
#                                          anti_sample = TRUE)

geo_network_results3 <- google_analytics(Sys.getenv("google_analytics_id"),
                                         date_range = c(start_date, end_date),
                                         metrics = c('users','newUsers'),
                                         dimensions = c('date','networkDomain','networkLocation','country',
                                                        'region','metro','city','latitude','longitude'),
                                         max = -1,
                                         anti_sample = TRUE)

social_interactions_results <- google_analytics(Sys.getenv("google_analytics_id"),
                                                date_range = c(start_date, end_date),
                                                metrics = c('users','newUsers','socialInteractions','uniqueSocialInteractions','socialInteractionsPerSession'),
                                                dimensions = c('date','socialInteractionNetwork','socialInteractionAction',
                                                               'socialInteractionNetworkAction',
                                                               'socialInteractionTarget','socialEngagementType'),
                                                max = -1,
                                                anti_sample = TRUE)

audience_results <- google_analytics(Sys.getenv("google_analytics_id"),
                                     date_range = c(start_date, end_date),
                                     metrics = c('users'),
                                     dimensions = c('date','userAgeBracket','userGender','interestOtherCategory','interestAffinityCategory'),
                                     max = -1,
                                     anti_sample = TRUE)

time_results <- google_analytics(Sys.getenv("google_analytics_id"),
                                     date_range = c(start_date, end_date),
                                     metrics = c('users','newUsers'),
                                     dimensions = c('date','hour','minute','dayOfWeekName','dateHour'),
                                     max = -1,
                                     anti_sample = TRUE)
