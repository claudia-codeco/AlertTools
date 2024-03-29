% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/alert_functions.R
\name{pipe_infodengue}
\alias{pipe_infodengue}
\title{pipeline used by infodengue}
\usage{
pipe_infodengue(
  cities,
  cid10 = "A90",
  datarelatorio,
  finalday = Sys.Date(),
  iniSE = 201001,
  nowcasting = "none",
  narule = NULL,
  writedb = FALSE,
  datasource = con,
  userinput = FALSE,
  completetail = NA,
  dataini = "notif"
)
}
\arguments{
\item{cities}{In general, a vector of 7-digit geocodes. If it is a data.frame containing geocodes
and all parameters, these will replace the database's parameters.}

\item{cid10}{default is A90 (dengue). Chik = A92.0, Zika = A92.8}

\item{datarelatorio}{epidemiological week}

\item{finalday}{if provided, uses only disease data reported up to that day}

\item{iniSE}{first date of the disease data. Default = 201501. Minimum = 201001.}

\item{nowcasting}{"fixedprob" for static model, "bayesian" for the dynamic model.
"none" for not doing nowcast (default)}

\item{narule}{how to treat missing climate data. Do nothing (default), "zero" fills 
with zeros, "linear" for linear interpolation, "arima" for inter and extrapolation.}

\item{writedb}{TRUE if it should write into the database, default is FALSE.}

\item{datasource}{posgreSQL connection to project's database}

\item{completetail}{if sinan data is older than final_day, fill in the tail with NA (default) or 0.}

\item{dataini}{"notif" (default) or "sinpri"}
}
\value{
data.frame with the week condition and the number of weeks within the 
last lag weeks with conditions = TRUE.
}
\description{
wrap of functions used by Infodengue.
}
\examples{
cidades <- getCidades(uf = "Paraná",datasource = con)
res <- pipe_infodengue(cities = cidades$municipio_geocodigo, cid10 = "A90",
nowcasting="none", dataini= "sinpri", completetail = 0, datarelatorio = 202124)
tail(tabela_historico(res))
# User's parameters (not working)
dd <- read.parameters(cities = c(3200300)) \%>\% mutate(limiar_epidemico = 100)
res <- pipe_infodengue(cities = dd, cid10 = "A90", 
finalday= "2018-08-12",nowcasting="none")
restab <- tabela_historico(res)
}
