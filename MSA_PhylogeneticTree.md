# This markdown is to generate a MSA and Phylo Tree for gene family analysis

## Fasta file with protein sequences for defined gene family:
```gfa_lgs1.fa```

## Optional code to remove transcript names from sequence IDs
```sed 's/|.*$//' raw_gfa_lgs1.fa > gfa_lgs1.fa ```

### Code for moving file to Alpine
##### [CURC Resources](https://curc.readthedocs.io/en/latest/compute/data-transfer.html)
##### Using scp from local folder with .fa file (e.g. Downloads)
```scp gfa_lgs1.fa cjvanges@colostate.edu@login.rc.colorado.edu:~/```
##### Prompted for my_password,push, then progress bar shows completion

##### Using SFTP from local folder with .fa file (e.g. Downloads) 
```sftp cjvanges@colostate.edu@login.rc.colorado.edu```
##### Prompted for my_password,push
##### After entering sftp connection, the enter line prompt changes to “sftp>”
##### Navigate to target remote directory, transfer file, then exit sftp portal
```cd /scratch/alpine/cjvanges@colostate.edu ```

```put gfa_lgs1```

```quit```

## Code for installing bioinformatic software 

##### Access Alpine scratch folder and compute nodes
```ssh cjvanges@colostate.edu@login.rc.colorado.edu```

```acompile```

```cd /scratch/alpine/cjvanges@colostate.edu/GFA_workshop_2025```
##### If you are unfamiliar with the Conda ecosystem, refer to these resources
##### [Conda Ecosystem Explained](https://conda.org/blog/2024-08-14-conda-ecosystem-explained/)

##### [CURC Conda Primer](https://curc.readthedocs.io/en/latest/software/python.html)

##### Check existing conda repositories
```conda list```
##### Install MAFFT using BioConda - Prompt for installing package dependencies [y/n] - type “y” and enter
```conda install -c bioconda mafft```
##### Install FastTree using BioConda - Prompt for installing package dependencies [y/n] - type “y” and enter
```conda install -c bioconda fasttree```
##### Check if these are now available - use control-Z to exit MAFFT
```conda list```

```mafft```

<img width="650" height="214" alt="image" src="https://github.com/user-attachments/assets/0491ec04-0d81-4c6f-b35e-417232692ffe" />

```fasttree```

<img width="567" height="592" alt="image" src="https://github.com/user-attachments/assets/5e8b8925-86fc-4c22-8cdd-ed4e14b5764a" />

## Code for generating MSA

##### [MAFFT website](https://mafft.cbrc.jp/alignment/software/)

```mafft gfa_lgs1.fa > gfa_lgs1.afa```

##### Check how the .fa and .afa files differ. Why are the files different sizes?

```head gfa_lgs1.fa```

```head gfa_lgs1.afa```

## Code for generating Phylogenetic Tree

##### [FastTree website](https://morgannprice.github.io/fasttree/#Usage)

```fasttree gfa_lgs1.afa > gfa_lgs1.tre```

## Code for moving file to local computer

##### From local machine (e.g. Downloads folder)

```scp cjvanges@colostate.edu@dtn.rc.colorado.edu:/scratch/alpine/cjvanges@colostate.edu/GFA_workshop_2025/gfa_lgs1.afa . ```

