module main

go 1.15

replace example.com/03_grpchello => ../protos

require (
	example.com/03_grpchello v0.0.0-00010101000000-000000000000 // indirect
	google.golang.org/grpc v1.35.0 // indirect
)
