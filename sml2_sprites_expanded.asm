;------------------------------------------------------------------------------
; SML2 Expanded Sprite Maps
;------------------------------------------------------------------------------
;
; This module claims free space in bank $01 starting at address $7000 and copies Mario's
; sprite maps there. We also overwrite the relevant sprite map pointers at $4000 - $41E4
; to point at our new labels. The sprite maps are descriptively labeled with some comments
; that might clarify what a sprite map is used for.
;
; The sprite map entries are four bytes per 8x8 sprite (same as gameboy OAM) with a terminating
; byte $80. They are laid out as follows: Y position, X position, Tile Index, and Properties
; (see: https://gbdev.io/pandocs/OAM.html). The X and Y integers are signed such that $00 is
; an origin of sorts. To move sprites:
;
; Up    - Decrement Y by multiple of $04
; Down  - Increment Y by multiple of $04
; Left  - Decrement X by multiple of $04
; Right - Increment X by multiple of $04
;
; Sprites can be freely added to the maps by adding entries before the termination byte. I have no
; idea if added sprites also have their own hitbox. Note that big Mario and fire flower Mario share
; sprite maps, but they don't have to. Unique sprite maps can be made with their own labels and the
; corresponding _feather/_no_feather pointers can be replaced.

SECTION "Expanded Sprite Maps", ROMX[$7000], BANK[1]

;------------------------------------------------------------------------------
; Small Mario Sprite Maps
;------------------------------------------------------------------------------

SmallRight:
	db $FC, $F8, $41, $20
	db $FC, $00, $40, $20
	db $04, $F8, $51, $20
	db $04, $00, $50, $20
	db $0C, $F8, $61, $20
	db $0C, $00, $60, $20
	db $80 ;end sprite

SmallLeft:
	db $FC, $F8, $40, $00
	db $FC, $00, $41, $00
	db $04, $F8, $50, $00
	db $04, $00, $51, $00
	db $0C, $F8, $60, $00
	db $0C, $00, $61, $00
	db $80 ;end sprite

SmallTurnRight:
	db $FC, $F8, $41, $20
	db $FC, $00, $40, $20
	db $04, $F8, $5A, $00
	db $04, $00, $5B, $00
	db $0C, $F0, $3A, $00
	db $0C, $F8, $6A, $00
	db $0C, $00, $6B, $00
	db $80 ;end sprite

SmallTurnLeft:
	db $FC, $F8, $40, $00
	db $FC, $00, $41, $00
	db $04, $F8, $5B, $20
	db $04, $00, $5A, $20
	db $0C, $F8, $6B, $20
	db $0C, $00, $6A, $20
	db $0C, $08, $3A, $20
	db $80 ;end sprite

SmallJumpRight:
	db $FC, $F8, $41, $20
	db $FC, $00, $48, $20
	db $04, $F8, $59, $20
	db $04, $00, $58, $20
	db $0C, $F8, $69, $20
	db $0C, $00, $68, $20
	db $80 ;end sprite

SmallJumpLeft:
	db $FC, $F8, $48, $00
	db $FC, $00, $41, $00
	db $04, $F8, $58, $00
	db $04, $00, $59, $00
	db $0C, $F8, $68, $00
	db $0C, $00, $69, $00
	db $80 ;end sprite

SmallCrouchRight:
	db $04, $F8, $2F, $20
	db $04, $00, $2E, $20
	db $0C, $F8, $3F, $20
	db $0C, $00, $3E, $20
	db $80 ;end sprite

SmallCrouchLeft:
	db $04, $F8, $2E, $00
	db $04, $00, $2F, $00
	db $0C, $F8, $3E, $00
	db $0C, $00, $3F, $00
	db $80 ;end sprite

; Each mario running animation has three frames
SmallRunAnimationRightOne:
	db $FC, $F7, $41, $20
	db $FC, $FF, $40, $20
	db $04, $F8, $53, $20
	db $04, $00, $52, $20
	db $0C, $F8, $63, $20
	db $0C, $00, $62, $20
	db $80 ;end sprite

SmallRunAnimationRightTwo:
	db $FC, $F8, $41, $20
	db $FC, $00, $40, $20
	db $04, $F8, $55, $20
	db $04, $00, $54, $20
	db $0C, $F8, $65, $20
	db $0C, $00, $64, $20
	db $80 ;end sprite

SmallRunAnimationRightThree:
	db $FC, $F8, $41, $20
	db $FC, $00, $40, $20
	db $04, $F8, $57, $20
	db $04, $00, $56, $20
	db $0C, $F8, $67, $20
	db $0C, $00, $66, $20
	db $80 ;end sprite

SmallRunAnimationLeftOne:
	db $FC, $F9, $40, $00
	db $FC, $01, $41, $00
	db $04, $F8, $52, $00
	db $04, $00, $53, $00
	db $0C, $F8, $62, $00
	db $0C, $00, $63, $00
	db $80 ;end sprite

SmallRunAnimationLeftTwo:
	db $FC, $F8, $40, $00
	db $FC, $00, $41, $00
	db $04, $F8, $54, $00
	db $04, $00, $55, $00
	db $0C, $F8, $64, $00
	db $0C, $00, $65, $00
	db $80 ;end sprite

SmallRunAnimationLeftThree:
	db $FC, $F8, $40, $00
	db $FC, $00, $41, $00
	db $04, $F8, $56, $00
	db $04, $00, $57, $00
	db $0C, $F8, $66, $00
	db $0C, $00, $67, $00
	db $80 ;end sprite

SmallLedgeHopRight:
	db $FC, $F8, $41, $20
	db $FC, $00, $48, $20
	db $04, $F8, $59, $20
	db $04, $00, $58, $20
	db $0C, $F8, $69, $20
	db $0C, $00, $68, $20
	db $80 ;end sprite

SmallLedgeHopLeft:
	db $FC, $F8, $48, $00
	db $FC, $00, $41, $00
	db $04, $F8, $58, $00
	db $04, $00, $59, $00
	db $0C, $F8, $68, $00
	db $0C, $00, $69, $00
	db $80 ;end sprite

SmallSwimIdleRight:
	db $FC, $F8, $41, $20
	db $FC, $00, $40, $20
	db $04, $F8, $43, $20
	db $04, $00, $42, $20
	db $0C, $F8, $45, $20
	db $0C, $00, $44, $20
	db $80 ;end sprite

SmallSwimIdleLeft:
	db $FC, $F8, $40, $00
	db $FC, $00, $41, $00
	db $04, $F8, $42, $00
	db $04, $00, $43, $00
	db $0C, $F8, $44, $00
	db $0C, $00, $45, $00
	db $80 ;end sprite

SmallSwimStrokeRight:
	db $FC, $F8, $41, $20
	db $FC, $00, $40, $20
	db $04, $F8, $47, $20
	db $04, $00, $46, $20
	db $0C, $F8, $4B, $20
	db $0C, $00, $4A, $20
	db $80 ;end sprite

SmallSwimStrokeLeft:
	db $FC, $F8, $40, $00
	db $FC, $00, $41, $00
	db $04, $F8, $46, $00
	db $04, $00, $47, $00
	db $0C, $F8, $4A, $00
	db $0C, $00, $4B, $00
	db $80 ;end sprite

;------------------------------------------------------------------------------
; Big Mario/Fire Mario Sprite Maps
;------------------------------------------------------------------------------
BigRight_feather:
	db $F4, $FD, $1E, $20
BigRight_no_feather:
	db $F4, $F9, $01, $20
	db $F4, $01, $00, $20
	db $FC, $F9, $11, $20
	db $FC, $01, $10, $20
	db $04, $F8, $23, $20
	db $04, $00, $22, $20
	db $0C, $F8, $37, $20
	db $0C, $00, $36, $20
	db $80 ;end sprite

BigLeft_feather:
	db $F4, $FB, $1E, $00
BigLeft_no_feather:
	db $F4, $F7, $00, $00
	db $F4, $FF, $01, $00
	db $FC, $F7, $10, $00
	db $FC, $FF, $11, $00
	db $04, $F8, $22, $00
	db $04, $00, $23, $00
	db $0C, $F8, $36, $00
	db $0C, $00, $37, $00
	db $80 ;end sprite

BigTurnRight_feather:
	db $F4, $FD, $1E, $00
BigTurnRight_no_feather:
	db $F4, $F9, $01, $20
	db $F4, $01, $00, $20
	db $FC, $F8, $1C, $00
	db $FC, $00, $1D, $00
	db $04, $F8, $2C, $00
	db $04, $00, $2D, $00
	db $0C, $F0, $3A, $00
	db $0C, $F8, $3C, $00
	db $0C, $00, $3D, $00
	db $80 ;end sprite

BigTurnLeft_feather:
	db $F4, $FB, $1E, $20
BigTurnLeft_no_feather:
	db $F4, $F7, $00, $00
	db $F4, $FF, $01, $00
	db $FC, $F8, $1D, $20
	db $FC, $00, $1C, $20
	db $04, $F8, $2D, $20
	db $04, $00, $2C, $20
	db $0C, $F8, $3D, $20
	db $0C, $00, $3C, $20
	db $0C, $08, $3A, $20
	db $80 ;end sprite

BigJumpRight_feather:
	db $F4, $FC, $1E, $20
BigJumpRight_no_feather:
	db $F4, $F8, $01, $20
	db $F4, $00, $08, $20
	db $FC, $F8, $11, $20
	db $FC, $00, $18, $20
	db $04, $F0, $2A, $20
	db $04, $F8, $29, $20
	db $04, $00, $28, $20
	db $0C, $F8, $39, $20
	db $0C, $00, $38, $20
	db $80 ;end sprite

BigJumpLeft_feather:
	db $F4, $FC, $1E, $00
BigJumpLeft_no_feather:
	db $F4, $F8, $08, $00
	db $F4, $00, $01, $00
	db $FC, $F8, $18, $00
	db $FC, $00, $11, $00
	db $04, $F8, $28, $00
	db $04, $00, $29, $00
	db $04, $08, $2A, $00
	db $0C, $F8, $38, $00
	db $0C, $00, $39, $00
	db $80 ;end sprite

BigSpinFront_feather:
	db $F4, $FC, $1F, $00
BigSpinFront_no_feather:
	db $F4, $F8, $1A, $00
	db $F4, $00, $1A, $20
	db $FC, $F8, $1B, $00
	db $FC, $00, $1B, $20
	db $04, $F8, $2B, $00
	db $04, $00, $2B, $20
	db $0C, $F8, $3B, $00
	db $0C, $00, $3B, $20
	db $80 ;end sprite

BigSpinBack_feather:
	db $F4, $FC, $1F, $00
BigSpinBack_no_feather:
	db $F4, $F8, $1A, $00
	db $F4, $00, $1A, $20
	db $FC, $F8, $09, $00
	db $FC, $00, $09, $20
	db $04, $F8, $19, $00
	db $04, $00, $19, $20
	db $0C, $F8, $49, $00
	db $0C, $00, $49, $20
	db $80 ;end sprite

BigCrouchRight_feather:
	db $04, $FC, $1E, $20
BigCrouchRight_no_feather:
	db $04, $F8, $17, $20
	db $04, $00, $16, $20
	db $0C, $F8, $27, $20
	db $0C, $00, $26, $20
	db $80 ;end sprite

BigCrouchLeft_feather:
	db $04, $FC, $1E, $00
BigCrouchLeft_no_feather:
	db $04, $F8, $16, $00
	db $04, $00, $17, $00
	db $0C, $F8, $26, $00
	db $0C, $00, $27, $00
	db $80 ;end sprite

BigRunRightAnimationOne_feather:
	db $F4, $FC, $1E, $20
BigRunRightAnimationOne_no_feather:
	db $F4, $F8, $01, $20
	db $F4, $00, $00, $20
	db $FC, $F8, $11, $20
	db $FC, $00, $10, $20
	db $04, $F8, $21, $20
	db $04, $00, $20, $20
	db $0C, $F8, $31, $20
	db $0C, $00, $30, $20
	db $80 ;end sprite

BigRunRightAnimationTwo_feather:
	db $F4, $FD, $1E, $20
BigRunRightAnimationTwo_no_feather:
	db $F4, $F9, $01, $20
	db $F4, $01, $00, $20
	db $FC, $F9, $11, $20
	db $FC, $01, $10, $20
	db $04, $F8, $23, $20
	db $04, $00, $22, $20
	db $0C, $F8, $33, $20
	db $0C, $00, $32, $20
	db $80 ;end sprite

BigRunRightAnimationThree_feather:
	db $F4, $FD, $1E, $20
BigRunRightAnimationThree_no_feather:
	db $F4, $F9, $01, $20
	db $F4, $01, $00, $20
	db $FC, $F9, $11, $20
	db $FC, $01, $10, $20
	db $04, $F8, $25, $20
	db $04, $00, $24, $20
	db $0C, $F8, $35, $20
	db $0C, $00, $34, $20
	db $80 ;end sprite

BigRunLeftAnimationOne_feather:
	db $F4, $FC, $1E, $00
BigRunLeftAnimationOne_no_feather:
	db $F4, $F8, $00, $00
	db $F4, $00, $01, $00
	db $FC, $F8, $10, $00
	db $FC, $00, $11, $00
	db $04, $F8, $20, $00
	db $04, $00, $21, $00
	db $0C, $F8, $30, $00
	db $0C, $00, $31, $00
	db $80 ;end sprite

BigRunLeftAnimationTwo_feather:
	db $F4, $FB, $1E, $00
BigRunLeftAnimationTwo_no_feather:
	db $F4, $F7, $00, $00
	db $F4, $FF, $01, $00
	db $FC, $F7, $10, $00
	db $FC, $FF, $11, $00
	db $04, $F8, $22, $00
	db $04, $00, $23, $00
	db $0C, $F8, $32, $00
	db $0C, $00, $33, $00
	db $80 ;end sprite

BigRunLeftAnimationThree_feather:
	db $F4, $FB, $1E, $00
BigRunLeftAnimationThree_no_feather:
	db $F4, $F7, $00, $00
	db $F4, $FF, $01, $00
	db $FC, $F7, $10, $00
	db $FC, $FF, $11, $00
	db $04, $F8, $24, $00
	db $04, $00, $25, $00
	db $0C, $F8, $34, $00
	db $0C, $00, $35, $00
	db $80 ;end sprite

BigLedgeHopRight_feather:
	db $F4, $FC, $1E, $20
BigLedgeHopRight_no_feather:
	db $F4, $F8, $01, $20
	db $F4, $00, $00, $20
	db $FC, $F8, $11, $20
	db $FC, $00, $10, $20
	db $04, $F8, $25, $20
	db $04, $00, $24, $20
	db $0C, $F8, $39, $20
	db $0C, $00, $34, $20
	db $80 ;end sprite

BigLedgeHopLeft_feather:
	db $F4, $FC, $1E, $00
BigLedgeHopLeft_no_feather:
	db $F4, $F8, $00, $00
	db $F4, $00, $01, $00
	db $FC, $F8, $10, $00
	db $FC, $00, $11, $00
	db $04, $F8, $24, $00
	db $04, $00, $25, $00
	db $0C, $F8, $34, $00
	db $0C, $00, $39, $00
	db $80 ;end sprite

BigSwimIdleRight_feather:
	db $F4, $FC, $1E, $20
BigSwimIdleRight_no_feather:
	db $F4, $F8, $01, $20
	db $F4, $00, $00, $20
	db $FC, $F8, $11, $20
	db $FC, $00, $10, $20
	db $04, $F0, $04, $20
	db $04, $F8, $03, $20
	db $04, $00, $02, $20
	db $0C, $F4, $06, $20
	db $0C, $FC, $05, $20
	db $80 ;end sprite

BigSwimIdleLeft_feather:
	db $F4, $FC, $1E, $00
BigSwimIdleLeft_no_feather:
	db $F4, $F8, $00, $00
	db $F4, $00, $01, $00
	db $FC, $F8, $10, $00
	db $FC, $00, $11, $00
	db $04, $F8, $02, $00
	db $04, $00, $03, $00
	db $04, $08, $04, $00
	db $0C, $FC, $05, $00
	db $0C, $04, $06, $00
	db $80 ;end sprite

BigSwimStrokeRight_feather:
	db $F4, $FC, $1E, $20
BigSwimStrokeRight_no_feather:
	db $F4, $F8, $01, $20
	db $F4, $00, $00, $20
	db $FC, $F8, $11, $20
	db $FC, $00, $10, $20
	db $04, $F0, $0C, $20
	db $04, $F8, $0B, $20
	db $04, $00, $0A, $20
	db $0C, $F0, $0F, $20
	db $0C, $F8, $0E, $20
	db $0C, $00, $0D, $20
	db $80 ;end sprite

BigSwimStrokeLeft_feather:
	db $F4, $FC, $1E, $00
BigSwimStrokeLeft_no_feather:
	db $F4, $F8, $00, $00
	db $F4, $00, $01, $00
	db $FC, $F8, $10, $00
	db $FC, $00, $11, $00
	db $04, $F8, $0A, $00
	db $04, $00, $0B, $00
	db $04, $08, $0C, $00
	db $0C, $F8, $0D, $00
	db $0C, $00, $0E, $00
	db $0C, $08, $0F, $00
	db $80 ;end sprite

ShootFireStandingRight:
	db $F4, $FD, $1E, $20
	db $F4, $F9, $01, $20
	db $F4, $01, $00, $20
	db $FC, $F9, $11, $20
	db $FC, $01, $10, $20
	db $04, $F8, $13, $20
	db $04, $00, $12, $20
	db $0C, $F8, $37, $20
	db $0C, $00, $36, $20
	db $80 ;end sprite

ShootFireStandingLeft:
	db $F4, $FB, $1E, $00
	db $F4, $F7, $00, $00
	db $F4, $FF, $01, $00
	db $FC, $F7, $10, $00
	db $FC, $FF, $11, $00
	db $04, $F8, $12, $00
	db $04, $00, $13, $00
	db $0C, $F8, $36, $00
	db $0C, $00, $37, $00
	db $80 ;end sprite

ShootFireRunningRightOne:
	db $F4, $FC, $1E, $20
	db $F4, $F8, $01, $20
	db $F4, $00, $00, $20
	db $FC, $F8, $11, $20
	db $FC, $00, $10, $20
	db $04, $F8, $13, $20
	db $04, $00, $12, $20
	db $0C, $F8, $31, $20
	db $0C, $00, $30, $20
	db $80 ;end sprite

ShootFireRunningLeftOne:
	db $F4, $FC, $1E, $00
	db $F4, $F8, $00, $00
	db $F4, $00, $01, $00
	db $FC, $F8, $10, $00
	db $FC, $00, $11, $00
	db $04, $F8, $12, $00
	db $04, $00, $13, $00
	db $0C, $F8, $30, $00
	db $0C, $00, $31, $00
	db $80 ;end sprite

ShootFireRunningRightTwo:
	db $F4, $FD, $1E, $20
	db $F4, $F9, $01, $20
	db $F4, $01, $00, $20
	db $FC, $F9, $11, $20
	db $FC, $01, $10, $20
	db $04, $F8, $13, $20
	db $04, $00, $12, $20
	db $0C, $F8, $33, $20
	db $0C, $00, $32, $20
	db $80 ;end sprite

ShootFireRunningLeftTwo:
        db $F4, $FC, $1E, $00
	db $F4, $F8, $00, $00
	db $F4, $00, $01, $00
	db $FC, $F8, $10, $00
	db $FC, $00, $11, $00
	db $04, $F8, $12, $00
	db $04, $00, $13, $00
	db $0C, $F8, $30, $00
	db $0C, $00, $31, $00
	db $80 ;end sprite

ShootFireRunningRightThree:
	db $F4, $FD, $1E, $20
	db $F4, $F9, $01, $20
	db $F4, $01, $00, $20
	db $FC, $F9, $11, $20
	db $FC, $01, $10, $20
	db $04, $F8, $13, $20
	db $04, $00, $12, $20
	db $0C, $F8, $35, $20
	db $0C, $00, $34, $20
	db $80

ShootFireRunningLeftThree:
        db $F4, $FB, $1E, $00
	db $F4, $F7, $00, $00
	db $F4, $FF, $01, $00
	db $FC, $F7, $10, $00
	db $FC, $FF, $11, $00
	db $04, $F8, $12, $00
	db $04, $00, $13, $00
	db $0C, $F8, $34, $00
	db $0C, $00, $35, $00
	db $80 ;end sprite

ShootFireJumpingRight:
	db $F4, $FC, $1E, $20
	db $F4, $F8, $01, $20
	db $F4, $00, $08, $20
	db $FC, $F8, $11, $20
	db $FC, $00, $18, $20
	db $04, $F8, $13, $20
	db $04, $00, $14, $20
	db $0C, $F8, $39, $20
	db $0C, $00, $38, $20
	db $80 ;end sprite

ShootFireJumpingLeft:
	db $F4, $FC, $1E, $00
	db $F4, $F8, $08, $00
	db $F4, $00, $01, $00
	db $FC, $F8, $18, $00
	db $FC, $00, $11, $00
	db $04, $F8, $14, $00
	db $04, $00, $13, $00
	db $0C, $F8, $38, $00
	db $0C, $00, $39, $00
	db $80 ;end sprite

; Shooting a fireball then quickly doing the turning animation
ShootFireTurnRight:
	db $F4, $FD, $1E, $00
	db $F4, $F9, $01, $20
	db $F4, $01, $00, $20
	db $FC, $F8, $1C, $00
	db $FC, $00, $1D, $00
	db $04, $F8, $13, $20
	db $04, $00, $12, $20
	db $0C, $F0, $3A, $00
	db $0C, $F8, $3C, $00
	db $0C, $00, $3D, $00
	db $80 ;end sprite

ShootFireTurnLeft:
	db $F4, $FB, $1E, $20
	db $F4, $F7, $00, $00
	db $F4, $FF, $01, $00
	db $FC, $F8, $1D, $20
	db $FC, $00, $1C, $20
	db $04, $F8, $12, $00
	db $04, $00, $13, $00
	db $0C, $F8, $3D, $20
	db $0C, $00, $3C, $20
	db $0C, $08, $3A, $20
	db $80 ;end sprite

;------------------------------------------------------------------------------
; Bunny Mario Sprite Maps
;------------------------------------------------------------------------------
BunnyRight:
	db $F4, $F9, $75, $20
	db $F4, $01, $74, $20
	db $FC, $F9, $11, $20
	db $FC, $01, $10, $20
	db $04, $F8, $23, $20
	db $04, $00, $22, $20
	db $0C, $F8, $37, $20
	db $0C, $00, $36, $20
	db $80 ;end sprite

BunnyLeft:
	db $F4, $F7, $74, $00
	db $F4, $FF, $75, $00
	db $FC, $F7, $10, $00
	db $FC, $FF, $11, $00
	db $04, $F8, $22, $00
	db $04, $00, $23, $00
	db $0C, $F8, $36, $00
	db $0C, $00, $37, $00
	db $80 ;end sprite

BunnyTurnLeft:
	db $F4, $F9, $75, $20
	db $F4, $01, $74, $20
	db $FC, $F8, $1C, $00
	db $FC, $00, $1D, $00
	db $04, $F8, $2C, $00
	db $04, $00, $2D, $0
	db $0C, $F0, $3A, $00
	db $0C, $F8, $3C, $00
	db $0C, $00, $3D, $00
	db $80 ;end sprite

BunnyTurnRight:
	db $F4, $F7, $74, $00
	db $F4, $FF, $75, $00
	db $FC, $F8, $1D, $20
	db $FC, $00, $1C, $20
	db $04, $F8, $2D, $20
	db $04, $00, $2C, $20
	db $0C, $F8, $3D, $20
	db $0C, $00, $3C, $20
	db $0C, $08, $3A, $20
	db $80 ;end sprite

BunnyJumpEarsDownRight:
	db $F4, $F8, $77, $20
	db $F4, $00, $7A, $20
	db $FC, $F8, $11, $20
	db $FC, $00, $18, $20
	db $04, $F0, $2A, $20
	db $04, $F8, $29, $20
	db $04, $00, $28, $20
	db $0C, $F8, $39, $20
	db $0C, $00, $38, $20
	db $80 ;end sprite

BunnyJumpEarsDownLeft:
	db $F4, $F8, $7A, $00
	db $F4, $00, $77, $00
	db $FC, $F8, $18, $00
	db $FC, $00, $11, $00
	db $04, $F8, $28, $00
	db $04, $00, $29, $00
	db $04, $08, $2A, $00
	db $0C, $F8, $38, $00
	db $0C, $00, $39, $00
	db $80 ;end sprite

BunnyJumpEarsUpRight:
	db $F4, $F8, $75, $20
	db $F4, $00, $7C, $20
	db $FC, $F8, $11, $20
	db $FC, $00, $18, $20
	db $04, $F0, $2A, $20
	db $04, $F8, $29, $20
	db $04, $00, $28, $20
	db $0C, $F8, $39, $20
	db $0C, $00, $38, $20
	db $80 ;end sprite

BunnyJumpEarsUpLeft:
	db $F4, $F8, $7C, $00
	db $F4, $00, $75, $00
	db $FC, $F8, $18, $00
	db $FC, $00, $11, $00
	db $04, $F8, $28, $00
	db $04, $00, $29, $00
	db $04, $08, $2A, $00
	db $0C, $F8, $38, $00
	db $0C, $00, $39, $00
	db $80 ;end sprite

BunnyCrouchRight:
	db $00, $F8, $79, $20
	db $00, $00, $78, $20
	db $04, $F8, $17, $20
	db $04, $00, $16, $20
	db $0C, $F8, $27, $20
	db $0C, $00, $26, $20
	db $80 ;end sprite

BunnyCrouchLeft:
	db $00, $F8, $78, $00
	db $00, $00, $79, $00
	db $04, $F8, $16, $00
	db $04, $00, $17, $00
	db $0C, $F8, $26, $00
	db $0C, $00, $27, $00
	db $80 ;end sprite

BunnyRunRightAnimationOne:
	db $F4, $F8, $75, $20
	db $F4, $00, $74, $20
	db $FC, $F8, $11, $20
	db $FC, $00, $10, $20
	db $04, $F8, $21, $20
	db $04, $00, $20, $20
	db $0C, $F8, $31, $20
	db $0C, $00, $30, $20
	db $80 ;end sprite

BunnyRunLeftAnimationOne:
	db $F4, $F8, $74, $00
	db $F4, $00, $75, $00
	db $FC, $F8, $10, $00
	db $FC, $00, $11, $00
	db $04, $F8, $20, $00
	db $04, $00, $21, $00
	db $0C, $F8, $30, $00
	db $0C, $00, $31, $00
	db $80 ;end sprite

BunnyRunRightAnimationTwo:
	db $F4, $F9, $75, $20
	db $F4, $01, $74, $20
	db $FC, $F9, $11, $20
	db $FC, $01, $10, $20
	db $04, $F8, $23, $20
	db $04, $00, $22, $20
	db $0C, $F8, $33, $20
	db $0C, $00, $32, $20
	db $80 ;end sprite

BunnyRunLeftAnimationTwo:
	db $F4, $F7, $74, $00
	db $F4, $FF, $75, $00
	db $FC, $F7, $10, $00
	db $FC, $FF, $11, $00
	db $04, $F8, $22, $00
	db $04, $00, $23, $00
	db $0C, $F8, $32, $00
	db $0C, $00, $33, $00
	db $80 ;end sprite

BunnyRunRightAnimationThree:
	db $F4, $F9, $77, $20
	db $F4, $01, $76, $20
	db $FC, $F9, $11, $20
	db $FC, $01, $10, $20
	db $04, $F8, $25, $20
	db $04, $00, $24, $20
	db $0C, $F8, $35, $20
	db $0C, $00, $34, $20
	db $80 ;end sprite

BunnyRunLeftAnimationThree:
	db $F4, $F7, $76, $00
	db $F4, $FF, $77, $00
	db $FC, $F7, $10, $00
	db $FC, $FF, $11, $00
	db $04, $F8, $24, $00
	db $04, $00, $25, $00
	db $0C, $F8, $34, $00
	db $0C, $00, $35, $00
	db $80 ;end sprite

BunnyLedgeHopRight:
	db $F4, $F8, $75, $20
	db $F4, $00, $74, $20
	db $FC, $F8, $11, $20
	db $FC, $00, $10, $20
	db $04, $F8, $25, $20
	db $04, $00, $24, $20
	db $0C, $F8, $39, $20
	db $0C, $00, $34, $20
	db $80 ;end sprite

BunnyLedgeHopLeft:
	db $F4, $F8, $74, $00
	db $F4, $00, $75, $00
	db $FC, $F8, $10, $00
	db $FC, $00, $11, $00
	db $04, $F8, $24, $00
	db $04, $00, $25, $00
	db $0C, $F8, $34, $00
	db $0C, $00, $39, $00
	db $80 ;end sprite

BunnySwimIdleRight:
	db $F4, $F8, $75, $20
	db $F4, $00, $74, $20
	db $FC, $F8, $11, $20
	db $FC, $00, $10, $20
	db $04, $F0, $04, $20
	db $04, $F8, $03, $20
	db $04, $00, $02, $20
	db $0C, $F4, $06, $20
	db $0C, $FC, $05, $20
	db $80 ;end sprite

BunnySwimIdleLeft:
	db $F4, $F8, $74, $00
	db $F4, $00, $75, $00
	db $FC, $F8, $10, $00
	db $FC, $00, $11, $00
	db $04, $F8, $02, $00
	db $04, $00, $03, $00
	db $04, $08, $04, $00
	db $0C, $FC, $05, $00
	db $0C, $04, $06, $00
	db $80 ;end sprite

BunnySwimStrokeRight:
	db $F4, $F8, $77, $20
	db $F4, $00, $76, $20
	db $FC, $F8, $11, $20
	db $FC, $00, $10, $20
	db $04, $F0, $0C, $20
	db $04, $F8, $0B, $20
	db $04, $00, $0A, $20
	db $0C, $F0, $0F, $20
	db $0C, $F8, $0E, $20
	db $0C, $00, $0D, $20
	db $80 ;end sprite

BunnySwimStrokeLeft:
	db $F4, $F8, $76, $00
	db $F4, $00, $77, $00
	db $FC, $F8, $10, $00
	db $FC, $00, $11, $00
	db $04, $F8, $0A, $00
	db $04, $00, $0B, $00
	db $04, $08, $0C, $00
	db $0C, $F8, $0D, $00
	db $0C, $00, $0E, $00
	db $0C, $08, $0F, $00
	db $80 ;end sprite
ENDSECTION


SECTION "Big Mario Sprite Map Pointers", ROMX[$4000], BANK[1]
dw BigRight_no_feather
dw BigRunRightAnimationOne_no_feather
dw BigRunRightAnimationTwo_no_feather
dw BigRunRightAnimationThree_no_feather
dw BigLeft_no_feather
dw BigRunLeftAnimationOne_no_feather
dw BigRunLeftAnimationTwo_no_feather
dw BigRunLeftAnimationThree_no_feather
dw BigJumpRight_no_feather ; 10
dw BigJumpLeft_no_feather
dw BigLedgeHopRight_no_feather
dw BigLedgeHopLeft_no_feather
dw BigTurnLeft_no_feather
dw BigTurnRight_no_feather
dw BigCrouchRight_no_feather
dw BigCrouchLeft_no_feather
dw BigSpinFront_no_feather ; 20
dw BigSpinBack_no_feather
dw BigSwimIdleRight_no_feather
dw BigSwimStrokeRight_no_feather
dw BigSwimIdleLeft_no_feather
dw BigSwimStrokeLeft_no_feather
 
ENDSECTION


SECTION "Small Mario Sprite Map Pointers 1", ROMX[$4040], BANK[1]

dw SmallRight
dw SmallRunAnimationRightOne
dw SmallRunAnimationRightTwo
dw SmallRunAnimationRightThree
dw SmallLeft
dw SmallRunAnimationLeftOne
dw SmallRunAnimationLeftTwo
dw SmallRunAnimationLeftThree
dw SmallJumpRight ; 10
dw SmallJumpLeft
dw SmallLedgeHopRight
dw SmallLedgeHopLeft
dw SmallTurnLeft
dw SmallTurnRight
dw SmallCrouchRight
dw SmallCrouchLeft

ENDSECTION


SECTION "Small Mario Sprite Map Pointers 2", ROMX[$4064], BANK[1]

dw SmallSwimIdleRight
dw SmallSwimStrokeRight
dw SmallSwimIdleLeft
dw SmallSwimStrokeLeft

ENDSECTION

SECTION "Fire Mario Sprite Map Pointers 1", ROMX[$40E0], BANK[1]

dw BigRight_feather
dw BigRunRightAnimationOne_feather
dw BigRunRightAnimationTwo_feather
dw BigRunRightAnimationThree_feather
dw BigLeft_feather
dw BigRunLeftAnimationOne_feather
dw BigRunLeftAnimationTwo_feather
dw BigRunLeftAnimationThree_feather
dw BigJumpRight_feather ; F0
dw BigJumpLeft_feather
dw BigLedgeHopRight_feather
dw BigLedgeHopLeft_feather
dw BigTurnLeft_feather
dw BigTurnRight_feather
dw BigCrouchRight_feather
dw BigCrouchLeft_feather
dw BigSpinFront_feather ; 100
dw BigSpinBack_feather
dw BigSwimIdleRight_feather
dw BigSwimStrokeRight_feather
dw BigSwimIdleLeft_feather
dw BigSwimStrokeLeft_feather

ENDSECTION

SECTION "Fire Mario Sprite Map Pointers 2", ROMX[$4120], BANK[1]

dw ShootFireStandingRight
dw ShootFireRunningRightOne
dw ShootFireRunningRightTwo
dw ShootFireRunningRightThree
dw ShootFireStandingLeft
dw ShootFireRunningLeftOne
dw ShootFireRunningLeftTwo
dw ShootFireRunningLeftThree
dw ShootFireJumpingRight
dw ShootFireJumpingLeft

ENDSECTION

SECTION "Fire Mario Sprite Map Pointers 3", ROMX[$4138], BANK[1]

dw ShootFireTurnLeft
dw ShootFireTurnRight
dw BigCrouchRight_feather ; Where's the feather??
dw BigCrouchLeft_feather  ;
dw BigSpinFront_feather
dw BigSpinBack_feather

ENDSECTION

SECTION "Bunny Mario Sprite Map Pointers 1", ROMX[$408A], BANK[1]

dw BunnyRight
dw BunnyRunRightAnimationOne
dw BunnyRunRightAnimationTwo
dw BunnyRunRightAnimationThree ; 90
dw BunnyLeft
dw BunnyRunLeftAnimationOne
dw BunnyRunLeftAnimationTwo
dw BunnyRunLeftAnimationThree
dw BunnyJumpEarsDownRight
dw BunnyJumpEarsDownLeft
dw BunnyLedgeHopRight
dw BunnyLedgeHopLeft ; A0
dw BunnyTurnLeft
dw BunnyTurnRight
dw BunnyCrouchRight
dw BunnyCrouchLeft

ENDSECTION


SECTION "Bunny Mario Sprite Map Pointers 2", ROMX[$40AE], BANK[1]

dw BunnySwimIdleRight
dw BunnySwimStrokeRight
dw BunnySwimIdleLeft
dw BunnySwimStrokeLeft

ENDSECTION

SECTION "Bunny Mario Sprite Map Pointers 3", ROMX[$40CE], BANK[1]

dw BunnyJumpEarsUpRight
dw BunnyJumpEarsUpLeft

ENDSECTION
