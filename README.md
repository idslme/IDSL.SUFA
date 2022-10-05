# IDSL.SUFA<img src='SUFA_educational_files/Figures/IDSL.SUFA-logo.png' width="250px" align="right" />

<!-- badges: start -->
[![Maintainer](https://img.shields.io/badge/maintainer-Sadjad_Fakouri_Baygi-blue)](https://github.com/sajfb)
[![CRAN status](https://www.r-pkg.org/badges/version/IDSL.SUFA)](https://cran.r-project.org/package=IDSL.SUFA)
![](http://cranlogs.r-pkg.org/badges/IDSL.SUFA?color=orange)
![](http://cranlogs.r-pkg.org/badges/grand-total/IDSL.SUFA?color=brightgreen)
[![Dependencies](https://tinyverse.netlify.com/badge/IDSL.SUFA)](https://cran.r-project.org/package=IDSL.SUFA)
<!-- badges: end -->

A simplified version of the [**IDSL.UFA**](https://github.com/idslme/IDSL.UFA) package to calculate isotopic profiles and adduct formulas from molecular formulas with no dependency on other R packages for online tools. The IDSL.SUFA package has functions to process user-defined adduct formulas.

	install.packages("IDSL.SUFA")

## Workflow
Main function:

	isotopic_profile_molecular_formula_feeder_simplified(molecular_formula,
					IonPathway = "[M]+", peak_spacing = 0, intensity_cutoff = 1)
	
	formula_adduct_calculator(molecular_formula, IonPathway)

***molecular_formula:*** A molecular formulas

***IonPathway:*** An ionization pathway. Pathways should be like [Coeff*M+ADD1-DED1+...] where "Coeff" should be an integer between 1-9 and ADD1 and DED1 may be ionization pathways. ex: 'IonPathway <- c("[M]+", "[M+H]+", "[2M-Cl]-", "[3M+CO2-H2O+Na-KO2+HCl-NH4]-")'

***peak_spacing:*** A maximum space between isotopologues in *Da* to merge neighboring isotopologues.

***intensity_cutoff:*** A minimum intensity threshold for isotopic profiles in percentage.

Visit [**wiki**](https://github.com/idslme/IDSL.UFA/wiki) for tutorials on [**Definitions of Peak Spacing and Intensity Cutoff**](https://github.com/idslme/IDSL.UFA/wiki/Peak-Spacing-and-Intensity-Cutoff)

##
**example 1:** Isotopic profile of selenomethionine (C<sub>5</sub>H<sub>11</sub>NO<sub>2</sub>Se)

	library(IDSL.SUFA)
	Isotopic_Profile <- isotopic_profile_molecular_formula_feeder_simplified(molecular_formula = "C5H11NO2Se")
	####
	plot(Isotopic_Profile[, 1], Isotopic_Profile[, 2], type = "h", xlab = "Theoretical mass (Da)", ylab = "Theoretical intensity (%)")
##	
**example 2:** PFOA (C<sub>8</sub>HF<sub>15</sub>O<sub>2</sub>) losing carboxylic acid group
	
	library(IDSL.SUFA)
	Adduct_Formula <- formula_adduct_calculator(molecular_formula = "C8HF15O2", IonPathway = "[M-HCO2]-")

##
Visit https://ipc.idsl.me/ to see the isotopic profile calculation interface

## Citation
Fakouri Baygi, S., Banerjee S. K., Chakraborty P., Kumar, Y. Barupal, D.K. [IDSL.UFA assigns high confidence molecular formula annotations for untargeted LC/HRMS datasets in metabolomics and exposomics](https://pubs.acs.org/doi/10.1021/acs.analchem.2c00563). *Analytical Chemistry*, **2022**, *94(39)*, 13315–13322.
