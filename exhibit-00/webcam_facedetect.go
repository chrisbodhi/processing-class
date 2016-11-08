package main

import (
	"fmt"
	"os"
	"path"
	"runtime"

	opencv "github.com/lazywei/go-opencv/opencv"
)

var key, x1, y1, x2, y2 int

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
	fmt.Println("Press space bar to photograph")

	for {
		if cap.GrabFrame() {
			img := cap.RetrieveFrame(1)
			if img != nil {
				faces := cascade.DetectObjects(img)
				for _, value := range faces {

					// todo: delete rectangle when everything is :ok_hand:
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

					x1 = value.X()
					y1 = value.Y() - 15
					x2 = x1 + value.Width() + 25
					y2 = y1 + value.Height() + 50
					fmt.Println(x1, y1, x2, y2)
				}
				fmt.Printf("\n\nbout to show you that image: %T\n\n", img)
				win.ShowImage(img)

				key = opencv.WaitKey(1)

				// Take a photo with the space bar
				if key == 32 {
					saveImage(img, x1, y1, x2, y2)
				}
			} else {
				fmt.Println("nil image")
			}
		}

		// Exit with the ESC key
		if key == 27 {
			os.Exit(0)
		}
	}
}

