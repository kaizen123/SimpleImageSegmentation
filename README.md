# Simple Image Segmentation Repo

**This repo contains information on some simple image segmentation algorithms.**
I have selected 5 images from Berkeley Segmentation Dataset and applied 4 segmented algorithms to them.

 
## Introduction

Image segmentation means partitioning a digital image into some multiple parts.
The proposed segmentation approaches included color, regions and, contours segmentations.
Some major ways to segmentation is, Thresholding, Edge-Based Segmentation,
and Region-based segmentation.  First, five images of the US Berkeley dataset 
were used for this code and for the comparison I used the images provided
in the data set that includes the visual for the naked eye which was provided in the above dataset.

## Comparison

I evaluated the results using **Recall, Precision and, 
F-Measure**. Those three are well-known algorithms for image comparison.
[For More About Algorithms](https://towardsdatascience.com/accuracy-precision-recall-or-f1-331fb37c5cb9)

## The Code

**Main.m** - *Contains the Basic code with necessary comments. This will procee the Images and
save the results in the Results folder*  
**Ms.m** - *Contains Mean shift Algorithm You can change the Image name and test*  
**Comparison.m** - *Contains the comparison between original image and the result images.
Each pixels compares here. Recall Presions and F-Measure output given by them*

