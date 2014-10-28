using System;
using System.Threading;
using NetMQ;
using NetMQ.zmq;

namespace ServerReceiver
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var context = NetMQContext.Create())
            {
                using (NetMQSocket replyer = context.CreateSocket(ZmqSocketType.Rep))
                {
                    const int port = 5555;
                    replyer.Bind("tcp://*:" + port);

                    const string replyMessage = "World";

                    Console.WriteLine("Waiting for requests on port " + port);

                    while (true)
                    {
                        var message = replyer.ReceiveString(); // Encoding.Unicode
                        Console.WriteLine("Received request: {0}", message);

                        // Simulate work, by sleeping
                        Thread.Sleep(1000);

                        // Send reply back to client
                        replyer.Send(replyMessage); // , Encoding.Unicode
                    }
                }
            }
        }
    }
}
