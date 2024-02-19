# Docker-iSyntax2TIFF

This repository contains the Dockerfile and scripts necessary to build an environment for converting Philips' iSyntax files to TIFF format.

## Requirements
- **Philips' Pathology SDK 2.0_L1**
- Docker

## Installation

1. Download the [Philips' Pathology SDK](https://www.openpathology.philips.com/).
2. Extract the `PythonTools.zip` from the `SampleCodes` folder.
3. Extract the zip file belonging to Python libraries (look for `py38` in the name) from the `Ubuntu20.04` folder.
4. Clone this repository:
   ```
   git clone https://github.com/DBP008/Docker-iSyntax2TIFF.git
   ```
5. In the cloned repository's build folder, ensure you have the following files:
   - Dockerfile
   - convert_and_overview.sh
   - PythonTools.zip
   - philips-pathology-...py38....zip
6. Build the Docker environment:
   ```
   docker image build -t dp_isyntax2tiff .
   ```

## Usage

- Place all `.iSyntax` files in a folder (e.g., `isyntax_files`).
- Run the following command:
  ```
  docker run -v /isyntax_files:/root/dp -it dp_isyntax2tiff
  ```
- After execution, you'll find the TIFF files, as well as macro and label JPEGs in the selected folder.
