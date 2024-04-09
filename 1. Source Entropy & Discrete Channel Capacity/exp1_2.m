clear all;

im1=imread('airplane_768KB_512x512.bmp');
im2=imread('lena_768KB_512x512.bmp');
im3=imread('fruits_132KB_256x256.png');
im4=imread('fruits_461KB_512x512.png');

im_gray1=rgb2gray(im1);
im_gray2=rgb2gray(im2);
im_gray3=rgb2gray(im3);
im_gray4=rgb2gray(im4);

figure;subplot(2,2,1);imshow(im1);subplot(2,2,2);imshow(im_gray1);
subplot(2,2,3);imshow(im2);subplot(2,2,4);imshow(im_gray2);
figure;subplot(2,2,1);imshow(im3);subplot(2,2,2);imshow(im_gray3);
subplot(2,2,3);imshow(im4);subplot(2,2,4);imshow(im_gray4);

en1=en(im_gray1)
en2=en(im_gray2)
en3=en(im_gray3)
en4=en(im_gray4)

function entropi=en(im1)
  [C,L]=size(im1);
  im_size=C*L;
  G=256;
  H_x=0;
  nk=zeros(G,1);
for i=1:C
for j=1:L
    im_level=im1(i,j)+1;
    nk(im_level)=nk(im_level)+1;
end
end
for k=1:G
    Ps(k)=nk(k)/im_size;
if Ps(k)~=0;
   H_x=-Ps(k)*log2(Ps(k))+H_x;
end
end
entropi=H_x

figure;
plot(Ps)
xlabel("灰度等级");
ylabel("概率");
title('各阶灰度的概率分布')

end