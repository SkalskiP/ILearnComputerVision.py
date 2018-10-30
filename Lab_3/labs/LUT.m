function LUT (image, encode)
    %Original image
    subplot(2,2,3);
    imshow(image);
    title('Original');
    
    %Encode plot
    subplot(2,2,1:2); 
    plot(encode); 
    title('Encode')
    
    %Encoded image
    subplot(2,2,4); 
    imshow(intlut(image,encode)); 
    title('Encoded image');
end