# MEFI
Two-dimensional, four-node, membrane-fiber element with drilling degrees of freedom.  
This element shall be used in Domain defined with ``-ndm 2 -ndf 3``

**Developed and implemented by:**    
- [C. N. López](mailto:carlos.lopez.o@ug.uchile.cl), University of Chile, Santiago<br/>
- F. Rojas, University of Chile, Santiago<br/>
- L. M. Massone, University of Chile, Santiago<br/>

## Description

The Membrane Fiber (MEFI) element, is described by four nodes, each containing three degrees of freedom
(DOFs), two translations, and one in-plane rotation (drilling) DOF, which incorporates a blended interpolation
function for the displacements over the element. The element formulation accommodates the quadrature points
and weights of the classical finite element formulation of membrane elements to resemble strips (fibers), similarly
to macroscopic elements.

![Model_Formulation](/images/MEFI_Element.jpg)<br/>
**Figure 1: Membrane fiber element: (a) Element idealization; (b) Interpolation function at bottom and top edges; (c) Interpolation function at left and right edges.**

### MEFI Input
```bash
element MEFI eleTag iNode jNode kNode lNode m -thick {Thicknesses} -width {Widths} -mat {Material_tags} <-Density Dens>

```

| Parameter | Description |
|----------|------------|
| eleTag | unique element tag|
| iNode jNode kNode lNode | tags of element nodes defined in counterclockwise direction|
| m | number of element macro-fibers|
| {Thicknesses} | array of m macro-fiber thicknesses|
| {Widths} | array of m macro-fiber widths |
| {Material_tags}| array of m macro-fiber nDMaterial [FSAM](https://opensees.berkeley.edu/wiki/index.php/FSAM_-_2D_RC_Panel_Constitutive_Behavior) tags|
| Dens | element density (optional, default = 0.00)|

### Recorders

The following recorders are available with the MEFI element.

| recorder | description |
|----------|------------|
| globalForce | Element global forces|
| RCPanel $fibTag $Response | Returns RC panel (macro-fiber) $Response for a $fibTag-th panel (1 ≤ fibTag ≤ m). For available $Response-s refer to nDMaterial [FSAM](https://opensees.berkeley.edu/wiki/index.php/FSAM_-_2D_RC_Panel_Constitutive_Behavior) |

## Example



## References
López, C. N., Rojas, F., & Massone, L. M. (2022). Membrane fiber element for reinforced concrete walls – the benefits of macro and micro modeling approaches. Engineering Structures, 254, 113819. [link](https://www.sciencedirect.com/science/article/abs/pii/S0141029621018897)<br/>
