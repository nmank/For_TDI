%Using the LGB clustering function to visualize two different bee images
%in only 6 colors

%Nate Mankovich
%1/30/2020

%hive being robbed bee imagee
hive_being_robbed = LGBClustering('./honey-bee-annotated-images/bee_imgs/bee_imgs/041_064.png',6)
%healthy bee image
healthy = LGBClustering('./honey-bee-annotated-images/bee_imgs/bee_imgs/017_044.png',6)

%saving these images to two different files labeled according to the health
%status of the bees
imwrite(hive_being_robbed, 'hive_being_robbed.jpg');
imwrite(healthy, 'healthy.jpg');