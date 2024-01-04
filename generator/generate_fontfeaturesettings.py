import blend2d_parser, blend2d_generator

if __name__ == "__main__":

    ctx = blend2d_parser.ParseContext('fontfeaturesettings.h')
    blend2d_parser.execute(ctx)

    blend2d_generator.sanitize(ctx)

    blend2d_generator.generate(ctx,
                               prefix = blend2d_generator.PREFIX + "require_relative 'blend2d_array'\nrequire_relative 'blend2d_bitset'\nrequire_relative 'blend2d_filesystem'\nrequire_relative 'blend2d_fontdefs'\nrequire_relative 'blend2d_geometry'\nrequire_relative 'blend2d_glyphbuffer'\nrequire_relative 'blend2d_object'\nrequire_relative 'blend2d_path'\nrequire_relative 'blend2d_string'\n",
                               setup_method_name = 'fontfeaturesettings')
