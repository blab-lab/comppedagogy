1. for integer = 40:50
       square = integer^2;
       fprintf('The square of %d is %d\n',integer,square);
   end
 
2. oddNumbers = [1:2:1000]

3. ntrials = length(data);
 for trialIX = 1:ntrials
     trialFileName = [num2str(1) '.mat'];
     fprintf('The file name for trial %d will be %s\n',trialIX,trialFileName);
 end
 
4. for i = 1:length(goodEvilAvailable)
       charIx = goodEvilAssignment(i);
       officeCharacters(charIx).goodEvil = goodEvil{i};
   end

5. ntrials = length(words4trials);
   for i = 1:ntrials
       word = words4trials(i);
       fprintf('The word for trial %d is %s\n',i,word);
   end
