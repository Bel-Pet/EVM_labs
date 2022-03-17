#include <iostream>
#include <opencv4/opencv2/opencv.hpp>

constexpr auto TIMEOUT = 10;
constexpr auto ESC_KEY_CODE = 27;
constexpr auto WINDOW_TITLE = "OpenCV";

int main() {
    cv::VideoCapture cap;
    // Open camera stream
    cap.open(0);
    if (!cap.isOpened()) {
        std::cout << "could not open the VideoCapture!" << std::endl;
        return -1;
    }

    while (true) {
        cv::Mat frame;
        // Read image from camera
        if (!cap.read(frame))
            break;

        // Remove red and blue channel
        for (int x = 0; x < frame.rows; ++x) {
            for (int y = 0; y < frame.cols; ++y) {
                frame.at<cv::Vec3b>(x, y)[0] = 0;
                frame.at<cv::Vec3b>(x, y)[2] = 0;
            }
        }

        // Display image
        imshow(WINDOW_TITLE, frame);

        // Wait for ESC
        if (cv::waitKey(TIMEOUT) == ESC_KEY_CODE)
            break;
    }

    return 0;
}