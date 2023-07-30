document.addEventListener("turbo:load", function() {
    const eventPopupContainer = document.querySelector(".event-popup-container");
    const showEventLink = document.querySelector(".show-event-link");

    showEventLink.addEventListener("click", function(event) {
      event.preventDefault();
      eventPopupContainer.classList.add("active");
    });

    eventPopupContainer.addEventListener("click", function(event) {
      if (event.target === this) {
        eventPopupContainer.classList.remove("active");
      }
    });
  });
