pn = 'C:\Sample Data\MerchData';
imds = imageDatastore(pn,'IncludeSubfolders',true,...
    'LabelSource','foldernames');
tbl = countEachLabel(imds);

[trainingSet, validationSet] = splitEachLabel(imds, 0.6, 'randomize');
bag = bagOfFeatures(trainingSet);
categoryClassifier = trainImageCategoryClassifier(trainingSet, bag);

img = readimage(validationSet, index);
[labelIdx, scores] = predict(categoryClassifier, img);