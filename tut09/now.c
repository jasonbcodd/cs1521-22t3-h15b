//
// Created by Jason Codd on 10/11/2022.
//

#include <spawn.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <sys/wait.h>

extern char **environ;

void spawn_and_wait(char **args) {
    pid_t pid;
    int spawn_status = posix_spawn(&pid, args[0], NULL, NULL, args, environ);
    if (spawn_status != 0) {
        errno = spawn_status;
        perror("posix spawn failed");
        exit(EXIT_FAILURE);
    }

    int waitpid_status;
    if (waitpid(pid, &waitpid_status, 0) == -1) {
        perror("waitpid");
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char **argv) {


    char *date_argv[] = {"/usr/bin/date", "+%d-%m-%Y", NULL};
    spawn_and_wait(date_argv);
    char *time_argv[] = {"/usr/bin/date", "+%T", NULL};
    spawn_and_wait(time_argv);
    char *whoami_argv[] = {"/usr/bin/whoami", NULL};
    spawn_and_wait(whoami_argv);
    char *hostname_argv[] = {"/usr/bin/hostname", "-f", NULL};
    spawn_and_wait(hostname_argv);
    char *path_argv[] = {"/usr/bin/realpath", ".", NULL};
    spawn_and_wait(path_argv);

    return 0;
}