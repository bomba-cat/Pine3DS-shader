# Minecraft-3ds-shader

This repository holds a discontinued version of Minecraft default in-game shader file

# Introduction

Vertex shaders are the only programmable shaders implemented by the CTR-SDK(PICA200). Vertex shaders are written in PICA-specific assembly language. The OpenGL ES 2.0 API loads the executable files and then runs the shaders. The OpenGL ES 2.0 API can load only executable files that have been assembled and linked. You can't load shader files written in GLSL.
![GPU](image/GPU.png)

Vertex shaders are run from the **main** function. A **main** object is an object file that can be assembled from an assembly code file that has a **main** function. A reference object is an object file that can be assembled from an assembly code file that does not have a **main** function.

To put a **main** function in an assembly code file, set the **main** label at the location where shader execution starts and set the **endmain** label after the last instruction at the end of the main function.(This is the last instruction in the main function, not the last instruction in the assembly code file.)A reference object only has subroutines and is referenced by a main object to resolve unresolved labels. When the objects are linked to create an executable file, the executable file does not include reference objects that are not referenced by any main objects

**Input Registers**

Input registers are floating-point registers that store vertex attribute data ("attributes" in OpenGL ES 2.0 applications).

**Temporary Registers**

Temporary registers are floating-point registers that temporarily maintain calculation results to be reused later. Their values are preserved until they are overwritten.

**Floating-Point Constant Registers**

Floating-point constant registers are floating-point registers that store constants to use for calculations. Uniforms for OpenGL ES 2.0 applications are stored here.

**Output Registers**

These registers output data that has been processed by vertex shaders into a later stage of the graphics pipeline.

# Building
You can use nintendo 3ds devkit or [picasso](https://github.com/devkitPro/picasso) from devkitpro. If you decided use picasso as assembler, make sure use the file and instructions in [homebrew](https://github.com/bomba-cat/Pine3DS-shader/blob/main/homebrew/README.md) folder.

# Developing

For starters, here is a list of all the programs:
- block_overlay
- cloud
- color
- color_uv
- color_uv_glint
- color_uv_vertex_alpha
- entity
- entity_colod_based_use_uv_anim
- entity_colorbased_no_texture
- entity_item_in_hand
- entity_item_in_hand_glint
- entity_overlay
- entity_overlay_color
- entity_overlay_color_mask
- entity_overlay_emissive
- entity_overlay_glint
- entity_overlay_glint_colormask
- entity_overlay_multitexture
- entity_overlay_multitexture_colortexture
- entity_uv_anim
- guardian_ghost
- normal_as_color
- position
- position_ccolor
- rain_snow
- renderchunk
- renderchunk_as_entity
- renderchunk_near_water
- renderchunk_seasons
- sky
- stitch_blit
- uv
- uv_blend
- uv_ccolor
- uv_repeat
- uv_scale
- uv_selection_overlay
- weather

If you want to modify the renderchunk, when using picasso you create the `renderchunk.vsh` file and start modifying it. You can take note of the `src/` folder in this repository, to create the basic setup of the vertex shader file. After that feel free to modify as you wish. Take note that unless you manage to modify the pipeline, you cant add any new uniforms whatsoever but that should be clear itself.

When you created the files you can use `picasso` to create the `.shbin` file. Here's and example:

`picasso renderchunk.vsh -o renderchunk.shbin`

After this you create the `romfs/shaders/3DS/` folder inside the mod folder of your Citra or put the files in `romfs/shaders/3DS/` of your 3DS
