library(ggplot2)
library(dplyr)

load("brfss2013.RData")
names(brfss2013)


grep("hlthpln1", names(brfss2013), value=TRUE)
grep("medcost", names(brfss2013), value=TRUE)

costhlth <- brfss2013 %>%
  select(medcost, hlthpln1) %>% 
  filter(!is.na(medcost)& !is.na(hlthpln1)) %>%
  mutate(consistence = ifelse(medcost!=hlthpln1, "consistent", "contradictory")) %>%
  group_by(consistence) %>%
  summarise(count=n())

ggplot(data=costhlth, aes(x=consistence, y=count)) + 
  geom_bar(stat='identity')
  

  
  
  


