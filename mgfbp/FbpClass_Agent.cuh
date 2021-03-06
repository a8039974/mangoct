#pragma once

#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
#include <string>
#include <vector>

#include "FbpClass.cuh"

// free memory
void FreeMemory_Agent(float* &p);

// Initialize u, the array of each detector element coordiante
// u: array of detector elements
// N: number of detector elements
// du: detector element size [mm]
// offcenter: detector off-center [mm]
void InitializeU_Agent(float* &u, const int N, const float du, const float offcenter);

// Initialize beta, the array of each view angle
// beta: array of view angles [radius]
// V: number of views
// rotation: rotate the reconstructed image [degree]
// totalScanAngle: total scan angle for short scan [degree]
void InitializeBeta_Agent(float* &beta, const int V, const float rotation, const float totalScanAngle);

// Initialize reconstruction kernel
// reconKernel: array of reconstruction kernel
// N: number of detector elements
// du: detector element size
void InitializeReconKernel_Agent(float* &reconKernel, const int N, const float du, const std::string& kernelName, const std::vector<float>& kernelParam);

// Malloc the memory as a given size
void MallocManaged_Agent(float* &p, const int size);

// Perform beam hardening correction
void CorrectBeamHardening_Agent(float* sgm, mango::Config & config);

// Filter the sinogram data
void FilterSinogram_Agent(float* sgm, float* sgm_flt, float* reconKernel, float* u, mango::Config& config);

// Backproject the image using pixel-driven method
void BackprojectPixelDriven_Agent(float* sgm_flt, float* img, float* u, float* beta, mango::Config& config);
