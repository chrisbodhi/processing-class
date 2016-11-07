package main

import (
	"fmt"
	"os"
	"path"
	"runtime"

	opencv "github.com/lazywei/go-opencv/opencv"
)


func saveImage(img *opencv.IplImage, x1 int, y1 int, x2 int, y2 int) {
	opencv.SaveImage("face.jpg", img, 0)
	loadAndCropImage(x1, y1, x2, y2)
}

func loadAndCropImage(x1, y1, x2, y2 int) {
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

 	crop := opencv.Crop(image, x1, y1, x2, y2)
 	opencv.SaveImage("cropped.jpg", crop, 0)
 	crop.Release()
}

func main() {
	win := opencv.NewWindow("todo: clever project name")
	defer win.Destroy()

	cap := opencv.NewCameraCapture(0)
	if cap == nil {
		panic("cannot open camera")
	}
	defer cap.Release()

	cwd, err := os.Getwd()
	if err != nil {
		panic(err)
	}
	cascade := opencv.LoadHaarClassifierCascade(path.Join(cwd, "haarcascade_frontalface_alt.xml"))

	fmt.Println("Press ESC to quit")

	for {
		if cap.GrabFrame() {
			img := cap.RetrieveFrame(1)
			if img != nil {
				faces := cascade.DetectObjects(img)
				for _, value := range faces {
					opencv.Rectangle(
						img,
						opencv.Point{
							value.X(),
							value.Y() - 15,
						},
						opencv.Point{
							value.X() + value.Width() + 25,
							value.Y() + value.Height() + 50,
						},
						opencv.ScalarAll(255.0), 3, 1, 0)

				 	x1 := value.X()
					y1 := value.Y() - 15
					x2 := x1 + value.Width() + 25
					y2 := y1 + value.Height() + 50
					fmt.Println(x1, y1, x2, y2)
					saveImage(img, x1, y1, x2, y2)
				}

				win.ShowImage(img)
			} else {
				fmt.Println("nil image")
			}
		}

		key := opencv.WaitKey(1)

		if key == 27 {
			os.Exit(0)
		}
	}
}

