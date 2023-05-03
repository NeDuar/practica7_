function [x] = grabaraudio(t, fs)
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
end

