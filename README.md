# Docker-iSyntax2TIFF

This repo stores the dockerfile and scripts to build an environment to convert Philips' iSyntax files to TIFF.

*Philips' Pathology SDK 2.0_L1 is required.*

# Installation

1) Download the Philips's SDK - https://www.openpathology.philips.com/
2) Extract for the "SampleCodes" folder the "PythonTools.zip"
3) Extract for the "Ubuntu20.04" folder the zip file belonging to Python libraries (there's py38 in the name)
4) Clone this repo
5) In the build folder you should have:
- Dockerfile
- PythonTools.zip
- philips-pathology-\*py38\*.zip
