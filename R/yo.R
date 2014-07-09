yo <- function(apitoken=NULL, username=NULL){
  require(httr)
  if(is.null(apitoken)){
    stop("apitoken is needed.")
  }
  if(is.null(username)){
  POST("http://api.justyo.co/yoall/", 
       body = list(api_token = apitoken)
       )
  }else{
    POST("http://api.justyo.co/yo/", 
         body = list(username = username,
                     api_token = apitoken)
         )
  }
}