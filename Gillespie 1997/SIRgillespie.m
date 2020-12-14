% Simulation of Gillespie SIR CODE2
function result = SIRgillespie (params, initial, max_dur)

% initial condition for simulation
state = initial;

% defines an empty structed array to receive the results
result.time = [];
result.S = [];
result.I = [];
result.R = [];

time = 0;
while (state.I > 0 && time < max_dur)
        
    % the Gillespie steps
    probs = probablity_vector(state, params);   %Produces new probabilities.
    tau = exprnd(1/sum(probs));    %Chooses how long until the next event occurs.
    which = process(probs); %Chooses which event will occur.
    time = time + tau;  %Calculates when the event occurs.
    
    % code to allow states to update
    switch which
        case 1
            state.S = state.S + 1;
        case 2
            state.S = state.S - 1;
        case 3
            state.I = state.I - 1;
        case 4
            state.R = state.R - 1;
        case 5
            state.S = state.S - 1;
            state.I = state.I +  1;
        case 6
            state.I = state.I - 1;
        case 7
            state.I = state.I - 1;
            state.R = state.R + 1;
    end
    
    % store results
    result.time = [result.time time];
    result.S = [result.S state.S];
    result.I = [result.I state.I];
    result.R = [result.R state.R];
end

function which = process (probs)
%Chooses a random event (case).
r = sum(probs)*rand;
which = 1;
s = probs(1);
while (r > s)
    which = which + 1;
    s = s + probs(which);
end

function p = probablity_vector(state, params)
% Calculates probabilities at a given state
p(1) = params.bd * (state.S + state.I + state.R);%Probability of a birth.
p(2) = params.bd * state.S;	%Probability of an unrelated death.
p(3) = params.bd * state.I;   	%
p(4) = params.bd * state.R;     %
p(5) = params.i * state.S * state.I;	%Probability of an infection
p(6) = params.di * state.I;	%Probility of a death by infection
p(7) = params.r * state.I;   %Probility of a recovery