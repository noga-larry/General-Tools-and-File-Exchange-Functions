function inx = findRegexpInCell(cell_array,expression)

inx = find(cell2mat(cellfun(@(x) ~isempty(regexp(x,expression,'Once')),...
    cell_array,'UniformOutput',false)));
