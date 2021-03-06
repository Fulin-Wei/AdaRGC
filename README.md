# Adaptive Riemannian Geometry Classifiers

## Description
This repository contains the MATLAB scripts of adaptive Riemannian geometry classifiers proposed in [1]. The proposed methods deal with the adaptation of Riemannian geometry based classifiers to tackle the drifts occurring in the data across the session. 
We proposed different techniques based on REBIAS, RETRAIN, and hybrid REBIAS-RETRAIN adaptation strategies to adapt the MDM and FgMDM classifier as proposed in [2]. A detailed review for Riemannian geometry in BCI can be found [here](https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=7740054). 
Note that the proposed approaches can also be used for adaptation across subject transfer learning scenarios. All the adaptation schemes for MDM and FgMDM is implemented as a composite
script in the scripts *MDM.M* and *FgMDM.M*. The folders MDM and FgMDM have detailed implementation of different adaptation schemes for the corresponding classifiers. 

[1] Satyam Kumar, Florian Yger, Fabien Lotte - " Towards Adaptive Classification using Riemannian Geometry approaches in Brain-Computer Interfaces " : [Paper Link](https://hal.inria.fr/hal-01924646)

[2] Barachant A, Bonnet S, Congedo M, Jutten C. " Riemannian geometry applied to BCI classification ". InInternational Conference on Latent Variable Analysis and Signal Separation 


#### Toolboxes we use

1. [Covariance toolbox](https://github.com/alexandrebarachant/covariancetoolbox)
2. [BCI signal processing toolbox](https://drive.google.com/file/d/0B93wwoGtlGkmYWJjODktVFNfUFU/view)

### Example script

1. **TestProtocole.m** : This script loads the sample data from the example mat files (*protocol_data.mat* and *protocol_data1.mat*) and compare
the performances of different adaptive algorithms.

### Todo
* Add for supervised rebias adaptation scheme in FgMDM
* Add the CSP adaptation algorithms 

I want to thank [Thibaut monseigne](https://tmonseigne.github.io/) for structuring the codes nicely, Thanks Thibaut!