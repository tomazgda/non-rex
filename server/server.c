#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "wsServer/include/ws.h"

/* variable to store the unity socket connection */
ws_cli_conn_t * unity_client;

/* when a connection is made */
void onopen(ws_cli_conn_t *client)
{
    /* display address of client */
    char *cli;
    cli = ws_getaddress(client);
    printf("Connection opened, addr: %s\n", cli);
}

/* when a connection is closed */
void onclose(ws_cli_conn_t *client)
{
    /* display address of client */
    char *cli;
    cli = ws_getaddress(client);
    printf("Connection closed, addr: %s\n", cli);
}

/* each time a message is recieved */
void onmessage(ws_cli_conn_t *client, const unsigned char *msg, uint64_t size, int type)
{

    /* the unity client upon connecting sends the message "Unity",
       so to determine whether a new client is a unity client we
       check we have recievd that message
    */
    int cmp;
    cmp = strcmp("Unity", (char*)msg);

    /* if so, we fill in the socket data to our variable */
    if (cmp==0) {
	printf("we got a unity client\n");
	unity_client = client;
    }

    /* display the message to the server log */
    char *cli;
    cli = ws_getaddress(client);
    printf("I receive a message %s (size: %" PRId64", type: %d), from %s\n", msg, size, type, cli);

    /* forward all messages to the unity client */
    ws_sendframe(unity_client, (char*)msg, size, type);
}

int main(void)
{
    /* Register events. */
    struct ws_events evs;
    evs.onopen    = &onopen;
    evs.onclose   = &onclose;
    evs.onmessage = &onmessage;

    /* handles incomming connections and spawns threads accordingly */
    ws_socket(&evs, 9010, 0, 1000);

    /* main never returns */
    return (0);
}


