# MaBaybay: A Matlab-based Baybayin Optical Character Recognition Package
This work aims to recognize Baybayin scripts from individual characters to a whole block of texts. The software offers a user-friendly graphical user interface (GUI) console with a simple design, allowing for easy use and interaction with the application.


![Alt text](https://github.com/rbp0803/MaBaybay/blob/main/MaBaybayIconV3.png)
![Alt text](https://github.com/rbp0803/MaBaybay/blob/main/MaBaybayOCR_console.jpg)


## Operating Environments and Dependencies
System:
* Windows 8 and later

Software:
* MATLAB versions R2020a-R2022b
* Statistics and Machine Learning Toolbox
* Image Processing Toolbox
* Computer Vision Toolbox
* OCR Language Data Files (Tagalog and Japanese)
* Parallel Computing Toolbox
  
_**Note:** The algorithms are only compatible with MATLAB versions R2020a to R2022b since the ocr built-in function from Mathworks was recently updated in version R2023a. The latest versions now have error recognition for Baybayin texts._

## Usage
* /Algorithms folder contains essential code functions to implement the recognition program. Due to the upload maximum size (25 MB) restriction per file, the Baybayin characters SVM classier and the Baybayin GUI executable file are deposited in the Release section: https://github.com/rbp0803/MaBaybay/releases/tag/v1.0.   
* Upon acquisition of the complete package (please ensure that the classifier are also in the same folder), simply run the `MaBaybayOCR_App.mlapp` file to access and explore the Baybayin GUI.
* /Filipino Word Corpus folder contains a csv file that holds a list of 74,400+ Filipino words. Words recorded from this file will be considered legitimate by the system.
* /Sample images folder contains 15 ample images that the user can opt to try. 

## References

For each system's detailed discussion, we refer the readers to the following:
 1. Pino R, Mendoza R, Sambayan R. 2021. Optical character recognition system for Baybayin scripts using support vector machine. PeerJ Comput. Sci. 7:e360 http://doi.org/10.7717/peerj-cs.360
 2. Pino R, Mendoza R, Sambayan R. 2021. A Baybayin word recognition system. PeerJ Comput. Sci. 7:e596 http://doi.org/10.7717/peerj-cs.596 
 3. Pino R, Mendoza R, Sambayan R. 2022. Block-level optical character recognition system for automatic transliterations of baybayin texts using support vector machine. Philipp. J. Sci. 151 (1), 303-315, https://doi.org/10.56899/151.01.23.

## Queries

Should you have any concerns, feel free to contact me: rbpino@up.edu.ph
