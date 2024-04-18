library(roxygen2)
library(pkgload)

roxygenise()
load_all(".")

helper_functions::db_connection(config_file = "../../config/db_config.json",
                                  config_db = "sid_1")

helper_functions::db_connection(config_file = "../../config/db_config.json",
                                config_db = "sid_dev")

library(dplyr)
library(dbplyr)

test <- data.frame(a = 1:5, b = NA, c = LETTERS[1:5])


test %>% coalesce_across(.name_to = "new", .cols = matches("a|b"), .keep = "unused")
