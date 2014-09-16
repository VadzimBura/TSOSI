function draw(xAxisValues, originalSignal,...
                discreteFourierTransform, dftCost, ...
                fastFourierTransform, fftCost,...
                inverseDicreteFourierTransform, idftCost, ...
                inverseFastFourierTransform, ifftCost)
    figure
    subplot(2, 2, 1),
    plot(xAxisValues, originalSignal);
    title('Original');
    grid on;
    
    subplot(2, 2, 2),
    plot(xAxisValues, abs(discreteFourierTransform));
    title(sprintf('DFT Magnitude, Computation Cost: %d', dftCost));
    grid on;
    
    subplot(2, 2, 3),
    plot(xAxisValues, angle(discreteFourierTransform));
    title(sprintf('DFT Phase, Computation Cost: %d', dftCost));
    grid on;
    
    subplot(2, 2, 4),
    plot(xAxisValues, real(inverseDicreteFourierTransform));
    title(sprintf('Inverse DFT, Computation Cost: %d', idftCost));
    grid on;
    
    
    
    figure
    subplot(2, 2, 1),
    plot(xAxisValues, originalSignal);
    title('Original');
    grid on;
    
    subplot(2, 2, 2),
    plot(xAxisValues, abs(fastFourierTransform));
    title(sprintf('FFT Magnitude, Computation Cost: %d', fftCost));
    grid on;
    
    subplot(2, 2, 3),
    plot(xAxisValues, angle(fastFourierTransform));
    title(sprintf('FFT Phase, Computation Cost: %d', fftCost));
    grid on;
    
    subplot(2, 2, 4),
    plot(xAxisValues, real(inverseFastFourierTransform));
    title(sprintf('Inverse FFT, Computation Cost: %d', ifftCost));
    grid on;
    
end

