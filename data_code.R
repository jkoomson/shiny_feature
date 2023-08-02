Custom<-Origin<-rownames(USArrests)
level_map<-tibble::tibble(Origin, Custom)
saveRDS(level_map, "data.RData")
