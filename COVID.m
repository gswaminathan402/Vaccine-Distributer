function [distribution,PhaseCut,DosesCut] = COVID(people, numVaccine)

[~,cols] = size(people);
distribution = ones(1,cols);
Eligibility = people(1,:);
NumDoses = people(2,:);

%Cut out anyone who is already ineligible
for j = 1:1:cols
    if people(2,j) == 2
        distribution(1,j) = 0;
    elseif people(3,j) <= 21 && people(3,j) ~= -1
        distribution(1,j) = 0;
    end
end

numOnes = find(distribution == 1);
numCuts = length(numOnes) - numVaccine;

if numCuts > 0
    PhaseCut = find(Eligibility == 5);
    DosesCut = find(NumDoses == 1);

    numPhaseCut = length(PhaseCut);
    numDosesCut = length(DosesCut);

%{
    if (numPhaseCut) > (numDosesCut)
        addition = numPhaseCut - numDosesCut;
        array = ones(1,addition) * DosesCut(1);
        DosesCut= [DosesCut,array];
    elseif (numPhaseCut) < (numDosesCut)
        addition = numDosesCut - numPhaseCut;
        array = ones(1,addition) * PhaseCut(1);
        PhaseCut = [PhaseCut,array];
    end
%}
    count = 1;
    while count <= numDosesCut
        for x = 1:1:numPhaseCut
            if PhaseCut(x) == DosesCut(count)
                DosesCut(count) = [];
            end
        end
        count = count + 1;
    end

    remove = [PhaseCut,DosesCut];
    index = 1; 

    while numCuts > 0
        distribution(remove(index)) = 0;
        index = index + 1;
        numCuts = numCuts - 1;
    end
end