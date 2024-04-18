#' Connecting to a database
#' 
#' Establishing a connection to a database.
#'#' @param config_file The path to a json config file. If none is given the default is "./config/db_config.json" in the current working directory. An example of the json file structure can be seen below.
#' @param config_db The name of the database you would like to connect to in the config file.
#' @examples
#' db_config = {
#'   "databases": {
#'     "db_name": {
#'       "host": "host.name.com",
#'       "port": 1234,
#'       "user": "user_name",
#'       "password": "pwd123",
#'       "db": "SID name"
#'     }
#'   }
#' }
#' @return A database connection object.
#' @export
db_connection <- function(config_file = "./config/db_config.json", config_db) {
  config_data <- fromJSON(file = config_file)
  
  conn_string = paste0("
    Driver={sqora32.dll};
    Dbq=(DESCRIPTION=
        (ADDRESS = 
          (PROTOCOL = TCP)
          (HOST = ", config_data$databases[[config_db]]$host, ")
          (PORT = ", config_data$databases[[config_db]]$port, "))
      (CONNECT_DATA =
        (SERVICE_NAME=", config_data$databases[[config_db]]$db, ")));
    Uid=", config_data$databases[[config_db]]$user, ";
    Pwd=", config_data$databases[[config_db]]$password, ";
    ")
  
  connection <- odbc::dbConnect(drv = odbc::odbc(),
                         driver = "Oracle in instantclient_21_13",
                         .connection_string = conn_string)
  return(connection)
}