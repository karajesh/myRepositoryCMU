library(readr)
iris <- read_csv("iris.csv", 
                 col_names = FALSE, col_types = cols(X1 = col_double()))
colnames(iris) <- c("Petal.Length", "Petal.Width", "Sepal.Length", "Sepal.Width", "Species")
View(iris)

iris$Species <- as.factor(iris$Species)
print(sapply(iris, class))
print(table(iris$Species))

# Generate ggplot diagram to visualize a boxplot of Sepal.Width by Species and write this plot out to an image 
# install.packages("ggplot2"); install.packages("cowplot")
library(ggplot2)
library(cowplot)
p1 <- ggplot(iris) + geom_boxplot(aes(x=Species, y=Sepal.Width, color=Species), outlier.alpha = 0.1) + theme_minimal()
save_plot("iris.png", p1, base_height=4, base_width=4, limitsize=FALSE)