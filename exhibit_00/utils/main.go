package utils

import (
	"fmt"
	"os"
	"os/exec"
	"path"
	"runtime"

	opencv "github.com/lazywei/go-opencv/opencv"
)

func ExecCli() {
	processing := "processing-java"
	processingArgs := []string{"--sketch", "`pwd`", "--output", "`pwd`/output", "--force", "--run"}
	processingErr := exec.Command(processing, processingArgs...).Run()
	if processingErr != nil {
		fmt.Fprintln(os.Stderr, processingErr)
		os.Exit(1)
	}

	gifsicle := "gifsicle"
	gifArgs := []string{"--delay", "3", "-03", "--loop", "artifacts/f*.gif > glitch.gif"}
	gifErr := exec.Command(gifsicle, gifArgs...).Run()
	if gifErr != nil {
		fmt.Fprintln(os.Stderr, gifErr)
		os.Exit(1)
	}
}

func SaveAndCropImage(img *opencv.IplImage, x1 int, y1 int, width int, height int) {
	opencv.SaveImage("face.jpg", img, 0)
	fmt.Println("\n\nFace saved.")

	_, currentfile, _, _ := runtime.Caller(0)
	filename := path.Join(path.Dir(currentfile), "../face.jpg")

	image := opencv.LoadImage(filename)
	if image == nil {
		panic("LoadImage failed")
	}
	defer image.Release()

	crop := opencv.Crop(image, x1, y1, width, height)
	opencv.SaveImage("cropped.jpg", crop, 0)
	fmt.Println("Cropped image saved.")
	crop.Release()
}
