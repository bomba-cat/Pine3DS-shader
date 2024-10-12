; Minecraft - New Nintendo 3DS Edition
; sky.shbin

; Handcoded by bomba-cat

; Uniforms
.fvec WORLDVIEWPROJ[4]
.fvec CURRENT_COLOR
.fvec FOG_COLOR

; Inputs
.in aPosition   v0
.in aColor      v1

; Outputs
.out outPos position.xyzw
.out outColor color.rgba

; Constants
.constf const0(1.000000, -1.000000, 1.000000, 1.000000)
.constf const1(0.003922, 0.003922, 0.003922, 0.003922)
.constf fogColor(0.0, 0.0, 0.0, 0.0) ;RGBA, i have no idea how exactly the alpha works but seems like it doesnt xd
.constf skyColor(1.0, 255.0, 1.0, 1.0) ;RGBA

; main
.proc main
    dp4 r0.x, WORLDVIEWPROJ[0], aPosition
    dp4 r0.y, WORLDVIEWPROJ[1], aPosition
    dp4 r0.z, WORLDVIEWPROJ[2], aPosition
    dp4 r0.w, WORLDVIEWPROJ[3], aPosition
    mov r0.xyz, r0.yxz
    mul outPos, const0, r0

		mov r10, FOG_COLOR				; Either move fogColor or FOG_COLOR in here
		mov r11, skyColor

		mul r1, skyColor, aColor
    mul r0, const1, r1
    mov r1, r10
    add r2, -CURRENT_COLOR, r1
    mad r2, aPosition, r0, CURRENT_COLOR
    mov outColor, r2
.end
