# LGE_CMRI_Simulation

## [Paper](https://www.sciencedirect.com/science/article/pii/S0010482521005679):  **Influence of image artifacts on image-based computer simulations of the cardiac electrophysiology**

#### E. Kruithof, S. Amirrajab, M.J.M. Cluitmans, K.D. Lau, M. Breeuwer.
----
### LGE cardiac MR image simulation code for generating data with slice misalignment  artifact. The code is an extension on the initial implementation of the [MRXCAT](https://jcmr-online.biomedcentral.com/articles/10.1186/s12968-014-0063-3) MATLAB code (available [here](https://biomed.ee.ethz.ch/mrxcat.html)) for simulating LGE cardiac MRI with slice misalignment artifacts

## Installation
Clone this repo:
```bash
git clone https://github.com/sinaamirrajab/LGE_CMRI_Simulation
cd LGE_CMR_Simulation/
```
This code was tested on MATLAB 2018b. To produce the results in the paper, you would need to have the XCAT .bin subject for simulation. The .bin files for this study could be provided upon request. 
Note that the XCAT is a separate software which offers computerized human anatomical models for simulation. The XCAT software is available [here](https://olv.duke.edu/industry-investors/available-technologies/xcat/)

Alternatively, Nifti format of the simulated images for different respiratory phases is available at [Results](./Results) folder. This data is combined to mimick slice misalignment artifact availabe [here](./Results/Misaligned_Slices.nii.gz)
