library(roxygen2)
library(pkgload)

roxygenise()
load_all(".")

con <- helper_functions::db_connection(config_file = "../../config/db_config.json",
                                  config_db = "sid_1")

helper_functions::db_connection(config_file = "../../config/db_config.json",
                                config_db = "sid_dev")

library(dplyr)
library(dbplyr)

tbl(con, "VSLNAMES")