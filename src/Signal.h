#ifndef LIME_SIGNAL_H
#define LIME_SIGNAL_H


Status SIGNALS(Crew *signals);

int Signal(char *s);
void emit(char *s);
void persist(char *s);

#endif
