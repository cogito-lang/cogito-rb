#ifndef RUBY_COGITO
#define RUBY_COGITO

#include <ruby.h>
#include <cogito.h>

typedef struct cg_buf {
  size_t length;
  size_t capacity;
  char *content;
} cg_buf_t;

void Init_cogito();

#endif
