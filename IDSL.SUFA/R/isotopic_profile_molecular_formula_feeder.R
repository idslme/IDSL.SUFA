isotopic_profile_molecular_formula_feeder <- function(molecular_formula, peak_spacing = 0, intensity_cutoff = 1, IonPathway = "[M]",
                                                      UFA_IP_memeory_variables = c(1e30, 1e-12, 100), plotProfile = TRUE, allowedVerbose = TRUE) {
  ##
  if (allowedVerbose) {initiation_time_UFA <- Sys.time()}
  ##
  SUFAstrCharge <- NA
  ##
  elementSorterList <- element_sorter()
  Elements <- elementSorterList[["Elements"]]
  massAbundanceList <- elementSorterList[["massAbundanceList"]]
  ##
  IonPW_DC <- ionization_pathway_deconvoluter(IonPathway, Elements)
  ##
  FormulaVector <- formula_vector_generator(molecular_formula, Elements, LElements = length(Elements), allowedRedundantElements = TRUE)
  ##
  Ion_coeff <- IonPW_DC[[1]][[1]]
  Ion_adduct <- IonPW_DC[[1]][[2]]
  MoleFormVec <- Ion_coeff*FormulaVector + Ion_adduct
  xNeg <- which(MoleFormVec < 0)
  if (length(xNeg) == 0) {
    ##
    IPP <- tryCatch(isotopic_profile_calculator(MoleFormVec, massAbundanceList, peak_spacing, intensity_cutoff, UFA_IP_memeory_variables),
                    error = function(e) {matrix(c(Inf, 100), ncol = 2)}, warning = function(w) {matrix(c(Inf, 100), ncol = 2)})
    ##
    SUFAstrCharge <- IonPW_DC[[1]][[3]]
    charge <- gsub("[+]|-", "", SUFAstrCharge)
    if (charge != "") {
      charge <- tryCatch(as.numeric(charge), warning = function(w) {1})
      if (charge > 1) {
        IPP[, 1] <- IPP[, 1]/charge
        ##
        if (allowedVerbose) {message(paste0("NOTICE! Multiple-charged ion of `", SUFAstrCharge, "` was detected for the ionization pathway!"))}
      }
    }
    SUFAstrCharge <<- SUFAstrCharge
    ##
    IPP[, 1] <- round(IPP[, 1], 7)
    IPP[, 2] <- round(IPP[, 2], 5)
    ##
  } else {
    SUFAstrCharge <<- NA
    IPP <- matrix(c(Inf, 100), ncol = 2)
    if (allowedVerbose) {warning("Molecular formula is not consistent with the ionization pathway!")}
  }
  ##
  if (allowedVerbose) {
    required_time <- Sys.time() - initiation_time_UFA
    message(paste0("The required processing time was `", required_time, " ", attributes(required_time)$units, "`"))
  }
  ##
  if (plotProfile) {
    if (!is.na(SUFAstrCharge)) {
      IonFormula <- SUFA_hill_molecular_formula_printer(Elements, MoleFormVec)
      plot(IPP[, 1], IPP[, 2], type = "h", lend = 2, ylim = c(0, 105),
           lwd = 4, lend = 2, col = "red", cex = 4, xlab = "m/z", ylab = "Intensity (%)", yaxs = "i")
      graphics::mtext(text = paste0("[", IonFormula, "]", SUFAstrCharge), side = 3, adj = 0.5, line = 0.25, cex = 1.1)
    }
  }
  ##
  return(IPP)
}
