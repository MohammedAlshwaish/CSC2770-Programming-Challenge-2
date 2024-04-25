CC = gcc
CFLAGS = -Wall -pthread

SRCS_Server = HTTP_Server.c
SRCS_Client = HTTP_Client.c

OBJS_Server = $(SRCS_Server:.c=.o)
OBJS_Client = $(SRCS_Client:.c=.o)

TARGET_Server = HTTP_Server
TARGET_Client = HTTP_Client

all: $(TARGET_Server) $(TARGET_Client)

$(TARGET_Server): $(OBJS_Server)
	$(CC) $(CFLAGS) $(OBJS_Server) -o $(TARGET_Server)

$(TARGET_Client): $(OBJS_Client)
	$(CC) $(CFLAGS) $(OBJS_Client) -o $(TARGET_Client)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS_Server) $(TARGET_Server) $(OBJS_Client) $(TARGET_Client)
