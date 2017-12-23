	I  = 'T1 - Cat Laptop.png';

	C = 'T1 - Cat Laptop .png' ;
	[N M] = size(C);
	C(1,M-2)='j';
	C(1,M-1)='p';
	C(1,M)='g';
	
    Im = imread(C);
    imshow(Im);