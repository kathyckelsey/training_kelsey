airtemps <- c(212, 30.3, 78, 32) # air temps in F

cel1 <- (airtemps[1]-32)*5/9
cel2 <- (airtemps[2]-32)*5/9
cel3 <- (airtemps[3]-32)*5/9 # this is a "bad" copy/paste situation!

# Now make a function
#' Convert F temperatures to C
#'
#' @param fahr the temperature in F
#'
#' @return the temperature in C
#' @export
#'
#' @examples
fahr_to_celsius <- function(fahr) {
  celsius <- (fahr - 32)*5/9
  return(celsius)
}

celsius1 <- fahr_to_celsius(airtemps[1])
celsius_all <- fahr_to_celsius(airtemps)

#now celsius_to_fahr; celsius*9/5 + 32
#' Title
#'
#' @param cel 
#'
#' @return
#' @export
#'
#' @examples
celsius_to_fahr <- function(cel) {
  fahr <- (cel*9/5) + 32
  return(fahr)
}

# now check the functions!
airtempsC <- fahr_to_celsius(airtemps)
airtempsF <- celsius_to_fahr(airtempsC)
airtempsF == airtemps

#Function to return C and K from F
# Ch 10.1.4 minimizing work with functions

convert_temps <- function(fahr) {
  celsius <- (fahr-32)*5/9
  kelvin <- celsius + 273.15
  temps <- data.frame(fahr=fahr, 
                    celsius=celsius, 
                    kelvin=kelvin)
            return(temps)
}

temps_all <- convert_temps(airtemps)


######
# copied custom theme from the book; Ch 10.1.4
custom_theme <- function(base_size = 9) {
  ggplot2::theme(
    axis.ticks       = ggplot2::element_blank(),
    text             = ggplot2::element_text(family = 'Helvetica', color = 'gray30', size = base_size),
    plot.title       = ggplot2::element_text(size = ggplot2::rel(1.25), hjust = 0.5, face = 'bold'),
    panel.background = ggplot2::element_blank(),
    legend.position  = 'right',
    panel.border     = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major = ggplot2::element_line(colour = 'grey90', size = .25),
    legend.key       = ggplot2::element_rect(colour = NA, fill = NA),
    axis.line        = ggplot2::element_blank()
  )
}


## using functions to help with plotting - use function above
source("temp-conversions.R")
source("ggplot-helpers.R")

library(ggplot2)

airtemps <- seq(-100, 100, 10)
airtemps_c <- celsius_to_fahr(airtemps)
temps_all <- convert_temps(airtemps)

ggplot(temps_all, mapping = aes(x = fahr, y = celsius, color = kelvin)) +
  geom_point() +
  custom_theme(base_size = 25)


