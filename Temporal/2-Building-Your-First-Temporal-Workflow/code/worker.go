package main

import (
	"log"

	"go.temporal.io/sdk/client"
	"go.temporal.io/sdk/worker"
)

func main() {
	c, err := client.Dial(client.Options{
		HostPort: "localhost:7233",
	})
	if err != nil {
		log.Fatalln("Unable to create client", err)
	}
	defer c.Close()

	w := worker.New(c, "hello-task-queue", worker.Options{})
	w.RegisterWorkflow(SayHelloWorkflow)
	w.RegisterActivity(SayHello)

	log.Println("Worker starting...")
	err = w.Run(worker.InterruptCh())
	if err != nil {
		log.Fatalln("Unable to start worker", err)
	}
}
