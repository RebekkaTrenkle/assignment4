

# The next two lines install the package - only necessary the first time  
source("https://bioconductor.org/biocLite.R") 
biocLite("rGADEM") 
# Load package 
library("rGADEM") 
# creates en empty string called pwd
pwd <- "" 
# creates the variable called path and assigns it the full name of the 
# file Test_100.fasta in the subdirectory extdata of the package rGADEM using
# system.file
# https://www.rdocumentation.org/packages/base/versions/3.6.0/topics/system.file 
path<- system.file("extdata/Test_100.fasta", package="rGADEM") 
# creates FastaFile and assigns it the combined entries of pwd and path,
# converted into character vectors without being separated (sep="")
# https://www.rdocumentation.org/packages/base/versions/3.6.0/topics/paste
FastaFile <- paste(pwd, path, sep="") 

# creates the variable sequences and loads into it sequences from 
# the input file FastaFile, with the format="fasta" using readDNAStringSet
sequences <- readDNAStringSet(FastaFile, "fasta") 
# creates the variable gadem and runs the function GADEM, which searches for 
# unknown motifs. gadem holds now the most similar sequences of the motif 
# from the individual DNA sequences that were observed
# https://www.rdocumentation.org/packages/rGADEM/versions/2.20.0/topics/GADEM
gadem <- GADEM(sequences, verbose=1) 
# creates the consensus motiv out of the sequences stored in gadem
# https://www.rdocumentation.org/packages/sna/versions/2.4/topics/consensus
consensus(gadem) 
# creates the variable gwm which holds the information stored in gadem, but
# in a motif list
# https://www.rdocumentation.org/packages/MotifDb/versions/1.14.0/topics/MotifList-class
pwm <- gadem@motifList[[1]]@pwm  
# draws the sequence logo of pwm
# https://www.rdocumentation.org/packages/DiffLogo/versions/1.2.1/topics/seqLogo
seqLogo(pwm)

