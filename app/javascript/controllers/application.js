import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

 // Wait for the document to be ready
 document.addEventListener("DOMContentLoaded", function() {
    // Get all the "Show Comments" buttons
    const showCommentsButtons = document.querySelectorAll(".show-comments-button");

    // Add a click event listener to each "Show Comments" button
    showCommentsButtons.forEach(function(button) {
      button.addEventListener("click", function() {
        // Find the parent group-post div
        const groupPost = button.closest(".group-post");

        // Find the comments container inside the group-post div
        const commentsContainer = groupPost.querySelector(".comments");

        // Toggle the visibility of the comments container
        commentsContainer.classList.toggle("show");

        // Update the button text based on the comments container visibility
        if (commentsContainer.classList.contains("show")) {
          button.textContent = "Hide Comments";
        } else {
          button.textContent = "Show Comments";
        }
      });
    });
  });
