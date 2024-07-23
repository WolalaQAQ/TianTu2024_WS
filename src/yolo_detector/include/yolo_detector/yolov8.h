#pragma once
#include <iostream>
#include <opencv2/opencv.hpp>
#include "yolo_detector/yolov8_utils.h"

class Yolov8 {
public:
  Yolov8() = default;
  ~Yolov8() = default;

  bool ReadModel(std::string &netPath, bool isCuda);
  bool Detect(const cv::Mat &srcImg, std::vector<OutputParams> &output);
  void DrawResult(cv::Mat &srcImg, const std::vector<OutputParams> &output, bool putLabel);

private:
  float _classThreshold = 0.50;
  float _nmsThreshold = 0.40;

  int _netWidth = 640;   //ONNX图片输入宽度
  int _netHeight = 640;  //ONNX图片输入高度

  cv::dnn::Net _net;

  //类别名，自己的模型需要修改此项
  const std::vector<std::string> _className = {
	  "bad",
	  "output_params",
	  "good",
  };

  const std::vector<cv::Scalar> _colors = {
	  cv::Scalar(0, 0, 255),
	  cv::Scalar(0, 255, 0),
	  cv::Scalar(255, 0, 0),
  };

};
