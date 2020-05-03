%Dealing with data
data=load('house_prices.csv');
x1=data(:,1);
x2=data(:,2);
y=data(:,3);

m=length(y);
x1_new=zeros(m,1);
x2_new=zeros(m,1);
x=zeros(m,3);

% Mean normalization of features x1 and x2

% For x1
 mi=min(x1);
 mx=max(x1);
 me=mean(x1);
 r=mx-mi;
 for i=1:m
     dif=x1(i)-me;
     x1_new(i)=dif/r;
 end
 
 % For x2
 mi=min(x2);
 mx=max(x2);
 me=mean(x2);
 r=mx-mi;
 for i=1:m
     dif=x2(i)-me;
     x2_new(i)=dif/r;
 end
 
 %ploting the training set
 subplot(2,2,1);
 c=[1,0,0];
 scatter3(x1_new,x2_new,y,20,c);
 title('Training Set');
 xlabel('Normalized Size');
 ylabel('Normalized #Rooms');
 zlabel('Price');
 
 %Initializing some variables
 it=3000;
 alp=0.001;
 x=[ones(m,1),x1_new,x2_new];
 theta=zeros(3,1);
 h=x*theta;
 t1=0;t2=0;t3=0;
 j=zeros(it,1);
 
 %Dealing with gradient descent and cost function
 for i=1:it
     t1=theta(1)-alp*(1/m)*sum(h-y);
     t2=theta(2)-(alp*(1/m)*sum((h-y).*x1_new));
     t3=theta(3)-(alp*(1/m)*sum((h-y).*x2_new));
     theta(1)=t1;
     theta(2)=t2;
     theta(3)=t3;
     h=x*theta;
     j(i)=(1/2*m)*sum((h-y).^2);
 end
  
 
 % Ploting cost function Vs Number of Iterations
 subplot(2,2,4);
 plot(1:it,j);
 title('Check proper working of cost function');
 xlabel('# Iterations ---->');
 ylabel('Cost Function J ----->');
 

 %Ploting The Output variables
subplot(2, 2, 3);
scatter3(x1_new, x2_new,h,[],y(:));
title('Output Of Training Set');
xlabel('Normalized Size');
ylabel('Normalized #Rooms');
zlabel('Price');
 

 %Ploting output in the form of plane
x1_range=linspace(min(x1_new),max(x1_new),50);
x2_range=linspace(min(x2_new),max(x2_new),50);
y_range=zeros(length(x1_range),length(x2_range));

for i =1:length(x1_range)
    for j =1:length(x2_range)
        y_range(i,j)=theta(1)+theta(2)*x1_range(i)+theta(3)*x2_range(j);
    end
end
subplot(2, 2, 2);
mesh(x1_range,x2_range,y_range);
xlabel('Normalized Size')
ylabel('Normalized #Rooms')
zlabel('Price')
title('Output Plane')


