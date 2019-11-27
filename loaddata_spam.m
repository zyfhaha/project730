data=load('spambase.data');
class=data(:,58);
X=data(:,1:57);
for i=1:57
    meanX(i)=mean(X(:,i));
    stdX(i)=std(X(:,i));
end
covX=stdX./meanX;

fs=find(covX>3);
Xfs=X(:,fs);
Y=nominal(class);