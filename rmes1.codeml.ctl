
      seqfile = rmes1.codon.aln.phy      * sequence data filename
     treefile = rmes1.prot.tre           * tree structure file name
      outfile = rmes1.results.out        * main result file name

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
