\name{isotopic_profile_molecular_formula_feeder_simplified}
\alias{isotopic_profile_molecular_formula_feeder_simplified}
\title{
Isotopic Profile Molecular Formula Feeder
}
\description{
A function to calculate isotopic profiles from a molecular formulas
}
\usage{
isotopic_profile_molecular_formula_feeder_simplified(molecular_formula,
IonPathway = "[M]+", peak_spacing = 0, intensity_cutoff = 1,
UFA_IP_memeory_variables = c(1e30, 1e-12, 10)
)
}
\arguments{
  \item{molecular_formula}{
A molecular formulas
}
  \item{IonPathway}{
An ionization pathway. Pathways should be like [Coeff*M+ADD1-DED1+...] where "Coeff" should be an integer between 1-9 and ADD1 and DED1 may be ionization pathways. ex: 'IonPathway <- c("[M]+", "[M+H]+", "[2M-Cl]-", "[3M+CO2-H2O+Na-KO2+HCl-NH4]-")'
}
  \item{peak_spacing}{
A maximum space between isotopologues in Da to merge neighboring isotopologues.
}
  \item{intensity_cutoff}{
A minimum intensity threshold for isotopic profiles in percentage.
}
  \item{UFA_IP_memeory_variables}{
A vector of three variables. Default values are c(1e30, 1e-12, 10). Memory may be an issue when the entire isotopologues are calculated; therefore, UFA_IP_memeory_variables[1] is used to adjust memory usage. UFA_IP_memeory_variables[2] indicates the minimum relative abundance (RA calculated by eq(1) in the reference [1]) of an isotopologue to include in the isotopic profile calculations. UFA_IP_memeory_variables[3] is the maximum elapsed time to calculate the isotopic profile on the `setTimeLimit` function of base R.
}
}
\value{
A list of isotopic profiles
}
\references{
[1] Fakouri Baygi, S., Crimmins, B.S., Hopke, P.K. Holsen, T.M. (2016). Comprehensive emerging chemical discovery: novel polyfluorinated compounds in Lake Michigan trout. \emph{Environmental Science and Technology}, 50(17), 9460-9468, \doi{10.1021/acs.est.6b01349}.
}
\seealso{
\url{https://ipc.idsl.me/}
}
\examples{
\donttest{
molecular_formula <- "C12Cl10"
peak_spacing <- 0.005 # in Da for QToF instruments
# Use this piece of code for intensity cutoff to preserve significant isotopologues
intensity_cutoff <- 1
IonPathway <- "[M+H]+"
isotopic_profile <- isotopic_profile_molecular_formula_feeder_simplified(molecular_formula,
IonPathway, peak_spacing, intensity_cutoff)
}
}
