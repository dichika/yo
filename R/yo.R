#'Just Yo
#'
#'\code{yo} yo all subscriber or a specific subscriber. 
#'
#'Before yo(), you need your API key. Please visit http://yoapi.justyo.co/.
#'
#'@param apitoken Your Yo API token
#'@param username Username who you want
#'  
#'  
#'@return status code and status message
#'  
#' @examples
#' \dontrun{
#' # Yo all subscriber.
#' beep("Your API token")
#' # Yo a specific subscriber
#' beep("Your API token", "username")
#' }
#'@export
yo <- function(apitoken=NULL, username=NULL){
  require(httr)
  if(is.null(apitoken)){
    stop("apitoken is needed.")
  }
  if(is.null(username)){
  res <- POST("http://api.justyo.co/yoall/", 
       body = list(api_token = apitoken)
       )
  }else{
    res <- POST("http://api.justyo.co/yo/", 
         body = list(username = username,
                     api_token = apitoken)
         )
  }
  res_message <- paste(collapse=" ",res$headers$status, res$headers$statusmessage)
  return(res_message)
}