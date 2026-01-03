#include <libavformat/avformat.h>

#ifndef OTHER_H
#define OTHER_H

void cleanUP(AVFormatContext *fmtCTX, AVCodecContext *codecCTX);
int shinu_now(const char *msg, AVFormatContext *fmtCTX, AVCodecContext *codecCTX);
void help();

int get_sec(double value);
int get_min(double value);
int get_hour(double value);


#endif
