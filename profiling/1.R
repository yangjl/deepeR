# Example Profiling Script

replicate(10, system.time(rnorm(100000, 0, 1)))

library(farmeR)
set_jupyter(port = 9999)


