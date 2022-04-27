function p_vec = permVec(vec)

p = randperm(length(vec));
p_vec = vec(p);