

# --- ----------------------------------------------------------------------
# --- DATA PLOTTING Examples with GGPLOT2
# --- 
# --- (c) June 2019, D.Benninger
# ---  
# ---
# --- Libraries: ggplot2, ggExtra 
# ---           (+standard R plot functions plot, qplot, hist)
# ---
# --- Data:  chol     (Cholesterin Data)    
# ---        midwest  (Population)
# ---        mpg      (motorcycle measures)                    
# ---        (standard R dataset in library ggplot2)
# ---
# --- Links
# ---   https://ggplot2.tidyverse.org/
# ---   https://www.statmethods.net/graphs/density.html
# ---   https://www.statmethods.net/advgraphs/ggplot2.html
# ---   https://www.r-bloggers.com/how-to-make-a-histogram-with-ggplot2/
# ---   http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html
# ---   
# ---
# --- Version
# ---    V1 June 2019 dbe
# ---    V2 May  2020 dbe - extended for CAS BIA10
# --- ----------------------------------------------------------------------

# --- check and set working directory (note use "/" instead of "\")
# setwd("c:/<your working directory orfolder>")
setwd("Z:/aData/HSLU/CAS BIA/Slides2020/zDATA")
getwd()

# --- Packages ggplot2, ggExtra installieren, falls nicht vorhanden
if(!"ggplot2" %in% rownames(installed.packages())) install.packages("ggplot2")
if(!"ggExtra" %in% rownames(installed.packages())) install.packages("ggExtra")

# --- Packages laden
library("ggplot2")
library("ggExtra")

# --- Set standards 
# turn-off scientific notation like 1e+48
options(scipen=999) 
# pre-set the bw theme.
theme_set(theme_bw()) 

# --- Load data
# --- Cholesterin data from Datacamp.com
# --- (data frame with 200 rows and 7 variables)
chol <- read.table("DATA_cholesterin.txt", header = TRUE)
chol
str(chol)
summary(chol)

# --- Boxplots and Histograms ----
boxplot(chol[,1], main="AGE")
hist(chol$AGE)
boxplot(chol[,2], main="HEIGHT")
hist(chol$HEIGHT)
boxplot(chol[,3], main="WEIGHT")
hist(chol$WEIGHT)

par(mfrow=c(1,3)) 
boxplot(summary(chol[,1]), main = "AGE")
boxplot(summary(chol[,2]), main = "HEIGHT")
boxplot(summary(chol[,3]), main = "WEIGHT")

par(mfrow=c(2,3)) 
boxplot(summary(chol[,1]), main = "AGE")
boxplot(summary(chol[,2]), main = "HEIGHT")
boxplot(summary(chol[,3]), main = "WEIGHT")

# --- Histograms ----
par(mfrow=c(4,1))
hist(chol$AGE)
hist(chol$HEIGHT)
hist(chol$WEIGHT)
hist(chol$CHOL)

# --- par(mfrow=c(2,1))
hist(chol$AGE, breaks=5)
hist(chol$AGE, breaks =50)


# --- Boxplot and Scatterplot mixed ----
x<- chol[,3]
xName <- names(chol)[3]
y<- chol[,4]
yName <- names(chol)[4]
# --- Output File >>> png("Picture1.png")
mat <- matrix(c(1,2,0,3), 2)
layout(mat, c(3.5,1), c(1,3))
par(mar=c(0.5, 4.5, 0.5, 0.5))
boxplot(x, horizontal=TRUE, axes=FALSE)
par(mar=c(4.5, 4.5, 0.5, 0.5))
plot(x, y, xlab=xName, ylab=yName)
par(mar=c(4.5, 0.5, 0.5, 0.5))
boxplot(y, axes=FALSE)
# --- Output >>> dev.off()

# --- Scatterplots ----
qplot(x, y, xlab= xName, ylab =yName, colour = AGE, data = chol)

qplot(chol$HEIGHT,chol$WEIGHT)
qplot(chol$HEIGHT,chol$WEIGHT, color=chol$AGE)
qplot(chol$HEIGHT,chol$WEIGHT, color=chol$CHOL)
qplot(chol$HEIGHT,chol$WEIGHT, color=chol$SMOKE)

# --- Midwest demographics (data frame with 437 rows and 28 variables)
# midwest <- read.csv("http://goo.gl/G1K41K") # backup data source
# midwest
# head(midwest)
# str(midwest)

# --- Scatterplot and Smoothline
 gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
	geom_point(aes(col=state, size=popdensity)) +
 	geom_smooth(method="loess", se=F) +
 		xlim(c(0, 0.1)) +
 		ylim(c(0, 500000)) +
 	labs(subtitle="Area Vs Population",
 		y="Population",
 		x="Area",
 	title="Scatterplot",
 	caption = "Source: midwest")

plot(gg)

# --- Fuel economy data from 1999 to 2008 for 38 popular models of cars
# --- (data frame with 234 rows and 11 variables)
# --- car manufaturer list "mtcars"
data(mpg, package="ggplot2") # alternate source: "http://goo.gl/uEeRGu")
mpg
str(mpg)
summary(mpg)



# --- Scatterplot -----------------------------------
g <- ggplot(mpg, aes(cty, hwy)) +
		geom_point() +
    geom_smooth(method="lm", se=F) +
    xlim(c(0,50)) + 
    ylim(c(0,50)) +
	    labs(subtitle="mpg: city vs highway mileage",
	    y="hwy", 
	    x="cty",

  	  title="Scatterplot with overlapping points",
    	caption="Source: midwest")
plot(g)

dim(mpg)

# --- scatterplot with jittered points -------------
g <- ggplot(mpg, aes(cty, hwy)) +
     geom_jitter(width = .5, size=1) +
     xlim(c(0,50)) +
     ylim(c(0,50)) +
     labs(subtitle="mpg: city vs highway mileage",
          y="hwy",
          x="cty",
          title="Jittered Points")
plot(g)


# --- Histogram plot -----------------------------------
g <- ggplot(mpg, aes(displ)) + scale_fill_brewer(palette = "Spectral")
g + geom_histogram(aes(fill=class),
binwidth = .1,
col="black",
size=.1) + # change binwidth
labs(title="Histogram with Auto Binning",
subtitle="Engine Displacement across Vehicle Classes")

# --- with fixed binning
g + geom_histogram(aes(fill=class),
bins=5,
col="black",
size=.1) + # change number of bins
labs(title="Histogram with Fixed Bins",
subtitle="Engine Displacement across Vehicle Classes") 

# --- Histogramm & Scatterplot combined ----------------
mpg_select <- mpg[mpg$hwy >= 35 & mpg$cty > 27, ]
g <- ggplot(mpg, aes(cty, hwy)) + 
  geom_count() + 
  geom_smooth(method="lm", se=F)

plot(g)
ggMarginal(g, type = "histogram", fill="transparent")
ggMarginal(g, type = "boxplot", fill="transparent")
ggMarginal(g, type = "density", fill="transparent")


# --- Density plot -------------------------------------
g <- ggplot(mpg, aes(cty))
g + geom_density(aes(fill=factor(cyl)), alpha=0.8) +
	labs(title="Density plot",
	subtitle="City Mileage Grouped by Number of cylinders",
	caption="Source: mpg",
	x="City Mileage",
	fill="# Cylinders")

# --- BOX plot -----------------------------------------
g <- ggplot(mpg, aes(class, cty))
	g + geom_boxplot(varwidth=T, fill="plum") +
	labs(title="Box plot",
	subtitle="City Mileage grouped by Class of vehicle",
	caption="Source: mpg",
	x="Class of Vehicle",
	y="City Mileage")
	
	
# --- with classes
g <- ggplot(mpg, aes(class, cty))
	g + geom_boxplot(aes(fill=factor(cyl))) +
	theme(axis.text.x = element_text(angle=0, vjust=0.6)) +
	ylim(c(0,40)) +
	labs(title="Box plot",
	subtitle="City Mileage grouped by Class of vehicle",
  caption="Source: mpg",
	x="Class of Vehicle",
	y="City Mileage")
	
	
# --- violin plot
g <- ggplot(mpg, aes(class, cty))
	g + geom_violin() +
	ylim(c(0,40)) +
	labs(title="Violin plot",
	subtitle="City Mileage vs Class of vehicle",
	caption="Source: mpg",
	x="Class of Vehicle",
	y="City Mileage")

# --- BAR chart ----------------------------------------
# --- first prepare the data, calculate frequency
freqtable <- table(mpg$manufacturer)
df <- as.data.frame.table(freqtable)
head(df)

# --- plot
g <- ggplot(df, aes(Var1, Freq))
	g + geom_bar(stat="identity", width = 0.5, fill="tomato2") +
	labs(title="Bar Chart",
	subtitle="Manufacturer of vehicles",
	caption="Source: Frequency of Manufacturers from 'mpg' dataset") +
	theme(axis.text.x = element_text(angle=90, vjust=0.6))
	
# --- with classes
g <- ggplot(mpg, aes(manufacturer))
	g + geom_bar(aes(fill=class), width = 0.75) +
	theme(axis.text.x = element_text(angle=90, vjust=0.6)) +
	labs(title="Categorywise Bar Chart",
	subtitle="Manufacturer of vehicles",
	caption="Source: Manufacturers from 'mpg' dataset")
	

