#install.packages("jsonlite")
library(jsonlite)
#install.packages("httpuv")
library(httpuv)
#install.packages("httr")
library(httr)
#install.packages("plotly")
library(plotly)
require(devtools)
#All code sourced from https://towardsdatascience.com/accessing-data-from-github-api-using-r-3633fb62cb08

oauth_endpoints("github")

#User Specific
myapp <- oauth_app(appname = "R_Software_Applciations",
                   key = "bb9e613a000fd6c60da5",
                   secret = "e4ac6f7de3ec80c59d64429054fdb724d50f2e00")

# Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/JamesConnon/repos", gtoken)

# Take action on http error
stop_for_status(req)

# Extract content from a request
json1 = content(req)

# Convert to a data.frame
gitDF = jsonlite::fromJSON(jsonlite::toJSON(json1))

# Subset data.frame
gitDF[gitDF$full_name == "JamesConnon/datasharing", "created_at"]

myData = fromJSON("https://api.github.com/users/JamesConnon")

#num followers
myData$followers 

followers = fromJSON("https://api.github.com/users/JamesConnon/followers")
followers$login #username of followers
myData$following #num followed

following = fromJSON("https://api.github.com/users/JamesConnon/following")
following$login #username of followed peopl

myData$public_repos #num repositories

repos = fromJSON("https://api.github.com/users/JamesConnon/repos")
repos$name #repositories names
repos$created_at #Repository date created
repos$full_name #gives full names of repositiories


LCARepos <- fromJSON("https://api.github.com/repos/JamesConnon/LCA/commits")
LCARepos$commit$message #Shows commit messages of LCA assignment


#Interrogate the Github API to extract data from another account by switching the username
shanahanData = fromJSON("https://api.github.com/users/CaoimheShanahan1")
shanahanData$followers #lists num followers 
shanahanData$following #lists number of people followed
shanahanData$public_repos #lists number of repositories 
shanahanData$bio 