// server.c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <string>
#include <cstring>
#include <iostream>

class Struct_to_message {
    public:
        // 处理结构体字段的特殊情况: \\, \;
        int string_to_message(char *str, char **msg, int offset) {
            int len = strlen(str);
            char *s = *msg;
            int count = offset;
            for (int i=0; i<len; i++) {
                if (str[i] == ';') {
                    s[count++] = '/';
                    s[count++] = ';';
                } else if (str[i] == '/'){
                    s[count++] = '/';
                    s[count++] = '/';
                } else{
                    s[count++] = str[i];
                }
            }
            s[count++] = ';';
            return len+1;
        }

        void message_to_string(char *msg, char**str, int *offset) {
            int len = strlen(msg);
            char *s = *str;
            int count = 0;
            for (int i=*offset; i<len; i++) {
                if (msg[i] == '/'){
                    s[count++] = msg[i+1];
                    i++;
                }
                else if (msg[i] == ';'){
                    *offset = i+1;
                    s[count++] = '\0';
                    break;
                } else {
                    s[count++] = msg[i];
                }
            }
        }

        void int_to_string(int value, char **str/*out*/, int str_len) {
            snprintf(*str, str_len, "%d", value);
        }

        void long_to_string(long value, char **str, int str_len) {
            snprintf(*str, str_len, "%ld", value);
        }

        void float_to_string(float value, char **str, int str_len) {
            snprintf(*str, str_len, "%f", value);
        }

        void double_to_string(double value, char **str, int str_len) {
            snprintf(*str, str_len, "%.9f", value);
        }

        int string_to_int(char* s) {
            return atoi(s);
        }

        long string_to_long(char *s) {
            return atol(s);
        }

        float string_to_float(char *s) {
            return atof(s);
        }

        double string_to_double(char *s) {
            return strtod(s, NULL);
        }

        char * alloc_mem(int size=1024) {
            return (char*)malloc(size);
        }

        // 打印结构体的所有字段
        void print() {

        }
};

void test_string_to_num(){
    Struct_to_message stm;
    char *ret = (char*)malloc(1024);
    char *tmp = (char*)malloc(1024);
    char str[] = "fadsf/fadfloljohtg;nnkgui";

    printf("----------------- xxx to string. --------------------\n");

    // int to string
    int i = 324;
    stm.int_to_string(i, &tmp, 1024);
    printf("value = %d, int to string: %s\n", i, tmp);

    // long to string
    long l = 42432;
    stm.long_to_string(l, &tmp, 1024);
    printf("value = %ld, long to string: %s\n", l, tmp);

    // float to string
    float f = 3.1415926;
    stm.float_to_string(f, &tmp, 1024);
    printf("value = %f, float to string: %s\n", f, tmp);

    // double to string
    double d = 3.1415926;
    stm.double_to_string(d, &tmp, 1024);
    printf("value = %.9f, double to string: %s\n", d, tmp);

    printf("----------------- string to xxx. --------------------\n");

    // string to int
    i = stm.string_to_int("4234324");
    printf("value = %s, string to int: %d\n", "4234324", i);

    // string to long
    l = stm.string_to_long("355554444");
    printf("value = %s, string to long: %ld\n", "355554444", l);

    // string to float
    f = stm.string_to_float("3.3213123123");
    printf("value = %s, string to float: %f\n", "3.3213123123", f);

    // string to double
    d = stm.string_to_double("3.53423423");
    printf("value = %s, string to double: %.9f\n", "3.53423423", d);
 
    printf("----------------- string to message. --------------------\n");

    // string to message
    i = 99999;
    stm.int_to_string(i, &tmp, 1024); // int to string
    int len = stm.string_to_message(tmp, &ret, 0);

    printf("value = %d\n", i);
    printf("string = %s\n", str);
    stm.string_to_message(str, &ret, len); // string to message
    printf("value+string = %s\n", ret);

    printf("----------------- message to string. --------------------\n");
    // message to string
    int offset = 0;
    stm.message_to_string(ret, &tmp, &offset);
    printf("tmp = %s\n", tmp);

    stm.message_to_string(ret, &tmp, &offset);
    printf("tmp = %s\n", tmp);

    free(ret);
    free(tmp);
}

class A {
    public:
        int age_;
        std::string name_;
    public:
        void print() {
            std::cout << "age = " << age_ << std::endl;
            std::cout << "name = " << name_ << std::endl;
        }

        void struct_to_message(char **str_out){
            Struct_to_message stm;
            char *ret = stm.alloc_mem();
            char *tmp = stm.alloc_mem();

            stm.int_to_string(age_, &tmp, 1024);
            int len = stm.string_to_message(tmp, &ret, 0);
            stm.string_to_message(const_cast<char*>(name_.c_str()), &ret, len);
            *str_out = ret;
            free(tmp);
        }

        void message_to_struct(char **str_in) {
            int offset = 0;
            Struct_to_message stm;
            char *tmp = stm.alloc_mem();

            char *ret = *str_in;
            stm.message_to_string(ret, &tmp, &offset);
            age_ = stm.string_to_int(tmp);

            memset(tmp, 0, 1024);
            stm.message_to_string(ret, &tmp, &offset);
            name_ = tmp;
            free(tmp);
        }
};

void test_class_to_message() {
    printf("------------------- class to message -----------------\n");
    Struct_to_message stm;

    char *s = (char*)malloc(1024);
    char *tmp = (char*)malloc(1024);

    std::string str_name = "struct";
    int age = 123;

    stm.int_to_string(age, &tmp, 1024);
    int len = stm.string_to_message(tmp, &s, 0);
    stm.string_to_message(const_cast<char*>(str_name.c_str()), &s, len);

    printf("%s\n", s);

    A a;
    a.age_ = age;
    a.name_ = str_name;
    char *t;
    a.print();
    a.struct_to_message(&t);
    printf("t = %s\n", t);

    a.age_ = 0;
    a.name_ = "";
    a.message_to_struct(&t);
    a.print();
    free(t);
    free(s);
    free(tmp);
}

int main() {
    test_string_to_num();
    test_class_to_message();
}
