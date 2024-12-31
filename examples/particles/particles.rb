# Ref.: https://github.com/blend2d/blend2d-apps/blob/ea194cb81d1c92bb42265ffed48609a665ba1981/bl_demos/bl_particles_demo.cpp
require_relative '../util/setup_blend2d'
require_relative '../util/setup_imgui'
require_relative '../util/setup_raylib'

class Particle
  MAX_AGE = 300
  CATEGORY_COUNT = 8
  CATEGORY_COLOR = [
    BLRgba32.create_as(0xFF4F00FF),
    BLRgba32.create_as(0xFFFF004F),
    BLRgba32.create_as(0xFFFF7F00),
    BLRgba32.create_as(0xFFFF3F9F),
    BLRgba32.create_as(0xFF7F4FFF),
    BLRgba32.create_as(0xFFFF9F3F),
    BLRgba32.create_as(0xFFFFFF00),
    BLRgba32.create_as(0xFFAF3F00),
  ].freeze

  attr_accessor :p, :v, :age, :category
  def initialize
    @p = BLPoint.new
    @v = BLPoint.new
    @age = 0
    @category = 0
  end
end

# Blend2D ARGB -> Raylib ABGR
def raylibTextureFromBlend2DImage(blImg, blImgData, rayImg, rayImgData)
  blImg.getData(blImgData)
  pixels = blImgData.pixelData.get_array_of_uint(0, blImgData.size.w * blImgData.size.h)
  pixels.map! do |argb|
    abgr = (argb & 0xFF000000) | ((argb & 0x00FF0000) >> 16) | (argb & 0x0000FF00) | ((argb & 0x000000FF) << 16)
  end
  rayImgData.put_array_of_uint(0, pixels)
  rayImg.data = rayImgData

  return LoadTextureFromImage(rayImg)
end

def renderBlend2DImage(ctx, use_color, particles, particle_count, blImg, blImgData, rayImg, rayImgData)
  ctx.clearAll()
  ctx.fillAllRgba32(BLRgba32.create_as(0xFF000000).value)

  p = BLPathCore.create

  cx = blImgData.size.w / 2
  cy = blImgData.size.h / 2

  radiusScale = 6.0

  if use_color
    paths = Array.new(Particle::CATEGORY_COUNT) { BLPathCore.create }
    particles.each do |part|
      # path.addCircle(BLCircle(cx + part.p.x, cy + part.p.y, double(maxAge - part.age) / double(maxAge) * radiusScale));
      circle = BLCircle.create_as(cx + part.p.x, cy + part.p.y, (Particle::MAX_AGE - part.age).to_f / Particle::MAX_AGE * radiusScale)
      paths[part.category].addGeometry(BL_GEOMETRY_TYPE_CIRCLE, circle, nil, BL_GEOMETRY_DIRECTION_CW)
    end
    ctx.setCompOp(BL_COMP_OP_PLUS)
    Particle::CATEGORY_COUNT.times do |i|
      ctx.fillGeometryRgba32(BL_GEOMETRY_TYPE_PATH, paths[i], Particle::CATEGORY_COLOR[i].value) # ctx.fillPath(p, BLRgba32(0xFFFFFFFFu))
    end
  else
    particles.each do |part|
      # path.addCircle(BLCircle(cx + part.p.x, cy + part.p.y, double(maxAge - part.age) / double(maxAge) * radiusScale));
      circle = BLCircle.create_as(cx + part.p.x, cy + part.p.y, (Particle::MAX_AGE - part.age).to_f / Particle::MAX_AGE * radiusScale)
      p.addGeometry(BL_GEOMETRY_TYPE_CIRCLE, circle, nil, BL_GEOMETRY_DIRECTION_CW)
    end
    ctx.fillGeometryRgba32(BL_GEOMETRY_TYPE_PATH, p, BLRgba32.create_as(0xFFFFFFFF).value) # ctx.fillPath(p, BLRgba32(0xFFFFFFFFu))
  end
end

if __FILE__ == $PROGRAM_NAME
  sidebar_width = 200
  image_width = 480
  image_height = 480

  angle = 0.0

  particles = []
  particle_count = 500

  # Prepare Blend2D objects

  blRnd = BLRandom.new
  blRnd.reset(1234)

  blImg = BLImageCore.create_as(image_width, image_height, BL_FORMAT_PRGB32)

  ctx = BLContextCore.create_as(blImg, nil)

  blImgData = BLImageData.new
  blImg.getData(blImgData)

  rayImgData = FFI::MemoryPointer.new(:uint, blImgData.size.w * blImgData.size.h)

  rayImg = Image.new
  rayImg.data = rayImgData
  rayImg.width = blImgData.size.w
  rayImg.height = blImgData.size.h
  rayImg.mipmaps = 1
  rayImg.format = PIXELFORMAT_UNCOMPRESSED_R8G8B8A8

  # Raylib starts here

  redrawEveryFrame = true

  SetTraceLogLevel(LOG_ERROR)
  screen_width = blImgData.size.w + sidebar_width
  screen_height = blImgData.size.h
  InitWindow(screen_width, screen_height, "Yet Another Ruby-raylib bindings")

  # ImGui setup starts here

  ImGui.CreateContext()
  ImGui.StyleColorsLight()
  ImGui.ImplRaylib_Init()
  io = ImGuiIO.new(ImGui.GetIO())
  io[:IniSavingRate] = 0
  io[:IniFilename] = nil
  io[:WantSaveIniSettings] = false
  io[:Fonts].AddFontDefault()

  # Build texture atlas
  font_pixels = FFI::MemoryPointer.new :pointer
  font_width = FFI::MemoryPointer.new :int
  font_height = FFI::MemoryPointer.new :int
  io[:Fonts].GetTexDataAsRGBA32(font_pixels, font_width, font_height, nil)

  # Upload texture to graphics system
  # [TODO] find standard and safe way to convert RGBA32 array into texture
  font_image = Raylib.GenImageColor(font_width.read_int, font_height.read_int, Raylib::BLUE)
  original_data = font_image[:data]
  font_image[:data] = font_pixels.read_pointer

  font_texture = Raylib.LoadTextureFromImage(font_image)
  font_image[:data] = original_data
  Raylib.UnloadImage(font_image)

  # Store our identifier
  font_texture_ptr = FFI::MemoryPointer.new(:uint32)
  font_texture_ptr.write(:uint32, font_texture[:id])
  io[:Fonts].SetTexID(font_texture_ptr)

  show_ui = true
  quit_mainloop = false
  show_fps = true
  exec_save = false

  # ImGui setup ends here

  # Prepare Raylib texture image
  renderBlend2DImage(ctx, true, particles, particle_count, blImg, blImgData, rayImg, rayImgData)
  rayTex = raylibTextureFromBlend2DImage(blImg, blImgData, rayImg, rayImgData)

  SetTargetFPS(60)

  until quit_mainloop
    if redrawEveryFrame
      count = particles.length()

      rot = 1.0 / 1000 # TODO get value via slider widget
      m = BLMatrix2D.new
      blMatrix2DSetRotation(m, rot, 100.0, 100.0) # TODO makeRotation(double angle);
      particles.each do |p|
        p.p.x += p.v.x
        p.p.y += p.v.y
        p.v = BLPoint.create_as(p.v.x * m[:contents][:elements][:m00] + p.v.y * m[:contents][:elements][:m10], p.v.x * m[:contents][:elements][:m01] + p.v.y * m[:contents][:elements][:m11]) # mapPoint
        p.age += 1
      end

      maxParticles = particle_count # TODO get value via slider widget
      n = (blRnd.nextDouble() * maxParticles / 60 + 0.95).to_i
      n.times do
        break if particles.length >= maxParticles
        angle = blRnd.nextDouble() * Math::PI * 2.0
        speed = [blRnd.nextDouble() * 2.0, 0.05].max
        aSin = Math.sin(angle)
        aCos = Math.cos(angle)

        part = Particle.new
        part.p.x = 0 # TODO BLPoint.reset()
        part.p.y = 0
        part.v.x = aCos * speed  # TODO BLPoint.reset(xValue, yValue)
        part.v.y = aSin * speed
        part.age = ([blRnd.nextDouble(), 0.5].min * Particle::MAX_AGE).to_i
        part.category = (blRnd.nextDouble() * 8).to_i
        particles << part
      end

      particles.reject! {|p| p.age >= Particle::MAX_AGE}
    end

    show_ui = !show_ui if IsKeyPressed(KEY_F1)

    BeginDrawing()
      ClearBackground(RAYWHITE)
      ImGui.ImplRaylib_NewFrame()
      ImGui.NewFrame()
      mainmenu_size = ImVec2.create
      if show_ui && ImGui::BeginMainMenuBar()
        mainmenu_size = ImGui::GetWindowSize()
        if ImGui::BeginMenu('Application')
          if ImGui::MenuItem_Bool('Redraw Every Frame', nil, redrawEveryFrame)
            redrawEveryFrame = !redrawEveryFrame
          end
          if ImGui::MenuItem_Bool('Show FPS', nil, show_fps)
            show_fps = !show_fps
          end
          if ImGui::MenuItem_Bool("Save")
            exec_save = true
          end
          if ImGui::MenuItem_Bool("Quit")
            quit_mainloop = true
          end
        end
      end

      exec_redraw = redrawEveryFrame

      if show_ui
        # Mode window
        ImGui::SetNextWindowSize(ImVec2.create(sidebar_width, screen_height - mainmenu_size[:y]), ImGuiCond_Always)
        ImGui::SetNextWindowPos(ImVec2.create(blImgData.size.w, 0 + mainmenu_size[:y]), ImGuiCond_Always)
        ImGui::Begin('Mode', nil, ImGuiCond_Once | ImGuiWindowFlags_NoCollapse | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoMove)
        count_buf = [particle_count].pack("L")
        if ImGui::SliderInt("Particle\nCount", count_buf, 0, 5000)
          particle_count = count_buf.unpack1("L")
        end
        ImGui::End()
      end

      ImGui.Render()
      ImGui.ImplRaylib_RenderDrawData(ImGui.GetDrawData())
    EndDrawing()

    quit_mainloop |= WindowShouldClose()

    if exec_redraw
      renderBlend2DImage(ctx, true, particles, particle_count, blImg, blImgData, rayImg, rayImgData)
      rayTex = raylibTextureFromBlend2DImage(blImg, blImgData, rayImg, rayImgData)
    end

    if exec_save
      codec = BLImageCodecCore.new
      codec.initByName("PNG", "PNG".chars.length, nil)
      blImg.writeToFile("screenshot.png", codec)
      codec.destroy()
      codec = nil
      exec_save = false
    end

    DrawTexture(rayTex, 0, (screen_height - rayImg.height) / 2, WHITE)
    if show_fps
      DrawFPS(screen_width - sidebar_width - 100, mainmenu_size[:y] + 10)
    end

  end

  ImGui.ImplRaylib_Shutdown()
  ImGui.DestroyContext(nil)

  CloseWindow()

  #
  # Raylib ends here
  #

  ctx.destroy()
  ctx = nil

  blImg.destroy()
  blImg = nil
end

