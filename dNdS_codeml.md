# This markdown is to analyze dN/dS ratios and estimate selection
### This analysis will require PAL2NAL (for converting protein alignment to coding alignement) and PAML (main dNdS analysis tool)

### Fasta files with protein and CDS sequences for defined gene family:
```rmes1.prot.fa```
```rmes1.prot.afa```
```rmes1.cds.fa```
```rmes1.prot.tre```
  
##### Instructions for generating protein alignment and tree file are at GFA/MSA_PhylogeneticTree.md

## 1 Software installation

### 1.1 Download PAL2NAL - https://www.bork.embl.de/pal2nal/
```wget http://www.bork.embl.de/pal2nal/distribution/pal2nal.v14.tar.gz```
  
```tar -xzf pal2nal.v14.tar.gz```

### Make executable
```chmod +x pal2nal.v14/pal2nal.pl```

### Add to PATH or use full path
```export PATH=$PATH:/path/to/pal2nal```

##### my example
```export PATH=$PATH:/scratch/alpine/cjvanges@colostate.edu/GFA_workshop_2025/pal2nal.v14/```

### Test installation
```pal2nal.pl```

### 1.2 Clone PAML from github - https://github.com/abacus-gene/paml
```git clone https://github.com/abacus-gene/paml.git```

```cd paml/src```

### Move to the `src` directory to compile the software
```make -f Makefile```

```ls -lF```

```rm *.o```

### Create a `bin` directory, which you can then export to your PATH
```mkdir ../bin```

### Move the compiled programs to `bin`
```mv baseml basemlg chi2 codeml evolver infinitesites mcmctree pamp yn00 ../bin```

### Add to PATH or use full path
```export PATH=$PATH:/path/to/bin```

##### my example
```export PATH=$PATH:/scratch/alpine/cjvanges@colostate.edu/GFA_workshop_2025/paml/bin/```

### Test installation
```codeml```
##### an message "error when opening file codeml.ctl -- tell me the full path-name of the file?" should appear - type anything and press enter to quit the program


## 2 Prepare codon-alignment file from protein alignment
```pal2nal.pl aligned_proteins.faa nucleotides.fna -output paml -nogap > rmes1.codon.aln.phy```

##### my example
```pal2nal.pl rmes1.prot.afa rmes1.cds.fa -output paml -nogap > rmes1_codon_alignment.phy```

## 3 create codeml control file
```nano rmes1.codeml.ctl```
##### copy and paste the following lines into the codeml.ctl file
##### edit your file for the file names corresponding to your codon-alignment file (.phy) and tree file (.tre)
```
      seqfile = rmes1.codon.aln.phy      * sequence data filename
     treefile = rmes1.prot.tre           * tree structure file name
      outfile = rmes1_results.out        * main result file name

        noisy = 3    * 0,1,2,3,9: how much rubbish on the screen
      verbose = 1    * 0: concise; 1: detailed; 2: too much
      runmode = -2    * 0: user tree;  1: semi-automatic;  2: automatic
                     * 3: StepwiseAddition; (4,5):PerturbationNNI; -2: pairwise

      seqtype = 1    * 1:codons; 2:AAs; 3:codons-->AAs
    CodonFreq = 2    * 0:1/61 each, 1:F1X4, 2:F3X4, 3:codon table

        model = 0    * models for codons:
                     * 0:one ratio; 1:b ratio; 2:2 or more ratios

      NSsites = 0    * 0:one omega; 1:neutral; 2:selection; 3:discrete;...
                     * 7:beta; 8:beta&w; 9:beta&gamma;
                     * 10:beta&gamma+1; 11:beta&normal>1; 12:0&2normal>1

        icode = 0    * 0:universal code; 1:mammalian mt; 2-10:see below

    fix_kappa = 0    * 1: kappa fixed, 0: kappa to be estimated
        kappa = 2    * initial or fixed kappa

    fix_omega = 0    * 1: omega or omega_1 fixed, 0: estimate 
        omega = .4   * initial or fixed omega, for codons or codon-translated AAs

       getSE = 0     * 0: don't want them, 1: want S.E.s of estimates
RateAncestor = 0     * (0,1,2): rates (alpha>0) or ancestral states (1 or 2)

   Small_Diff = .5e-6
    cleandata = 1    * remove sites with ambiguity data (1:yes, 0:no)?
  fix_blength = 0    * 0: ignore, -1: random, 1: initial, 2: fixed
       method = 0    * Optimization method 0: simultaneous; 1: one branch a time
```
##### use ctrl+X to close file, change the name of the codeml.ctl file as desired, and press 'Y' to save

## 4 Run codeml
```codeml rmes1.codeml.ctl```

##### View results
```less rmes1_results.out```
