% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Rt_functions.R
\name{applyGenTimeDist}
\alias{applyGenTimeDist}
\title{Calculate matrix of generation time distribution for cities in infodengue}
\usage{
applyGenTimeDist(cities, stations, cid10 = "A90", datasource = con, ...)
}
\arguments{
\item{cities}{: vector of geocodes}

\item{stations}{: vector of meteorological stations}

\item{cid10}{: "A90" for dengue, "A92" for chikungunya, "A92.8" for zika}

\item{datasource}{: sql connection}

\item{ini}{: initial date (Date or epidemiological week)}

\item{end}{: final date (Date or epidemiological week)}
}
\value{
list of generation time distributions matrices
}
\description{
Calculate the generation time for cities or from meteorological stations
}
\examples{
cid <- getCidades(uf="Rio de Janeiro")$municipio_geocodigo
gt <- applyGenTimeDist(stations = c("SBGL","SBJR"), cid10 = "A90")
system.time(gt <- applyGenTimeDist(cities = cid, cid10 = "A90"))
}
