function reinitializeJs() {
  addLoadingClassesToLinksAndForms();
  document.querySelectorAll('pre code').forEach((block) => {
    hljs.highlightBlock(block);
  });
}

addLoadingClassesToLinksAndForms = function() {
  document.querySelectorAll('form').forEach(form => {
    form.addEventListener('turbo:submit-start', function(event) {
      this.classList.add('htmx-request');
    });
  });
  document.querySelectorAll('a').forEach(link => {
    link.addEventListener('turbo:click', function(event) {
      this.classList.add('htmx-request');
    });
  })
}

document.addEventListener("DOMContentLoaded", function(event){
  reinitializeJs();
});

// add an event listener for the htmx afterRequest event
document.addEventListener("htmx:afterRequest", function(event) {
  reinitializeJs();
});

document.addEventListener("htmx:afterRequest", function(event) {
  reinitializeJs();
});

document.addEventListener("turbo:frame-load", function(event) { 
  reinitializeJs();
})
