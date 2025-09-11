
setwd("/Users/carlvangessel/carl.vangessel@colostate.edu - Google Drive/My Drive/Carl lab folder/data_sharing/pangenome_expression/")

rm(list=ls())
dev.off()

load("pangenome_tpms.rdata") ## !!!!! THIS DATA IS ON THE PETA LIBRARY - A SMALLER DATASET FOR BTx623 IS AVAILABLE ON https://github.com/cvanges/GFA/

sort(names(tpms))

### Single gene of interest
goi <- "Sobic.006G017200"

# Function - single gene of int
search_gene <- function(df_list, rowname) {
  found_rows <- list()
  
  for (i in seq_along(df_list)) {
    df <- df_list[[i]]
    if (rowname %in% rownames(df)) {
      found_rows[[names(df_list)[i]]] <- df[rowname, , drop = FALSE]
    }
  }
  return(found_rows)
}

# Usage
goi_exp <- search_gene(tpms, goi)
View(goi_exp[[1]])


### Many genes of interest
goi.ls <- c("Sobic.006G017200", "Sobic.006G017400", "Sobic.006G017500", "SbPI276837.06G016600", "SbPI276837.06G016800")

goi.ls <- c("Sobic.002G010800", "Sobic.010G121000", "Sobic.005G047700", "Sobic.005G047800", "Sobic.005G048400", "SbPI154844.02G010200", "SbPI154844.10G109400", "SbPI154844.05G042300", "SbPI154844.05G042500", "SbPI154987.02G009100", "SbPI154987.10G109900", "SbPI154987.05G044300", "SbPI154987.05G044500", "SbPI154987.05G044700", "SbPI156178.02G010300", "SbPI156178.10G107600", "SbPI156178.05G041100", "SbPI156178.05G041200", "SbPI180348.02G009800", "SbPI180348.10G108700", "SbPI180348.05G041100", "SbPI180348.05G041200", "SbPI180348.05G041400", "SbPI180348.05G041600", "SbPI276816.02G010400", "SbPI276816.10G111500", "SbPI276816.05G042900", "SbPI276816.05G043100", "SbPI276816.05G043200", "SbPI276816.05G043300", "SbPI276837.02G010600", "SbPI276837.10G109700", "SbPI276837.05G041900", "SbPI276837.05G042000", "SbPI276837.05G042200", "SbPI329301.02G010100", "SbPI329301.10G106600", "SbPI329301.05G040400", "SbPI329301.05G040600", "SbPI329301.05G040700", "SbPI329301.05G040800", "SbPI329501.02G010000", "SbPI329501.10G109100", "SbPI329501.K115700", "SbPI329501.05G039700", "SbPI329501.05G039800", "SbPI329501.05G039900", "SbPI329501.05G040000", "SbPI513676.02G010200", "SbPI513676.10G110200", "SbPI513676.05G041600", "SbPI513676.05G041800", "SbPI513676.05G042100", "SbPI533766.02G010600", "SbPI533766.10G111000", "SbPI533766.05G041800", "SbPI533766.05G042000", "SbPI533766.05G042400", "SbPI533766.05G042600", "SbPI533766.05G042900", "SbPI533869.02G010600", "SbPI533869.10G112400", "SbPI533869.05G041500", "SbPI533869.05G041600", "SbPI533869.05G041700", "SbPI534133.02G010100", "SbPI534133.10G112400", "SbPI534133.05G042200", "SbPI534133.05G042500", "SbPI534133.05G042600", "SbPI534133.05G042700", "SbPI565121.02G010500", "SbPI565121.10G109000", "SbPI565121.05G042100", "SbPI565121.05G042200", "SbPI565121.05G042400", "SbPI569459.02G010300", "SbPI569459.05G040400", "SbPI569459.10G106800", "SbPI569459.K133000", "SbPI569459.K133200", "SbPI570071.05G041200", "SbPI570071.10G107900", "SbPI576434.02G010400", "SbPI576434.10G110600", "SbPI576434.05G041700", "SbPI576434.05G041800", "SbPI576434.05G041900", "SbPI585966.02G010000", "SbPI585966.10G107800", "SbPI585966.05G040200", "SbPI585966.05G040300", "SbPI585966.05G040500", "SbPI597980.02G010300", "SbPI597980.10G108300", "SbPI597980.05G040800", "SbPI597980.05G040900", "SbPI597980.05G041100", "SbPI655981.02G010400", "SbPI655981.05G041800", "SbPI655981.10G111000", "SbPI655988.02G010100", "SbPI655988.05G039600", "SbPI655988.10G108200", "SbPI656015.02G010300", "SbPI656015.10G109600", "SbPI656015.05G042100", "SbPI656015.05G042300", "SbPI656015.05G042400", "SbPI656015.05G042500", "SbPI656023.02G009800", "SbPI656023.10G110700", "SbPI656023.05G042200", "SbPI656023.05G042300", "SbPI656023.05G042400", "SbPI656027.02G010100", "SbPI656027.10G111100", "SbPI656027.05G042100", "SbPI656027.05G042200", "SbPI656027.05G042300", "SbPI656031.02G010200", "SbPI656031.05G046700", "SbPI656031.10G110200", "SbPI656031.05G042300", "SbPI656031.05G042400", "SbPI656031.05G042700", "SbPI656031.05G046500", "SbPI656031.05G046800", "SbPI656031.05G046900", "SbPI656044.02G010300", "SbPI656044.10G107000", "SbPI656044.05G039900", "SbPI656044.05G040000", "SbPI656044.05G040200", "SbPI656050.02G010100", "SbPI656050.10G110100", "SbPI656050.05G041200", "SbPI656050.05G041300", "SbPI656050.05G041400", "SbPI656057.02G010400", "SbPI656057.10G108900", "SbPI656057.05G041100", "SbPI656057.05G041300", "SbPI656057.05G041400", "SbPI656057.05G041500", "SbPI656111.02G010200", "SbPI656111.10G110700", "SbPI656111.05G042500", "SbPI656111.05G042600", "SbPI656111.05G042700", "SbPI656111.05G042800", "SbPI660557.02G010500", "SbPI660557.10G109700", "SbPI660557.05G041500", "SbPI660557.05G041800", "SbPI660557.05G041900", "SbPI660557.05G042000", "SbPI660557.05G042300", "SbPI660563.02G011400", "SbPI660563.10G112800", "SbPI660563.05G043900", "SbPI660563.05G044000", "SbPI660563.05G044100", "SbPI660565.02G010200", "SbPI660565.10G112900", "SbPI660565.05G042200", "SbPI660565.05G042300")

goi.file <- read.delim("/Users/carlvangessel/Documents/goi.ls.arg2.txt", header = F)
goi.ls <- as.list(goi.file[[1]])

# Function - multiple gene of int
search_multiple_genes <- function(df_list, gene_list) {
  all_matches <- list()
  for (gene in gene_list) {
    for (i in seq_along(df_list)) {
      df <- df_list[[i]]
      if (gene %in% rownames(df)) {
        row_data <- df[gene, , drop = FALSE]
        rownames(row_data) <- gene
        all_matches[[gene]] <- row_data
        }
    }
  }
  return(all_matches)
}

# Usage
combined_results <- search_multiple_genes(tpms, goi.ls)
View(combined_results[["SbPI276837.06G016600"]])


### Plotting function
plot_single_gene <- function(df) {
  df_sorted <- df[, order(colnames(df)), drop = FALSE] # Sort columns alphabetically
  values <- as.numeric(df_sorted[1, ])
  col_names <- colnames(df_sorted)
  plot_title <- rownames(df_sorted)[1]
  # Create bar chart
  barplot(values, 
          names.arg = col_names,
          main = plot_title,
          xlab = NA,
          ylab = "Transcript per Million",
          col = "lightblue",
          border = "black",
          cex.names = 0.6,
          las = 2)
}

# Usage
plot_single_gene(goi_exp[[1]])
plot_single_gene(combined_results$SbPI276837.06G016600)


########################################## SMALL dataset, BTx623 only ##########################################################
rm(list=ls())
dev.off()

load("btx623_tpms_small.rdata") ## !!!!! THIS SMALL DATASET FOR BTx623 IS AVAILABLE ON https://github.com/cvanges/GFA/

### Single gene of interest
goi <- "Sobic.006G017200"
goi <- "Sobic.001G168400"

### Function - single gene of interest
search_gene <- function(df, rowname) {
  if (rowname %in% rownames(df)) {
    return(df[rowname, , drop = FALSE])
  } else {
    return(NULL)
  }
}

# Usage
goi_exp <- search_gene(btx_tpms, goi)
View(goi_exp)

### Plotting function
plot_single_gene <- function(df) {
  df_sorted <- df[, order(colnames(df)), drop = FALSE] # Sort columns alphabetically
  values <- as.numeric(df_sorted[1, ])
  col_names <- colnames(df_sorted)
  plot_title <- rownames(df_sorted)[1]
  # Create bar chart
  barplot(values, 
          names.arg = col_names,
          main = plot_title,
          xlab = NA,
          ylab = "Transcript per Million",
          col = "lightblue",
          border = "black",
          cex.names = 0.6,
          las = 2)
}

plot_single_gene(goi_exp)
