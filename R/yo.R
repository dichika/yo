yo <- function(apitoken){
  require(httr)
  POST("http://api.justyo.co/yoall/", 
       body = list(api_token=apitoken)
       )
}