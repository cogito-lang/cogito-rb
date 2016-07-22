#include <cogito/parser.tab.h>

static VALUE parse(VALUE self, VALUE str)
{
  if (TYPE(str) == T_NIL) return Qnil;

  char *input = rb_string_value_cstr(&str);
  char *output = cg_parse(input);

  return rb_str_new(output);
}

void Init_cogito()
{
  VALUE Cogito = rb_define_module("Cogito");
  rb_define_singleton_method(Cogito, "parse", parse, 1);
}
