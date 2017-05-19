library("magick")
library("magrittr")

doggie_praise <- function(firstname){
  image <- download.file("http://www.randomdoggiegenerator.com/randomdoggie.php",
                         destfile = "doggo.php", mode = "wb")
  
  image_read("doggo.php") %>%
    image_annotate(text = praise::praise(template = paste0(firstname,
                                                           " is ${adjective} and \n dogs are ${adjective}!")),
                   gravity = "southwest",
                   boxcolor = "black",
                   color = "white",
                   size = 20) %>%
    grid::grid.raster()
  
  file.remove("doggo.php")
  return("It's true")
}

doggie_praise("Carles")

