#Import what you need here. I need ggplot forsure
library(ggplot2)

#This is how you import data. Head is to check if you go it right
data <- read.csv("C:/Users/Ashriful Dulla/Downloads/food-choices/food_coded.csv")
head(data)

#Put the comfort food coded data as one variable
food_coded <- subset(data, select=c("comfort_food_reasons_coded"))
head(food_coded)
stress <- length(which(food_coded == 1))
boredom <- length(which(food_coded == 2))
depression <- length(which(food_coded == 3))
print(depression)
hunger<- length(which(food_coded == 4))
laziness<- length(which(food_coded == 5))
cold_weather<- length(which(food_coded == 6))
happiness <- length(which(food_coded == 7))
watching_tv<- length(which(food_coded == 8))
none <- length(which(food_coded == 9))

axis <- c(stress, boredom, depression, hunger, laziness, cold_weather, happiness, watching_tv, none) 
#Time to make a bar graph
barplot(axis, depression)

#I tried this with gender to see what's up 
#Shout out to akrun from stack overflow
barplot(table(food_coded))

#Put the comfort food coded data as one variable
gender <- subset(data, select=c("Gender"))
head(gender)

#Time to make a bar graph
well<- table(gender)
g <- ggplot (well, aes("Reasons"))

g + geom_bar()

#Another test
barplot(table(gender))

print(well)

gender_dataframe <- as.data.frame(table(gender))
gender_dataframe
ggplot(gender_dataframe, aes(x=gender, y = Freq, fill = gender))+
  geom_bar(stat = "identity")


food_code <- as.data.frame(table(food_coded))
food_code
ggplot(food_code, aes(x=food_coded, y = Freq, fill = food_coded))+
  geom_bar(stat = "identity")

projection <- data[c("Gender","comfort_food_reasons_coded")]
both <- as.data.frame(table(projection))
both


f <-  ggplot(both, aes(x=comfort_food_reasons_coded, y=Freq, fill=Gender)) +
  geom_bar(stat="identity", position=position_dodge())+ 
  xlab("Reasons for Eating Comfort Food") + ylab("# of Responses")+
  scale_x_discrete(labels=c("1"= "stress","2" = "boredom",
                            "3" = "depression/sadness",
                            "4" = "hunger",
                            "5" = "laziness",
                            "6" = "cold weather",
                            "7" = "happiness", 
                            "8" = "watching tv",
                            "9" = "none",
                            "0" = "no answer"))+
  scale_fill_discrete(labels = c("1"= "Female", "2"= "Male"))
  

f

