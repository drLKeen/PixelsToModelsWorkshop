bookSet = fullfile(matlabroot, 'toolbox', 'vision', 'visiondata', 'bookCovers');
stopSignSet = fullfile(matlabroot, 'toolbox', 'vision', 'visiondata', 'stopSignImages');
bookDS = imageDatastore(bookSet, LabelSource = "foldernames");
stopDS = imageDatastore(stopSignSet, LabelSource = "foldernames");
bookFiles = bookDS.Files;
stopFiles = stopDS.Files;
bookLabels = bookDS.Labels;
stopLabels = stopDS.Labels;
%imds = combine(bookDS, stopDS)

imds = bookDS;
imds.Files = [bookFiles;stopFiles];
imds.Labels = [bookLabels; stopLabels]

%imds.Folders = [bookFolders;stopFolders];
%bookFolders = bookDS.Folders;
%stopFolders = stopDS.Folders;

bag = bagOfFeatures(imds) %FAILS