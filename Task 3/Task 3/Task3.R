#install package
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("EBImage")

#set lokasi kerja
setwd("D:/RStudio/Task 2/Task 3/")
#panggil package
library(EBImage)

# Reading Image
Image <- readImage('foto.jpeg')
display(Image)
print(Image)

# Brightness
Image1 <- Image + 0.2
Image2 <- Image - 0.2
par(mfrow= c(1,2))
plot(Image1)
plot(Image2)

#Adjusting Contrast
Image3 <- Image * 0.5
Image4 <- Image * 2
par(mfrow= c(1,2))
plot(Image3)
plot(Image4)

#Gamma Correction
Image5 <- Image ^ 2
Image6 <- Image ^ 0.7
par(mfrow= c(1,2))
plot(Image5)
plot(Image6)

#cropping
display(Image[189:500, 100:600,])

#Spatial Transformation
Imagetr <- translate(rotate(Image, 45), c(50, 0))
display(Imagetr)

#Color Management
colorMode(Image) <- Grayscale
display(Image)
print(Image)
colorMode(Image) <- Color
display(Image)

#filtering
fLow <- makeBrush(21, shape= 'disc', step=FALSE)^2
fLow <- fLow/sum(fLow)
Image.fLow <- filter2(Image, fLow)
display(Image.fLow)

fHigh <- matrix(1, nc = 3, nr = 3)
fHigh[2, 2] <- -8
Image.fHigh <- filter2(Image, fHigh)
display(Image.fHigh)

aa<- medianFilter(Image.fHigh,1.1)
par(mfrow= c(1,2))
plot(aa)
plot(Image.fHigh)
Image <- readImage("foto.jpeg")
medFltr <- medianFilter(Image, 1.1)
display(medFltr)
