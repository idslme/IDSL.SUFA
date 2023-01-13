# IDSL.SUFA<img src='SUFA_educational_files/Figures/IDSL.SUFA-logo.png' width="250px" align="right" />

<!-- badges: start -->
[![Maintainer](https://img.shields.io/badge/maintainer-Sadjad_Fakouri_Baygi-blue)](https://github.com/sajfb)
[![CRAN status](https://www.r-pkg.org/badges/version/IDSL.SUFA)](https://cran.r-project.org/package=IDSL.SUFA)
![](http://cranlogs.r-pkg.org/badges/IDSL.SUFA?color=orange)
![](http://cranlogs.r-pkg.org/badges/grand-total/IDSL.SUFA?color=brightgreen)
[![Dependencies](https://tinyverse.netlify.com/badge/IDSL.SUFA)](https://cran.r-project.org/package=IDSL.SUFA)
<!-- badges: end -->

A simplified version of the [**IDSL.UFA**](https://github.com/idslme/IDSL.UFA) package to calculate isotopic profiles and adduct formulas from molecular formulas with no dependency on other R packages for online tools. The IDSL.SUFA package has functions to process user-defined adduct formulas.

## Installation

	install.packages("IDSL.SUFA")

## Workflow
Main functions:

	isotopic_profile_molecular_formula_feeder(molecular_formula,
						  peak_spacing = 0,
						  intensity_cutoff = 1,
						  IonPathway = "[M]",
						  UFA_IP_memeory_variables = c(1e30, 1e-12, 100),
						  plotProfile = TRUE,
						  allowedVerbose = TRUE)
	
	formula_adduct_calculator(molecular_formula, IonPathway)

***molecular_formula:*** A molecular formulas

***peak_spacing:*** A maximum space between isotopologues in *Da* to merge neighboring isotopologues using the satellite clustering merging (SCM) method described in the reference[3].

***intensity_cutoff:*** A minimum intensity threshold for isotopic profiles in percentage.

***IonPathway:*** An ionization pathway (also known as [adduct type]((https://github.com/idslme/IDSL.UFA/wiki/Standard-Adduct-Type))). Pathways should be like [*Coeff*M+ADD1-DED1+...] where *Coeff* should be an integer between 1-9 and ADD1 and DED1 may be ionization pathways. ex: 'IonPathway <- c("[M]+", "[M+H]+", "[2M-Cl]-", "[3M+CO2-H2O+Na-KO2+HCl-NH4]-")'

***UFA_IP_memeory_variables:*** A vector of three variables. Default values are c(1e30, 1e-12, 100) to manage memory usage. UFA_IP_memeory_variables[1] is used to control the overall size of isotopic combinations. UFA_IP_memeory_variables[2] indicates the minimum relative abundance (RA calculated by eq(1) in the reference [2]) of an isotopologue to include in the isotopic profile calculations. UFA_IP_memeory_variables[3] is the maximum elapsed time in seconds to calculate the isotopic profile on the `setTimeLimit` function of base R.

***plotProfile:*** c(TRUE, FALSE). A `TRUE` **plotProfile** generates a spectra plot.

***allowedVerbose:*** c(TRUE, FALSE). A `TRUE` **allowedVerbose** provides messages about the flow of the function.

Visit [**wiki**](https://github.com/idslme/IDSL.UFA/wiki) for detailed documentations and tutorials for the [**list of consistent labeled isotopes**](https://github.com/idslme/IDSL.UFA/wiki/Consistent-Labeled-Isotopes), [**Standard Adduct Type**](https://github.com/idslme/IDSL.UFA/wiki/Standard-Adduct-Type), [**Definitions of Peak Spacing and Intensity Cutoff**](https://github.com/idslme/IDSL.UFA/wiki/Peak-Spacing-and-Intensity-Cutoff)

##
**example 1:** Isotopic profile of selenomethionine (C<sub>5</sub>H<sub>11</sub>NO<sub>2</sub>Se)

	library(IDSL.SUFA)
	Isotopic_Profile <- isotopic_profile_molecular_formula_feeder(molecular_formula = "C5H11NO2Se")
	
## Labeled molecular formulas
**example 2:** Isotopic profile of MBDD-2378 => 2,3,7,8-Tetrabromo(<sup>13</sup>C<sub>12</sub>)dibenzo-*p*-dioxin => <sup>13</sup>C<sub>12</sub>H<sub>4</sub>Br<sub>4</sub>O<sub>2</sub>

	library(IDSL.SUFA)
	Isotopic_Profile <- isotopic_profile_molecular_formula_feeder(molecular_formula = "[13]C12H4Br4O2", IonPathway = "[M-Br+O]-")
	
##	
**example 3:** PFOA (C<sub>8</sub>HF<sub>15</sub>O<sub>2</sub>) loosing carboxylic acid group
	
	library(IDSL.SUFA)
	Adduct_Formula <- formula_adduct_calculator(molecular_formula = "C8HF15O2", IonPathway = "[M-HCO2]-")

##
Visit https://ipc.idsl.me/ to see the isotopic profile calculation interface

## Citation
[1] Fakouri Baygi, S., Banerjee S. K., Chakraborty P., Kumar, Y. Barupal, D.K. [IDSL.UFA assigns high confidence molecular formula annotations for untargeted LC/HRMS datasets in metabolomics and exposomics](https://pubs.acs.org/doi/10.1021/acs.analchem.2c00563). *Analytical Chemistry*, **2022**, *94(39)*, 13315–13322.

[2] Fakouri Baygi, S., Crimmins, B.S., Hopke, P.K. Holsen, T.M. [Comprehensive emerging chemical discovery: novel polyfluorinated compounds in Lake Michigan trout](https://pubs.acs.org/doi/10.1021/acs.est.6b01349). *Environmental Science and Technology*, **2016**, *50(17)*, 9460-9468.

[3] Fakouri Baygi, S., Fernando, S., Hopke, P.K., Holsen, T.M. and Crimmins, B.S. [Automated Isotopic Profile Deconvolution for High Resolution Mass Spectrometric Data (APGC-QToF) from Biological Matrices](https://pubs.acs.org/doi/10.1021/acs.analchem.9b03335). *Analytical chemistry*, **2019**, *91(24)*, 15509-15517.