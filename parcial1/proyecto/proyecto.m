clear, clc

% Patrón de entrada 1 (número romano)
x0 = [1 -1 -1 -1 -1 -1 -1 -1 -1 -1]; % I

% Patrón de entrada 2 (número romano)
x1 = [1 1 -1 -1 -1 -1 -1 1 1 1]; % X

% Patrón de entrada 3 (número romano)
x2 = [-1 -1 -1 -1 -1 -1 1 1 1 -1]; % V

% Patrón de entrada 4 (número romano)
x3 = [1 -1 -1 -1 -1 -1 1 -1 -1 -1]; % M

% Patrón de entrada 5 (número romano)
x4 = [1 -1 -1 -1 -1 -1 -1 1 1 1]; % C

x0mul = x0(:) * x0(:)';
x1mul = x1(:) * x1(:)';
x2mul = x2(:) * x2(:)';
x3mul = x3(:) * x3(:)';
x4mul = x4(:) * x4(:)';

w1 = x0mul + x1mul + x2mul + x3mul + x4mul;
w = w1 - diag(diag(w1));

% Valor a encontrar (número romano)
x = [1 1 -1 -1 -1 -1 -1 1 1 1]; % X

u0 = x;
c = 1;

ulast = x;

while (1)
  u0 = u0 * w;
  
  for i = 1:1:10
    if u0(i) > 0
      u0(i) = 1;
    else
      u0(i) = -1;
    endif
  endfor

  if (u0 == ulast)
    fprintf('Número romano encontrado.\n');
    u0
    ulast
    c
    break;
  endif

  c = c + 1;
  ulast = u0;
end
