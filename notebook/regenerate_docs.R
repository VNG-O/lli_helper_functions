library(roxygen2)
library(pkgload)

roxygenise()
load_all(".")

db_connection(config_file = "../../config/db_config.json",
              config_db = "sid_1")

db_connection(config_file = "../../config/db_config.json",
              config_db = "sid_uat")

library(dplyr)
library(dbplyr)

test <- data.frame(a = 1:5, b = NA, c = LETTERS[1:5])


test %>% coalesce_across(.name_to = "new", .cols = matches("a|b"), .keep = "unused")
