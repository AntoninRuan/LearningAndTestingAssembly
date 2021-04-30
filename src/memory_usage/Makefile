name = memory_usage
output_root = ~/AssemblyProjects/TestingAndLearning/out

run_$(name) : $(name)
	$(output_root)/$(name)

$(name) : tmp.o
	ld -m elf_i386 -s -o $(output_root)/$(name) $(output_root)/tmp.o
	rm $(output_root)/tmp.o
tmp.o :
	nasm -f elf -o $(output_root)/tmp.o $(name).asm