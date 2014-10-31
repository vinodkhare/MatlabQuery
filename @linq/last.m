%     $ Copyright (C) 2014 Brian Lau http://www.subcortex.net/ $
%     Released under the BSD license. The license and most recent version
%     of the code can be found on GitHub:
%     https://github.com/brian-lau/MatlabQuery

function output = last(self,func)

if nargin == 1
   output = lastOrDefault(self);
else
   output = lastOrDefault(self,func);
end

if isempty(output)
   error('linq:last:Invalid','No matching element');
end
