## Load Library
# if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# Set Peak Info, Sampling Rate, and Run Time
peak_1 <- list(height = 100, width = 1, position = 50)
peak_2 <- list(height = 300, width = 3, position = 400)
peak_3 <- list(height = 450, width = 5, position = 450)
peaks_info <- list(peak_1, peak_2, peak_3)

points_per_second <- 40

seconds_of_run_time <- 600

## Generate Mock Chromatogram Using Gaussian Distribution
mock_chromatogram <- function(peaks_info, points_per_second, seconds_of_run_time) {
  time <- seq(0, runtime, by = 1 / points_per_second)
  chromatogram <- rep(0, length(time))
  
  for (peak in peaks_info) {
    height <- peak$height
    width <- peak$width
    position <- peak$position
    peak_values <- height * exp(-(time - position)^2 / (2 * width^2))
    chromatogram <- chromatogram + peak_values
  }
  
  return(data.frame(Time = time, Intensity = chromatogram))
  }

## Generate Chromatogram Data as a Function of Peak Info, Sampling Rate, and Run Time
chromatogram_data <- mock_chromatogram(peaks_info, points_per_second, seconds_of_run_time)

## Print Chromatogram Plot
print(ggplot(chromatogram_data, aes(x = Time, y = Intensity)) + 
  theme_minimal() +
  geom_point(size = 1, shape = 18, color = "#008080") +
  theme(plot.title = element_text(face = "bold")) + 
  labs(title = "Mock Chromatogram", x = "Time (s)", y = "Intensity (AU)")
  )

## Print Chromatogram Points List
original_max_print <- getOption("max.print")
options(max.print = 1e9)
page(chromatogram_data, method = "print")
options(max.print = original_max_print)