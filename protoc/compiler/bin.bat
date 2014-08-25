@echo off
compiler\protoc --plugin=protoc-gen-as3="compiler\protoc-gen-as3.bat" --as3_out=output\as3 %1.proto
compiler\protoc --java_out=output\java %1.proto
