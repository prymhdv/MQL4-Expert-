//+------------------------------------------------------------------+
//||   ||||||||||                 C_OS.mqh                          ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |0 errors, 0 warnings, 169-175 msec elapsed
//+------------------------------------------------------------------+
/*
DirectX 9: The DLL for DirectX 9 is typically called "d3d9.dll". This DLL provides the runtime implementation for DirectX 9 graphics functionality.
DirectX 10 and DirectX 11: For DirectX 10 and DirectX 11, the DLL is typically named "d3d11.dll". This DLL provides the runtime implementation for DirectX 10 and DirectX 11 graphics functionality.
DirectX 12: For DirectX 12, the DLL is named "d3d12.dll". This DLL provides the runtime implementation for DirectX 12 graphics functionality.
dumpbin /exports csp.dll
*/
//+------------------------------------------------------------------+
#import "d3d12.dll"
//int CreateNamedPipeW(string pipeName, int openMode, int pipeMode, int maxInstances, int outBufferSize, int inBufferSize, int defaultTimeOut, int security);
int portotype();
/*
D3D12CoreCreateLayeredDevice
D3D12CoreGetLayeredDeviceSize
D3D12CoreRegisterLayers
D3D12CreateDevice
D3D12CreateRootSignatureDeserializer
D3D12CreateVersionedRootSignatureDeserializer
D3D12DeviceRemovedExtendedData
D3D12EnableExperimentalFeatures
D3D12GetDebugInterface
D3D12GetInterface
D3D12PIXEventsReplaceBlock
D3D12PIXGetThreadInfo
D3D12PIXNotifyWakeFromFenceSignal
D3D12PIXReportCounter
D3D12SerializeRootSignature
D3D12SerializeVersionedRootSignature
*/
#import
#import "opengl32.dll"
//int CreateNamedPipeW(string pipeName, int openMode, int pipeMode, int maxInstances, int outBufferSize, int inBufferSize, int defaultTimeOut, int security);
int portotype();
/*
GlmfBeginGlsBlock
GlmfCloseMetaFile
GlmfEndGlsBlock
GlmfEndPlayback
GlmfInitPlayback
GlmfPlayGlsRecord
glAccum
glAlphaFunc
glAreTexturesResident
glArrayElement
glBegin
glBindTexture
glBitmap
glBlendFunc
glCallList
glCallLists
glClear
glClearAccum
glClearColor
glClearDepth
glClearIndex
glClearStencil
glClipPlane
glColor3b
glColor3bv
glColor3d
glColor3dv
glColor3f
glColor3fv
glColor3i
glColor3iv
glColor3s
glColor3sv
glColor3ub
glColor3ubv
glColor3ui
glColor3uiv
glColor3us
glColor3usv
glColor4b
glColor4bv
glColor4d
glColor4dv
glColor4f
glColor4fv
glColor4i
glColor4iv
glColor4s
glColor4sv
glColor4ub
glColor4ubv
glColor4ui
glColor4uiv
glColor4us
glColor4usv
glColorMask
glColorMaterial
glColorPointer
glCopyPixels
glCopyTexImage1D
glCopyTexImage2D
glCopyTexSubImage1D
glCopyTexSubImage2D
glCullFace
glDebugEntry
glDeleteLists
glDeleteTextures
glDepthFunc
glDepthMask
glDepthRange
glDisable
glDisableClientState
glDrawArrays
glDrawBuffer
glDrawElements
glDrawPixels
glEdgeFlag
glEdgeFlagPointer
glEdgeFlagv
glEnable
glEnableClientState
glEnd
glEndList
glEvalCoord1d
glEvalCoord1dv
glEvalCoord1f
glEvalCoord1fv
glEvalCoord2d
glEvalCoord2dv
glEvalCoord2f
glEvalCoord2fv
glEvalMesh1
glEvalMesh2
glEvalPoint1
glEvalPoint2
glFeedbackBuffer
glFinish
glFlush
glFogf
glFogfv
glFogi
glFogiv
glFrontFace
glFrustum
glGenLists
glGenTextures
glGetBooleanv
glGetClipPlane
glGetDoublev
glGetError
glGetFloatv
glGetIntegerv
glGetLightfv
glGetLightiv
glGetMapdv
glGetMapfv
glGetMapiv
glGetMaterialfv
glGetMaterialiv
glGetPixelMapfv
glGetPixelMapuiv
glGetPixelMapusv
glGetPointerv
glGetPolygonStipple
glGetString
glGetTexEnvfv
glGetTexEnviv
glGetTexGendv
glGetTexGenfv
glGetTexGeniv
glGetTexImage
glGetTexLevelParameterfv
glGetTexLevelParameteriv
glGetTexParameterfv
glGetTexParameteriv
glHint
glIndexMask
glIndexPointer
glIndexd
glIndexdv
glIndexf
glIndexfv
glIndexi
glIndexiv
glIndexs
glIndexsv
glIndexub
glIndexubv
glInitNames
glInterleavedArrays
glIsEnabled
glIsList
glIsTexture
glLightModelf
glLightModelfv
glLightModeli
glLightModeliv
glLightf
glLightfv
glLighti
glLightiv
glLineStipple
glLineWidth
glListBase
glLoadIdentity
glLoadMatrixd
glLoadMatrixf
glLoadName
glLogicOp
glMap1d
glMap1f
glMap2d
glMap2f
glMapGrid1d
glMapGrid1f
glMapGrid2d
glMapGrid2f
glMaterialf
glMaterialfv
glMateriali
glMaterialiv
glMatrixMode
glMultMatrixd
glMultMatrixf
glNewList
glNormal3b
glNormal3bv
glNormal3d
glNormal3dv
glNormal3f
glNormal3fv
glNormal3i
glNormal3iv
glNormal3s
glNormal3sv
glNormalPointer
glOrtho
glPassThrough
glPixelMapfv
glPixelMapuiv
glPixelMapusv
glPixelStoref
glPixelStorei
glPixelTransferf
glPixelTransferi
glPixelZoom
glPointSize
glPolygonMode
glPolygonOffset
glPolygonStipple
glPopAttrib
glPopClientAttrib
glPopMatrix
glPopName
glPrioritizeTextures
glPushAttrib
glPushClientAttrib
glPushMatrix
glPushName
glRasterPos2d
glRasterPos2dv
glRasterPos2f
glRasterPos2fv
glRasterPos2i
glRasterPos2iv
glRasterPos2s
glRasterPos2sv
glRasterPos3d
glRasterPos3dv
glRasterPos3f
glRasterPos3fv
glRasterPos3i
glRasterPos3iv
glRasterPos3s
glRasterPos3sv
glRasterPos4d
glRasterPos4dv
glRasterPos4f
glRasterPos4fv
glRasterPos4i
glRasterPos4iv
glRasterPos4s
glRasterPos4sv
glReadBuffer
glReadPixels
glRectd
glRectdv
glRectf
glRectfv
glRecti
glRectiv
glRects
glRectsv
glRenderMode
glRotated
glRotatef
glScaled
glScalef
glScissor
glSelectBuffer
glShadeModel
glStencilFunc
glStencilMask
glStencilOp
glTexCoord1d
glTexCoord1dv
glTexCoord1f
glTexCoord1fv
glTexCoord1i
glTexCoord1iv
glTexCoord1s
glTexCoord1sv
glTexCoord2d
glTexCoord2dv
glTexCoord2f
glTexCoord2fv
glTexCoord2i
glTexCoord2iv
glTexCoord2s
glTexCoord2sv
glTexCoord3d
glTexCoord3dv
glTexCoord3f
glTexCoord3fv
glTexCoord3i
glTexCoord3iv
glTexCoord3s
glTexCoord3sv
glTexCoord4d
glTexCoord4dv
glTexCoord4f
glTexCoord4fv
glTexCoord4i
glTexCoord4iv
glTexCoord4s
glTexCoord4sv
glTexCoordPointer
glTexEnvf
glTexEnvfv
glTexEnvi
glTexEnviv
glTexGend
glTexGendv
glTexGenf
glTexGenfv
glTexGeni
glTexGeniv
glTexImage1D
glTexImage2D
glTexParameterf
glTexParameterfv
glTexParameteri
glTexParameteriv
glTexSubImage1D
glTexSubImage2D
glTranslated
glTranslatef
glVertex2d
glVertex2dv
glVertex2f
glVertex2fv
glVertex2i
glVertex2iv
glVertex2s
glVertex2sv
glVertex3d
glVertex3dv
glVertex3f
glVertex3fv
glVertex3i
glVertex3iv
glVertex3s
glVertex3sv
glVertex4d
glVertex4dv
glVertex4f
glVertex4fv
glVertex4i
glVertex4iv
glVertex4s
glVertex4sv
glVertexPointer
glViewport
wglChoosePixelFormat
wglCopyContext
wglCreateContext
wglCreateLayerContext
wglDeleteContext
wglDescribeLayerPlane
wglDescribePixelFormat
wglGetCurrentContext
wglGetCurrentDC
wglGetDefaultProcAddress
wglGetLayerPaletteEntries
wglGetPixelFormat
wglGetProcAddress
wglMakeCurrent
wglRealizeLayerPalette
wglSetLayerPaletteEntries
wglSetPixelFormat
wglShareLists
wglSwapBuffers
wglSwapLayerBuffers
wglSwapMultipleBuffers
wglUseFontBitmapsA
wglUseFontBitmapsW
wglUseFontOutlinesA
wglUseFontOutlinesW

*/
#import

//FileVersion: 3.0.3.0
//#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\C_OS\Opencl\libopencl.h>
//#import "OpenCL.dll"
////int CreateNamedPipeW(string pipeName, int openMode, int pipeMode, int maxInstances, int outBufferSize, int inBufferSize, int defaultTimeOut, int security);
//int portotype();
//bool CLGetDeviceInfo(int, int, int, int);
//void clBuildProgram();
//void clCloneKernel();
//void clCompileProgram();
//void clCreateBuffer();
//void clCreateBufferWithProperties();
//void clCreateCommandQueue();
//void clCreateCommandQueueWithProperties();
//void clCreateContext();
//void clCreateContextFromType();
//void clCreateFromGLBuffer();
//void clCreateFromGLRenderbuffer();
//void clCreateFromGLTexture();
//void clCreateFromGLTexture2D();
//void clCreateFromGLTexture3D();
//void clCreateImage();
//void clCreateImage2D();
//void clCreateImage3D();
//void clCreateImageWithProperties();
//void clCreateKernel();
//void clCreateKernelsInProgram();
//void clCreatePipe();
//void clCreateProgramWithBinary();
//void clCreateProgramWithBuiltInKernels();
//void clCreateProgramWithIL();
//void clCreateProgramWithSource();
//void clCreateSampler();
//void clCreateSamplerWithProperties();
//void clCreateSubBuffer();
//void clCreateSubDevices();
//void clCreateUserEvent();
//void clEnqueueAcquireGLObjects();
//void clEnqueueBarrier();
//void clEnqueueBarrierWithWaitList();
//void clEnqueueCopyBuffer();
//void clEnqueueCopyBufferRect();
//void clEnqueueCopyBufferToImage();
//void clEnqueueCopyImage();
//void clEnqueueCopyImageToBuffer();
//void clEnqueueFillBuffer();
//void clEnqueueFillImage();
//void clEnqueueMapBuffer();
//void clEnqueueMapImage();
//void clEnqueueMarker();
//void clEnqueueMarkerWithWaitList();
//void clEnqueueMigrateMemObjects();
//void clEnqueueNDRangeKernel();
//void clEnqueueNativeKernel();
//void clEnqueueReadBuffer();
//void clEnqueueReadBufferRect();
//void clEnqueueReadImage();
//void clEnqueueReleaseGLObjects();
//void clEnqueueSVMFree();
//void clEnqueueSVMMap();
//void clEnqueueSVMMemFill();
//void clEnqueueSVMMemcpy();
//void clEnqueueSVMMigrateMem();
//void clEnqueueSVMUnmap();
//void clEnqueueTask();
//void clEnqueueUnmapMemObject();
//void clEnqueueWaitForEvents();
//void clEnqueueWriteBuffer();
//void clEnqueueWriteBufferRect();
//void clEnqueueWriteImage();
//void clFinish();
//void clFlush();
//void clGetCommandQueueInfo();
//void clGetContextInfo();
//void clGetDeviceAndHostTimer();
//void clGetDeviceIDs();
//void clGetDeviceInfo();
//void clGetEventInfo();
//void clGetEventProfilingInfo();
//void clGetExtensionFunctionAddress();
//void clGetExtensionFunctionAddressForPlatform();
//void clGetGLObjectInfo();
//void clGetGLTextureInfo();
//void clGetHostTimer();
//void clGetImageInfo();
//void clGetKernelArgInfo();
//void clGetKernelInfo();
//void clGetKernelSubGroupInfo();
//void clGetKernelWorkGroupInfo();
//void clGetMemObjectInfo();
//void clGetPipeInfo();
//void clGetPlatformIDs();
//void clGetPlatformInfo();
//void clGetProgramBuildInfo();
//void clGetProgramInfo();
//void clGetSamplerInfo();
//void clGetSupportedImageFormats();
//void clLinkProgram();
//void clReleaseCommandQueue();
//void clReleaseContext();
//void clReleaseDevice();
//void clReleaseEvent();
//void clReleaseKernel();
//void clReleaseMemObject();
//void clReleaseProgram();
//void clReleaseSampler();
//void clRetainCommandQueue();
//void clRetainContext();
//void clRetainDevice();
//void clRetainEvent();
//void clRetainKernel();
//void clRetainMemObject();
//void clRetainProgram();
//void clRetainSampler();
//void clSVMAlloc();
//void clSVMFree();
//void clSetCommandQueueProperty();
//void clSetContextDestructorCallback();
//void clSetDefaultDeviceCommandQueue();
//void clSetEventCallback();
//void clSetKernelArg();
//void clSetKernelArgSVMPointer();
//void clSetKernelExecInfo();
//void clSetMemObjectDestructorCallback();
//void clSetProgramReleaseCallback();
//void clSetProgramSpecializationConstant();
//void clSetUserEventStatus();
//void clUnloadCompiler();
//void clUnloadPlatformCompiler();
//void clWaitForEvents();
//#import
//+------------------------------------------------------------------+
int CLtest()
{         //if(!CLGetDeviceInfo(1, 1, 1, 1)) return(-1);//
          return(-1);//
}//
#import
#import "nvcuda.dll"
#import
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(LIBs)\mql4-lib\OpenCL\Definitions.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(LIBs)\mql4-lib\OpenCL\MQL5.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(LIBs)\mql4-lib\OpenCL\OpenCL.mqh>