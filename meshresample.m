function [node,elem]=meshresample(v,f,elemnum)
% meshresample: resample mesh using CGAL mesh simplification code
% by FangQ, 2007/11/21

exesuff='.exe';
if(isunix) exesuff=['.',mexext]; end

%savesmf(v,f,'origmesh.dat')
saveoff(v,f,'origmesh.off');
delete newmesh.dat;
eval(['! cgalsimp2',exesuff,' origmesh.off ', num2str(elemnum), ' newmesh.dat']);
[node,elem]=readoff('newmesh.dat');
[node,I,J]=unique(node,'rows');
elem=J(elem);
saveoff(node,elem,'newmesh.dat');