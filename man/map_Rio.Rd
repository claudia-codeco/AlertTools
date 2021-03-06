% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/alert_functions.R
\name{map_Rio}
\alias{map_Rio}
\title{Plot the alert map for Rio de Janeiro city.}
\usage{
map_Rio(
  obj,
  cores = c("green", "yellow", "orange", "red"),
  data,
  datasource = con,
  shapefile = "../report/Rio_de_Janeiro/shape/CAPS_SMS.shp",
  filename = "",
  dir,
  resol = 200
)
}
\arguments{
\item{obj}{object created by the twoalert and fouralert functions.}

\item{cores}{colors corresponding to the levels 1, 2, 3, 4.}

\item{data}{Date}

\item{filename}{if present, the map is saved.}

\item{dir}{directory where map will be saved.}

\item{resol}{dpi png resolution, default is 200}
}
\value{
a map
}
\description{
Function to plot a map of the alert.
}
\examples{
params <- c(varcli ="temp_min", clicrit=22, limiar_epidemico=100, limiar_preseason = 14.15)
criter <- setCriteria(rule="Af", values = params)
alerio2 <- alertaRio(naps = 0:2, crit = criter, se=201804, delaymethod="fixedprob")
map_Rio(alerio2)
}
