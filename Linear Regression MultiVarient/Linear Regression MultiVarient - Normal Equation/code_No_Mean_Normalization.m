%Dealing with data
data=load('house_prices.csv');
x1=data(:,1);
x2=data(:,2);
y=data(:,3);

m=length(y);
x=zeros(m,3);


 
 %ploting the training set
 subplot(2,2,1);
 c=[1,0,0];
 scatter3(x1,x2,y,20,c);
 title('Training Set');
 xlabel('Normalized Size');
 ylabel('Normalized #Rooms');
 zlabel('Price');
 
 %Initializing some variables
 x=[ones(m,1),x1,x2];
 theta=zeros(3,1);
 h=x*theta;
 
 %Normal Equation
 theta=(inv(x'*x))*x'*y;
  
 h=x*theta;
 

%Ploting The Output variables
subplot(2, 2, 3);
scatter3(x1, x2,h,[],y(:));
title('Output Of Training Set');
xlabel('Normalized Size');
ylabel('Normalized #Rooms');
zlabel('Price');
 

%Ploting output in the form of plane
x1_range=linspace(min(x1),max(x1),50);
x2_range=linspace(min(x2),max(x2),50);
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


