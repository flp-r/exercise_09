

library(Biostrings)

Overlap <- function(seq1, seq2) {
  seq1 <- paste(seq1, collapse = "")
  seq2 <- paste(seq2, collapse = "")
  
  max_overlap <- min(nchar(seq1), nchar(seq2))
  overlap_length <- 0
  
  for (i in 1:max_overlap) {
    if (substr(seq1, nchar(seq1) - i + 1, nchar(seq1)) == substr(seq2, 1, i)) {
      overlap_length <- i
    }
  }
  
  return(overlap_length)
}





OverlapMatrix <- function(s){
  n_of_seq = length(s)
  matice <- matrix(nrow = n_of_seq, ncol = n_of_seq)
  
  for (i in 1:n_of_seq){
    seq_1 <- s[[i]]
    for (j in 1:n_of_seq){
      seq_2 <- s[[j]]
      if (i == j){
        matice[i, j] <- 0
      }
      else{
      matice[i, j] <- Overlap(seq_1, seq_2)}
    }
  }
  return(matice)
  
}






GreedySuperstring <- function(s){
  while(length(s) > 1){
    overlapMap <- OverlapMatrix(s)
    if (max(overlapMap) == 0){
      return(s)
    }
    else{
      max_indices <- which(overlapMap == max(overlapMap), arr.ind = TRUE)
      seq1 <- s[max_indices[1]]
      seq2 <- s[max_indices[2]]
      ss <- substr(seq2, max_indices, nchar(seq2))
      
      
      merged_seq <- paste0(seq1, seq2)
    }
  }
  
  
}

s <- DNAStringSet(c("CATGC", "CTAAGT", "GCTA", "TTCA", "ATGCATC"))
print(s[1])



seq1 <- s[[1]]
seq2 <- s[[5]]
Overlap(seq1, seq2)
m = OverlapMatrix(s)
max_indices <- which(m == max(m), arr.ind = TRUE)
seqm <- s[max_indices[1]]


substr(seq1, 4, nchar(seq1))
