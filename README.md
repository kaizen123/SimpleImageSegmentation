# SimpleImageSegmentation Repo

**This repo contains information on some simple image segmentation algorithms.**
I have selected 5 images from Berkeley Segmentation Dataset and applied 4 segmented algorithms to them.

 
## Introduction

Image segmentation means partitioning a digital image into some multiple parts.
The proposed segmentation approaches included color, regions and, contours segmentations.
Some major ways to segmentation is, Thresholding, Edge-Based Segmentation,
and Region-based segmentation.  First, five images of the US Berkeley dataset 
were used for this code and for the comparison I used the images provided
in the data set that includes the visual for the naked eye which was provided in the above dataset.

### K-Means

K-Means become one of the popular clustering algorithms. The idea of this 
algorithm is to collect same data into one cluster based on the distance. 
The closer the two points are, the closer they are to get the compact and 
independent clusters as clustering targets. The implementation of the K-means
 can show as follows. First, it randomly selects K initial clusters 
(K should be given by the user), Then it calculates the distance from each
 sample to each cluster center, and make clusters based on each sampling center,
 Then For each cluster, with the mean of all samples as the cluster of new 
clustering centers. And finally, repeat the above mentioned two steps until 
the cluster center no longer changes. The advantage of the K-means is fast 
and simple, but the disadvantage is we should select the clusters manually.

### Mean Shift

The disadvantage of the K-means is we should give the given clusters,
 but the mean shift algorithm is an algorithm that clusters data iteratively
 by finding the densest clusters in a feature space. 
So, mean shift algorithm falls under the unsupervised learning category. 
It assigns the data points to the clusters repeatedly by shifting points 
towards the mode. Because of that this is also called mode-seeking algorithm.
