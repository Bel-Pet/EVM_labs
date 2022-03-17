#include "opencv2/opencv.hpp"
#include <opencv2/imgproc.hpp>
using namespace cv;

#include <iostream>
using namespace std;

#include <ctime>

#define MSEC 33

int main()
{
    VideoCapture cap (0);
// VideoCapture - класс для захвата видео из видео файлов / последовательности изображений / камер
// Аргумент указывает на то, какое устройство открываем и при помощи какого API с ним взаимодействуем
// Вычисляется он следующим образом: ID устройства + ID API
// ID устройства = 0 значит используем устройство по умолчанию
// ID API = 0 значит используем API по умолчанию
    if (! cap.isOpened())               // Проверим, открылся ли поток
    {
        cerr << "Could not open the camera =(" << endl;
        return -1;
    }
    Mat frame;                                // Mat - класс n-мерных массивов
    int now_fps = -1;
    struct timespec t1, t2;
    clock_gettime (CLOCK_REALTIME, &t1);
    clock_gettime(CLOCK_REALTIME, &t2);
    long double frame_for_second = 0;

    while(true)
    {
        ++frame_for_second;
        cap.read(frame);                        // в массив frame записываем кадр считанный из потока cap
        if (frame.empty()) {                  // Проверяем, считался ли кадр
            break;
        }
        for (auto it  = frame.begin<int>(); it != frame.end<int>(); ++it) {
            //*it &= 0xFF0000FF; // Blue
            *it &= 0x0000FF00;   // Green
          // *it &= 0x00FF0000; // Red
        }


        putText(frame, "FPS: " + to_string(now_fps), Point(0, 460),  FONT_HERSHEY_SIMPLEX, 0.8,  Scalar(255, 255, 255));

        imshow("name window =)",frame);         // Выводим изображение на экран
        int k = waitKey(MSEC);             // Ждём 1000/MSEC миллисекунд нажатия клавиши и запоминаем её код
        if (k == 27) break;                                          // Если нажата esc, выходим из цикла
        
        clock_gettime (CLOCK_REALTIME, &t2);
        if (t2.tv_sec - t1.tv_sec > 1) {
            long double time = t2.tv_sec - t1.tv_sec;
            now_fps = frame_for_second / time;
            frame_for_second = 0;
            clock_gettime (CLOCK_REALTIME, &t1);
        }
    }
    return 0;
}
