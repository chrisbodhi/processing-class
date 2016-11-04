package main

import (
	"fmt"
	"os"
	"path"

	opencv "github.com/lazywei/go-opencv/opencv"
)

func main() {
	win := opencv.NewWindow("todo: clever project name")
	defer win.Destroy()

	// Grabs from the zero-th camera
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
					fmt.Printf("%+v", value)
					fmt.Println("\n")
					// every 5 minutes, if x and y, save image at the dimensions of that circle
					// &{x:392 y:166 width:253 height:253}
					// opencv.Crop(img, 0, 0, 50, 50)

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
