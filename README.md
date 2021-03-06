## Index 

  * [Index](#index)
  * [Golang playground](#golang-playground)
  * [References](#references)
  * [Basic Type](#basic-type)
  * [if and switch](#if-and-switch)
  * [for loop](#for-loop)
  * [Array and Slice](#array-and-slice)
  * [Vector and Matrix](#vector-and-matrix)
  * [Map](#map)
  * [Struct](#struct)
  * [Pointer](#pointer)
  * [Function](#function)
  * [Class and Object](#class-and-object)
  * [Interface](#interface)
  * [interface{} variable](#interface-variable)
  * [Functional Programming](#functional-programming)
  * [Json Marshal/Unmarshal](#json-marshalunmarshal)
  * [Custom JSON Marshalling in Go](#custom-json-marshalling-in-go)
  * [Read/write from/to file](#readwrite-fromto-file)
  * [protobuf](#protobuf)
	 * [protobuf golang example](#protobuf-golang-example)
	 * [protobuf C++ example](#protobuf-c-example)
  * [gRPC](#grpc)
	 * [gRPC tutorial for C++](#grpc-tutorial-for-c)
	 * [gRPC tutorial for Go](#grpc-tutorial-for-go)
	 * [gRPCHelloWorld C++/Go Example](#grpchelloworld-cgo-example)
	 * [gRPCFtp C++/Go Example](#grpcftp-cgo-example)
  * [gin web backend framework](#gin-web-backend-framework)
	 * [Example](#example)
  * [resty http client library](#resty-http-client-library)
	 * [Example](#example-1)
  * [Swagger Codegen](#swagger-codegen)
	 * [References](#references-1)
	 * [swagger-codegen cli install](#swagger-codegen-cli-install)
	 * [Gen code for golang server](#gen-code-for-golang-server)
	 * [Gen code for golang client](#gen-code-for-golang-client)
	 * [Gen code for HTML2 docs](#gen-code-for-html2-docs)
	 * [Examples](#examples)
  * [Go Swagger](#go-swagger)
	 * [Installation](#installation)
	 * [Generate webserver code from swagger spec 2.0](#generate-webserver-code-from-swagger-spec-20)
	 * [Cons](#cons)
	 * [Pros](#pros)
	 * [References](#references-2)
  * [Go Kit](#go-kit)
	 * [Example: StringSvc1](#example-stringsvc1)
	 * [gokit code generator](#gokit-code-generator)
	 * [GrantZheng/kit](#grantzhengkit)
	 * [gokit issues](#gokit-issues)



-------------------------------------------------

## Golang playground 
 -> [Golang Playground](https://play.golang.org/)

-------------------------------------------------

 ## References
 - [官方Effective Go](https://golang.org/doc/effective_go.html)
 - [michaelchen golang 教學](https://michaelchen.tech/golang-programming/)
 - [Golang standard library](https://golang.org/pkg/)
 - [Go maps in action](https://blog.golang.org/maps)
-------------------------------------------------

## [Basic Type](https://michaelchen.tech/golang-programming/data-type/)
- 布林值(真或假)：
	- bool
- 字串：
	- string
- 整數(Integer)
	- 有號數
		- int  int8  int16  int32  int64 
	- 無號數
		- uint uint8 uint16 uint32 uint64 uintptr
- 符點數(float)
	- float32 (含小數點 7 位)
		```golang
		package main
		import "fmt"
		func main() {
			var f1 float32 = 0.1234567123 * 10;
			var f2 float32 = 0.1234567123;
			fmt.Printf("%v\n", f1)
			fmt.Printf("%v\n", f2)
		}
		```
	- float64 (含小數點 15 位)
		```golang
		package main
		import "fmt"
		func main() {
			var f1 float64 = 0.1234567890123456789 * 10;
			var f2 float64 = 0.1234567890123456789;
			fmt.Printf("%v\n", f1)
			fmt.Printf("%v\n", f2)
		}
		```
 
- byte // alias for uint8
- rune // alias for int32, represents a Unicode code point

-------------------------------------------------

## [if and switch](https://michaelchen.tech/golang-programming/selection/)

-------------------------------------------------

## [for loop](https://michaelchen.tech/golang-programming/iteration/)

-------------------------------------------------

## [Array and Slice](https://michaelchen.tech/golang-programming/array-slice/)

```golang
package main
import "fmt"

type Point struct {
	x float64
	y float64
}

func PassSliceByReference(slice  []Point) {
	fmt.Printf("%v %v\n", len(slice ), slice);
}

func PassSliceWithPointerByReference(slice []*Point) {
	fmt.Printf("%v %v\n", len(slice ), slice);
}

func PassArrayByPoint(parray *[1]Point) {
	fmt.Printf("%v %v\n", len(parray), parray);
}

func main() {
	slice := []Point {
		{1, 2}, {3,4},
	};
	slice = append(slice, Point{1,2});
	//slice[1:2] is meaning i=1 && i < 2
	slice = append(slice, slice[1:2]...);
	PassSliceByReference(slice);
	
	slice_with_pointer := []*Point {
		{1, 2},
	};
	slice_with_pointer[0] = &Point{3,4};
	PassSliceWithPointerByReference(slice_with_pointer );

	//Array need to specified the length of entity 
	array := [1]Point {
		{1, 2},
	};
	PassArrayByPoint(&array);
}
```

-------------------------------------------------

## [Vector and Matrix](https://michaelchen.tech/golang-cookbook/vector-matrix/)

-------------------------------------------------

## [Map](https://michaelchen.tech/golang-programming/map/)
- 字串 key 與字串 value 的映射
	```golang
	package main
	import "fmt"

	//https://stackoverflow.com/a/31064737/11474144
	func MapInit() map[string]string {
		fmt.Printf("\nMapInit\n");

		//case 1
		// Initializes a map with space for 15 items before reallocation
		// the first 15 items added to the map will not require any map resizing
		m1 := make(map[string]string, 15);
		fmt.Printf("len:%d %v\n", len(m1), m1);

		//case 2
		// Initializes a map with an entry relating the name "bob" to the string "bbb"
		m2 := map[string]string{"bob": "bbb"};
		fmt.Printf("len:%d %v\n", len(m2), m2);

		//case 3
		// Initializes a map with three entry
		m3 := map[string]string {
			"aaa": "AAA",
			"bbb": "BBB",
			"ccc": "CCC",
		};
		fmt.Printf("len:%d %v\n", len(m3), m3);
		return m3;
	}

	func MapIterate(m map[string]string) {
		fmt.Printf("\nMapIterate\n");
		for key,value := range m {
			fmt.Printf("key:%v value:%v\n", key, value);
		}
	}

	func MapRemoveByKey(m map[string]string, key string) {
		fmt.Printf("\nMapRemoveByKey %v\n", key);
		delete(m, key);
	}

	func MapInsertKeyValuePair(m map[string]string, key string, value string) {
		fmt.Printf("\nMapInsertKeyValuePair %v %v\n", key, value);
		m[key] = value;
	}

	func MapGetValueByKey(m map[string]string, key string) {
		fmt.Printf("\nMapGetValueByKey %v\n", key);
		value, ok := m[key];
		if ok {
			fmt.Printf("the value is %v\n", value);
		} else {
			fmt.Printf("the key is not found %v\n", key);
		}
	}

	func main() {
		m := MapInit();
		MapIterate(m);

		MapRemoveByKey(m, "bbb");
		MapIterate(m);

		MapInsertKeyValuePair(m, "ddd", "DDD");
		MapIterate(m);

		MapGetValueByKey(m, "aaa");
		MapGetValueByKey(m, "aaA");
	}

	```

## [Struct](https://michaelchen.tech/golang-programming/struct/)

-------------------------------------------------

## [Pointer](https://michaelchen.tech/golang-programming/pointer/)
- [Pass by pointer vs pass by value in Go](https://goinbigdata.com/golang-pass-by-pointer-vs-pass-by-value/)

```golang
package main
import "fmt"

type Point struct {
	x float64
	y float64
}

func pass_by_pointer(p *Point, new_x float64) {
	p.x = new_x;
}

func pass_by_value(p Point, new_x float64) {
	p.x = new_x;
}

func main() {
	var p *Point = &Point{x: 1.0, y: 2.0};
	pass_by_pointer(p, 12.0);
	fmt.Printf("%v\n", *p); //{12 2}

	var p2 Point = Point{x: 1.0, y: 2.0};
	pass_by_value(p2, 12.0);
	fmt.Printf("%v\n", p2); //{1 2}
}
```

-------------------------------------------------

## [Function](https://michaelchen.tech/golang-programming/function/)
```golang
package main
import "fmt"

//代入一個值與回傳一個值
func test1(n1 int) int {
	return n1;
}

//代入二個值與回傳二個值
func test2(n1 int, n2 int) (int, int) {
	return n1, n2;
}

func main() {
	//宣告變數但不指定型別
	var n1, n2 = test2(1, 2);
	fmt.Printf("a: %v %v\n", n1, n2);

	//https://stackoverflow.com/questions/53404305/when-to-use-var-or-in-go/53404332
	//宣告變數與指定型別
	var n3 int;
	fmt.Printf("b: %v\n", n3);

	n3 = test1(3);
	fmt.Printf("c: %v\n", n3);

	// := 不使用 var 宣告
	n4 := 123;
	n4 = test1(4);
	fmt.Printf("d: %v\n", n4);

	// 省略第一個回傳值
	_, n5 := test2(4, 5);
	fmt.Printf("e: %v\n", n5);
}
```

-------------------------------------------------

## [Class and Object](https://michaelchen.tech/golang-programming/class-object/)
- 物件最大的意途是抽象化與封裝，將重覆的程序、業務邏輯與附加邏輯隱藏在物件裡讓其他的物件可以重覆呼叫與使用。與函數不同點在於物件裡有成員變數(member variable)，並且物件有繼承可以延伸父類別的行為、介面提供附加邏輯的具體實作。
- 但 Golang 並沒有提供繼承，只有介面。其原因為繼承會增加耦合的成本，無法在動態時期改變具現實例。

```golang
package main
import "fmt"

type PointX struct {
	x float64
}

func (p *PointX) X() float64 {
	return p.x;
}

func (p *PointX) SetX(x float64) {
	p.x = x;
}

type PointY struct {
	y float64
};

func (p *PointY) Y() float64 {
	return p.y;
}

func (p *PointY) SetY(y float64) {
	p.y = y;
}

//embbeded struct of PointX and PointY
type PointXYZ struct {
	PointX
	PointY
	z float64
};

//override PointX's SetX function
func (p *PointXYZ) SetX(x float64) {
	p.PointX.x = x * x;
}

func (p *PointXYZ) Z() float64 {
	return p.z;
}

func (p *PointXYZ) SetZ(z float64) {
	p.z = z;
}

func main() {
	pxy := &PointXYZ{};
	pxy.SetX(3.0);
	pxy.SetY(6.0);
	pxy.SetZ(9.0);
	fmt.Printf("%v %v %v\n", pxy.X(), pxy.Y(), pxy.Z());
}
```

-------------------------------------------------

## [Interface](https://michaelchen.tech/golang-programming/interface/)
- 業務邏輯可以透過介面將附加邏輯給隔開，而實現達到開放封閉原則。最好的例子就是外掛(Plugin-In)。譬如 Foobar2000 音樂播放器的業務邏輯為
	- 檔案讀取模組 (Source Reader) -> 解碼模組 (Decoder) ->  放音模組 (Audio Playback)
- 業務邏輯的主要流程盡量不會變更，變更的為上述三個附加邏輯的模組，當模組化後面對需求，對程式碼的改動是透過增加新程式碼進行的，而不是更改現有的程式碼。檔案讀取模組可以是"檔案讀取"或"串流讀取"或未來的新模組，解碼模組可以是"MP3解碼模組"或"AAC解碼模組或未來的新模組。
- 模組式的設計就是透過介面提供一致性的接口讓業務邏輯去使用。

```golang

package main
import "fmt"

type Reader interface {
	Read(buf *Buf) error
}

type Decoder interface {
		Decode(buf *Buf) error;
}

type Playback interface {
		Playback(buf *Buf) error;
}

type Buf struct {
	in_buf []byte;
	in_len int;
	out_buf []byte;
	out_len int;
}

func NewBuf(in_alloc_len int, out_alloc_len int) *Buf {
	return &Buf{
		make([]byte, in_alloc_len),
		0,
		make([]byte, out_alloc_len),
		0,
	};
}

func (p *Buf) InBuf() []byte {
	return p.in_buf;
}

func (p *Buf) SetInLen(n int) {
	p.in_len = n;
}

func (p *Buf) InLen() int {
	return p.in_len;
}

func (p *Buf) OutBuf() []byte {
	return p.out_buf;
}		

func (p *Buf) OutLen() int {
	return p.out_len;
}

func (p *Buf) SetOutLen(n int) {
	p.out_len = n;
}

func ReverseBuf(buf *Buf) {
	n := buf.InLen();
		for i := 0; i < n/2; i++ {
				buf.OutBuf()[i] = buf.InBuf()[n-1-i];
		buf.OutBuf()[n-1-i] = buf.InBuf()[i];
	}
	buf.OutBuf()[n/2] = buf.InBuf()[n/2];
	buf.SetOutLen(buf.InLen());
}

type FileReader struct {

}

func NewFileReader() *FileReader {
	return &FileReader{};
}

func (p *FileReader) Read(buf *Buf) error {
	for i:=0; i< len(buf.InBuf()); i++ {
		buf.InBuf()[i] = 'A' + byte(i);
	}
	buf.SetInLen(len(buf.InBuf()));
	return nil;
}


type Mp3Decoder struct {

}

func NewMp3Decoder() *Mp3Decoder {
	return &Mp3Decoder{};
}

func (p *Mp3Decoder) Info() string {
	return "128kbps,16bit,2ch";
}

func (p *Mp3Decoder) Decode(buf *Buf) error {
	ReverseBuf(buf);
	return nil;
}

type DirectSoundPlayback struct {

}

func NewDirectSoundPlayback() *DirectSoundPlayback {
	return &DirectSoundPlayback{};
}

func (p *DirectSoundPlayback) Playback(buf *Buf) error {
	fmt.Printf("Read from reader %v %v\n", buf.InBuf(), string(buf.InBuf()));
	fmt.Printf("Decode from decoder %v %v\n", buf.OutBuf(), string(buf.OutBuf()));
	return nil;
}


func main() {
	var buf *Buf = NewBuf(26, 26);

	var reader Reader = NewFileReader();
	var decoder Decoder = NewMp3Decoder();
	var playback Playback = NewDirectSoundPlayback();

	reader.Read(buf);
	decoder.Decode(buf);
	playback.Playback(buf);
}
```

-------------------------------------------------

## interface{} variable
- interface{} 與 golang interface 並不是同一件事， interface{} 類似於 C 語言裡的 void * 變數，用於承接任何指標類型的實例。

```golang
package main
import "fmt"

type A struct {

}

func (p *A) Name() string {
	return "A";
}

type B struct {

}

func (p *B) Name() string {
	return "B";
}

type C struct {

}

func (p *C) Name() string {
	return "C";
}

func main() {
	interface_map :=  map[string]interface{} {
		"A": &A{},
		"B": &B{},
		"C": &C{},
	};

	//casting with error code
	vlaue_a, ok_a:= interface_map["A"];
	if ok_a {
		a, oka_2 := vlaue_a.(*A);
		if oka_2 {
			fmt.Printf("%v\n", a.Name());
		}
	}

	//casting without check error code
	value_b := interface_map["B"];
	if value_b != nil {
		b := value_b.(*B);
		if b != nil {
			fmt.Printf("%v\n", b.Name());
		}
	}

	//use .(type) to check which class instance is
	switch interface_map["C"].(type) {
		case *C:
			c := interface_map["C"].(*C);
			fmt.Printf("%v\n", c.Name());
			break;
	}
}
```
	
-------------------------------------------------

## Functional Programming
- 閉包 (Closure)

```golang
package main
import "fmt"
 
func main() {
	n := 1;
	f := func() int {
		n += 1;
		return n;
	};
	fmt.Printf("%v\n", f());
}
```

- Callback function: 類似 C 的 function pointer

```golang
package main
import "fmt"

func DoAlsaAudioCapture(pcm_callback func([]float64) error) {
	pcm_data := make([]float64, 64);
	pcm_callback(pcm_data);
	
	pcm_data2 := make([]float64, 128);
	pcm_callback(pcm_data2);
	
	pcm_data3 := make([]float64, 256);
	pcm_callback(pcm_data3);
}
 
func main() {
	pcm_callback := func(pcm_data []float64) error {
		fmt.Printf("Receving number %v of audio samples\n", len(pcm_data));
		return nil;
	};
	DoAlsaAudioCapture(pcm_callback);
}
```

-------------------------------------------------

## Json Marshal/Unmarshal
- 當成員有了 json tag 那麼第一個字元必須大寫代表 export

```golang
package main
import (
	"fmt"
	"encoding/json"
)

type ServerConfig struct {
	ListenPort int		`json:"listen_port"`
	EnableSsl bool		`json:"enable_ssl"`
}

func main() {
	json_bytes := []byte(`
{
	"listen_port": 443,
	"enable_ssl": false
}
`);
	server_config := &ServerConfig { };
	json.Unmarshal(json_bytes, &server_config);
	fmt.Printf("%v\n", server_config);
	
	json_bytes, _ = json.Marshal(server_config);
	fmt.Printf("%v\n", string(json_bytes));
	
	json_bytes, _ = json.MarshalIndent(server_config, "", "\t")
	fmt.Printf("%v\n", string(json_bytes));
}
```

-------------------------------------------------

## [Custom JSON Marshalling in Go](http://choly.ca/post/go-json-marshalling/)
- 客製化 json marshal/unmarshal 的輸入/輸出欄位

```golang
package main
import (
	"fmt"
	"encoding/json"
)

type ServerConfig struct {
	ListenPort int		`json:"listen_port"`
	EnableSsl bool		`json:"enable_ssl"`
}

func (p *ServerConfig) MarshalJSON() ([]byte, error)  {
	return json.Marshal(*p);
}

func (p *ServerConfig) UnmarshalJson(data []byte) error {
	return json.Unmarshal(data, p);
}
 
func main() {
	json_bytes := []byte(`
{
	"listen_port": 443,
	"enable_ssl": false
}
`);
	server_config := &ServerConfig { };
	server_config.UnmarshalJson(json_bytes);
	fmt.Printf("%v\n", server_config);
	
	json_bytes, _ = server_config.MarshalJSON();
	fmt.Printf("%v\n", string(json_bytes));
}
```

-------------------------------------------------

## [Read/write from/to file](https://stackoverflow.com/a/9739903/11474144)

-------------------------------------------------

## [protobuf](https://developers.google.com/protocol-buffers/docs/gotutorial)

- [Language Guide (proto3)](https://developers.google.com/protocol-buffers/docs/proto3)
- Protocol Buffers  主要應用在不同程式語言的 RPC 上(當然 PB 也是可以拿來取代 JSON)，並透過描述檔 ```*.proto``` 描述傳送方與接收方的資料結構，再透過 protoc code generator 去產生對映的 ```*.pb.go``` 或 ```*.pb.h``` 與 ```*.pb.cc```，如此就不需再人工 
	* ```定義 golang 的資料結構```
	* ```撰寫 golang 的 unmarshal/marshal```
	* ```定義 C++ 的資料結構```
	* ```撰寫 C++ 的 unmarshal/marshal```
- Golang 需安裝 protoc 與 protoc-gen-go
- C++ 則需安裝 protoc 與 libprotobuf(libprotobuf.so)
- 上述工具在 source source.sh && make 後都會自動安裝

-------------------------------------------------

### [protobuf golang example](src/02_protobuffer/src/main.go)
- [Doc for go generated Code](https://developers.google.com/protocol-buffers/docs/reference/go-generated)

-------------------------------------------------

### [protobuf C++ example](src/02_protobuffer/src/main.cc)
- [Doc for C++ generated code](https://developers.google.com/protocol-buffers/docs/reference/cpp-generated)

-------------------------------------------------

## [gRPC](https://www.grpc.io/docs/what-is-grpc/introduction/)
- [Status codes and their use in gRPC](https://github.com/grpc/grpc/blob/master/doc/statuscodes.md)

-------------------------------------------------

### gRPC tutorial for C++
- [Quick Start](https://www.grpc.io/docs/languages/cpp/quickstart/)
- [Basic tutorial](https://www.grpc.io/docs/languages/cpp/basics/)
- [gRPC C++ 1.34.0 doxygen](https://grpc.github.io/grpc/cpp/pages.html)
- grpc build 完自動也會將 protoc binarys 也一起 build 完，而不論要產生哪種語言的 protobuf code gen 或 grpc code gen，則都需要編譯 host 版的 c++ grpc binarys。他們都是以 grpc_cpp_plugin、grpc_python_plugin、protoc-gen-go、protoc-gen-go-grpc  ... 外掛型式去丟給 protoc。
- visual c++ 則可以從 vcpkg 去直接撈，而 mingw-w64 與 GCC 則可參考我的腳本 [libex/grpc/grpc_v1.34.0](https://github.com/deepkh/libex/blob/master/grpc/grpc_v1.34.0.sh)，需注意下，grpc 會先編譯 host 的 c++ grpc binarys 才會再編譯 runtime 的 grpc library，而 cmake 版本則需要 cmake-3.16.1 含以上，建議在 container 或  chroot 或 systemd-nspawn 的容器環境編譯。

-------------------------------------------------

### gRPC tutorial for Go
- [Quick Start](https://www.grpc.io/docs/languages/go/quickstart/)
- [Basics tutorial](https://www.grpc.io/docs/languages/go/basics/)

-------------------------------------------------

### gRPCHelloWorld C++/Go Example
- [grpchello.proto](src/03_grpchello/protos/grpchello.proto)
- [grpchelloclient_main.cc](src/03_grpchello/src/grpchelloclient_main.cc)
- [grpchellohello_main.cc](src/03_grpchello/src/grpchelloserver_main.cc)
- [grpchelloclient_main.go](src/03_grpchello/src/grpchelloclient_main.go)
- [grpchellohello_main.go](src/03_grpchello/src/grpchelloserver_main.go)

-------------------------------------------------

### gRPCFtp C++/Go Example
- [grpcftp.proto](src/04_grpcftp/protos/grpcftp.proto)
- [grpcftpclient_main.cc](src/04_grpcftp/src/grpcftpclient_main.cc)
- [grpcftpserver_main.cc](src/04_grpcftp/src/grpcftpserver_main.cc)
- [grpcftpclient_main.go](src/04_grpcftp/src/grpcftpclient_main.go)
- [grpcftpserver_main.go](src/04_grpcftp/src/grpcftpserver_main.go)
- grpcftp.proto 實作了 grpc 的四種交互中的其中三種。第四種 request 與 response 都為 stream 目前尚未實現。
	1. Hello: Request 與 Response 都非 stream 模式
	2. List 與 Pull: Request 非 stream 模式 而 Reponse 為 stream 模式
		1. List: 列出 client 所指定的 server 資料夾的檔案
		2. Pull: 從 server 拉一個檔案，client 會下載檔案到 pull/ 
	3. Push: Request 為 stream 模式而 Reponse 為非 stream 模式
		1. Push: 推一個檔案到 server，server 會儲存檔案到 push/ 


-------------------------------------------------

## gin web backend framework
HTTP  後端快速開發框架。可用閉包快速開發業務邏輯外，另還提供  router、middleware、group(可依 path 前綴字來分版本，如/v1/api、/v2/api)、form binding、query binding、server side rendering。
- [https://github.com/gin-gonic/gin](https://github.com/gin-gonic/gin)
- [# Golang 微框架 Gin 简介](https://www.jianshu.com/p/a31e4ee25305)

### Example
- [src/05_ginwebser/src/main.go](src/05_ginwebser/src/main.go)

-------------------------------------------------

## resty http client library
透過閉包來快速開發 http 客戶端(原作者提及由 Ruby rest-client 啟發)

### Example
- [src/05_ginwebser/src/main_test.go](src/05_ginwebser/src/main_test.go)

-------------------------------------------------

## Swagger Codegen
透過 OpenAPI 的定義檔(.json, .yaml) 去產生 API Docs與 Server Stub Code, Client SDK Code, HTML API Docs。

### References
- [About Swagger Specification | Documentation | Swagger](https://swagger.io/docs/specification/about/)
- [OpenAPI Specification](https://swagger.io/specification/)
- [Server-stub-generator-HOWTO](https://github.com/swagger-api/swagger-codegen/wiki/Server-stub-generator-HOWTO#go-server)
- [REST Servers in Go: Part 4 - using OpenAPI and Swagger](https://eli.thegreenplace.net/2021/rest-servers-in-go-part-4-using-openapi-and-swagger/ "Permalink to REST Servers in Go: Part 4 - using OpenAPI and Swagger")
-  [Swagger Editor](http://editor.swagger.io/?_ga=2.207490132.690680557.1612839664-1829507373.1608976376) – browser-based editor where you can write OpenAPI specs.
-  [Swagger UI](https://swagger.io/swagger-ui/) – renders OpenAPI specs as interactive API documentation.
-  [Swagger Codegen](https://github.com/swagger-api/swagger-codegen)

### swagger-codegen cli install 
```
# Download current stable 3.x.x branch (OpenAPI version 3)
wget https://repo1.maven.org/maven2/io/swagger/codegen/v3/swagger-codegen-cli/3.0.24/swagger-codegen-cli-3.0.24.jar -O swagger-codegen-cli.jar

java -jar swagger-codegen-cli.jar --help
```

### Gen code for golang server
```
${SWAGGERCODEGENCLI_BIN} generate -l go-server -i openapi.yaml -o out_dir
```

### Gen code for golang client
```
${SWAGGERCODEGENCLI_BIN} generate -l go -i openapi.yaml -o out_dir
```

### Gen code for HTML2 docs
```
${SWAGGERCODEGENCLI_BIN} generate -l html2 -i openapi.yaml -o out_dir
```

### Examples

下列 server, client, HTML 都由 openapi_3.0_test.yaml 定義檔並透過上面三串指令去產生。

- [openapi_3.0_test.yaml](src/06_swagger_codegen/openapi/openapi_3.0_test.yaml)
- [server](src/06_swagger_codegen/server)
- [client](src/06_swagger_codegen/client)
- [HTML API Docs](src/06_swagger_codegen/html2)

心得:
- OpenAPI 定義檔可透過 [Swagger Editor](http://editor.swagger.io/?_ga=2.207490132.690680557.1612839664-1829507373.1608976376) 在線編輯後後再儲存到 openapi_3.0_test.yaml
- 如果 openapi_3.0_test.yaml 更新後並重新執行指令，它會選擇覆蓋源碼而不是聰明的保留修改的部份
- Server
	- 從 webserver, route, services routine 從上到下都串好了, 僅剩 services routine留下空函式
	- Code 產生的還可以接受
	- 沒有 go.mod，需手動適度修改
	- 原生框架與 gorilla/mux router，如果已使用其它 原生框架習慣了，則會需要適應原生框架
		> Most Go web "frameworks" are nonidiomatic and should probably be avoided for codegen purposes, including Gin. I would recommend plain `net/http` handlers + selected pieces from [https://github.com/gorilla](https://github.com/gorilla) as necessary; probably just [https://github.com/gorilla/mux](https://github.com/gorilla/mux) for routing is enough. from [peterbourgon commented on 26 May 2016](https://github.com/swagger-api/swagger-codegen/issues/2970#issuecomment-221770716)
- Client
	- 產生的是 SDK 
	- 沒有 main.go，需手動適度修改
	- 沒有 go.mod，需手動適度修改
	- 原生框架
	- Code 產生的很大一包

-------------------------------------------------

## Go Swagger
Go swagger 可完成下列三個意圖，與 swagger-codegen 相比多了一個從已有的 code 產生 swagger spec 2.0 yaml。但由於 Generate webserver code 所產生的 Code 太過纍贅，所以稍微閱讀後就沒有再深入理解。
- Generate webserver code from swagger spec 2.0: 通過 swagger spec 2.0 生成 webserver code 
- Generate client code from swagger spec 2.0: 通過 swagger spec 2.0 生成 web client code
- Generate spec from source code's comments: 通過源碼生成 swagger spec 2.0


### Installation
```
wget https://github.com/go-swagger/go-swagger/releases/download/v0.26.1/swagger_linux_amd64 -O /usr/local/swagger && chmod +x /usr/local/swagger
```

### Generate webserver code from swagger spec 2.0
- 撰寫 swagger spec 2.0 yaml -> 假設 test.yaml
- 產生 server code -> `swagger generate server --target=./ --spec=test.yaml --name=hello`
- services handler 需自行改寫，可參考
	- [Server Usage](https://goswagger.io/generate/server.html) 
	- [A swagger golang hello world](https://ops.tips/blog/a-swagger-golang-hello-world/) 
	- [Examples](https://github.com/go-swagger/go-swagger/tree/master/examples)

### Cons
- [Server Usage](https://goswagger.io/generate/server.html) 框架複雜，需深入理解框架後才有辦法開發業務邏輯
- 業務邏輯的實現需在 `configure_xxx.go`，但 `configure_xxx.go` 裡還包含其他不相關的設定，不符合開放封閉原則不利於長期維護
- [A swagger golang hello world](https://ops.tips/blog/a-swagger-golang-hello-world/)  則太舊
- 目前僅支援 `swagger spec 2.0` ，swagger-codegen-cli 則支援 `swagger spec 2.0` 與 `OpenAPI 3.0`

### Pros
- 從 Code 註解產生  `swagger spec 2.0` 則不用遷就於 go-swagger 的 generate code 架構

### References
- [go-swagger](https://github.com/go-swagger/go-swagger)
- [Docs](https://goswagger.io/)

-------------------------------------------------
## Go Kit

gokit 的 http transport 實作是透過 [kit.http.NewServer](https://github.com/go-kit/kit/blob/master/transport/http/server.go#L27) 實作 [http.handler](https://golang.org/pkg/net/http/#Handler) 並加入客製化的:
- [endpoint.Endpoint](https://github.com/go-kit/kit/blob/d9e46badbf75f459d391162b4f72abd9ac852511/endpoint/endpoint.go#L9)
- [DecodeRequestFunc](https://github.com/go-kit/kit/blob/d9e46badbf75f459d391162b4f72abd9ac852511/transport/grpc/encode_decode.go#L11)
- [EncodeResponseFunc](https://github.com/go-kit/kit/blob/d9e46badbf75f459d391162b4f72abd9ac852511/transport/http/encode_decode.go#L30)

當 [kit.http.NewServer](https://github.com/go-kit/kit/blob/master/transport/http/server.go#L27) 初始化完後，再丟進原生 [http.Handler](https://golang.org/pkg/net/http/#Handler)，與 Gorilla Mux 一樣都是再包一層自己的  [http.Handler](https://golang.org/pkg/net/http/#Handler) ，如此就可讓實作 [http.Handler](https://golang.org/pkg/net/http/#Handler) 套件互相串在一起，受限於框架的層度較少。

### Example: StringSvc1 
- [src/07_gokitsamples/stringsvc1/main.go](src/07_gokitsamples/stringsvc1/main.go)

以 /count 計算字數服務來說明

1. 初始化  /count 的 httptransport.NewServer (http.Handler). 並帶入 `makeCountEndpoint(svc)` 、`decodeCountRequest` 與 `encodeResponse`
2. 編譯 main.go 並執行 ./main
3. 透過 ```curl -X POST -H "Content-Type: application/json" -d '{"S":"abc@gmail.com"}' http://localhost:8080/count``` 驗證
4. 執行流程如下
	1. decodeCountRequest
	2. makeCountEndpoint 裡的閉包 (Closure) 
	3. 最後是 encodeResponse 輸出

```golang
  svc := stringService{}

  countHandler := httptransport.NewServer(
    makeCountEndpoint(svc),
    decodeCountRequest,
    encodeResponse,
  )
 
  http.Handle("/count", countHandler)
  log.Fatal(http.ListenAndServe(":8080", nil))
```


```golang
func decodeCountRequest(_ context.Context, r *http.Request) (interface{}, error) {
  var request countRequest
  fmt.Printf("1. decodeCountRequest\n")
  if err := json.NewDecoder(r.Body).Decode(&request); err != nil {
    return nil, err
  }
  return request, nil
}
```

```golang
// Endpoints are a primary abstraction in go-kit. An endpoint represents a single RPC (method in our service interface)
func makeCountEndpoint(svc StringService) endpoint.Endpoint {
  return func(_ context.Context, request interface{}) (interface{}, error) {
    fmt.Printf("2. makeCountEndpoint\n")
    req := request.(countRequest)
    v := svc.Count(req.S)
    return &countResponse{v}, nil
  }
}
```

	
```golang
func encodeResponse(_ context.Context, w http.ResponseWriter, response interface{}) error {
  v1, ok1 := response.(*uppercaseResponse)
  v2, ok2 := response.(*countResponse)
  fmt.Printf("3. encodeResponse v1:%+v ok1=%v v2:%+v ok2=%v\n", v1, ok1, v2, ok2)
  return json.NewEncoder(w).Encode(response)
}
```

### gokit code generator

-   [go-kit/kit/cmd/kitgen](https://github.com/go-kit/kit/tree/master/cmd/kitgen)
-   [kujtimiihoxha/kit](https://github.com/kujtimiihoxha/kit)
-   [GrantZheng/kit](https://github.com/GrantZheng/kit)

### GrantZheng/kit

目前僅剩 [GrantZheng/kit](https://github.com/GrantZheng/kit) . 在 2020 年底尚有更新。可用下列命令去產生 code。

```
kit n s hello               # Create new service 
kit g s hello              
kit g s hello -t grpc
kit g d                     # Create Docker file
```


### gokit issues

1. kitgen 目前大多已沒更新
2. kitgen 產生的 Code 龐大與 swagger-codegen-cli 相比並不好理解
3. 需要同時支持 HTTP, GRPC ... 不同 Transport 的情況會是哪些? 
4. kitgen 透過定義 service.go 檔來產生 server stubs code 是不錯，但沒有 OpenAPI 3.0 來的標準. eg: 譬如沒有 GET/PUT/POST/DELETE 方法

-------------------------------------------------

## gin-swagger
透過在源碼定義註解而產生 Swagger 2.0 Spec。

- [declarative_comments_format](https://swaggo.github.io/swaggo.io/declarative_comments_format/)
- [swag/example/celler/main.go](https://github.com/swaggo/swag/blob/master/example/celler/main.go)