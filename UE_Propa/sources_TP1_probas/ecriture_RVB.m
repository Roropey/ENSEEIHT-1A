function image_RVB = ecriture_RVB(image_originale)


R=image_originale(1:2:end , 2:2:end);
B=image_originale(2:2:end , 1:2:end);
V1=image_originale(1:2:end , 1:2:end);
V2=image_originale(2:2:end , 2:2:end);
V=(V1+V2)*0.5;
image_RVB=cat(3,R,V,B);
end