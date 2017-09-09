package main

import (
	"time"
)

import l4g "github.com/ccpaging/log4go"

func main() {
  l4g.AddFilter("stdout", l4g.ERROR, l4g.NewConsoleLogWriter())

	l4g.DefaultCallerSkip = 2

	//log := l4g.NewLogger()
	defer l4g.Close()

	l4g.AddFilter("stdout", l4g.DEBUG, l4g.NewConsoleLogWriter())
	l4g.Info("The time is now: %s", time.Now().Format("15:04:05 MST 2006/01/02"))
  /*

	log.AddFilter("stdout", l4g.DEBUG, l4g.NewConsoleLogWriter().Set("format", "[%T %D %Z] [%L] (%x) %M"))
	log.Info("The time is now: %s", time.Now().Format("15:04:05 MST 2006/01/02"))

	time.Sleep(1 * time.Second)
	l4g.FORMAT_UTC = true
	log.Info("The time is now: %s", time.Now().Format("15:04:05 MST 2006/01/02"))
  */

	// This makes sure the filters is running
	// time.Sleep(200 * time.Millisecond)
}
