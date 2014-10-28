Fortran C ZeroMQ
================

This is a small proof-of-concept project on how to move data from an Intel Fortran based console application to a .Net assembly.

The CoreModule is the Fortran project. It uses the CoreModuleCommunicator library to communicate with a C# backend. ZeroMQ is the communication layer between those two. 

You might need to copy the two libzmq-___.dll files into the CoreModule Debug folder.