%Dealing with data
data=load('dat.txt');
x=data(:,1);
y=data(:,2);

%Ploting input data or training set
plot(x,y,'r*');
xlabel('input ---->');
ylabel('output ---->');

%Initializing the variables
m=length(y);
theta=zeros(2,1);
x=[ones(m,1),data(:,1)];
h=x*theta;
it=3800;
alp=0.00001;
t1=0;t2=0;
J=zeros(it,1);


%Dealing with gradient descent and cost function
for i = 1:it
    t1=theta(1)-(alp*(1/m)*sum(h-y));
    t2=theta(2)-(alp*(1/m)*sum((h-y).*x(:,2)));
    theta(1)=t1;
    theta(2)=t2;
    h=x*theta;
    J(i)=1/(2*m)*sum((h-y).^2);
    
    
end

%ploting the output
hold on;
plot(x(:,2),x*theta);
hold off;

