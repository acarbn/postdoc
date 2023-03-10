function [MSFind,MSFavg,resnum]=GNM(fname1,mode_set,chain)

rcut_gnm=7;
% gamma constant
ga=1;
try
prot=pdbread(fname1);
catch
prot=getpdb(fname1);  
end

atomnum=size(prot.Model.Atom,2);
count=0;
for i=1:atomnum
	if contains(prot.Model.Atom(i).AtomName,'CA')==1 && contains(chain,prot.Model.Atom(i).chainID)==1
        if isempty(prot.Model(1).Atom(i).altLoc) || ...
                        strcmpi(prot.Model(1).Atom(i).altLoc,'A')
	count=count+1;
	x(count)=prot.Model.Atom(i).X;
	y(count)=prot.Model.Atom(i).Y;
	z(count)=prot.Model.Atom(i).Z;
        end
	end
end

resnum=length(x);
% if mode_beg<0 && mode_max<0
%     mode_beg=resnum+mode_beg;
%     mode_max=resnum+mode_max;
% end


for j=1:resnum
	for k=1:resnum
         distx = x(j)-x(k);
         disty = y(j)-y(k);
         distz = z(j)-z(k);

         r=sqrt(distx^2+disty^2+distz^2);               
                % Kirchhoff
                if (r <= rcut_gnm && j~=k && r > 0.0001)
                    cont(j,k)=-1;
                else
                    cont(j,k)=0;                                
                end
                
	end
end

        % detailed balance for connectivity matrix
        diagonal=sum(cont(:,:));
        
        for j=1:resnum
            for i=1:resnum
                if i == j
                    cont(i,j)=-1*diagonal(i); % Kirchhoff
                end
            end
        end
    
        [U(:,:),S(:,:),V(:,:)]=svd(cont(:,:));
        w=diag(S(:,:));        
        
invcont=zeros(resnum,resnum,max(mode_set));
invcontav=zeros(resnum,resnum);

for k=resnum-mode_set
%for kk=[resnum-mode_max resnum-mode_beg] 
    for j=1:resnum
        for i=1:resnum
            invcont(i,j,resnum-k)=invcont(i,j,resnum-k)+U(i,k)*U(j,k)/w(k);
            invcontav(i,j)=invcontav(i,j)+U(i,k)*U(j,k)/w(k);
        end
    end
    MSF(resnum-k,:)=diag(invcont(:,:,resnum-k));
    MSFind(resnum-k,:)=MSF(resnum-k,:)./trapz(MSF(resnum-k,:)); 
end
MSFavg=diag(invcontav)/trapz(diag(invcontav));
w
figure(365)
plot(resnum-1:-1:0,w,'LineWidth',3,'Color','k')
grid on
axis square
set(gca,'FontSize',24)
xlabel('Mode Number')
ylabel('Eigenvalue')
end


