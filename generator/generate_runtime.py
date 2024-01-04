import blend2d_parser, blend2d_generator

if __name__ == "__main__":

    ctx = blend2d_parser.ParseContext('runtime.h')
    blend2d_parser.execute(ctx)

    blend2d_generator.sanitize(ctx)

    blend2d_generator.generate(ctx, setup_method_name = 'runtime')
