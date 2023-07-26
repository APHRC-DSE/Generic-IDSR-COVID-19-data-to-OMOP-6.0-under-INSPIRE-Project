Sys.getenv('R_USER')

library(usethis)
library(devtools)
library(SqlRender)
library(DatabaseConnector)
library(Achilles)

connectionDbDetails <- createConnectionDetails(dbms = "postgresql",
                                               server = "127.0.0.1/ohdsi",
                                               user ="ohdsi_admin_user",
                                               password = "pass123",
                                               pathToDriver = "//var//lib//postgresql//psqlJDBC")

cdmDbSchema <- "cdm_idsr_54_v3"
cdmDBVersion <- "5.4"
resultsDbSchema <- "results_idsr_v3"
vocabDbSchema <- "vocab"
tempDbSchema <- "temp"


## Achilles package
achillesResults <- achilles(
  connectionDetails = connectionDbDetails,
  cdmDatabaseSchema = cdmDbSchema,
  resultsDatabaseSchema = resultsDbSchema,
  scratchDatabaseSchema = resultsDbSchema,
  vocabDatabaseSchema = vocabDbSchema,
  tempEmulationSchema = tempDbSchema,
  sourceName = "IDSR_GEN_SYN_v3",
  createTable = FALSE,
  smallCellCount = 5,
  cdmVersion = cdmDBVersion,
  createIndices = TRUE,
  numThreads = 1,
  tempAchillesPrefix = "tmpach",
  dropScratchTables = TRUE,
  sqlOnly = FALSE,
  outputFolder = "/media/tathagata/SSD/INSPIRE/OHDSI/Tools/ATLAS/log",
  verboseMode = TRUE,
  optimizeAtlasCache = TRUE,
  defaultAnalysesOnly = TRUE,
  updateGivenAnalysesOnly = FALSE,
  sqlDialect = NULL
)


## Create Indices
achillesIndices <- createIndices(
  connectionDetails = connectionDbDetails,
  resultsDatabaseSchema = resultsDbSchema,
  outputFolder = "/media/tathagata/SSD/INSPIRE/OHDSI/Tools/ATLAS/log",
  sqlOnly = FALSE,
  verboseMode = TRUE,
  achillesTables = c("achilles_results", "achilles_results_dist")
)