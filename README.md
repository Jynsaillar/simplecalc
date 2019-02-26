# simplecalc
Simple program for doing very basic calculations. Written in Fortran95.

## TL;DR:
### On Windows:
* Download `GFortran` and install the version appropriate for your system: [GFortran binaries](https://gcc.gnu.org/wiki/GFortranBinaries) | [GFortran from source](https://gcc.gnu.org/wiki/Guide%20to%20Building%20gcc/gfortran)
* Clone repository: `git clone https://github.com/Jynsaillar/simplecalc.git`
* Compile the program from command line:  
* `gfortran -std=f95 simplecalc.f95 -o simplecalc.exe`  
for linking on a system that has the GFortran libraries installed  
**or**  
* `gfortran -static -std=f95 simplecalc.f95 -o simplecalc.exe`  
for static linking.

More information regarding compilation can be found in the [Getting Started](https://gcc.gnu.org/wiki/GFortranGettingStarted) section of GFortran.
