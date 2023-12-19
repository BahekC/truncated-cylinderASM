org 100h
jmp start
a_x dw 400
a_y dw 350
b_x dw 240
leftLineLHT dw 290
rigthLineLHT dw 260
start:
mov ah,00
mov al, 18
int 10h
mov ah, 0Ch
mov al, 15
mov cx, a_x
mov dx, a_y
mov bp, dx
mov si, dx
arcBottom:
mov bx, cx
sub bx, 320
mov ax, bx
mul bx
cmp ax, 4
jle jmp nedel
mov bx, 4
mov dx, 0
div bx
nedel:
mov bx, ax
sub bx, 1600
neg bx
mov ax, bx
xchg bx, ax
mov dx, 8000h 


@@Bit:
xor dl, dh
mov al, dl
mul al
cmp ax, bx
jna @@Reset
xor dl, dh
@@Reset:
shr dh, 1
jnz @@Bit
xchg ax, dx
mov bx,ax
sub di, bx
printArcBottom:
mov dx, si
mov ah, 0Ch
mov al, 15
int 10h
dec cx
sub dx, di
mov si, dx
mov di, bx
cmp cx, b_x
jnz arcBottom
cordArcTop:
mov ah, 0Ch
mov al, 15
mov cx, a_x
mov dx, a_y
mov bp, dx
mov si,dx
arcTop:
mov bx, cx
sub bx, 320
mov ax, bx
mul bx
cmp ax, 4
jle jmp nedel2
mov bx, 4
mov dx, 0
div bx
nedel2:
mov bx, ax
sub bx, 1600
neg bx
mov ax, bx
xchg bx, ax
mov dx, 8000h


@@Bit2:
xor dl, dh
mov al, dl 
mul al
cmp ax, bx
jna @@Reset2
xor dl,dh
@@Reset2:
shr dh, 1
jnz @@Bit2
xchg ax,dx
mov bx,ax
sub di, bx

printArcTop:
mov dx, si
mov ah, 0Ch
mov al, 15
int 10h
sub cx, 4
add dx, di
mov si, dx
mov di, bx
cmp cx, b_x
jnz arcTop
cordLeftLine:
mov ah, 0Ch
mov al, 15
mov cx, b_x
mov dx, a_y
mov bx, 105
leftLine:
int 10h
add bx, 1
sub dx, 1
cmp bx, leftLineLHT
jnz leftLine
cordRightLine:
mov ah, 0Ch
mov al, 15
mov cx, 398
mov dx, 355
mov bx, 160
rightLine:
int 10h
add bx, 1
sub dx, 1
cmp bx, rigthLineLHT
jnz rightLine
cordArcTop2:
mov di, 0
mov ah, 0Ch
mov al, 15
mov cx, 400
mov dx, 255
mov bp, dx
mov si, dx
arcTop2:
mov bx, cx
sub bx, 320
mov ax, bx
mul bx
cmp ax, 4
jle jmp nedel3
mov bx, 4
mov dx, 0
div bx
nedel3:
mov bx, ax 
sub bx, 1600
neg bx
mov ax, bx
xchg bx, ax
mov dx, 8000h

@@Bit3:
xor dl, dh
mov al, dl
mul al
cmp ax, bx
jna @@Reset3
xor dl,dh
@@Reset3:
shr dh, 1
jnz @@Bit3
xchg ax, dx
mov bx, ax
sub di, bx

printArcTop2:
mov dx, si
mov ah, 0Ch
mov al, 15
int 10h
add bx, -2 
sub cx, 4
add dx, di
mov si, dx
mov di, bx
cmp cx, b_x
jnz arcTop2
corArcBottom2:
mov di, 0
mov ah, 0Ch
mov al, 15
mov cx, 420
mov dx, 255
mov bp, dx
mov si ,dx
arcBottom2:
mov bx, cx
sub bx, 320
mov ax, bx
mul bx
cmp ax, 4
jle jmp nedel4
mov bx, 4
mov dx, 0
div bx
nedel4:
mov bx, ax
sub bx, 1600
neg bx
mov ax, bx
xchg bx, ax
mov dx, 8000h

@@Bit4:
xor dl, dh
mov al, dl
mul al
cmp ax, bx
jna @@Reset4
xor dl,dh
@@Reset4:
shr dh, 1
jnz @@Bit4
xchg ax, dx
mov bx, ax
sub di, bx

printArcBottom2:
mov dx, si
mov ah, 0Ch
mov al, 15
int 10h
add bx, 2 
sub cx, 4
sub dx, di
mov si, dx
mov di, bx
cmp cx, b_x
jnz arcBottom2

GetKey:
mov ah,00
int 16h
end:
mov ah, 00
mov al, 03
int 10h
mov ah, 04Ch
mov al, 00
int 21h
ret