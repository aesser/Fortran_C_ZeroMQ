Fortran C ZeroMQ
================

This is a small proof-of-concept project on how to move data from an Intel Fortran based console application to a .Net assembly.

The CoreModule is the Fortran project. It uses the CoreModuleCommunicator library to communicate with a C# backend. ZeroMQ is the communication layer between those two:

                                                                                          
      +--------------+         +--------------------------+         +------------------+  
      |              |         |                          |         |                  |  
      |  CoreModule  | +-----> |  CoreModuleCommunicator  | +-----> |  ServerReceiver  |  
      |              |         |                          |         |                  |  
      +--------------+         +--------------------------+         +------------------+  
                                                                                          
       Fortran                  C                         using      C#                   
                                                         ZeroMQ                           
                                                                                          
Technologies used for this sample code are:
- Microsoft Visual Studio 2013
- Intel Fortran Compiler
- ZeroMQ 4.0.4

The code is mostly based on other sample code (e.g. ZeroMQ) and is nothing that is production ready!

You might need to copy the two libzmq-___.dll files into the CoreModule Debug folder.
