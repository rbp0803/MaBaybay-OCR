# MaBaybay: A Matlab-based Baybayin Optical Character Recognition Package

![Alt text](https://github.com/rbp0803/MaBaybay/blob/main/MaBaybayIconV3.png)

This work consolidates our Baybayin optical character recognition (OCR) systems, which comprise of three recognition levels: character, word, and block category.
 1. Character - this system primarily recognizes and discriminates Baybayin from the Latin alphabet at the character level. 
 2. Word - this system aims to transliterate Baybayin words into their equivalent Latin form. 
 3. Block - this system integrates prior OCR algorithms, which discriminates Baybayin from Latin texts and further transliterates Baybayin-detected texts to Latin. 


![Alt text](https://github.com/rbp0803/MaBaybay/blob/main/Framework.png)

## Environment
Software:
* MATLAB R2020a and later releases
* Statistics and Machine Learning Toolbox

## Usage
* /Algorithms folder contains essential code functions to implement the recognition program. Due to the upload maximum size (25 MB) restriction per file, the Baybayin characters and Latin letters classifiers are deposited in the Release section: https://github.com/rbp0803/MaBaybay/releases/tag/v1.0.   
* Upon acquisition of the complete package (please ensure that the classifiers are also in the same folder), simply run the `run_headless.m` file for a sample implementation.
* /Filipino Word Corpus folder contains an excel file that holds a list of 74,490 Filipino words (and some default phrases).
* /Sample images folder contains other sample images that the user can opt to try.

## References

For each system's detailed discussion, we refer the readers to the following:
 1. Pino R, Mendoza R, Sambayan R. 2021. Optical character recognition system for Baybayin scripts using support vector machine. PeerJ Comput. Sci. 7:e360 http://doi.org/10.7717/peerj-cs.360
 2. Pino R, Mendoza R, Sambayan R. 2021. A Baybayin word recognition system. PeerJ Comput. Sci. 7:e596 http://doi.org/10.7717/peerj-cs.596 
 3. Pino R, Mendoza R, Sambayan R. 2022. Block-level optical character recognition system for automatic transliterations of baybayin texts using support vector machine. Philipp. J. Sci. 151 (1), 303-315, https://doi.org/10.56899/151.01.23.

## Queries

Should you have any concerns, feel free to contact me: rbpino@up.edu.ph
