# Problem
Analytical and preparative chromatography requires expensive instrumentation and a specialized in-lab skillset to troubleshoot results and equipment. Chromatograms are a perfect dataset candidate to conduct statistical analysis or train machine learning algorithms on, because a well designed LC method is repeatable, provides a large and highly dimensional, quantitative data set, and can be used to measure complex solutions. However, in order to understand and predict the behavior of a sample, a large number of these chromatograms could prove difficult to acquire and become a rate-limiting step in an in silico modeling initiative.

## Chromatography
Without turning this README into too much of an ode, chromatography was my first love when I started working in process development. I've always enjoyed the theories of the techniques and the minute manipulations that can change the entire on-column chemical interactions, so this project was especially fun to think about!

Liquid chromatography (LC) is a method of separating components in a solution based on different characteristics, like hydrodynamic volume, hydrophobicity, surface charge, hydrogen bonding, or affinity to other molecules. Proteins, viruses, small molecules, nucleic acids, and even lipids can be separated using chromatography, and many of these techniques are transferrable across modalities.

In LC, the mobile-stationary phase interaction dictates your separation profile. Usually, a mobile phase is designed for optimum chemical interaction with your stationary phase (chromatographic resin) that you visualize on a chromatogram. The mobile phase is the solution that runs through your chromatography column at a certain flowrate to facilitate separation, and depending on the chemical reactions occuring, certain components will "stick" tighter to the column or "fall off" the column until a certain amount of time has passed.

# Solution
This code doesn't replace traditional LC, but it offers a simple alternative for analysis when equipment and/or methods aren't readily available.

This code creates a mock chromatogram using three parameters:
1. Sample run time (how many seconds will the mobile phase flow through the column for one sample?)
2. Sampling rate (how many points per second will be collected for each chromatogram?)
3. Peak information (what are the heights/widths of each peak, how many peaks exist, and where do these peaks fall on the chromatogram?)

Most LC softwares observe Gaussian distribution for peak shapes, so this code incorporated a Gaussian distribution into the peak information calculation. The resulting plot is a chromatogram that measures time in seconds as a function of intensity in AU (absorbance units). As an extra feature, lines 42 through 46 print out each point for easier processing.

## Considerations
This code assumes a three peak separation profile, but this could be modified to accomodate more complex separation methods with more peaks by modifying lines 5 through 9. This code also assumes a "perfect" separation situation, so this code doesn't account for fronting, tailing, shouldering, or splitting behaviors seen in certain methods or on fatigued columns.
