#'Just Yo
#'
#'\code{yo} yo all subscriber or a specific subscriber. 
#'
#'Before yo(), you need your API key. Please visit http://yoapi.justyo.co/
#'
#'@param apitoken Your Yo API token
#'@param username Username who you want
#'  
#'@importFrom httr POST
#'@return status code and status message
#'  
#' @examples
#' \dontrun{
#' # Yo all subscriber.
#' yo("Your API token")
#' # Yo a specific subscriber
#' yo("Your API token", "username")
#' }
#'@export
yo <- function(apitoken=NULL, username=NULL){
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

#'Connpass2Yo
#'
#'\code{yo} yo all subscriber or a specific subscriber. 
#'
#'Before yo(), you need your API key. Please visit http://yoapi.justyo.co/
#'
#'@param event_id Connpass event_id
#'@param apitoken Your Yo API token
#'@param to Username who you want
#'  
#' @examples
#' \dontrun{
#' # connpass event
#' # e.g.) http://zokupata.connpass.com/event/9804/
#' event2yo(9804, "USERNAME", options()$YO_KEY)
#' }
#' @export
connpass2yo <- function(event_id, to, apikey){
  require("connpass")
  require("yo")
  res <- getInfo(event_id)
  count <- res$events$limit - res$events$accepted
  for(i in seq(count)){
    yo(apikey, to)      
  }
}
