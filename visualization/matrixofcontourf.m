function varargout=matrixofcontourf(dreamPar,evalResults,varargin)

nRows = 100;
nCols = 100;

if nargin==2
    parListIncluded = repmat(true,size(dreamPar.parMap));
else
    parListIncluded = varargin{1};
end

parCols = dreamPar.parCols;
nOptPars = dreamPar.nOptPars;
nOptParsIncluded = sum(double(parListIncluded));
H=[];

for iPar2 = 1:nOptPars
    for iPar1 = 1:iPar2
        
        if parListIncluded(iPar1) && parListIncluded(iPar2)

            panelIx = panelindex(iPar1,iPar2,parListIncluded);
            subplot(nOptParsIncluded,nOptParsIncluded,panelIx);
            
            M = zeros(nRows,nCols);

            if iPar2>iPar1

                x = evalResults(:,parCols(iPar2));
                y = evalResults(:,parCols(iPar1));
                xBounds = linspace(dreamPar.rangeMin(iPar2),...
                    dreamPar.rangeMax(iPar2),nCols+1);
                yBounds = linspace(dreamPar.rangeMin(iPar1),...
                    dreamPar.rangeMax(iPar1),nRows+1);

                for r=1:nRows
                    for c=1:nCols
                        M(r,c) = sum(x>=xBounds(c)&x<xBounds(c+1)&...
                                     y>=yBounds(r)&y<yBounds(r+1));
                    end
                end
                
                contourf(M);
                set(gca,'xTick',xBounds([1,end]),...
                        'yTick',yBounds([1,end]),...
                        'ydir','normal')
                
                axis square
                if false;%iPar2>iPar1+1
                    set(gca,'xTickLabel',[],...
                            'yTickLabel',[])
                end
                
                if sum(M(:))~=sum(~isnan(evalResults(:,dreamPar.evalCol)))
                    error('The 2-dimensional histogram should sum to unity.')
                end

            elseif iPar1==iPar2

                h = text(0.5,0.5,dreamPar.parMap{iPar1},...
                    'horizontalalignment','right',...
                    'fontname','lucida console',...
                    'interpreter','none');
                axis off
                
            else

            end
            H = [H;h];
        end
    end    
end

if nargout==0
    varargout={};
elseif nargout==1
    varargout{1}=H;
end


function panelIx = panelindex(iPar1,iPar2,parListIncluded) 

L = sum(parListIncluded);
a = sum(double(parListIncluded(1:iPar1)));
b = sum(double(parListIncluded(1:iPar2)));
panelIx = (a-1)*L+b;
