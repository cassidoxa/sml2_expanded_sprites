objects := sml2_sprites_expanded.o

all: sml2_sprites_expanded.gb

%.o: %.asm
	rgbasm -o $@ $< -E

sml2_sprites_expanded.gb: $(objects)
	rgblink -o $@ $^ -O sml2_original.gb --sym sml2_sprites_expanded.sym
	rgbfix -v $@
	rm -rf sml2_sprites_expanded.o

clean:
	rm -rf sml2_sprites_expanded.gb
