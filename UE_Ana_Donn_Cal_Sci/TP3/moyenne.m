function moyenne_image = moyenne(image)

image = single(image);

un = ones(size(image,1),size(image,2));
maximum_denominateur = max(un,image(:,:,1)+image(:,:,2)+image(:,:,3));
rvb_normalise = image./maximum_denominateur;

r_moyenne = mean(rvb_normalise(:,:,1),'all');
v_moyenne = mean(rvb_normalise(:,:,2),'all');
b_moyenne = mean(rvb_normalise(:,:,3),'all');

moyenne_image = [r_moyenne v_moyenne];

end