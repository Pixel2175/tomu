#ifndef CONTROL_H
#define CONTROL_H

#include "backend.h"

void *control_place(void *arg);
void playback_pause(PlayBackState *state);
void playback_resume(PlayBackState *state);
void playback_stop(PlayBackState *state);
int playback_paused(PlayBackState *state);
int playback_resumed(PlayBackState *state);
void shuffle(const char *path);

#endif
