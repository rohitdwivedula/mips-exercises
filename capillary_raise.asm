# Given the value of Sigma, Gamma and the cosine of angle between the glass and water, calculate the height of
# the capillary rise in the tube. ( H = (2 * σ * cosx) / ( γ * R ), assume σ = 5.670373, γ =
# 9.807)


.data

SIGMA: .double 5.67
GAMMA: .double 9.807

.text

li $v0, 6
syscall
mov.d $f2, $f0 # R

li $v0, 5
syscall
cvt.d.s $f4, $f0 # cos x

la $t0, SIGMA
l.d $f6, ($t0) # sigma

li $v0, 3
mov.d $f12, $f6
syscall

mul.d $f8, $f6, $f4 # (sigma * cos x)

li $v0, 3
mov.d $f12, $f6
syscall

add.d $f8, $f8, $f8 # nr  = (2 * sigma * cos x)

li $v0, 3
mov.d $f12, $f8
syscall

la $t0, GAMMA
l.d $f10, ($t0) # gamma
mul.d $f12, $f10, $f2 # dr = (gamma * R)
div.d $f14, $f8, $f12 # nr/dr

li $v0, 3
mov.d $f12, $f14
syscall

li $v0, 10
syscall