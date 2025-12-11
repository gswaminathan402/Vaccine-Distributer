function [distribution] = P2_1(patients, stock)
[~,cols] = size(patients);
distribution = zeros(1,cols);
for y = 1:1:cols
    if  patients(1,y) == 1 && (patients(2,y) == 0 || ...
            patients(2,y) == 1) && (patients(3,y) > 21 || ...
            patients(3,y) == -1)
        distribution(y) = 1;
    end
end
Eligible = find(distribution == 1);
numE = length(Eligible);
extras = stock - numE;
while extras > 0
    for j = 1:1:cols
        if patients(1,j) == 2 && patients(2,j) == 0 && (patients(3,j) > 21 || patients(3,j) == -1) && extras > 0
            distribution(j) = 1;
            extras = extras - 1;
        end
    end
    for j = 1:1:cols
        if patients(1,j) == 2 && patients(2,j) == 1 && (patients(3,j) > 21 || patients(3,j) == -1) && extras > 0
            distribution(j) = 1;
            extras = extras - 1;
        end
    end
    for j = 1:1:cols
        if patients(1,j) == 3 && patients(2,j) == 0 && (patients(3,j) > 21 || patients(3,j) == -1) && extras > 0
            distribution(j) = 1;
            extras = extras - 1;
        end
    end
    for j = 1:1:cols
        if patients(1,j) == 3 && patients(2,j) == 1 && (patients(3,j) > 21 || patients(3,j) == -1) && extras > 0
            distribution(j) = 1;
            extras = extras - 1;
        end
    end
    for j = 1:1:cols
        if patients(1,j) == 4 && patients(2,j) == 0 && (patients(3,j) > 21 || patients(3,j) == -1) && extras > 0
            distribution(j) = 1;
            extras = extras - 1;
        end
    end
    for j = 1:1:cols
        if patients(1,j) == 4 && patients(2,j) == 1 && (patients(3,j) > 21 || patients(3,j) == -1) && extras > 0
            distribution(j) = 1;
            extras = extras - 1;
        end
    end
    for j = 1:1:cols
        if patients(1,j) == 5 && patients(2,j) == 0 && (patients(3,j) > 21 || patients(3,j) == -1) && extras > 0
            distribution(j) = 1;
            extras = extras - 1;
        end
    end
    for j = 1:1:cols
        if patients(1,j) == 5 && patients(2,j) == 1 && (patients(3,j) > 21 || patients(3,j) == -1) && extras > 0
            distribution(j) = 1;
            extras = extras - 1;
        end
    end
end

% Test Case: patients = [1 3 5 2 4 3 3 1 5 4; 2 1 0 2 2 1 1 0 2 2;18 21 30
% 15 2 36 -1 22 32 11], stock = 2
%Tests giving the final dose to the first person if the last two eligible
%are in the same phase and have the same number of previous doses