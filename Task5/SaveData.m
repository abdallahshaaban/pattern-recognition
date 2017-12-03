function SaveData( Features , IDs , Classes , OldFeatures)
FinalTable = [IDs OldFeatures Features Classes];
csvwrite('Features.csv',FinalTable);
end

