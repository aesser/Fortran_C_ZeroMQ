#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <zmq.h>
#include "zhelpers.h"


extern "C" {
	void dzmq_hello(void *ptr, char *string);
}

void dzmq_hello(void *ptr, char *string)
{
	void *context = zmq_ctx_new();

	//  Socket to talk to server
	void *requester = zmq_socket(context, ZMQ_REQ);
	zmq_connect(requester, "tcp://localhost:5555");

	int request_nbr;
	for (request_nbr = 0; request_nbr != 10; request_nbr++) {
		s_send(requester, string);
		char *string = s_recv(requester);
		printf("Received reply %d [%s]\n", request_nbr, string);
		free(string);
	}
	zmq_close(requester);
	zmq_ctx_destroy(context);
}