# Прописываем все пути

pythonPath = "Z:/PortableApps/!Other/Python/Python37/"
envPath    = Sys.getenv("PATH")

library(data.table)
pythonInstalled = envPath %like% pythonPath

if (!pythonInstalled) {
  library(reticulate)
  use_python(pythonPath)
  Sys.setenv(PATH=paste(Sys.getenv("PATH"),
                        pythonPath,
                        sep=.Platform$path.sep))
  Sys.setenv(PATH=paste(Sys.getenv("PATH"),
                        paste0(pythonPath, "Scripts/"),
                        sep=.Platform$path.sep))
  Sys.setenv(PATH=paste(Sys.getenv("PATH"),
                        paste0(pythonPath, "Lib/"),
                        sep=.Platform$path.sep))
  pythonInstalled = TRUE
}