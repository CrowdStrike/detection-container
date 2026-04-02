/*
 * CrowdStrike Detection Container - Inert Trojan Sample
 *
 * This is a test binary that attempts to connect to 192.168.0.1:444
 * for testing CrowdStrike Falcon's on-sensor machine learning detection.
 *
 * THIS IS A TEST TOOL ONLY - Not actual malware
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define TARGET_IP "192.168.0.1"
#define TARGET_PORT 444

int main(void) {
    int sockfd;
    struct sockaddr_in server_addr;

    // Create socket
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0) {
        perror("socket");
        return 1;
    }

    // Setup server address structure
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(TARGET_PORT);

    // Convert IP address
    if (inet_pton(AF_INET, TARGET_IP, &server_addr.sin_addr) <= 0) {
        perror("inet_pton");
        close(sockfd);
        return 1;
    }

    // Attempt connection (this should be detected and blocked by Falcon)
    if (connect(sockfd, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
        // Expected to fail - either blocked by Falcon or no route to host
        close(sockfd);
        return 1;
    }

    // If we somehow get here, close and exit
    close(sockfd);
    return 0;
}
