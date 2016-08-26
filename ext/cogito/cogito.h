#ifndef RUBY_COGITO
#define RUBY_COGITO

#include <ruby.h>
#include <cogito.h>

static VALUE to_json(VALUE self, VALUE str);
static VALUE to_iam(VALUE self, VALUE str);

void Init_cogito();

#endif
