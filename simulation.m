clear;clc;
number=8000;
p1=40;p=60;
v1=10*rand(p1,1);
v2=10*rand(p1,1);
v1(p1+1:p)=0;
v2(p1+1:p)=0;
sigma=1*ones(1,60);
data1= mvnrnd(v1,sigma,number);
data2= mvnrnd(v2,sigma,number);
X=[data1;data2];
class(1:number,1)=1;
class(number+1:number*2,1)=0;
Y=nominal(class);

X1=[];c1=[];
X2=[];c2=[];
X3=[];c3=[];
X4=[];c4=[];
X5=[];c5=[];
for i=1:number*2
    ra=rand(1,1);
    if ra<0.2
        X1=[X1;X(i,:)];
        c1=[c1;class(i,:)];
    end
    if ra>=0.2 && ra<0.4
        X2=[X2;X(i,:)];
        c2=[c2;class(i,:)];
    end
    if ra>=0.4 && ra<0.6
        X3=[X3;X(i,:)];
        c3=[c3;class(i,:)];
    end
    if ra>=0.6 && ra<0.8
        X4=[X4;X(i,:)];
        c4=[c4;class(i,:)];
    end
    if ra>=0.8 && ra<=1
        X5=[X5;X(i,:)];
        c5=[c5;class(i,:)];
    end
end

Xt=[X1;X2;X3;X4];
ct=[c1;c2;c3;c4];
svmmodel=fitcsvm(Xt,ct,'KernelFunction','gaussian');
plabel=predict(svmmodel,X5);
el=[];
k=0;
for i=1:length(plabel)
    if plabel(i)~=c5(i)
        k=k+1;
        el(k)=i;
    end
end
error_rate=length(el)/length(plabel)