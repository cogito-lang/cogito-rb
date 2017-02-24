#include "cogito.h"

extern int cg_to_json(cg_buf_t *buffer, char *input);
extern int cg_to_iam(cg_buf_t *buffer, char *input);

extern cg_buf_t* cg_buf_build(void);
extern void cg_buf_free(cg_buf_t *buffer);

static VALUE CogitoError;

static VALUE to_json(VALUE self, VALUE str)
{
  if (TYPE(str) == T_NIL) return Qnil;

  cg_buf_t *buffer = cg_buf_build();
  char *input = rb_string_value_cstr(&str);

  if (cg_to_json(buffer, input) != 0) {
    rb_raise(CogitoError, "JSON conversion failed");
  }

  VALUE response = rb_str_new2(buffer->content);
  cg_buf_free(buffer);
  return response;
}

static VALUE to_iam(VALUE self, VALUE str)
{
  if (TYPE(str) == T_NIL) return Qnil;

  cg_buf_t *buffer = cg_buf_build();
  char *input = rb_string_value_cstr(&str);

  if (cg_to_iam(buffer, input) != 0) {
    rb_raise(CogitoError, "IAM conversion failed");
  }

  VALUE response = rb_str_new2(buffer->content);
  cg_buf_free(buffer);
  return response;
}

void Init_cogito()
{
  VALUE Cogito = rb_define_module("Cogito");
  VALUE CogitoSingleton = rb_singleton_class(Cogito);

  rb_define_private_method(CogitoSingleton, "convert_to_json", to_json, 1);
  rb_define_singleton_method(Cogito, "to_iam", to_iam, 1);

  CogitoError = rb_define_class_under(Cogito, "CogitoError", rb_eStandardError);
}
