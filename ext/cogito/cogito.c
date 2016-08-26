#include "cogito.h"

extern response_t* cg_to_json(char *input);
extern response_t* cg_to_iam(char *input);

static VALUE CogitoError;

static VALUE respond(response_t *response) {
  if (response->status != 0) {
    rb_raise(CogitoError, "%s", response->message);
  }
  return rb_str_new2(response->message);
}

static VALUE to_json(VALUE self, VALUE str)
{
  if (TYPE(str) == T_NIL) return Qnil;

  char *input = rb_string_value_cstr(&str);
  return respond(cg_to_json(input));
}

static VALUE to_iam(VALUE self, VALUE str)
{
  if (TYPE(str) == T_NIL) return Qnil;

  char *input = rb_string_value_cstr(&str);
  return respond(cg_to_iam(input));
}

void Init_cogito()
{
  VALUE Cogito = rb_define_module("Cogito");
  rb_define_singleton_method(Cogito, "to_json", to_json, 1);
  rb_define_singleton_method(Cogito, "to_iam", to_iam, 1);

  CogitoError = rb_define_class_under(Cogito, "CogitoError", rb_eStandardError);
}
