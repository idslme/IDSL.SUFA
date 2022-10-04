formula_adduct_calculator <- function(molecular_formula, IonPathway) {
  ##
  Elements <- element_sorter()[["Elements"]]
  L_Elements <- length(Elements)
  ## IonPathway = [Coeff*M+CO2-H2O+Na-KO2+HCl-...] # Coeff should be an integer between 1-9
  IonPW_DC <- ionization_pathway_deconvoluter(IonPathway, Elements)
  ##
  FormulaVector <- formula_vector_generator(molecular_formula, Elements, L_Elements)
  ##
  MolVecMat <- do.call(rbind, lapply(IonPW_DC, function(pathway) {
    Ion_coeff <- pathway[[1]]
    Ion_adduct <- pathway[[2]]
    MoleFormVec <- Ion_coeff*FormulaVector + Ion_adduct
    x_neg <- which(MoleFormVec < 0)
    if (length(x_neg) > 0) {
      MoleFormVec <- NULL
    }
    MoleFormVec
  }))
  ##
  if (length(MolVecMat) > 0) {
    molecular_adducts <- SUFA_hill_molecular_formula_printer(Elements, MolVecMat)
  } else {
    molecular_adducts <- NA
  }
  return(molecular_adducts)
}
