package main

import (
	"fmt"
	"os"
	"path"
	"runtime"
	opencv "github.com/lazywei/go-opencv/opencv"
)

var key, x1, y1, x2, y2 int

func saveAndCropImage(img *opencv.IplImage, x1 int, y1 int, x2 int, y2 int) {
	opencv.SaveImage("face.jpg", img, 0)
	fmt.Println("Face saved.")

 	_, currentfile, _, _ := runtime.Caller(0)
 	filename := path.Join(path.Dir(currentfile), "face.jpg")

 	image := opencv.LoadImage(filename)
 	if image == nil {
 		panic("LoadImage failed")
 	}
 	defer image.Release()
	fmt.Printf("image type is %T \n", image)
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

	fmt.Println("Press space bar to photograph and press ESC to quit")

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
							value.X() - 15,
							value.Y() - 75,
						},
						opencv.Point{
							value.X() + value.Width() + 45,
							value.Y() + value.Height() + 150,
						},
						opencv.ScalarAll(255.0), 3, 1, 0)
					
					// todo: make image 4:3 ratio
					x1 = value.X() - 15
					y1 = value.Y() - 75
					x2 = value.X() + value.Width() + 45
					y2 = value.Y() + value.Height() + 150
					fmt.Println(x1, y1, x2, y2)
				}

				win.ShowImage(img)

				key = opencv.WaitKey(1)

				// Take a photo with the space bar
				if key == 32 {
					saveAndCropImage(img, x1, y1, x2, y2)
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

