#include <iostream>
#include <opencv4/opencv2/opencv.hpp>
#include <time.h>

using namespace cv;
using namespace std;
double delay = 0;

int main() {
    VideoCapture cap(0);

    Mat img;
    time_t startTime, curTime;
    //cap.set(cv::CAP_PROP_FPS, 30);
    time(&startTime);
    int numFrames = 0;
    double timeDiff = 0.0;
    double currentFPS = 0.0;
    double timeRead = 0.0;
    double timeConv = 0.0;
    double timeShow = 0.0;
    int frames = 0;

    while (true) {
        frames++;
        long double start = (double)getTickCount();
        
        timeRead = (double)getTickCount();
        cap.read(img);
        timeRead = ((double)getTickCount() - timeRead) / getTickFrequency();
        //cout << "Time spent for reading: " << t << endl;

        timeConv = (double)getTickCount();
        GaussianBlur(img, img, Size(9, 9), 10);
        timeConv = ((double)getTickCount() - timeConv) / getTickFrequency();
        //cout << "Time spent for converting: " << t << endl;

        timeShow = (double)getTickCount();
        imshow("Image", img);
        timeShow = ((double)getTickCount() - timeShow) / getTickFrequency();
        //cout << "Time spent for showing: " << t << endl;

        long double end = (double)getTickCount();
        delay = delay + (end - start) / 10000000;
        //std::cerr << delay << std::endl;
        if (delay > 1) {
            std::cerr << "FPS: " << frames / delay << std::endl;
            delay = 0;
            frames = 0;
            cout << "Time spent for reading: " << timeRead << endl;
            cout << "Time spent for converting: " << timeConv << endl;
            cout << "Time spent for showing: " << timeShow << endl;
        }

        if (waitKey(1) == 'm')
            break;
    }

    return 0;
}