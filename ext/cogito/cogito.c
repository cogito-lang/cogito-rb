#include "cogito.h"

extern char* cg_to_json(char *input);
extern char* cg_to_iam(char *input);

static VALUE to_json(VALUE self, VALUE str)
{
  if (TYPE(str) == T_NIL) return Qnil;

  char *input = rb_string_value_cstr(&str);
  char *output = cg_to_json(input);

  return rb_str_new2(output);
}

static VALUE to_iam(VALUE self, VALUE str)
{
  if (TYPE(str) == T_NIL) return Qnil;

  char *input = rb_string_value_cstr(&str);
  char *output = cg_to_iam(input);

  return rb_str_new2(output);
}

void Init_cogito()
{
  VALUE Cogito = rb_define_module("Cogito");
  rb_define_singleton_method(Cogito, "to_json", to_json, 1);
  rb_define_singleton_method(Cogito, "to_iam", to_iam, 1);
}
