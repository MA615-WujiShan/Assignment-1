
library(tidyverse)

# call built-in data mtcars.
data(mtcars)

# Select only car models where mpg<20
mtcars_mpg2 <- mtcars[mtcars$mpg < 20,]


# Reduce the variables to mpg, cyl, disp, hp, gears
mtcars_mpg2 <- mtcars_mpg2[, c(1,2,3,4,10)]

# read the R file hand_functions.R so that it can be used
# notice that with echo = TRUE 
source(file = "hand_functions(2).R", echo = TRUE)

# Now use the function from hand_functions.R

sp_out <- sum_special(mtcars_mpg2)


# library(esquisse)
# use ggplot() to declare the mtcars_mpg2 data for a graphic
# use geom_point to create a scatterplot with the bullet shape, 4L size and a specific color
# use geom_smooth to helping to see the patternin the presence of overplotting
# esquisser(data = mtcars_mpg2, viewer = "browser")



ggplot(mtcars_mpg2) +
  aes(x = disp, y = mpg) +
  geom_point(shape = "bullet", size = 4L, colour = "#B22222") +
  geom_smooth(span = 0.5) +
  theme_minimal()


# note that this boxplot cannot be made with esquisse() unless
# the data is adjusted. What adjustment is needed?

ggplot(mtcars_mpg2, aes(x=as.factor(cyl), y=mpg)) + 
  geom_boxplot(fill="slateblue", alpha=0.2) + 
  xlab("cyl")

# use geom_boxplot to display the distribution of the continuous variable, -
# - which visualizeses the median, two hinges, and two whiskers, and an outlier
# the adjustment is changing the variable "cyl" to a classification variable,
# so we can make the boxplot with esquisse()

# esquisser(data = mtcars_mpg2, viewer = "browser")


