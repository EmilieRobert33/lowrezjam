pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
--test por la partie qte
function _init()
	poke(0x5f2c,3)
	offset=0
	notes={}
	fini={}
	frame=0
	combo=0
	temps=60
	test_pat={"h",60,"h",30,"b",30,"b",40,"g",60,"d",40,"g",40,"d",60,"h",40,"b",40,"g",40,"d",40}

	carreau={}
	carreau2={}
end

function _update60()
	
	pattern(test_pat)
	faire_carreau()
	update_carreau()
	if (btnp(2)) then
		if (notes[1]!=nill and notes[1].x>=27 and notes[1].x<=40 and notes[1].s=="⬆️") then
			del(notes,notes[1])
			sfx(30+combo)
			combo+=1
			if (combo>9) combo=0
		else
			sfx(40)
			combo=0
			offset=0.08
		end
	end
	if (btnp(3)) then
		if (notes[1]!=nill and notes[1].x>=27 and notes[1].x<=40 and notes[1].s=="⬇️") then
			del(notes,notes[1])
			sfx(30+combo)
			combo+=1
			if (combo>9) combo=0
		else
			sfx(40)
			combo=0
			offset=0.08

		end
	end
	
	if (btnp(0)) then
		if (notes[1]!=nill and notes[1].x>=27 and notes[1].x<=40 and notes[1].s=="⬅️") then
			del(notes,notes[1])
			sfx(30+combo)
			combo+=1
			if (combo>9) combo=0
		else
			sfx(40)
			combo=0
			offset=0.08

		end
	end

	if (btnp(1)) then
		if (notes[1]!=nill and notes[1].x>=27 and notes[1].x<=40 and notes[1].s=="➡️") then
			del(notes,notes[1])
			sfx(30+combo)
			combo+=1
			if (combo>9) combo=0
		else
			sfx(40)
			combo=0
			offset=0.08

		end
	end




	for i=1,#notes do
		if (notes[i]!=nill) then
			notes[i].x-=1
			if (notes[i].x<20) then
				add(fini,notes[i])
				del(notes,notes[i])
				sfx(40)
				offset=0.08
			end
		end
	end
	for a=1,#fini do
		if (fini[i]!=nill) and (fini[i].x<-7) then
			del(fini,notes[i])
		end
	end
	

end

function _draw()
	cls()
	screen_shake()
	draw_carreau()
	print (#test_pat)
	spr(0,15,4,4,4)
--	line(32,50,32,64,11)
	line(27,50,27,64,11)
	line(40,50,40,64,11)
	for i=1,#notes do
		local n=notes[i]
		print(n.s,n.x,n.y)
--		pset(n.x+3,n.y+3,9)
	
	end

	for a=1,#fini do
		local n=fini[i]
		if n!=nill then
			print(n.s,n.x,n.y)
--			pset(n.x+3,n.y+3,9)
		end

	end


end

function pattern(s)
	frame+=1
	if (frame>=temps and s[1]!=nill) then
		frame=0
		temps=s[2]
		del(s,s[2])
		faire_note(del(s,s[1]))
	end
end



function faire_note(a)

	if (a=="h") then
		local n={x=64,y=55,s="⬆️"}
		add(notes,n)
	end

	if (a=="b") then
		local n={x=64,y=55,s="⬇️"}
		add(notes,n)
	end
	if (a=="d") then
		local n={x=64,y=55,s="➡️"}
		add(notes,n)
	end
	if (a=="g") then
		local n={x=64,y=55,s="⬅️"}
		add(notes,n)
	end





end

function faire_carreau()
	if (cos(t())==0 or cos(t())==1 or cos(t())==-1) then
		local c={x1=rnd(64),y1=-rnd(20),x2=rnd(64),y2=0}
		add(carreau,c)
	end
	if (cos(t())==0 or cos(t())==1 or cos(t())==-1) then
		local c={x1=64,y1=rnd(64),x2=64+rnd(20),y2=rnd(64)}
		add(carreau2,c)
	end
end

function update_carreau()

	for i=1,#carreau do
		if carreau[i]!=nill then
			local c=carreau[i]
			c.y1+=1
			c.y2+=1

			if (c.y1>65) del(carreau,c)
		end
	end

	for a=1,#carreau2 do
		if carreau2[a]!=nill then
			local c=carreau2[a]
			c.x1-=1
			c.x2-=1

			if (c.x2<-5) del(carreau2,c)
		end
	end


end

function draw_carreau()
	for i=1,#carreau do
		if carreau[i]!=nill then
			local c=carreau[i]
			rectfill(c.x1,c.y1,c.x2,c.y2,5)
		end
	end
	for a=1,#carreau2 do
		if carreau2[a]!=nill then
			local c=carreau2[a]
			rectfill(c.x1,c.y1,c.x2,c.y2,5)
		end
	end
end

function screen_shake()
  local fade = 0.95
  local offset_x=16-rnd(32)
  local offset_y=16-rnd(32)
  offset_x*=offset
  offset_y*=offset
  
  camera(offset_x,offset_y)
  offset*=fade
  if offset<0.05 then
    offset=0
  end
end
----------------------------
-- init 
----------------------------

function _init_combat()
	notes={}
end


__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000440000000004444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000440000000044444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000440000000444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00004444000004444444444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00004444000044444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000440000444444444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000440004444444444444444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000004400000aaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000004400000aaa07aa07aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000004400000aaa00aa00aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000004400000aa0aaaaaa0aa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000004400000aaa66aa66aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000440000006666666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000440000066666006666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000044000066660dddd066660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000440dd06660dddddd06660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000440ddd0660dddddd0660d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000044000000660dddd06600dd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000440000060660dd066060dd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000440000006660dd066600dd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000440000066600dd006660dd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000004400000660d00dd00660dd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000044000000d0dd0dd0dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000044000000d0dd0ddd0d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000044000000000044d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000044000000dddd00dddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000044000000dddd00dddd00000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000044000000dddd00dddd00000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000044000000dddd00dddd00000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000044000000dddd00dddd00000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000004400000ddddd00ddddd0000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000004400000ddddd00ddddd0000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000044000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00333300003333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
03388330033883300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33833833333883330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
38388383333883330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33388333383883830000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33388333338338330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
03388330033883300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00333300003333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000a55002300142001200002000160000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000c55002300142001200002000160000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000001055002300142001200002000160000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000001255002300142001200002000160000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000001855017500142001200002000160000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000001c55017500142001200002000160000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000001e55017500142001200002000160000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000002355017500142001200002000160000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000002955025500142001200002000160000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000002f55001500142001200002000160000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000865000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
