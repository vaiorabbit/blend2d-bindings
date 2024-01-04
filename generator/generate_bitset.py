import blend2d_parser, blend2d_generator

if __name__ == "__main__":

    ctx = blend2d_parser.ParseContext('bitset.h')
    blend2d_parser.execute(ctx)

    blend2d_generator.sanitize(ctx)
    blend2d_generator.generate(ctx,
                               prefix = blend2d_generator.PREFIX + "require_relative 'blend2d_object'\n",
                               setup_method_name = 'bitset')
