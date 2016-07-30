% Carnot Efficiency

hotabst = input('Enter the absolute tempurature of the hot reservoir: ');
coldabst = input('Enter the absoulate tempurature of the cold reservoir: ');

carneff = 1 - (hotabst/coldabst);

if hotabst < coldabst
    temp = coldabst;
    coldabst = hotabst;
    hotabst = temp;
end
    

fprintf('The Carnot efficiency of this heat engine is %.3f \n',carneff);
