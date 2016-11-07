// https://github.com/lazywei/go-opencv/blob/master/samples/crop.go
package main

import (
	"os"
	"path"
	"runtime"

	opencv "github.com/lazywei/go-opencv/opencv"
)

func main() {
	_, currentfile, _, _ := runtime.Caller(0)
	filename := path.Join(path.Dir(currentfile), "face.jpg")
	if len(os.Args) == 2 {
		filename = os.Args[1]
	}

	image := opencv.LoadImage(filename)
	if image == nil {
		panic("LoadImage failed")
	}
	defer image.Release()

	crop := opencv.Crop(image, 50, 50, 150, 150)
	opencv.SaveImage("cropped.jpg", crop, 0)
	crop.Release()

	os.Exit(0)
}

