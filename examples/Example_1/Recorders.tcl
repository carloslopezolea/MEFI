# NODE Recorders:
# ----------------------------------------------------------------

recorder Node -file $dataDir/REACTIONS_1.out -time -node 1 -dof 1 2 3 reaction
recorder Node -file $dataDir/REACTIONS_2.out -time -node 2 -dof 1 2 3 reaction
recorder Node -file $dataDir/NODE_DISP.out -time -node 17 -dof 1 2 3 disp

# AREA ELEMENT Recorders:
# ----------------------------------------------------------------


