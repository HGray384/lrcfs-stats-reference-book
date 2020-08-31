# constants for this example
populationSize <- 10000
baseRate <- 0.02

doping <- populationSize*baseRate
notDoping <- populationSize-doping

priorOdds = baseRate/(1-baseRate)