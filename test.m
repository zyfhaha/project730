clc;clear;
loaddata_spam;

svmmodel=fitcsvm(X,Y,'KernelFunction','gaussian');
plabel=predict(svmmodel,X);
el=[];
k=0;
for i=1:length(plabel)
    if plabel(i)~=Y(i)
        k=k+1;
        el(k)=i;
    end
end
error_rate=length(el)/length(plabel)

svmmodelfs=fitcsvm(Xfs,Y,'KernelFunction','gaussian');
plabelfs=predict(svmmodelfs,Xfs);
elfs=[];
k=0;
for i=1:length(plabelfs)
    if plabelfs(i)~=Y(i)
        k=k+1;
        elfs(k)=i;
    end
end
error_rate_fs=length(elfs)/length(plabelfs)