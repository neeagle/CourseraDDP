---
title       : Coursera DDP Project
subtitle    : Rent/price ratio by zipcode
author      : student
job         : investor
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Background

1. Investors don't know how to find good real estate deals outside their states
2. Many factors/(income, population, safety etc./) affect return
3. This study will investigate their relationships with return

--- .class #id 

## Rent/price ratio is a ruler of return

In this figure, purple means high return and yellow means low return.
![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png)

--- .class #id 

## Rent/price ratio is a ruler of return (con'd)

The code for previous plot is as follows. Data are from Zillow.

```r
library(zipcode)
library(ggmap)
data(zipcode)
zip_price_rent <- read.csv(file="F:/R/slidify test/Zip_PriceToRentRatio_AllHomes.csv")
map<-get_map(location='united states', zoom=4, maptype = "toner", source='google',color='color')
zipmerge <- merge(zip_price_rent, zipcode, by.x="RegionName", by.y="zip")
ggmap(map) + geom_point(aes(x=longitude, y=latitude, show_guide = TRUE, colour=log(as.numeric(1/X2016.05))), data=zipmerge, na.rm=TRUE) +  scale_color_gradient(low="yellow", high="purple")
```

--- .class #id 

## Rent/price also changes with time
This example is Zip#10025 from 10/2010 to 05/2016

```r
exp <- as.data.frame(cbind(8:75, 1/t(zipmerge[1,8:75])))
colnames(exp) <- c("a", "b")
ggplot(data=exp, aes(a,b)) + geom_line()
```

![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png)

--- .class #id 

## Conclusion and future direction
1. real estate and demographic data can aid choice of investment
2. More complete and interactive graphs will come
