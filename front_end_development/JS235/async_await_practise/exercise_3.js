// Write a getReady function that utilizes at least three asynchronous functions that you write to simulate getting ready in the morning. Each task should take time and not begin until the task before has been completed. getReady should utilize async / await.

// Here's an example of how your getReady function may behave:
// getReady();
// // Good morning!
// // Petting cat...
// // Getting dressed... (5 seconds later)
// // Brushing teeth...  (3 seconds later)
// // I'm ready!         (2 seconds later)

async function breakfast() {

}

async function cleanup() {

}

async function getReady() {
  breakfast();
  cleanup();
}

getReady();
