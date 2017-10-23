# Food_Choices


This is an exploratory analysis of [data found from Kaggle](https://www.kaggle.com/borapajo/food-choices "Shoutout to BoraPajo"). The dataset includes information on food choices and nutrition, preferences, childhood favorites, and other information from college students at Mercyhurst University. The information was gathered through a survey done by volunteers at the college. 

I will be creating visuals from the dataset to see the trends and information I can gather just from graphs. The data is great to work with for the fact it has a code sheet that offers an explanation for the information found in the csv. 


#####So what are we looking at? 

The first focus on this project will be to look at gender and reasons for food choices. More specifically, what were the reasons students ate comfort food and what if any are the differences between men and women in the data. 

#####How are you going to do it? 

R. And ggplot. Cause that's all I know so far. 

#####Is it gonna be pretty? 

The benefit of using ggplot is that it offers beautiful pastel shades of colors as a default for many of the graphs. It also offers and intuitive and simple way to customize labels, colors, and such. 

######What's the goal? 

Make as many graphs until I get bored with this dataset. 

#####Why are you doing this? 

I need reassurance that my existance isn't futile. 

##Dirty Data  

Honestly I forgot everything I did to clean the data. But what I do know is that there are 125 entries(students) and 59 categories(responses to questions). The word file that came with the data helped make sense of the columns and sparked all ideas for this project. It's worth a look through if you're interested in this project, but I offered a sample below. 

>11) cook – how often do you cook?
>1 - Every day 
>2 - A couple of times a week 
>3 - Whenever I can, but that is not very often  
>4 - I only help a little during holidays 
>5 - Never, I really do not know my way around a kitchen

To clean up the data, I loaded the csv in Excel(well Openoffice cause I spent the MS Office money on whiskey). I used their find and replace function to fill in missing data or N/A data with zeros. 

##Men vs Women 

After loading the data into RStudio with the function:

```R
data <- read.csv("C:/Users/Ashriful/Documents/Food_Choices-master/Food_Choices-master/food_coded.csv")
head(data)
```

I immediately wanted to know the amount of men and women are within the dataset. Shoutout to stackoverflow, I learned that the table() function R finds the frequency of elements and allows me to easily find out the number of women and men who took the survey by using the code below:

```R
gender <- subset(data, select=c("Gender"))
head(gender)
gender_dataframe <- as.data.frame(table(gender))
gender_dataframe
ggplot(gender_dataframe, aes(x=gender, y = Freq, fill = gender))+
  geom_bar(stat = "identity")
 ```

All that gave me this beautiful graph: 

![alt text](https://github.com/ashriful/Food_Choices/blob/master/Gender_Graph.png "Have you seen anything so pretty?")

##Reasons for those numbers on the scale

The next curosity I had looking through the data was the section for comfort food. The data included a coded column where the researcher asked students what their main reasons were for eating comfort food. From the food_coded doc:

>10) comfort_food_reasons_coded
>(the one mentioned first)
>
>1 – stress
>2 – boredom
>3 – depression/sadness
>4 – hunger
>5 – laziness
>6 – cold weather
>7 – happiness 
>8- watching tv
>9 – none 

I wanted to graph this so I used the code the same frequency function as above and created a simple but beautiful barplot.

Code:

```R
food_coded <- subset(data, select=c("comfort_food_reasons_coded"))
head(food_coded)
food_code <- as.data.frame(table(food_coded))
food_code
ggplot(food_code, aes(x=food_coded, y = Freq, fill = food_coded))+
  geom_bar(stat = "identity")
 ```

Graph: 

![alt text](https://github.com/ashriful/Food_Choices/blob/master/Food_Choices.png "Money is the easiest way to quantify success")

Things to improve: Stop being lazy and label the x-axis 
##Who's more depressed? 

Now to explore this data in interesting ways, it's worth comparing different variables. Combining what I learned from the first two graph I wanted to see what were the respective reasons men and women to choose comfort food. 

Using a simple data frame I was able to merge the two columns for a comparison: 

```R
projection <- data[c("Gender","comfort_food_reasons_coded")]
both <- as.data.frame(table(projection))
both
```

Now that I have my data frame "both" (I need to work on variable names), I can plug in to ggplot and label my graph as neccessary: 

```R
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
```

Which gives you this graph: 

![alt text](https://github.com/ashriful/Food_Choices/blob/master/MenandWomen.png "I got lazy after this")

##What now? 
TBA
