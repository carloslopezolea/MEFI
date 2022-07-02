# MEFI
Two-dimensional, four-node, membrane-fiber element with drilling degrees of freedom.  
This element shall be used in Domain defined with ``-ndm 2 -ndf 3``

**Developed and implemented by:**    
- [C. N. López](mailto:carlos.lopez.o@ug.uchile.cl), University of Chile, Santiago<br/>
- F. Rojas, University of Chile, Santiago<br/>
- L. M. Massone, University of Chile, Santiago<br/>

## Description

The Membrane Fiber (MEFI) element (Fig. 1a), is described by four nodes, each containing three degrees of freedom
(DOFs), two translations, and one in-plane rotation (drilling) DOF, which incorporates a blended interpolation
function for the displacements over the element (Fig. 1b-c). The element formulation accommodates the quadrature points
and weights of the classical finite element formulation of membrane elements to resemble strips (fibers), similarly
to macroscopic elements.

![Model_Formulation](/images/MEFI_Element.jpg)<br/>
**Figure 1: Membrane fiber element: (a) Element idealization; (b) Interpolation function at bottom and top edges; (c) Interpolation function at left and right edges.**

### MEFI Input TCL
```bash
element MEFI eleTag iNode jNode kNode lNode m -thick {Thicknesses} -width {Widths} -mat {Material_tags} <-Density Dens>

```

| Parameter | Description |
|:----------|:------------|
| eleTag | unique element tag|
| iNode jNode kNode lNode | tags of element nodes defined in counterclockwise direction|
| m | number of element macro-fibers|
| {Thicknesses} | array of m macro-fiber thicknesses|
| {Widths} | array of m macro-fiber widths |
| {Material_tags}| array of m macro-fiber nDMaterial [FSAM](https://opensees.berkeley.edu/wiki/index.php/FSAM_-_2D_RC_Panel_Constitutive_Behavior) tags|
| Dens | element density (optional, default = 0.00)|

### Recorders

The following recorders are available with the MEFI element.

| Recorder | Description |
|:----------|:------------|
| globalForce | element global forces|
| RCPanel $fibTag $Response | returns RC panel (macro-fiber) $Response for a $fibTag-th panel (1 ≤ fibTag ≤ m). For available $Response-s refer to nDMaterial [FSAM](https://opensees.berkeley.edu/wiki/index.php/FSAM_-_2D_RC_Panel_Constitutive_Behavior) |

## Example 1
The RC wall specimen RW-A20-P10-S38 [(Tran and Wallace, 2012)](https://escholarship.org/uc/item/1538q2p8) is simulated using the MEFI element. Input files (.tcl) used to build the wall model and perform displacement-controlled analysis can be found in [RC Wall Example](/examples/Example_1). To run the analysis use the file ``Run_Pushover.tcl``. Analytical and experimental lateral load versus top displacement responses are presented in Fig. 2. 

<p align="center"><img src="/images/Wall_Response.jpg" width="40%"></p>

                                     **Figure 2: Lateral load versus top displacement response for specimen RW-A20-P10-S38.**   

## References
- López, C. N., Rojas, F., & Massone, L. M. (2022). Membrane fiber element for reinforced concrete walls – the benefits of macro and micro modeling approaches. Engineering Structures, 254, 113819. [link](https://www.sciencedirect.com/science/article/abs/pii/S0141029621018897)<br/>
