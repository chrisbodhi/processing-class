package main

import (
	"fmt"
	"os"
	"path"

	"./utils"
	opencv "github.com/lazywei/go-opencv/opencv"
)

var key, x1, y1, width, height int

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

	fmt.Println("Press space bar to photograph and press ESC to quit")

	for {
		if cap.GrabFrame() {
			img := cap.RetrieveFrame(1)
			if img != nil {
				faces := cascade.DetectObjects(img)
				for _, value := range faces {

					opencv.Rectangle(
						img,
						opencv.Point{
							value.X() - 15,
							value.Y() - 75,
						},
						opencv.Point{
							value.X() + value.Width() + 45,
							value.Y() + value.Height() + 150,
						},
						opencv.ScalarAll(255.0), 3, 1, 0)

					x1 = value.X() - 15
					y1 = value.Y() - 75
					width = value.Width() + 45
					height = value.Height() + 150

					fmt.Printf("\n%#v", value)
				}

				win.ShowImage(img)

				key = opencv.WaitKey(1)

				// Take a photo with the space bar
				if key == 32 {
					utils.SaveAndCropImage(img, x1, y1, width, height)
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
