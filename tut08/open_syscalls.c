//
// Created by Jason Codd on 3/11/2022.
//


#include <stdio.h>
#include <sys/file.h>

int main() {


    char *FilePath = "my_file.txt";

    FILE *f1 = fopen(FilePath, "r");
    int fd1 = open(FilePath, O_RDONLY);


    FILE *f2 = fopen(FilePath, "a");
    int fd2 = open(FilePath, O_WRONLY|O_CREAT|O_APPEND);


    FILE *f3 = fopen(FilePath, "w");
    int fd3 = open(FilePath, O_WRONLY|O_CREAT|O_TRUNC);


    FILE *f4 = fopen(FilePath, "r+");
    int fd4 = open(FilePath, O_RDWR);


    FILE *f5 = fopen(FilePath, "w+");
    int fd5 = open(FilePath, O_RDWR|O_CREAT|O_TRUNC);
}