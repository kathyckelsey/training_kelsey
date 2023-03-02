---
title: "functions"
author: "Kathy Kelsey"
date: "2023-03-02"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r}
source("temp-conversions.R")
source("ggplot-helpers.R")
```

```{r}
library(ggplot2)
```

```{r}
airtemps <- seq(-100, 100, 10)

airtemps_c <- celsius_to_fahr(airtemps)
```

```{r}
temps_all <- convert_temps(airtemps)
```

```{r}
ggplot(temps_all, mapping = aes(x = fahr, y = celsius, color = kelvin)) +
  geom_point() +
  custom_theme(base_size = 25)
```

