function Result = GlcmEnergy( Mat)

res = Mat .* Mat;
Result = sum(sum(res));

end