
surveys <- read.csv('surveys.csv')
surveys_complete <- surveys[complete.cases(surveys), ]

surveys_complete$species <- factor(surveys_complete$species)
species_mean <- tapply(surveys_complete$wgt, surveys_complete$species, mean)
species_mean
species_max <- tapply(surveys_complete$wgt, surveys_complete$species, max)
species_min <- tapply(surveys_complete$wgt, surveys_complete$species, min)
species_sd <- tapply(surveys_complete$wgt, surveys_complete$species, sd)
nlevels(surveys_complete$species) # or length(species_mean)
surveys_summary <- data.frame(species=levels(surveys_complete$species),
                              mean_wgt=species_mean,
                              sd_wgt=species_sd,
                              min_wgt=species_min,
                              max_wgt=species_max)
pdf(file.path(Sys.getenv('OUTPUT_DIR'),"mean_per_species.pdf"))
barplot(surveys_summary$mean_wgt)
dev.off()