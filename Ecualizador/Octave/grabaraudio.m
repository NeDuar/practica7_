function [x, Ganancias] = grabaraudio(t, fs)
  % Función para grabar y reproducir un archivo de audio con nombre "grabacion.wav"
  % Devuelve el vector de señal grabada y su frecuencia de muestreo.
  % Almacena la señal grabada en la carpeta "grabaraudio".
  fs = 16000;
  n = 20;

  recorder = audiorecorder(fs, 16, 1); % Inicializar objeto grabador
  recordblocking(recorder, t); % Grabar señal
  x = getaudiodata(recorder); % Obtener datos grabados

  audiowrite('grabacion.wav', x, fs); % Guardar archivo

  [x, fs] = audioread('grabacion.wav'); % Leer archivo de audio

  play(recorder); % Reproducir señal grabada

  Ganancias = 20*(log10(max(abs(x))));
  Ganancias = linspace(0, 1, 10);
  for i = 1:length(Ganancias)
  % aplicar ganancia
  x_ganancia = x * Ganancias(i);

  % calcular ganancia
  Ganancia = 20*(log10(max(abs(x_ganancia))));
  endfor
  lx=length(x);

end

